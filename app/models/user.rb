class User < ApplicationRecord

    enum user_type: {teacher: 'teacher',student: 'student'}
    
    has_many :subscriptions , dependent: :destroy
    has_many :courses , dependent: :destroy
    has_many :notifications ,dependent: :destroy
  

    
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    validate  :validate_email


         
    def teacher?
      user_type == 'teacher'
    end

    def student?
      user_type == 'student'
    end

  #   def students_subscribed_to_my_courses
  #     if teacher?
  #       students = User.joins(:courses).where('courses.teacher.id=?').where(user_type: :student)
  #     else
  #       User.none
  #   end
  # end

    # used to count subscriber per course
    def subscribers_count_per_course
        if teacher?
        courses.includes(:subscriptions).map do |course|
          { course_name: course.course_name, subscribtions: course.subscriptions.count }
          end
        else
          User.none
        end
  end

    private
    def validate_email
        if (email =~ /^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$/).nil?
          errors.add(:email, 'please enter a valid email')
        end
    end

 

end
