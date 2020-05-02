class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :ru_title, default: 'Отсутствует'
      t.string :en_title, default: 'Отсутствует'
      t.string :image_url
      t.text :description
      t.date :start_date
      t.string :country
      t.float :imdb, default: 0
      t.float :kinopoisk, default: 0

      t.timestamps
    end
  end
end
