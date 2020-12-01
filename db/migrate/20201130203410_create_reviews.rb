class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :rating
      t.references :activity, polymorphic: true, index: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
