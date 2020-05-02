class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.string :number
      t.string :title
      t.date :date

      t.timestamps
    end
  end
end
