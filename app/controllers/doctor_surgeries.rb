class DoctorsSurgeriesController < ApplicationController
  def create
    DoctorSurgeries.create(doctor_surgeries_params)
    redirect_to surgery_path(@surgery_1.id)
  end

  private
  def doctor_surgeries_params
    params.permit(:name, :years, :university)
  end
end
