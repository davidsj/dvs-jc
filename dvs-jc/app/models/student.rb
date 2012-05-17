class Student < ActiveRecord::Base
  attr_accessible :date_of_birth, :first_name, :jc_days_sentenced, :last_name
  validates :first_name,        :presence => true
  validates :last_name,         :presence => true
  validates :jc_days_sentenced, :presence => true
  validates :date_of_birth,     :presence => true

  has_many :jc_absences
  has_many :jc_substitutions
end
