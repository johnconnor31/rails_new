class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :google_search
	private def current_user
	  if session[:name]
	  		@current_user = session[:name]
		else 
			nil
	   end
	end
	private def google_search
		GoogleCustomSearchApi.search("poker")	
	end
end
