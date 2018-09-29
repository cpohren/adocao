class AnimalsController < ApplicationController
  protect_from_forgery with: :null_session, only: :contact
    def index 
      #@animals = Animal.all
            
      @animals = Animal.where(nil) # creates an anonymous scope
      if params[:filter]
        @animals = @animals.with_kind(filter_params[:kind]) if filter_params[:kind].present?
        @animals = @animals.with_gender(filter_params[:gender]) if filter_params[:gender].present?
        @animals = @animals.with_size(filter_params[:size]) if filter_params[:size].present?
        @animals = @animals.neutered(filter_params[:neutered]) if filter_params[:neutered].present?
        @animals = @animals.vaccinated(filter_params[:vaccinated]) if filter_params[:vaccinated].present?
      end
      #byebug

    end
    def mine 
      @animals = current_user.animals.all
    end
    def show 
        @animal = Animal.find(params[:id])
    end
    def edit
        @animal = Animal.find(params[:id])
    end
    def new
      @animal = Animal.new
    end
    def create
      @animal = Animal.new(animal_params)
      respond_to do |format|
        if @animal.save(animal_params)
          format.html { redirect_to edit_animal_path(@animal), notice: 'Device was successfully updated.' }
          format.json { render :show, status: :ok, location: @animal }
        else
          format.html { render :edit }
          format.json { render json: @animal.errors, status: :unprocessable_entity }
        end
      end
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
      def destroy
        @animal = Animal.find(params[:id])
        @animal.destroy
        respond_to do |format|
          format.html { redirect_to mine_animals_url, notice: 'Animal was successfully destroyed.' }
        end
      end
      def contact
        contact_data = {
          name: params[:name_contact],
          phone: params[:phone_contact],
          email_from: params[:email_contact],
          message: params[:message_contact],
          animal_id: params[:animal_id]
        }
        AdoptionMailer.interested(contact_data).deliver
        redirect_to animal_path(params[:animal_id])
      end
      private 
      def animal_params
        params.require(:animal).permit(:name, :kind, :breed, :gender, :birth, :size, :neutered, :vaccinated, :description, :user_id)
      end
      def filter_params
        params.require(:filter).permit(:kind, :breed, :gender, :size, :neutered, :vaccinated, :files [])
      end
  end
  