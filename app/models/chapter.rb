class Chapter < ApplicationRecord
  belongs_to :course
  has_many :practice_questions, dependent: :destroy
  accepts_nested_attributes_for :practice_questions, allow_destroy: true

end
