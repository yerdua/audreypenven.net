class RootController < ApplicationController
  def index
    @body_class = 'red-first'

    @projects = Album.projects.order(updated_at: :desc).limit(12)
    @collections = Album.collections.order(updated_at: :desc).limit(12)
    @albums = Album.order(updated_at: :desc).limit(12)
  end
end
