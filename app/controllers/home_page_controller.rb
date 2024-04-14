class HomePageController < ApplicationController
    def index
        @animes = Anime.all
    end
end