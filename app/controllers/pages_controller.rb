class PagesController < ApplicationController
    def home
        @novels = Novel.order(upvotes: :desc).limit 5
    end
end