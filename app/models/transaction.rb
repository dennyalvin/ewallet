class Transaction < ApplicationRecord
    belongs_to :user, foreign_key: 'source_user'
end
