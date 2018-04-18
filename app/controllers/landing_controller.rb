class LandingController < ApplicationController
  def index 
      @animals = Animal.all
  end
  
end