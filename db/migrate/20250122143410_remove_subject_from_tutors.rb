class RemoveSubjectFromTutors < ActiveRecord::Migration[7.1]
  def change
    remove_column :tutors, :subject_id, :string
  end
end
