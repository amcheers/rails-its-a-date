class ChangeWishlistsToFavoriteActvities < ActiveRecord::Migration[6.0]
  def change
    rename_table :wishlists, :favorite_activities
  end
end
