class SiteController < ApplicationController
  def index
    redirect_to new_user_session_path, notice: "You need to be logged in to see the posts" unless current_user
    @posts = Post.all
  end
end