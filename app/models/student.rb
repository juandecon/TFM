class Student < ApplicationRecord
    has_and_belongs_to_many :courses
    has_many :grades
    has_many :assignments, through: :grades
end
