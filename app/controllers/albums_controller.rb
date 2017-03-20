class AlbumsController < ApplicationController
  before_filter :load_album

  def show
    @body_class = 'red-first'
  end

  private

  def load_album
    @album = Album.includes(photographs: {collaborator_roles: :collaborator}).find(params[:id])
  end
end
