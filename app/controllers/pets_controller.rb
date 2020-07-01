class PetsController < ApplicationController
  def index
    @pets = Pet.all

    render json: { pets: @pets }
  end

  def create
    @pet = Pet.create(
      name: params[:name],
      species: params[:species],
    )

    render json: { pet: @pet }, status: :created
  end
end
