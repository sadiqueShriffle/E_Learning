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

    def subscribed_students(course)
      if teacher?
        byebug
        # course.subscriptions.joins(:user).where(users: { user_type: 'student' }).pluck('users.id', 'users.username','users.email')
        course.subscribtions.map(&:user)
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

    private
    def validate_email
        if (email =~ /^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$/).nil?
          errors.add(:email, 'please enter a valid email')
        end
    end

end
