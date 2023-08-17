class PracticeQuestion < ApplicationRecord
   belongs_to :chapter, inverse_of: :practice_questions
 end
