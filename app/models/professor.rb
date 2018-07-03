class Professor < ApplicationRecord
  has_and_belongs_to_many :courses
  accepts_nested_attributes_for :courses

  scope :course_list, -> { joins(:courses_professors).where('courses_professors.professor_id = ?', self.id).joins(:courses).where('courses.id = courses_professors.course_id') }


  def average_number
    ratings = Rating.where(:professor_id => self.id)
    rating_sum = ratings.sum(:rating)
    rating_count = ratings.count
    rating_sum / rating_count
  end
end
