class StoresController < ApplicationController

  def purchase
    range = 3.day.ago.beginning_of_day..Date.today.end_of_day
    stores = Store.where(created_at: range, user_id: params['user_id'], video_id: params['video_id'])
    if stores.blank?
      store = Store.new(store_params)
      if store.save
        render json: store
      else
        render json: store.errors, status: :unprocessable_entity
      end  
    else 
      render json: {'response': 'video is purchased' }
    end
    
  end

  def store
    range = 3.day.ago.beginning_of_day..Date.today.end_of_day
    store = Store.where(created_at: range)
    render json: store
  end

  private

    def store_params
        params.permit(:user_id, :video_id)
    end
    
end
