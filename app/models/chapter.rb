class Chapter < ApplicationRecord
  belongs_to :course
  has_many :practice_questions, dependent: :destroy 
  
  validates :chapter_name , presence: true 

  accepts_nested_attributes_for :practice_questions, allow_destroy: true

end
