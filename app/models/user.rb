class User < ApplicationRecord
    has_secure_password

    enum user_type: {teacher: 'teacher',student: 'student'}
    
    has_many :subscriptions
    # has_many :subscribed_courses, through: :subscriptions, source: :course
    has_many :courses , dependent: :destroy
    has_many :notifications ,dependent: :destroy
  
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
    validates :username, presence: true, uniqueness: true

    def subscribed_students(course)
      if teacher?
   
        course.subscriptions.joins(:user).where(users: { user_type: 'student' }).pluck('users.id', 'users.username','users.email')
        # course.subscribtions.map(&:user)

      else
        []
      end
    end


    def subscribers_count_per_course
        if teacher?
        courses.includes(:subscriptions).map do |course|
          { course_name: course.course_name, subscribtions: course.subscriptions.count  }
          end
        else
          User.none
        end
    end

 

end
