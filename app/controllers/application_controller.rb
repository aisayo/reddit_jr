# responsible for handling requests
# responding to those requests 

class ApplicationController < Sinatra::Base
    
    configure do 
        # set sessions
        set :views, 'app/views'
    end 

    # define general routes
    # any route/request that doesnt involve a model 
    get '/' do 
      erb :welcome
    end 

    helpers do 

      def get_post
        @post = Post.find_by(id:params[:id])

      end 

    end 

    # about route
    # contact page

end 