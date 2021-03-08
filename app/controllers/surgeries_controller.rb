class SurgeriesController < ApplicationController
  def show
    # require "pry"; binding.pry
    @surgery = Surgery.find(params[:id])
  end
end
