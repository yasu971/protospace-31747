class CommentsController < ApplicationController
  def create
    if comment = Comment.create(comment_params)
    # 詳細ページへ
    redirect_to prototype_comments_path "#{comment.prototype.id}"
    # redirect_to "/prtotypes/#{comment.prototype.id}"
  else
    render :show
  end
end

  # 参考
  # if prototype.update(prototype_params)
  #   redirect_to prototype_path
  # else
  #   render :edit
  # end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end
