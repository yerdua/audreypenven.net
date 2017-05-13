class Album < ApplicationRecord
  has_and_belongs_to_many :photographs
  belongs_to :primary_photograph, class_name: 'Photograph'

  has_many :collaborator_roles, through: :photographs
  has_many :collaborators, -> { distinct }, through: :collaborator_roles

  validates :title, presence: true
  validate :primary_photograph_in_album

  def collaborator_titles
    collaborator_roles.select(:title).distinct.pluck(:title)
  end

  private

  def primary_photograph_in_album
    unless photographs.include?(primary_photograph)
      errors[:primary_photograph] << 'must be a photograph in this album'
    end
  end
end
