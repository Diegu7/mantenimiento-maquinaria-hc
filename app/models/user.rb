class User < ApplicationRecord
    has_secure_password

    validates_presence_of :username, :first_name, :last_name, :middle_name, :email
    validates :username, uniqueness: true
end
