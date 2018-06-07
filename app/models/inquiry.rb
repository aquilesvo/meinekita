class Inquiry < ApplicationRecord
  belongs_to :kindergarden
  belongs_to :user

  def alert
    super ? Time.at(super) : super
  end
end


