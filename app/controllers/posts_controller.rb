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

    #update the post
    def update
    	#operation similar to show
    	@post = Post.find(params[:id])

    	#helps to update the post
    	if @post.update(post_params)
    		redirect_to @post
    	else
    		render 'edit'
    	end
    end

    def edit
    	#Helps to edit the post
    	@post = Post.find(params[:id])
    end

    #below method helps to delete the post
    def destroy
    	@post = Post.find(params[:id])
    	@post.destroy

    	redirect_to posts_path
    end


    private
    def post_params
    	params.require(:post).permit(:title, :content)
    end
    
end
