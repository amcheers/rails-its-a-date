class CreateWishlists < ActiveRecord::Migration[6.0]
  def change
    create_table :wishlists do |t|
      t.references :activity, polymorphic: true, index: true
      t.references :user, null: false ,foreign_key: true

      t.timestamps
    end
  end
end
