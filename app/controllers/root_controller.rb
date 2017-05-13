class RootController < ApplicationController
  def index
    @body_class = 'red-first'

    @albums = Album.order(updated_at: :desc).limit(12)
  end
end
