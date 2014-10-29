class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def new 
    @property = Property.new
  end

  def create
    @property = Property.new(params[:property].permit(:postcode, :cost, :rent))
    @property.user = current_user
    if @property.save 
      redirect_to '/properties'
    else
      render 'new'
    end
  end

  def edit
    @property = current_user.properties.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:notice] = 'This is not your property!'
    redirect_to '/properties'
  end

  def update
    @property = current_user.properties.find(params[:id])
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
