class LikesController < ApplicationController
  def create
    @likeable = params[:type].constantize.find(params[:id]) if %w(Comment Post).include?(params[:type])
    current_user.like!(@likeable) if @likeable
  end

  def destroy
    if %w(Comment Post).include?(params[:type])
      @likeable = params[:type].constantize.find_by(id: params[:post_id],user_id: current_user.id)
      current_user.likes.where(likeable_id: params[:id], likeable_type: params[:type]).delete_all
    end
  end
end
