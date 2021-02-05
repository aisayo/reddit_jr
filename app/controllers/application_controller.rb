# responsible for handling requests
# responding to those requests 

class ApplicationController < Sinatra::Base
    
    configure do 
        set :views, 'app/views'
    end 

    get '/' do 
       erb :test
    end 

end 