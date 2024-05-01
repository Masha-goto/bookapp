class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy

  def has_written?(book)
    books.exists?(id: book.id)
  end

	# def display_name
	# 	profile&.nickname || self.email.split('@').first
	# end

end
