class Course < ApplicationRecord

  belongs_to :user
  has_many :subscriptions

  has_many :chapters 


  validate :user_must_be_teacher


  private
  def user_must_be_teacher
   errors.add(:base, "Only teachers can create courses") unless user&.teacher?
  end


  

end

