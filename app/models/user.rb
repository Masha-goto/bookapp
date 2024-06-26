class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
	has_many :bookmarklists, through: :bookmarks, source: :book

  has_one :profile, dependent: :destroy

  def has_written?(book)
    books.exists?(id: book.id)
  end

  def has_bookmarked?(book)
    bookmarks.exists?(book_id: book.id)
  end

  def prepare_profile
    profile || build_profile
  end

	def display_name
		profile&.nickname || self.email.split('@').first
	end

  def avatar_image
    if profile&.avatar&.attached?
      profile.avatar
    else
      'default-avatar.png'
    end
  end

end
