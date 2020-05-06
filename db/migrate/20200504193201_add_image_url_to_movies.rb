class AddImageUrlToMovies < ActiveRecord::Migration[5.2]
  def change
    change_column :movies, :image_url, :string, default: 'https://dummyimage.com/600x400/f5f5f5/000000&text=No+image+=('
    change_column :movies, :description, :text, default: 'Описание недоступно'
  end
end
