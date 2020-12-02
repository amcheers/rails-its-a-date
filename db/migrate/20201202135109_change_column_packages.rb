class ChangeColumnPackages < ActiveRecord::Migration[6.0]
  def change
    rename_column :packages, :name, :title
  end
end
