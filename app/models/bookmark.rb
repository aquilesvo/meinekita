class Bookmark < ApplicationRecord
  belongs_to :kindergarden
  belongs_to :user

  validates :kindergarden, uniqueness: { scope: :user }
end
