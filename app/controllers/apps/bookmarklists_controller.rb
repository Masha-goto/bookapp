class Apps::BookmarklistsController < Apps::ApplicationController
	def index
		@books = current_user.bookmarklists
	end
end