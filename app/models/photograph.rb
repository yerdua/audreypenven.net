class Photograph < ApplicationRecord
  has_and_belongs_to_many :albums
  has_many :collaborator_roles
  has_many :collaborators, through: :collaborator_roles

  validates :image, attachment_presence: true
  validates :taken_on, presence: true
end
