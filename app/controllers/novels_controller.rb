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
    redirect_to root_path unless @novel.user == @current_user
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

  private
  def find_excerpts
    count = 3
    excerpts = (0...Excerpt.count).to_a.shuffle.take(count).map{ |excerpt| Excerpt.limit(1).offset(excerpt)[0] }
  end

  def novel_params
    params.require(:novel).permit(:title, :blurb, :cover, :upvotes)
  end

end
