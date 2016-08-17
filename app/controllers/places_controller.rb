class PlacesController < ApplicationController
	before_action :authenticate_user!, except: [:show, :index]
	before_action :set_place, only: [:show, :update, :edit, :destroy]
	before_action :authorize_user!, only: [:edit, :update, :destroy]
	def new
		@place = Place.new
		#load_categories
		load_form_data
	end

	def index
		@places = Place.all.order(:id)
	end

	def show
	
	if current_user
      if @place.votes.where(user_id: current_user.id).any?
        @vote = @place.votes.where(user_id: current_user.id).first
      else
        @vote = @place.votes.build
      end
    end
		
	end

	def create 
		@place = current_user.places.new(place_params)
		if @place.save
			flash[:success] = 'İşlem başarıyla tamamlandı'
			redirect_to place_path(@place)
		else
			#load_categories
			load_form_data
			render :new
		end
	end

	def edit
		#load_categories
		load_form_data
	end

	def update
		if @place.update(place_params)
			redirect_to place_path(@place)
		else
			#load_categories
			load_form_data
			render :edit
		end
	end

	def destroy
		@place.destroy
 	    redirect_to places_path, notice: "Yer başarıyla silindi"

 	end

	private

	def authorize_user!
    redirect_to root_path, notice: "Not authorized" unless @place.user_id == current_user.id
  	end

	def set_place
		@place = Place.find(params[:id])
	end

	#def load_categories
		def load_form_data
		@categories = Category.all.collect {|c| [c.name, c.id]}
		@tags = Tag.all
	end

	def place_params
		params.require(:place).permit(:name, :address, :phone_number, :contact_mail, :established_at, :description, :category_id, tag_ids: [])
	end
		
end
