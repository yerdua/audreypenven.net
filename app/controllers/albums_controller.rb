class AlbumsController < ApplicationController
  before_filter :load_album

  def show
  end

  private

  def load_album
    @album = Album.includes(photographs: {collaborator_roles: :collaborators}).find(params[:id])
  end
end
