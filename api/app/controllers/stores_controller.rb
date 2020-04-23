class StoresController < ApplicationController
  def index
    stores = Store.all
    render json: stores
  end

  def show
    if Store.exists?(params[:id])
      store = Store.find(params[:id])
      render json: store
    else
      render json: {'messaje': 'store not found'}
    end 
  end

  def create
    store = Store.new(store_params)
    if Store.save
      render json: store, status: :created, location: store
    else
      render json: Store.errors, status: :unprocessable_entity
    end
  end

  def update
    if Store.exists?(params[:id])
      render json: Store.update(params[:id], store_params)
    else
      render json: {'messaje': 'store not found'}
    end
  end

  def delete
    if Store.exists?(params[:id])
      render json: Store.update(params[:id], store_params)
    else
      render json: {'messaje': 'store not found'}
    end
  end

  private

    def store_params
        params.permit(:title, :plot, :number, :videos_id)
    end
    
end
