class JcSubstitutionsController < ApplicationController
  def create
    @student = Student.find(params[:student_id])
    @jc_substitution = @student.jc_substitutions.create(params[:jc_substitution])
    redirect_to student_path(@student)
  end
 
  def destroy
    @student = Student.find(params[:student_id])
    @jc_substitution = @student.jc_substitutions.find(params[:id])
    @jc_substitution.destroy
    redirect_to student_path(@student)
  end
end
