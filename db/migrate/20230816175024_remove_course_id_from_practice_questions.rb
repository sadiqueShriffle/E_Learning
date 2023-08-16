class RemoveCourseIdFromPracticeQuestions < ActiveRecord::Migration[7.0]
  def change
    remove_column :practice_questions, :course_id 
    remove_column :practice_questions ,:user_id 
    remove_column :practice_questions, :course_id_id
    


  end
end
