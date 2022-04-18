class PseudousersController < ApplicationController
    def upvote
        puts '--------------------------UPVOTE BEING MADE...--------------------------'
        puts novel = Novel.find(params[:upvote])
        if @current_user.present?

            if novel.pseudousers.exists?(id: @current_user.pseudouser.id)
                novel.pseudousers.delete(Pseudouser.find_by(id: @current_user.pseudouser.id))
                novel.upvotes -= 1
                novel.save
            else
                novel.pseudousers << @current_user.pseudouser
                novel.upvotes += 1
                novel.save
            end

        end
        redirect_to root_path
    end

end