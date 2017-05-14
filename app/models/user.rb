class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :pantry_items
  has_many :ingredients, through: :pantry_items
  has_many :favorites
  has_many :mutes
end
  
