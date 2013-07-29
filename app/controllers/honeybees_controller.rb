class HoneybeesController < ApplicationController
before_filter :find_honeybee, :only => [:show, :edit, :update, :destroy]
before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @honeybees = Honeybee.all
  end

  def new
    @honeybee = Honeybee.new
  end

  def edit

  end

  def update
    if @honeybee.update_attributes(params[:honeybee])
    flash[:notice] = "Honeybee sighting has been updated."
    redirect_to @honeybee
  else
    flash[:alert] = "Honeybee sightn=ing has not been updated."
    render action: "edit"
  end
end

  def create
    @honeybee = Honeybee.new(params[:honeybee])
    @honeybee.user = current_user
  if @honeybee.save
    flash[:notice] = "Honeybee has been recorded."
    redirect_to @honeybee
  else
    flash[:alert] = "Honeybee has not been recorded."
    render action: "new"
  end
end

  def show

  end

  def destroy
    flash[:notice] = "Honeybee record has been deleted."
    redirect_to honeybee_path
  end

private
  def find_honeybee
    @honeybee = Honeybee.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The honeybee you were looking" +
                    " for could not be found."
    redirect_to honeybees_path
  end
end
