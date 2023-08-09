# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# 10.times do |i|
#     User.create(
#     first_name: 'sadiq'"#{i}",
#     last_name:'ansri',
#     user_type: 'student',
#     email:'sadiq'"#{i}"'@gmail.com',
#     username:'sadiq00'"#{i}",
#     password:'sadique@1234',
#     profile_picture: 'SA' "#{i}"
#     )
#     end


    # 10.times do |i|
    #     User.create(
    #     first_name: 'Rahul'"#{i}",
    #     last_name:'Singh',
    #     user_type: 'teacher',
    #     email:'ragyk'"#{i}"'@gmail.com',
    #     username:'rahul00'"#{i}",
    #     password:'rahul@12',
    #     profile_picture: 'RA' "#{i}"
    #     )
    #     end

    #     5.times do|i|
    #         Course.create()


    #     end


    #     subscribe =student.subscriptions.create(user_id: 23,course_id: 2,subscription_date: Date.today,expiration_date: Date.t
    #         oday+30)

    #  teachers = User.where(user_type: 'teacher')
    # id = teachers.ids

    # students = User.where(user_type: 'student')
    # id= students.ids

    # courses = Course.all
    # c_id= courses.ids



#     teachers.each do |teacher,id|
#     3.times do |i|
#         teacher.courses.create(
# course_name: "Mathematics""#{i}", description: "Testing Courses " "#{i}", user_id: id
#         )

#         end
#     end
    


# teachers.each do |teacher|
#         courses.each do |course,c_id|
#         3.times do |i|
#             course.chapters.create(
#                 chapter_name: "Testing Out Chapters ""#{i}",
#                 course_id: c_id
#             )
#         end
#     end
# end

    

# courses.each do |course|
#         students.each  do |student|
            
#             student.subscriptions.create(
#                 user_id: student.id,
#                 course_id: course.id,
#                 subscription_date: Date.today,
#                 expiration_date: Date.today+1,
#                 username: student. 


#             )
#         end
#         end

    
        

 # user = User.create( first_name: 'rajat', last_name: 'rajat', username: 'rajat23', email: 'rajat@gmail.com', password: 'rajat@22', user_type: 'student', profile_picture: 'rajat.jpg')
    teacher = User.where(user_type: 'teacher')

    # student.subscriptions.map(&:course)