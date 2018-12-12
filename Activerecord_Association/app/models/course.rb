class Course < ApplicationRecord

    belongs_to :prereqs,
        class_name: 'Prereq',
        primary_key: :id,
        foreign_key: :prereq_id

    has_many :enrollments,
        class_name: 'Enrollment',
        primary_key: :id,
        foreign_key: :course_id

    has_many :enrolled_students,
        through: :enrollments,
        source: :user

    has_one :prerequisite,
        
end
