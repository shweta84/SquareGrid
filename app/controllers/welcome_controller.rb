class WelcomeController < ApplicationController

  skip_before_filter :user_data, only: :color_data

  def index
  end

  def color_data
    render json: GridColor.all_colors
  end

  def save_color
    if params[:updateGrid].eql?('true')
      data = GridColor.find_or_initialize_by(box_no: params[:box_no], user_id: @user.id)
      data.attributes = grid_params
      data.save
    end
    render json: GridColor.all_colors.where(box_no: params[:box_no])
  end

  private

  def grid_params
    params.permit(:color)
  end
end
