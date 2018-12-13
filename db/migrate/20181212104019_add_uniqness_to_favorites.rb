class AddUniqnessToFavorites < ActiveRecord::Migration[5.0]
  def change
    remove_index :favorites,[:user_id, :micropost_id]
    add_index :favorites,[:user_id, :micropost_id] ,unique:false
    
  end
end
