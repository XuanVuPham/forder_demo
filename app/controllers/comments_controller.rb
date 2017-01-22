class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_commentable_object, only: :create
  before_action :load_comment, only: :destroy

  def create
    @comment = @commentable.comments.build comment_params
    if @comment.save
      flash[:success] = t "flash.success_message"
    else
      flash[:danger] = t "flash.danger_message"
    end
    redirect_to @commentable
  end

  def destroy
    @commentable = @comment.commentable
    if @comment.destroy
      flash[:success] = t "flash.success_message"
    else
      flash[:danger] = t "flash.danger_message"
    end
    redirect_to @commentable
  end

  private
  def comment_params
    params.require(:comment).permit :content, :user_id
  end

  def load_comment
    @comment =  Comment.find_by id: params[:id]
    unless @comment
      flash[:danger] = t "flash.danger_message"
      redirect_back
    end
  end

  def load_commentable_object
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return @commentable = $1.classify.constantize.find(value)
      end
    end
    flash[:danger] = t "flash.danger_message"
    redirect_back
  end
end
