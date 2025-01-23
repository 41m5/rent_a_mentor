class AddSubjectIdToTutorSubjects < ActiveRecord::Migration[7.0]
  def change
    add_column :tutor_subjects, :subject_id, :integer
  end
end
