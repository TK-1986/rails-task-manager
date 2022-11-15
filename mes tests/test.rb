class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  def index
  @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
   @restaurant = Restaurant.new(restaurant_params)
   @restaurant.save
   redirect_to restaurant_path(@restaurant) # veut dire : redirige vers la page show de l'instance restaurant.
  end

  def edit
  end

  def update
    @restaurant.update(restaurant_params)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :rating, :phone_number, :category)
  end

  def set restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end


Rails.application.routes.draw do
  get 'restaurants', to: 'restaurants#index'
  post 'restaurants', to: 'restaurants#create'
  get 'restaurants/new', to: 'restaurants#new'
  get 'restaurants/:id/edit', to: 'restaurants#edit'
  patch 'restaurants/:id', to: 'restaurants#update' # veut dire : patch la page show de l'instance restaurant.
  delete'restaurants/:id', to: 'restaurants#destroy'
  get'restaurants/:id', to:'restaurants#show'

  ressources: restaurants


end


générer automatiquement un boolean false sur rails generator :  https://stackoverflow.com/questions/10000000/rails-generator-automatically-generate-a-boolean-false
