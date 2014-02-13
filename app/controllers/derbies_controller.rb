class DerbiesController < ApplicationController

  def index
    @derbies = Derby.all
  end

  def show
    @derby = Derby.find_by_id(params[:id])

    unless @derby
      flash[:error] = 'Derby cannot be found'
      redirect_to derbies_path
    end
  end
end
