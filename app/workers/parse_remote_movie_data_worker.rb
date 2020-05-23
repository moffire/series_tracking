class ParseRemoteMovieDataWorker
  include Sidekiq::Worker

  def perform(*args)
    FullData.parse_all_movies_data
  end
end
