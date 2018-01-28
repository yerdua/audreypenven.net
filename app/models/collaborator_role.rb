class CollaboratorRole < ApplicationRecord
  belongs_to :collaborator, inverse_of: :roles
  belongs_to :photograph, inverse_of: :collaborator_roles

  scope :for_photograph, -> (photograph) { where(photograph_id: photograph.id) }
  scope :for_collaborator, -> (collaborator) { where(collaborator_id: collaborator.id) }

  validates :title, :collaborator_id, :photograph_id, presence: true
  validates :title, uniqueness: { scope: [:collaborator_id, :photograph_id] }
end
