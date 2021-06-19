class ChangeNameToBeStringInUsers < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :name, :string
  end

  def down
    change_column :users, :name, :text
  end
end
