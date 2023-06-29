class Api::UserController < ApplicationController
    before_action :authorize_request

    def balance
        total_balance = Journal.where(user_id: @current_user.id).sum('debit - credit')

        return render json: { data: {balance: total_balance} }
    end
    
end