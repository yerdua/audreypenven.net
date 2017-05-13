class Photograph < ApplicationRecord
  has_and_belongs_to_many :albums
  has_many :collaborator_roles
  has_many :collaborators, through: :collaborator_roles
  has_many :site_image_mappings

  scope :for_location, ->(location_key) {joins(:site_image_mappings).where(site_image_mappings: { location_key: location_key})}

  # Short edge measurements are based on 35mm proportions
  has_attached_file :image,
    PAPERCLIP_ATTACHMENT_OPTIONS.merge({
      styles: {
        large:      ['2000x2000>', :jpg], #short edge: 1333
        medium:     ['1000x1000>', :jpg], #short edge: 667
        small:      ['500x500>', :jpg],   #short edge: 333
        square_200: ['200x200#', :jpg],
        square_150: ['150x150#', :jpg]
      }
    })

  validates :image, attachment_presence: true
  do_not_validate_attachment_file_type :image
  # validates :taken_on, presence: true

end
