class AddEdLevelToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :ed_level, :string
  end
end
