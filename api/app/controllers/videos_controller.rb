class VideosController < ApplicationController

  def index
    videos = Video.all
    render json: videos.includes(:episodes)
  end

  def show
    if Video.exists?(params[:id])
      video = Video.includes('episodes').find(params[:id])
      render json: video
    else
      render json: {'messaje': 'Video not found'}
    end 
  end

  def create
    video = Video.new(video_params)
    if video.save
      render json: video, status: :created, location: video
    else
      render json: video.errors, status: :unprocessable_entity
    end
  end

  def update
    if Video.exists?(params[:id])
      render json: Video.update(params[:id], video_params)
    else
      render json: {'messaje': 'Video not found'}
    end
  end

  def destroy
    if Video.exists?(params[:id])
      Video.destroy(params[:id])
      render json: {'messaje': 'succsess'}
    else
      render json: {'messaje': 'Video not found'}
    end
  end

  private

    def video_params
        params.permit(:title, :plot,:quality, :price, :video_type, :number)
    end
    
end
