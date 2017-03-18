class CollaboratorRole < ApplicationRecord
  belongs_to :collaborator
  belongs_to :photograph

  validates :title, :collaborator_id, :photograph_id, presence: true
end
