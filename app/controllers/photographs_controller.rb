class PhotographsController < ApplicationController
  def new
    @photograph = Photograph.new
  end

  def create
    @photograph = Photograph.new(allowed_params)
    if @photograph.save
      render 'SAVED!'
    else
      render :new
    end
  end

  private

  def allowed_params
    params.require(:photograph).permit(:image)
  end
end
