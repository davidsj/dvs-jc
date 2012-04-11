class Student < ActiveRecord::Base
  attr_accessible :date_of_birth, :first_name, :jc_days_sentenced, :last_name
end
