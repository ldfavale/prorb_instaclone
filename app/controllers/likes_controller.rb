class LikesController < ApplicationController
  before_action :set_likeable
  def create
    current_user.like!(@likeable)
  end

  def destroy
    current_user.likes.where(likeable_id: @likeable.id, likeable_type:@likeable.class.to_s ).delete_all
  end
end