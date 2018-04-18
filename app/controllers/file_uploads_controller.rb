class FileUploadsController < ApplicationController
def new
  @animal = Animal.find(params[:animal_id])
end

def create
  @animal = Animal.find(params[:animal_id])
  @animal.files.attach(params[:animal][:files])
  redirect_to animal_path(@animal)
end
end