class BogsController < ApplicationController

	def index
		@bogs = Bog.all
		render :index

	end

	def new
		render :new
	end

	def create
		#binding.pry
		bog = params.require(:bog).permit(:name, :description)
		bog = Bog.create(bog) #Bog is title of my model/ .create is a method to add to database
		redirect_to "/bogs/#{bog.id}"
	end

	def show
		bog_id = params[:id]
        @bog = Bog.find(bog_id)
        render :show
    end

	def edit
		#binding.pry
		bog_id = params[:id]
 	    @bog = Bog.find(bog_id)
        render :edit
    end

    def update
        bog_id = params[:id]
        bog = Bog.find(bog_id)

        # get updated data
        updated_attributes = params.require(:bog).permit(:name, :description)
        # update the plane
        bog.update_attributes(updated_attributes)

        #redirect to show
        redirect_to "/bogs/#{bog_id}"
    end

	def delete
		creature_to_delete=Bog.find(params[:id])
		Bog.destroy(creature_to_delete)
		redirect_to "/bogs"
	end
end