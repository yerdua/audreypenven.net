class Photograph < ApplicationRecord
  has_and_belongs_to_many :albums
  has_many :collaborator_roles
  has_many :collaborators, through: :collaborator_roles

  has_attached_file :image,
    PAPERCLIP_ATTACHMENT_OPTIONS.merge({
      styles: {
        large: ['2000x2000>', :jpg],
        medium: ['1000x1000>', :jpg],
        small_square: ['200x200#', :jpg]
      }
    })

  validates :image, attachment_presence: true
  do_not_validate_attachment_file_type :image
  # validates :taken_on, presence: true

end
