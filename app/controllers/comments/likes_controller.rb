class Comments::LikesController < LikesController
    before_action :set_likeable

    private 

    def set_likeable
        @likeable = Comment.find(params[:comment_id])
        @post = Post.find(params[:post_id])
    end
end