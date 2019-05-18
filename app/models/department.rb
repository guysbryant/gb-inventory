class Department < ActiveRecord::Base
    has_many :items
    has_many :users, through: :user_departments
    has_many :user_departments
end