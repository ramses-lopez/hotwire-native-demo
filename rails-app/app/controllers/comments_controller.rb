class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: "Comment was successfully added." }
        format.turbo_stream
      else
        format.html { redirect_to @post, alert: "Error adding comment." }
        format.turbo_stream { render turbo_stream: turbo_stream.replace("new_comment", partial: "comments/form", locals: { comment: @comment, post: @post }) }
      end
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to @post, notice: "Comment was successfully removed." }
      format.turbo_stream
    end
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:author, :content)
    end
end