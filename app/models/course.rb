class Course < ApplicationRecord
  has_and_belongs_to_many :professors
  accepts_nested_attributes_for :professors

  scope :professor_list, -> { joins(:courses_professors).where('courses_professors.course_id = ?', self.id).joins(:professors).where('professors.id = courses_professors.professor_id') }

end
