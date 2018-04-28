class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was created successfully.'}
        format.json {render :show, status: :created, location: @post }
      else
        format.html { redirect_to @post, alert: 'Comment was not saved successfully.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    post = @comment.post
    @comment.destroy
    redirect_to post, notice: 'Comment was deleted.'
  end

  private

    def comment_params
      params.require(:comment).permit(:name, :body)
    end

end
