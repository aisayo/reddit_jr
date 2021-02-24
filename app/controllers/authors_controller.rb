class AuthorsController < ApplicationController

    # responsible for anything involving our author

    get '/signup' do # render signup form
        erb :"authors/signup"
    end 

    post '/signup' do # process the signup form
        # receive data from the form inside of params hash
        # create a new author object with the data
        author = Author.new(params)
        # validate our author object
        # if author.username != ""
        if author.username.blank? || author.email.blank? || author.name.blank? || author.password.blank? || Author.find_by_email(params[:email]) || Author.find_by_username(params[:username])
            redirect '/signup'
        else 
            author.save
            session[:author_id] = author.id # logging user in
            redirect '/posts'
        end 
    end 


    # login '/login' read => querying our author and reading authors attributes

    get '/login' do # render the login form
        erb :"authors/login"
    end 

    post '/login' do # process the login form
        # gather data from the form => params
        # find my author object
        author = Author.find_by_username(params[:username])
        # binding.pry
        # if author exists && password is correct
        if author && author.authenticate(params[:password])
            # login user
            session[:author_id] = author.id
            # redirect 
            redirect '/posts'
        else 
            # flash[]
            flash[:error] = "Invalid login"
            # invalid login
            redirect '/login'
        end 
    end 

    get '/logout' do
        session.clear
        redirect '/login'
    end 

    # logout  'logout' delete => clears our session
end 

