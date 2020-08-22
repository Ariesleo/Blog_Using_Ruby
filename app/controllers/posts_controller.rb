class PostsController < ApplicationController

    def index
    	#helps to loop through all the post crated using posts instance variable 
    	@posts = Post.all.order("created_at DESC")
    end

    def new
    	#creating an new instance variable for Post model
    	@post = Post.new 
    end

    #below method helps to create the post
    def create
    	@post = Post.new(post_params)

    	if @post.save
    		redirect_to @post
    	else
    		render 'new'
    	end
    end

    #Below methow is to show the created posts in show page
    def show
    	#we need to find the post that was created by the id
    	@post = Post.find(params[:id])

    end


    private
    def post_params
    	params.require(:post).permit(:title, :content)
    end
    
end
