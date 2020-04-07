module V1
  class VotesController < ApplicationController
    before_action :authenticate_user

    def create
      vote = current_user.user_votes.new(video_id: params[:video_id])

      if current_user.user_votes.count < User::MAX_ALLOWED_VOTES && vote.save
        head :ok
      else
        head 422
      end
    end
  end
end
