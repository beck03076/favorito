class SearchesController < ApplicationController
  before_filter :set_search

  def index
  end

  def create
    result = Search.perform(search_params)
    @decorated_result = Favorito::Presenter.new(result)
    render :index
  rescue Github::InvalidUsername => e
    redirect_to_index(e)
  rescue Github::UserNotFound => e
    redirect_to_index(e)
  end


  private

  def redirect_to_index(exception)
    redirect_to :root, notice: exception.to_s
  end

  def set_search
    @search = Search.new
  end

  def search_params
    params.require(:search).permit(:username)
  end

end
