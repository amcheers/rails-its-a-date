class CreateCategoriesDateActivities < ActiveRecord::Migration[6.0]
  def change
    create_table :categories_date_activities do |t|
      t.references :date_activity, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
    end
  end
end
