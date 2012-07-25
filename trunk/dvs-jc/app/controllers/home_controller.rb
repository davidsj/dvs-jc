class HomeController < ApplicationController
  def index
    @jc_terms = JcTerm.all.sort_by(&:start_date).reverse
    @students = Student.all.sort_by(&:full_name)
  end
end
