class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :subscriptions, dependent: :destroy
  has_many :movies, through: :subscriptions
  has_many :viewed_episodes, dependent: :destroy
  
end
