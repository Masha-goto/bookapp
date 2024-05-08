class Book < ApplicationRecord
	has_one_attached :eyecatch
	has_rich_text :content

	validates :title, presence: true
	validates :title, length: { minimum: 2, maximum: 100 }

  validates :content, presence: true

	belongs_to :user
	has_many :bookmarks, dependent: :destroy

	def display_created_at
    I18n.l(self.created_at, format: :default)
	end

	def bookmark_count
		bookmarks.count
	end

	def author_name
		user.display_name
	end

  def self.looks(search, word)
    if search == "perfect_match"
      @book = Book.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @book = Book.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @book = Book.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @book = Book.where("title LIKE?","%#{word}%")
    else
      @book = Book.all
    end
  end
end
