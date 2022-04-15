class NovelsController < ApplicationController
  def new
    @novel = Novel.new
  end

  def create
    novel = Novel.new
    find_excerpts.each { |excerpt| novel.excerpts << excerpt }
    novel.content = novel.excerpts.map{ |excerpt| excerpt.content }.join ' '
    @current_user.novels << novel 

    novel.save
    redirect_to novel_path novel
  end

  def edit
    @novel = Novel.find params[:id]
  end

  def update
    novel = Novel.find params[:id]
    novel.update novel_params
    redirect_to novel
  end

  def show
    @novel = Novel.find params[:id]
  end

  def destroy
    novel = Novel.find params[:id]
    novel.destroy

    redirect_to user_path @current_user
  end

end
