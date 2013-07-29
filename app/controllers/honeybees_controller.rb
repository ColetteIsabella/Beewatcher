class HoneybeesController < ApplicationController

  def index
  end

  def new
    @honeybee = Honeybee.new
  end

  def edit
  end

  def create
    @honeybee = Honeybee.new(params[:honeybee])
  if @honeybee.save
    flash[:notice] = "Honeybee has been recorded."
    redirect_to @honeybee
  else
    # nothing, yet
  end
end
  def show
    @honeybee = Honeybee.find(params[:id])
  end


end
