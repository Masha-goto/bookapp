class Book < ApplicationRecord
	validates :title, presence: true
	validates :title, length: { minimum: 2, maximum: 100 }

  validates :content, presence: true

	belongs_to :user

	def display_created_at
    I18n.l(self.created_at, format: :default)
	end

	# def author_name
	# 	user.display_name
	# end
end
