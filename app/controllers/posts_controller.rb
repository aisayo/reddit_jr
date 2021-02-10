class PostsController < ApplicationController
 # all routes pertaining to Post model 

    # ERB tags: 
    # <%= %> = what our user sees
    # <% %> = what our views process

    # user just requested all posts 
    #index route
    get '/posts' do 
        @posts = Post.all
        erb :'posts/index'
    end 

    # user just made a request to view form to add a new post
    get '/posts/new' do 
        erb :'posts/new'
    end 

    # user wants to see details of 1 post
    # show route
    get '/posts/:id' do 
        # retrieve the requested post 
        @post = Post.find(params[:id])
        # show details of that post         
        erb :'posts/show'
    end 

    # our user just submitted the new post form 
    post '/posts' do 
        # create the new post
        # redirect our user somewhere 
    end 

    # our user just requested to see an edit form for a post

    get '/posts/:id/edit' do 
        # retreive the object
        # autofill a form with the details of that object
        # render to our user to fill out 
    end 

    # user just submitted the edit form
    patch '/posts/:id' do 
        # no view 
        # update the particular object with new attributes
    end 

    # user wants to delete an existing post 
    delete '/posts/:id' do 
        # no view 
    end 





end 