class JcMembership < ActiveRecord::Base
  belongs_to :student
  belongs_to :jc_term

  validates :student, :presence => true
  validates :jc_term, :presence => true
  validates_uniqueness_of :student_id, :scope => :jc_term_id

  attr_accessible :student_id, :jc_term_id
end
