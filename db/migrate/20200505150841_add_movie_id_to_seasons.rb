class AddMovieIdToSeasons < ActiveRecord::Migration[5.2]
  def change
    add_column :seasons, :movie_id, :integer
    add_index :seasons, :movie_id
  end
end
