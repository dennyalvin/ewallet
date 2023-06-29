class TransactionService
    def initialize
        @errors = nil
    end
    
    def add(user,params)
        ActiveRecord::Base.transaction do
            transaction = create_transaction(user[:id], params)

            add_debit(user[:id],transaction.id,params[:amount], params[:category]) if params[:category] == 'deposit'
            add_credit(user[:id],transaction.id,params[:amount], params[:category]) if deductions.include? params[:category]
            add_debit(params[:target_user],transaction.id,params[:amount], 'transfer-in') if params[:category] == 'transfer'
        end
        self
    end

    def success?
        return true if @errors.nil?
        false
    end

    private
    def deductions
        %w[withdraw transfer]
    end

    def create_transaction(user_id, params)
        trans = Transaction.create!(
            source_user: user_id,
            target_user: params[:target_user],
            category: params[:category],
            amount: params[:amount],
            status: 'done'
        )
        
        trans
    end

    def add_credit(user_id,transaction_id,amount, notes)
        Credit.insert({
                user_id: user_id,
                transaction_id: transaction_id,
                notes: notes,
                credit: amount
            })
    end

    def add_debit(user_id,transaction_id,amount,notes)
        Debit.insert({
                user_id: user_id,
                transaction_id: transaction_id,
                notes: notes,
                debit: amount
             })
    end
end