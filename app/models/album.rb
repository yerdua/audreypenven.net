class Album < ApplicationRecord
  has_and_belongs_to_many :photographs

  validates :title, presence: true
end
