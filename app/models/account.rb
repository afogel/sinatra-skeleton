class Account < ActiveRecord::Base
    validates :email, :hashed_password, presence: true
    validates :email, uniqueness: true
end
