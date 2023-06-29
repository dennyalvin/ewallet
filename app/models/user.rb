class User < ApplicationRecord
    has_many :user_sessions
    has_many :journals
    has_many :transactions
    has_secure_password
    
end
