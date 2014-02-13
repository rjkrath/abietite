class DerbyEntriesController < ApplicationController

  before_filter :find_derby

  def index
    @derby_entries = @derby.try(:derby_entries) || []

    respond_to do |format|
      format.json { render json: 'JSON String' }
    end
  end

  def find_derby
    @derby = Derby.where(id: params[:derby_id]).first
  end

end
