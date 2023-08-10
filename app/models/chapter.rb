class Chapter < ApplicationRecord
  belongs_to :course
  has_many :practice_questions, dependent: :destroy
end
