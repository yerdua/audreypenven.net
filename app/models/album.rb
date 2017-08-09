class Album < ApplicationRecord
  CLASSIFICATIONS = %w[collection project album]

  has_and_belongs_to_many :photographs
  belongs_to :primary_photograph, class_name: 'Photograph'

  has_many :collaborator_roles, through: :photographs
  has_many :collaborators, -> { distinct }, through: :collaborator_roles

  validates :title, presence: true
  validates :classification, presence: true, inclusion: { in: CLASSIFICATIONS }
  validate :primary_photograph_in_album

  scope :collections, -> { where(classification: 'collection') }
  scope :projects, -> { where(classification: 'project') }


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
