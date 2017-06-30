class PostsController < ApplicationController

  def index
    if user_signed_in?
      @posts = current_user.made_news_list
    else
      @posts = Post.all
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def post_params
    params.require(:post).permit(:title, :link, :description, :pub_date, :photo)
  end
end
