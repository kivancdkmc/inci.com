class VotesController < ApplicationController
  
	  before_action :authenticate_user!
    before_action :set_place
    before_action :set_vote, only: [:update]
    before_action :authorize_user!, only: [:update]

  def create
  	 #@vote = @place.votes.new(rating: params[:vote][:rating])
    @vote = @place.votes.new
    @vote.rating = params[:vote][:rating]
    @vote.user = current_user

    if @vote.save
      redirect_to @place, notice: "Oy kullanıldı"
    else
      redirect_to @place, notice: "Oyunuz kaydedilemedi"
    end

  end

  # def destroy
  def update
    if @vote.update(rating: params[:vote][:rating])
      redirect_to @place, notice: "Oyunuz güncellendi"
    else
      redirect_to @place, notice: "Oyunuz kaydedilemedi"
    end
  end

  private

  def authorize_user!
    redirect_to @place, notice: "Not authorized" unless @vote.user_id == current_user.id
  end

  def set_vote
    @vote = Vote.find(params[:id])
  end

  def set_place
    @place = Place.find(params[:place_id])
  end

end
