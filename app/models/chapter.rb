class Chapter < ApplicationRecord
  belongs_to :course, inverse_of: :chapters
  has_many :practice_questions  , inverse_of: :chapter
  # accepts_nested_attributes_for :practice_questions, allow_destroy: true

end
