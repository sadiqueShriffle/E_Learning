class DropColumnPractice < ActiveRecord::Migration[7.0]
  def change
    remove_column :practice_questions, :user_id
    remove_column :chapters, :user_id


  end
end
