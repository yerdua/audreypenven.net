class PhotographsController < ApplicationController
  # before_filter :authenticate, only: [:new, :create, :edit, :update]
  before_filter :load_photograph, only: [:show, :edit]

  def new
    @photograph = Photograph.new
  end

  def create
    @photograph = Photograph.new(allowed_params)
    if @photograph.save
      redirect_to @photograph
    else
      render :new
    end
  end

  def portfolio
    @body_class = 'red-first'
  end

  private

  def load_photograph
    @photograph = Photograph.find(params[:id])
    @collaborator_to_roles = @photograph.collaborator_roles.includes(:collaborator).group_by(&:collaborator)
  end

  def allowed_params
    params.require(:photograph).permit(:image)
  end
end
