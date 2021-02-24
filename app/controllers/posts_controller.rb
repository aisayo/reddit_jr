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

    # show route
    get '/posts/:id' do 
       get_post
        erb :'posts/show'
        # # retrieve the requested post 
        # @post = Post.find(params[:id])
        # # show details of that post         
        # erb :'posts/show'
    end 

    # user wants to see details of 1 post
    # show route

    # our user just submitted the new post form 
    post '/posts' do 
        # create the new post
        # redirect our user somewhere 

        # @post = Post.new(title: params[:title], content: params[:content])
        # @post = Post.new(params)
        # @post.save
        @post = Post.new(params) #.new & .save
        @post.author_id = session[:author_id]
        @post.save
        # @post = Post.new(params)
        # @post.author_id = session[:author_id]
        # @post.save
        # author = Author.find(session[:author_id])
        # author.posts << @post
        # author.posts.build(params)
        redirect "/posts/#{@post.id}" 
    end 

    # our user just requested to see an edit form for a post

    get '/posts/:id/edit' do 
        get_post
        redirect_if_not_authorized
        erb :"/posts/edit"
        # retreive the object
        # autofill a form with the details of that object
        # render to our user to fill out 
    end 

    # user just submitted the edit form
    patch '/posts/:id' do 
        get_post
        redirect_if_not_authorized
        @post.update(title: params[:title], content: params[:content])
        redirect "/posts/#{@post.id}" 
        # @post.update
        # no view 
        # update the particular object with new attributes
    end 

    # user wants to delete an existing post 
    delete '/posts/:id' do 
        get_post
        @post.destroy
        redirect '/posts'
        # no view 
    end 

private 

    def get_post 
        @post = Post.find_by(id:params[:id])
    end 

    def redirect_if_not_authorized
        if @post.author != current_user
            flash[:error] = "You cant make this edit, you don't own this"
            redirect '/posts'
        end 

    end 

end 