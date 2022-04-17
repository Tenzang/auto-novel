class ExcerptsController < ApplicationController
  before_action :check_for_login, only: [:new]

  def new
    @highlighted = "new excerpt"
    @excerpt = Excerpt.new
  end

  def create
    new_excerpt = Excerpt.create excerpt_params
    new_excerpt.length = new_excerpt.content.split.size
    new_excerpt.save
    @current_user.excerpts << new_excerpt
    redirect_to user_path(@current_user) # you can redirect wherever you want
  end

  def edit
    @excerpt = Excerpt.find params[:id]
    redirect_to root_path unless @excerpt.user == @current_user
  end

  def update
    excerpt = Excerpt.find params[:id]
    excerpt.update excerpt_params
    redirect_to user_path(@current_user)
  end

  def show
    @font = hand_written.sample
    @excerpt = Excerpt.find params[:id]
  end

  def destroy
    excerpt = Excerpt.find params[:id]
    excerpt.destroy

    redirect_to @current_user
  end

  private
  def excerpt_params
    params.require(:excerpt).permit(:content, :novel_region, :paragraph_region)
  end
end
