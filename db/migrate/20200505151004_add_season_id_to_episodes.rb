class AddSeasonIdToEpisodes < ActiveRecord::Migration[5.2]
  def change
    add_column :episodes, :season_id, :integer
    add_index :episodes, :season_id
  end
end
