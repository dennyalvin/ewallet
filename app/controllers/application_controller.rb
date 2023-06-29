class ApplicationController < ActionController::Base
    def authorize_request
        header = request.headers['Authorization']
        header = header.split(' ').last if header
        
        session = UserSession.find_by(token: header)

        unless session.present? && session.expired_at > Time.now
          render json: { errors: "Unauthorized" }, status: 401
        else
            @current_user = session.user
        end
    end
end