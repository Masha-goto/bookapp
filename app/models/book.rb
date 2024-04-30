class Book < ApplicationRecord
	validates :title, presence: true
	validates :title, length: { minimum: 2, maximum: 100 }

  validates :content, presence: true

	belongs_to :user

	# def author_name
	# 	user.display_name
	# end
end
