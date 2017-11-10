class SearchesController < ApplicationController
  def index
    @search = Prefecture.search(params[:q]) # この行を追加
    @stations = @search.result #この行を修正

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stations }
    end
  end
end
