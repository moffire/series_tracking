require_relative 'my_shows'
require 'nokogiri'
require 'open-uri'

URL = 'https://myshows.me/m/search/all/'.freeze

def full_data
  html = Nokogiri::HTML(URI.open(URL))
  max_pages = html.css('.pagination > .pagination__item')[-2].css('a').text.to_i
  (0..2).each do |page_number|
    page = URL + '?page=' + page_number.to_s
    data = Nokogiri::HTML(URI.open(page))
    all_movies = data.css('.table__body > .table__row')
    all_movies.each do |movie|
      movie_id = movie.at('.voting-star')['data-show-id']
      MyShows.new(movie_id).movie_info
    end
  end
end

full_data