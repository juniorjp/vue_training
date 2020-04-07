module V1
  class VideosController < ApplicationController
    def index
      @videos = Video.includes(:user_votes).all
    end
  end
end
