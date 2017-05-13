# This is a probably-stupid way of using photographs throughout the site
class SiteImageMapping < ApplicationRecord
  validates :location_key, presence: true
  validates :photograph_id, presence: true
  validates :photograph_id, uniqueness: {scope: :location_key}

  belongs_to :photograph
end
