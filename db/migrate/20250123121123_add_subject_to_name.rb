class AddSubjectToName < ActiveRecord::Migration[7.1]
  def change
    add_column :subjects, :name, :string
  end
end
