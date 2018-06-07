class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bookmarks, dependent: :destroy
  has_many :kindergardens, :through => :bookmarks

  has_many :inquiries
  has_many :kindergardens, :through => :inquiries

end
