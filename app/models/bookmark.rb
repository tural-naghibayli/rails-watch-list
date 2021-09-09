class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :list, presence: true
  validates :movie, presence: true
  validates :movie, uniqueness: { scope: :list }
  validates :comment, length: { minimum: 6 }
end
