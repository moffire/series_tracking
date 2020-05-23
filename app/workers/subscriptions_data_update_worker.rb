class SubscriptionsDataUpdateWorker
  include Sidekiq::Worker

  def perform(*args)
    Movie.update_subscriptions_movies
  end
end
