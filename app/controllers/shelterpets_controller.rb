class ShelterpetsController < ApplicationController
  def index
    @pets  = Shelter.find(params[:shelter_id]).pets
  end
end
