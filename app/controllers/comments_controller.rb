class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_place
  before_action :set_comment, only: [:destroy]
  before_action :authorize_user!, only: [:destroy]


  def create
  	
    @comment = @place.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @place, notice: "Yorumunuz Kaydedildi"
    else
      redirect_to @place, notice: "Yorum Kaydedilemedi"
    end
  end
  
  def destroy
    @comment.destroy
    redirect_to @place, notice: "Yorum kaldırıldı"
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def authorize_user!
    redirect_to @place, notice: "Not authorized" unless @comment.user_id == current_user.id
  end


  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_place
    @place = Place.find(params[:place_id])
  end

end