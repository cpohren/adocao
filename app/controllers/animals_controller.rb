class AnimalsController < ApplicationController
    def index 
        @animals = Animal.all
    end
    def show 
        @animal = Animal.find(params[:id])
    end
    def edit
        @animal = Animal.find(params[:id])
    end
    def update
      @animal = Animal.find(params[:id])
        respond_to do |format|
          if @animal.update(animal_params)
            format.html { redirect_to @animal, notice: 'Device was successfully updated.' }
            format.json { render :show, status: :ok, location: @animal }
          else
            format.html { render :edit }
            format.json { render json: @animal.errors, status: :unprocessable_entity }
          end
        end
      end
      private 
      def animal_params
        params.require(:animal).permit(:name, :kind, :breed, :gender, :birth, :size, :neutered, :vaccinated, :description)
      end

  end