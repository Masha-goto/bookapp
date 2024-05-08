class SearchesController < ApplicationController
  before_action :authenticate_user!

	def index
    @books = Book.looks(params[:search], params[:word])
	end
end