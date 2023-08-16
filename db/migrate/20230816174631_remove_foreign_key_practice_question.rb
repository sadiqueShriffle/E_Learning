class RemoveForeignKeyPracticeQuestion < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :practice_questions, column: :course_id

  end
end
