class AddCoordinatesToDateActivity < ActiveRecord::Migration[6.0]
  def change
    add_column :date_activities, :latitude, :float
    add_column :date_activities, :longitude, :float
  end
end
