class AddUserIdToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :user_id, :integer
    add_index :movies, :user_id
  end
end
# rails generate migration RemoveFieldNameFromTableName field_name:datatype