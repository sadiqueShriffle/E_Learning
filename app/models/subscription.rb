class Subscription < ApplicationRecord

  belongs_to :user
  belongs_to :course


  after_create :create_notification_for_teacher

  validate :user_must_be_student
  validate :validate_unique_subscription_for_student
  

#   scope :subscribed_courses, -> {student.subscriptions.map(&:course)}
    
# display_subscribed_courses_with_chapters
#     subscribed_courses.each do |course|
#       puts "Course Name : #{course.course_name}"
#       puts "Description: #{course.description}"

#       chapters = course.chapters
#       chapters.each  do |chapter|
#           puts "Chapter Name :#{chapter.chapter_name}"
          
#       end

#     end  
#   end


  private 
  def user_must_be_student
    errors.add(:base, "only Student can subscribe to course") unless user&.student?
  end
  

  def create_notification_for_teacher
    if user.student? && course.user.teacher?
      message = "#{user.username} has subscribed to your course: #{course.course_name} "
      course.user.notifications.create!(message: message, course: course)
    end
  end


def validate_unique_subscription_for_student
  if user && course && user.student? && user.subscriptions.where(course_id: course_id).exists?
    errors.add(:base, "You Have Alredy Subscribed to this course")
  end
end


end
