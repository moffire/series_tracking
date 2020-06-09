class ApplicationController < ActionController::Base
  before_action :unviewed_episodes_count
  
  
  private
  
  def unviewed_episodes_count
    if user_signed_in?
      @unviewed_count = 0
      current_user.subscriptions.each do |subscription|
        @unviewed_count += subscription.movie.episodes.count - subscription.movie.viewed_episodes.count
      end
    end
  end
end
