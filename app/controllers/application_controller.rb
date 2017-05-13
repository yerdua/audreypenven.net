class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :load_header_image

  def load_header_image
    possible_images = Photograph.for_location("#{controller_name}_#{action_name}-header")
    @header_image = possible_images.count > 1 ? possible_images.to_a.sample : possible_images.first
  end

  private

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      ENV['USERNAME'].present? && ENV['PASSWORD'].present? && username == ENV['USERNAME'] && password == ENV['PASSWORD']
    end
  end

end
