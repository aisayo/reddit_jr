class Author < ActiveRecord::Base
    has_many :posts

    # methods that we get:
    # author.posts
    # author.posts<< () shovel a new post to authors collection
    # author.posts.build(hash of attributes)
    # author.posts.create(hash of attributes)
    
    # has many categories through post
    has_many :categories, through: :posts
    # author.categories
end 


