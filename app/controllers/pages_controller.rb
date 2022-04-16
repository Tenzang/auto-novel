class PagesController < ApplicationController
    def home
        @fonts = hand_written
        @novels = Novel.order(upvotes: :desc).limit 5
    end
end