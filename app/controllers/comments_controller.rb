class CommentsController < ApplicationController

    def index

    end
    
    def create
        # debugger
        @blog = Blog.find(params[:blog_id])
        @comment = Comment.create(comment_params)
        if @comment.save
        redirect_to blogs_path(@blog)
        else 
            redirect_to blogs_path(@blog)
        end
    end

    private
    def comment_params
        params.permit(:commenter, :body ,:blog_id) 
    end
end
