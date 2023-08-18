class Api::V1::PostsController < ApplicationController
  #  before_action :find_user

      def create
        post = @user.posts.build(post_params)

        if post.save
          render json: post, status: :created
        else
          render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      # def find_user
      #   @user = User.find(params[:user_id])
      # end

      def post_params
        params.require(:post).permit(:title, :content)
      end
	
end
