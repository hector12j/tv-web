class EpisodesController < ApplicationController
  
  def index
    episodes = Episode.all
    render json: episodes
  end

  def show
    if Episode.exists?(params[:id])
      episode = Episode.find(params[:id])
      render json: episode
    else
      render json: {'messaje': 'episode not found'}
    end 
  end

  def create
    episode = Episode.new(episode_params)
    if episode.save
      render json: episode, status: :created, location: episode
    else
      render json: episode.errors, status: :unprocessable_entity
    end
  end

  def update
    if Episode.exists?(params[:id])
      render json: Episode.update(params[:id], episode_params)
    else
      render json: {'messaje': 'Episode not found'}
    end
  end

  def destroy
    if Episode.exists?(params[:id])
      render json: Episode.destory(params[:id])
    else
      render json: {'messaje': 'Episode not found'}
    end
  end

  private

    def episode_params
        params.permit(:title, :plot, :number, :video_id)
    end
    
end
