class JcMembershipsController < ApplicationController
  def create
    if params[:jc_term_id]
      @jc_term = JcTerm.find(params[:jc_term_id])
      @jc_term.jc_memberships.create!(params[:jc_membership])
    elsif params[:student_id]
      @student = Student.find(params[:student_id])
      @student.jc_memberships.create!(params[:jc_membership])
    end

    redirect_to request.referer
  end

  def destroy
    @jc_membership = JcMembership.find(params[:id])
    @jc_membership.destroy

    redirect_to request.referer
  end
end
