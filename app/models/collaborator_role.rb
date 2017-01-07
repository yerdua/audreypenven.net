class CollaboratorRole < ApplicationRecord
  validates :title, :collaborator_id, :photograph_id, presence: true
end
