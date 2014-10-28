class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def new 
    @property = Property.new
  end

  def create
    @property = Property.new(params[:property].permit(:postcode, :cost, :rent))
    
    if @property.save 
      redirect_to '/properties'
    else
      render 'new'
    end
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    @property.update(params[:property].permit(:postcode, :cost, :rent))
    redirect_to '/properties'
  end

  def destroy
    @property = Property.find(params[:id])
    @property.destroy
    flash[:notice] = 'Property deleted successfully'
    redirect_to '/properties'
  end
end
