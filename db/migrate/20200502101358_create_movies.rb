class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :ru_title
      t.string :en_title
      t.string :image_url
      t.text :description
      t.date :start_date
      t.string :country
      t.float :imdb
      t.float :kinopoisk

      t.timestamps
    end
  end
end
