class AddUrlAndPhoneNumberToDateActivity < ActiveRecord::Migration[6.0]
  def change
    add_column :date_activities, :url, :string
    add_column :date_activities, :phone_number, :string
  end
end
