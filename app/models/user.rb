class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :subscriptions, dependent: :destroy
  has_many :movies, through: :subscriptions
  has_many :viewed_episodes, dependent: :destroy
  after_create :generate_api_token
  
  private
  
  def generate_api_token
    self.api_token = Devise.friendly_token 10
    save
  end
end
