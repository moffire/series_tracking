class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :movies, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
end
