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
       erb :test
    end 

    # about route
    # contact page

end 