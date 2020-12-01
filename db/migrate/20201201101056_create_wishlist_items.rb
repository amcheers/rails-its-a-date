class CreateWishlistItems < ActiveRecord::Migration[6.0]
  def change
    create_table :wishlist_items do |t|
      t.references :activity, polymorphic: true, index: true
      t.reference :user
    end
  end
end
