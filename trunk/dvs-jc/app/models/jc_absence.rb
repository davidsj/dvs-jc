class JcAbsence < ActiveRecord::Base
  belongs_to :student
  attr_accessible :day
end
