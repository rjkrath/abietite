class DerbyEntriesController < ApplicationController

  before_action :find_derby, only: :index
  before_action :find_derby_entry, only: [:create, :destroy]

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
          render json: 'success', status: :created
        else
          render json: 'failure', status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    current_voter.derby_entries.destroy(@derby_entry)

    respond_to do |format|
      format.json do
        render json: 'success', status: :ok
      end
    end
  end

  private

  def find_derby
    @derby = Derby.find_by(id: params[:derby_id])
  end

  def find_derby_entry
    @derby_entry = DerbyEntry.find_by(id: params[:id])

    unless @derby_entry
      render json: 'not found', status: :unprocessable_entity
    end
  end

end
