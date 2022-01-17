class CommentsController < ApplicationController



  # POST /posts or /posts.json
  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to request.referrer

  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referrer
  end

  def update

    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to request.referrer
  end


  def updateLike
    u = User.find(session[:user_id])
    c = Comment.find(params[:comment_id])

    checkLike = LikeComment.find_by(comment_id:c.id,user_id:u.id)
    if(checkLike)
      ActiveRecord::Base.connection.execute("DELETE FROM like_comments WHERE comment_id=#{c.id} AND user_id=#{u.id}")
      redirect_to request.referrer
    else
      u.like_comments.create(comment_id:c.id)
      redirect_to request.referrer
    end


  end



  private
    def comment_params
      params.require(:comment).permit(:user_id, :post_id , :comment_post)
    end






end
