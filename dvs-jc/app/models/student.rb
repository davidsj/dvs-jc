class Student < ActiveRecord::Base
  include ActionView::Helpers::TextHelper

  attr_accessible :date_of_birth, :first_name, :jc_days_sentenced, :last_name
  validates :first_name,        :presence => true
  validates :last_name,         :presence => true
  validates :jc_days_sentenced, :presence => true, :numericality => {:greater_than_or_equal_to => 0}
  validates :date_of_birth,     :presence => true

  has_many :jc_absences, :dependent => :destroy
  has_many :jc_substitutions, :dependent => :destroy
  has_many :jc_memberships, :dependent => :destroy
  has_many :jc_terms, :through => :jc_memberships

  after_initialize :init

  def init
    self.jc_days_sentenced ||= 0
  end

  def age
    today = Date.today
    age = today.year - date_of_birth.year
    if today.month < date_of_birth.month or (today.month == date_of_birth.month and today.day < date_of_birth.day)
      age -= 1
    end
    
    return age
  end

  def full_name
    first_name + " " + last_name
  end

  def name_and_age
    full_name + " (" + age.to_s + " y/o)"
  end

  def jc_selection_suffix
    "(" + pluralize(jc_terms.count, "term") + " served, " +
      pluralize(jc_days_sentenced, "day") + " sentenced, " +
      pluralize(jc_absences.count, "absence") + ", " +
      pluralize(jc_substitutions.count, "substitution") + ", " +
      age.to_s + " y/o)"
  end

  def name_for_jc_selection
    full_name + " " + jc_selection_suffix
  end

  def sorted_jc_memberships
    jc_memberships.sort_by{|x| x.jc_term.start_date}.reverse
  end

  def available_jc_terms
    JcTerm.all.reject{|t| jc_terms.find_by_id(t.id)}.sort_by(&:start_date).reverse
  end
end
