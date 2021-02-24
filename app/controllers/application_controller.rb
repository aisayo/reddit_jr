# responsible for handling requests
# responding to those requests 

class ApplicationController < Sinatra::Base
    
    configure do 
        # set sessions
        set :views, 'app/views'
        enable :sessions 
        set :session_secret, "secret"
        register Sinatra::Flash
    end 

    # define general routes
    # any route/request that doesnt involve a model 
    get '/' do 
      # binding.pry
      erb :welcome
    end 

    helpers do # makes these methods availble to controller and views

      # return the logged in user
     def current_user # return logged in user 
      @current_user ||= Author.find_by_id(session[:author_id]) #memoization
     end 

      # check if a user logged in
      def logged_in?
        !!session[:author_id]
      end 

    end 

    # about route
    # contact page

end 