class Course < ApplicationRecord

  belongs_to :user
  has_many :subscriptions

  has_many :chapters 


  validate :user_must_be_teacher 
  validate :user_must_be_student 

  private
  def user_must_be_teacher
   errors.add(:base, "Only teachers can create courses") unless user&.teacher?
  end

  def user_must_be_student
    erros.add(:base, "Only student can subscribe courses") unless user&.student?
  end
  

end

