class Api::TransactionController < ApplicationController
    before_action :authorize_request
    before_action :validate_deposit, only: [:deposit]
    before_action :validate_withdraw, only: [:withdraw]
    before_action :validate_transfer, only: [:transfer]
    
    def deposit
        trans = TransactionService.new.add(@current_user, transaction_params("deposit"))
        return render json: { data: {message: "Deposit is success"} } if trans.success?
    end

    def withdraw
        trans = TransactionService.new.add(@current_user, transaction_params("withdraw"))
        return render json: { data: {message: "Withdraw is success"} } if trans.success?
    end

    def transfer
        trans = TransactionService.new.add(@current_user, transaction_params("transfer"))
        return render json: { data: {message: "Transfer is success"} } if trans.success?
    end

    private
    def deposit_params
        params.permit(:amount, :target_user)
    end

    def transaction_params(category)
        {
            category: category,
            target_user: deposit_params[:target_user].present? ? deposit_params[:target_user] : nil,
            amount: deposit_params[:amount]
        }
    end

    def validate_deposit
        unless params[:amount].present?
            return render json: {
                        error: "Amount is mandatory",
                        status: 400
                    },status: 400
        end
    end

    def validate_withdraw
        unless params[:amount].present?
            return render json: {
                        error: "Amount is mandatory",
                        status: 400
                    },status: 400
        end
        
        if user_balance < params[:amount]
            return render json: {
                        error: "insufficient balance",
                        status: 400
                    },status: 400
        end
    end

    def validate_transfer
        unless params[:amount].present?
            return render json: {
                        error: "Amount is mandatory",
                        status: 400
                    },status: 400
        end

        unless params[:target_user].present?
            return render json: {
                        error: "Target user is mandatory",
                        status: 400
                    },status: 400
        end
        
        if user_balance < params[:amount]
            return render json: {
                        error: "insufficient balance",
                        status: 400
                    },status: 400
        end
    end

    def user_balance
        Journal.where(user_id: @current_user.id).sum('debit - credit')
    end
end