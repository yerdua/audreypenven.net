class Collaborator < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
