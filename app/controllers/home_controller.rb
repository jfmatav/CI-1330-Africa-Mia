class HomeController < ApplicationController

	def index
		if user_signed_in?
			#redirect_to :controller => 'tours', :action => 'index'
			redirect_to(:tours)
		end
	end
end
