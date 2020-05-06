class ChangeStartDateToStringFromMovies < ActiveRecord::Migration[5.2]
  def change
    change_column :movies, :start_date, :string
  end
end
