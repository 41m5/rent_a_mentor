class CreateTutorSubjects < ActiveRecord::Migration[7.1]
  def change
    create_table :tutor_subjects do |t|

      t.timestamps
    end
  end
end
