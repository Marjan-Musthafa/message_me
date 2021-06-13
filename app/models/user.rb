class User < ApplicationRecord
    validates :username, presence: true, uniqueness: { case_sensitive: false }, length: {maximum: 50, minimum: 3}
    has_secure_password   
    has_many :messages
end
