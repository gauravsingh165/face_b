class Api::V1::LikesController < ApplicationController
    before_action :find_post

    def create
        debugger
      like = @post.likes.build(user: current_user)
      
      if like.save
        render json: { message: 'Post liked successfully' }, status: :created
      else
        render json: { errors: like.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      like = current_user.likes.find_by(post: @post)
      
      if like
        like.destroy
        render json: { message: 'Like removed successfully' }, status: :ok
      else
        render json: { message: 'Like not found' }, status: :not_found
      end
    end

    private

    def find_post
        debugger
      @post = current_user.posts.find(params[:post_id])
    end
	
end
