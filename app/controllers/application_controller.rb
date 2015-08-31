class ApplicationController < ActionController::Base

	def index
	 	
	end
	def new
		@worker = Worker.new
	end
  protect_from_forgery with: :exception
end
