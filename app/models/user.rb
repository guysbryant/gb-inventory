class User < ActiveRecord::Base 
    has_secure_password 
    validates :username, presence: true 
    validates :username, uniqueness: true 

    has_many :departments, through: :user_departments
    has_many :user_departments
end