class SeancesController < ApplicationController

  def index
    @seances = @current_user.seances
    render json: @seances, status: :ok
  end

  def show
    render json: @current_user.seances, status: :ok
  end

  def create
     @seance = @current_user.seances.new(seance_params)
      if @seance.save!
        # @seance.exercice.new(exercice_params)
        render json: @seance, status: :ok
    else
        render json: { errors: @seance.errors.full_message }, status: :unprocessable_entity
    end
  end

  private

  def seance_params
    params.permit(:name, exercice: [:name, :repetition])
  end

  def exercice_params
  params.permit(exercice: [:name, :repetition])
  end

end
