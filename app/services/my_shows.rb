require 'nokogiri'
require 'open-uri'
require 'cgi/util'

class MyShows

  BASE_URL = 'https://myshows.me'.freeze

  attr_accessor :query

  def initialize(query = nil)
    @query = query
  end

  def parse_html(url = '')
    Nokogiri::HTML(URI.open(BASE_URL + url))
  rescue StandardError
    "Error 404. Page not found."
    nil
  end

  # hash of searched series or top rated movies if no query
  def movies_list
    return top_rated if query.nil?

    content = {}
    encoded_query = CGI.escape(@query)
    html = parse_html("/search/?q=#{encoded_query}")
    all_series = html.css('table.catalogTable').search('tr')
    all_series[1...-1].each do |movie|
      movie_id = movie.css('td > a')[0]['href'][/\d+/]
      content[:"#{movie_id}"] = {
        en_title: movie.css('td > .catalogTableSubHeader')[0].text,
        ru_title: movie.css('td > a')[0].text,
        watchers: movie.css('td')[2].text,
        seasons: movie.css('td')[4].text,
        year: movie.css('td')[5].text
      }
    end
    content
  rescue NoMethodError
    "Can't apply selectors in '#{__method__}' method. DOM structure apparently was changed."
  end

  def get_ratings(movie_id)
    html = parse_html("/view/#{movie_id}/")
    rating = { kinopoisk: 0, imdb: 0 }
    path = html.css('.clear > p > .cFade')
    path.each do |row|
      if row.text.include?('Рейтинг Кинопоиска')
        rating[:kinopoisk] = row.parent.css('a').text.to_f
      end
      if row.text.include?('Рейтинг IMDB')
        rating[:imdb] = row.parent.css('a').text.to_f
      end
    end
    rating
  end

  def movie_info
    html = parse_html("/view/#{@query}/")
    movie_full_info = {
      external_id: html.css('.metaList > .last > a')[0]['href'][/\d+/],
      movie_ru_title: html.css('.container > .row > .col8 > h1').text,
      movie_en_title: html.css('.container > .row > .col8 > .subHeader').text,
      movie_image: html.css('.presentBlock > .presentBlockImg').to_s[/(?<=\().+?(?=\))/],
      description: html.css('main > .row > .col5 > p').text.gsub(' ', ''),
      start_date: html.css('.clear > p')[0].text[/\d+\s+[а-яА-Я]+\s+\d+/],
      country: html.css('.clear > p')[1].text.split[1]
    }
    movie_full_info.merge!(get_ratings(query))
    movie_full_info.merge(seasons: seasons_list(query))
  rescue NoMethodError
    "Can't apply selectors in '#{__method__}' method. DOM structure apparently was changed."
  end

  def seasons_list(movie_id)
    seasons = {}
    html = parse_html("/view/#{movie_id}/")
    # list of all seasons
    html.css('.col8 > form > .row[itemprop="season"]').reverse_each do |season|
      season_number = season.css('.flat > a')[0].text.split(' ')[0]

      seasons[season_number] = {}
      # list of all episodes
      season.css('.widerCont > .infoList > li').reverse_each do |series|
        special_series_counter = 0
        episode_number = series.css('._numb').text
        if episode_number.empty?
          special_series_counter += 1
          episode_number = "#{'%02i' % special_series_counter} (special)"
        end

        episode_info = { episode_title: series.css('._name').text,
                         episode_date: series.css('._date').text }
        seasons[season_number].store("#{episode_number}", episode_info)
      end
    end
    seasons
  rescue NoMethodError
    "Can't apply selectors in '#{__method__}' method. DOM structure apparently was changed."
  end

  # top rated movies from main page
  def top_rated
    top_rated_list = {}
    html = parse_html
    html.css('.landing > .container > .row> .col3 > a')[1...8].each do |movie|
      movie_id = movie['href'][/\d+/]
      top_rated_list[:"#{movie_id}"] = {
        movie_ru_title: movie.css('.fsHeader').text,
        movie_en_title: movie.css('.cFadeLight').text,
        movie_image_link: movie.search('._img').to_s[/(?<=\().+?(?=\))/],
        movie_page_link: movie['href']
      }
    end
    top_rated_list
  rescue NoMethodError
    "Can't apply selectors in '#{__method__}' method. DOM structure apparently was changed."
  end

end