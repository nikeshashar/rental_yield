class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def new 
    @property = Property.new
  end

  def create
    Property.create(params[:property].permit(:postcode, :cost, :rent))
    redirect_to '/properties'
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    @property.update(params[:property].permit(:postcode, :cost, :rent))
    redirect_to '/properties'
  end
end
