class Course < ApplicationRecord

  belongs_to :user
  has_many :subscriptions, dependent: :destroy 
  # has_many :subscribers, through: :subscriptions, source: :user
  has_many :chapters

  accepts_nested_attributes_for :chapters, allow_destroy: true

  validate :user_must_be_teacher 
  validates :course_name , :description , presence: true
  # validate :user_must_be_student 

  private
  def user_must_be_teacher
   errors.add(:base, "Only teachers can create courses") unless user&.teacher?
  end

  # def user_must_be_student
  #   errors.add(:base, "Only student can subscribe courses") unless user&.student?
  # end
  

end

