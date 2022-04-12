class ExcerptsController < ApplicationController
  def new
    @excerpt = Excerpt.new
  end

  def create
    Excerpt.create excerpt_params
    redirect_to user_path(@current_user) # you can redirect wherever you want
  end

  def edit
  end

  def show
  end

  private
  def excerpt_params
    params.require(:excerpt).permit(:content)
  end
end
