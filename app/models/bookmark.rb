class Bookmark < ApplicationRecord
  belongs_to :kindergarden
  belongs_to :user
end
