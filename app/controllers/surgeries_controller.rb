class SurgeriesController < ApplicationController
  def show
    # require "pry"; binding.pry
    @surgery = Surgery.find(params[:id])
    @experienced_docs = @surgery.most
    @inexperienced_docs = @surgery.least
  end
end
