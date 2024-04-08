class SeancesController < ApplicationController

  def index
    @seances = @current_user.seances
    render json: @seances, status: :ok
  end

  def show
    render json: @current_user.seances, status: :ok
  end

  def new
    @seance = Seance.new
    @seance.exercices.build
  end

  def create
     @seance = @current_user.seances.new(seance_params)
      if @seance.save!
        render json: @seance, status: :ok
    else
        render json: { errors: @seance.errors.full_message }, status: :unprocessable_entity
    end
  end

  def edit
    @seance =  Seance.find(params[:id])
  end

  def update
    @seance =  Seance.find(params[:id])
    if (@seance.update(seance_params))
      render json: @seance, status: :ok
    else
      render json: { errors: @seance.erros.full_message }, status: :unprocessable_entity
    end
  end

  def destroy
    @seance = Seance.find(params[:id])
    @seance.destroy
  end

  private
  def seance_params
    params.require(:seance).permit(:name, exercices_attributes: [:name, :repetition])
  end
end
