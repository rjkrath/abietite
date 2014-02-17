class DerbyEntriesController < ApplicationController

  before_filter :find_derby, only: :index
  before_filter :find_derby_entry, only: :create

  def index
    @derby_entries = @derby.try(:derby_entries) || []

    respond_to do |format|
      format.json { render json: 'JSON String' }
    end
  end

  def create
    respond_to do |format|
      format.json do
        if current_voter.derby_entries << @derby_entry
          render json: 'success', status: 200
        else
          render json: 'failure', status: 422
        end
      end
    end

  end

  def find_derby
    @derby = Derby.where(id: params[:derby_id]).first
  end

  def find_derby_entry
    @derby_entry = DerbyEntry.where(id: params[:id]).first

    unless @derby_entry
      render json: 'not found', status: 422
    end
  end

end
