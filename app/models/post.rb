class Post < ActiveRecord::Base
    #belong to both author and category 
    belongs_to :author
    # post.author / read the author that the post belongs to
    # post.author= / set the author that post belongs to 
    # post.build_author(hash of attributes)
    # post.create_author(hash of attributes)
    belongs_to :category


    # what kind of table is post: join table
end 