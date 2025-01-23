class AddTutorIdToTutorSubjects < ActiveRecord::Migration[7.1]
  def change
    add_column :tutor_subjects, :tutor_id, :integer
    add_foreign_key :tutor_subjects, :tutors
  end
end
