class Api::AuthController < ApplicationController
	def login
        #Auth user by email & password
		@user = User.find_by(email: login_params[:email])
        if @user.present? && @user.authenticate(login_params[:password])
            #If Login success, then create Token and store it
        
            token = session_token(@user.email)
            UserSession.create(
                user_id: @user.id,
                token: token,
                expired_at: Time.now.utc + 30.days
            )
            
            return render json: { data: {token: token} }
		end

        render json: {
            error: "Invalid email or password",
            status: 400
        },status: 400
	end

	private
    def login_params
        params.permit(:email, :password)
    end

    def session_token(email)
        #Make Unique session token, by concate now + user email + SaltStringToSecure
        Digest::SHA256.hexdigest([Time.now,email,'SaltStringSecure'].join).to_s
    end
end