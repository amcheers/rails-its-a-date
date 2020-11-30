class CreateDateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :date_activities do |t|
      t.string :title
      t.text :description
      t.boolean :confirmed
      t.string :location
      t.integer :price
      t.json :availability
      t.boolean :reservation
      t.string :reservation_url
      t.string :contact_email
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
