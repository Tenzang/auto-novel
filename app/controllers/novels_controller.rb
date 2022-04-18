class NovelsController < ApplicationController
  before_action :check_for_login, only: [:new]

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

    # CLOUDINARY FILE UPLOAD NOT WORKING 
    # if params[:file].present?
    #   req = Cloudinary::Uploader.upload(params[:file])
    #   novel.cover = req["public_id"]
    # end

    if params[:cover].present?
      novel.cover = params[:cover]
    end

    novel.update novel_params
    novel.save
    
    redirect_to novel
  end

  def show
    @novel = Novel.find params[:id]
    @font = hand_written.sample
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
    params.require(:novel).permit(:title, :blurb, :upvotes, :cover)
  end

end
