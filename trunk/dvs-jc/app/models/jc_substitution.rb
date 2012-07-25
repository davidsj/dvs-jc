class JcSubstitution < ActiveRecord::Base
  belongs_to :student
  attr_accessible :day

  validates_uniqueness_of :day, :scope => :student_id
end
