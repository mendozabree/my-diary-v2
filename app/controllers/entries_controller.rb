class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :update, :destroy]

  def index
    @entries = Entry.all
    json_response(@entries)
  end

  def create
    @entry = Entry.create!(entry_params)
    json_response(@entry, :created)
  end

  def show
    json_response(@entry)
  end

  def update
    @entry.update(entry_params)
    head :no_content
  end

  def destroy
    @entry.destroy
    head :no_content
  end

  private

  def entry_params
    params.permit(:title, :description, :body)
  end

  def set_entry
    @entry = Entry.find(params[:id])
  end
end
