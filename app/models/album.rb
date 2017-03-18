class Album < ApplicationRecord
  has_and_belongs_to_many :photographs
  belongs_to :primary_photograph, class_name: 'Photograph'

  has_many :collaborators, through: :photographs

  validates :title, presence: true
  validate :primary_photograph_in_album

  private

  def primary_photograph_in_album
    errors[:primary_photograph] << 'must be a photograph in this album'
  end
end
