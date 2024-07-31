# app/models/user.rb
class User < ApplicationRecord
  # Include default devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # before_validation :set_user_type
  
  # def set_user_type
  #   debugger
  # end
end
