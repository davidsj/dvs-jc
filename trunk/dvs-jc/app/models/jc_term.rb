# -*- coding: utf-8 -*-
class JcTerm < ActiveRecord::Base
  include ActionView::Helpers::TextHelper

  has_many :jc_memberships, :dependent => :destroy
  has_many :students, :through => :jc_memberships

  validates :start_date, :presence => true

  attr_accessible :start_date
  validates_uniqueness_of :start_date

  def prev
    JcTerm.first(:conditions => ["start_date < ?", self.start_date],
                 :order => "start_date DESC")
  end

  def next
    JcTerm.first(:conditions => ["start_date > ?", self.start_date],
                 :order => "start_date")
  end

  def end_date
    if self.next
      self.next.start_date - 1
    end
  end

  def name
    name = start_date.strftime('%b %-d, %Y')
    if end_date
      name += " — " + end_date.strftime('%b %-d, %Y')
    end
    return name
  end

  def name_for_jc_selection
    name + " (" + pluralize(students.count, "member") + ")"
  end

  def sorted_jc_memberships
    jc_memberships.sort_by{|x| x.student.full_name}.sort_by{|x| x.student.age}
  end

  def available_students
    Student.all.reject{|s| students.find_by_id(s.id)}.sort_by(&:age).
      sort_by(&:jc_terms_served_this_year)
  end
end
