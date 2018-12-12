# == Schema Information
#
# Table name: courses
#
#  id            :bigint(8)        not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Course < ApplicationRecord

    belongs_to :prereq,
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
    
    has_many :postreqs,
        class_name: 'Course',
        primary_key: :id,
        foreign_key: :prereq_id
end
