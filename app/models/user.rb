class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
         has_many :membership
         has_many :organization , through: :membership
         has_many :blogs, dependent: :destroy

 
end
