class CreateDateActivitiesPackages < ActiveRecord::Migration[6.0]
  def change
    create_table :date_activities_packages do |t|
      t.references :package, null: false, foreign_key: true
      t.references :date_activity, null: false, foreign_key: true
    end
  end
end
