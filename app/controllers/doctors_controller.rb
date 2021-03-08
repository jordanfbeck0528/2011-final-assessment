class DoctorsController < ApplicationController
  def index
    # require "pry"; binding.pry
    @doctors = Doctor.all
  end
end
