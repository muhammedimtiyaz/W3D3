class Course < ApplicationRecord

    belongs_to :prereqs,
        class_name: 'Course',
        primary_key: :id,
        foreign_key: :prereq_id

    belongs_to :instructor,
        class_name: 'Course',
        primary_key: :id,
        foreign_key: :instructor_id

    has_many :enrollments,
        class_name: 'Enrollment',
        primary_key: :id,
        foreign_key: :course_id

    has_many :enrolled_students,
        through: :enrollments,
        source: :user     
    
    has_many :courses,
        class_name: 'Course',
        primary_key: :id,
        foreign_key: :prereq_id

    has_many :users,
        through: :enrollments,
        source: :user

end
