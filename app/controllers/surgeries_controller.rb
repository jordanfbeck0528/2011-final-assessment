class SurgeriesController < ApplicationController
  def show
    # require "pry"; binding.pry
    @surgery = Surgery.find(params[:id])
    @experienced_docs = @surgery.most
    @inexperienced_docs = @surgery.least
  end

  def update
    @surgery = Surgery.find(params[:id])
    @doctor = Doctor.find_by(name: params[:name])

    @surgery.doctors << @doctor

    redirect_to surgery_path(@surgery.id)
  end
end
