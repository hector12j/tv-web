class VideosController < ApplicationController

  def index
    videos = Video.all.order(created_at: :asc)
    render json: videos
  end

  def show
    if Video.exists?(params[:id])
      video = Video.find(params[:id])
      render json: video
    else
      render json: {'messaje': 'Video not found'}
    end 
  end

  def create
    video = Video.new(video_params)
    if video.save
      render json: video
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

  def movies
    videos = Video.where(video_type: 'movie').order(created_at: :asc)
    render json: videos
  end

  def seasons
    videos = Video.where(video_type: 'season').order(created_at: :asc).includes(:episodes).order(number: :asc)
    render json: videos
  end

  private

    def video_params
        params.permit(:title, :plot,:quality, :price, :video_type, :number)
    end
    
end
