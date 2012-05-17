class JcAbsencesController < ApplicationController
  def create
    @student = Student.find(params[:student_id])
    @jc_absence = @student.jc_absences.create(params[:jc_absence])
    redirect_to student_path(@student)
  end
 
  def destroy
    @student = Student.find(params[:student_id])
    @jc_absence = @student.jc_absences.find(params[:id])
    @jc_absence.destroy
    redirect_to student_path(@student)
  end
end
