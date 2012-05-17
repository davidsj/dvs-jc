class Student < ActiveRecord::Base
  attr_accessible :date_of_birth, :first_name, :jc_days_sentenced, :last_name
  validates :first_name,        :presence => true
  validates :last_name,         :presence => true
  validates :jc_days_sentenced, :presence => true
  validates :date_of_birth,     :presence => true

  has_many :jc_absences, :dependent => :destroy
  has_many :jc_substitutions, :dependent => :destroy

  def age
    today = Date.today
    age = today.year - date_of_birth.year
    if today.month < date_of_birth.month or (today.month == date_of_birth.month and today.day < date_of_birth.day)
      age -= 1
    end
    
    return age
  end
end
