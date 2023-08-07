class RemoveForeignKey < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :chapters ,column: :user_id
    remove_foreign_key :practice_questions , column: :user_id
  end
end
