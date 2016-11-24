class SearchesController < ApplicationController

  def index
    @search = Search.new
  end

  def create
    result = Search.perform(search_params)
  end

  private

  def search_params
    params.require(:search).permit(:username)
  end

end
