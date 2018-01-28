class Collaborator < ApplicationRecord
  has_many :roles, class_name: 'CollaboratorRole', inverse_of: :collaborator
  has_many :photographs, through: :roles

  validates :name, presence: true, uniqueness: true

  def titles_for_photograph(photograph)
    roles.for_photograph(photograph).pluck(:title)
  end
end
