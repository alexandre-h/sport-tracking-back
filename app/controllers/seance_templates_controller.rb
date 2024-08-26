class SeanceTemplatesController < ApplicationController
  before_action :set_seance_template, only: [:show, :update, :destroy]
  before_action :authenticate_user!

def index
  if !current_user
    render json: 'You must be logged to see the data', status: :not_found
  else
    @user_seance_template = current_user.seance_templates
    render json: @user_seance_template, status: :ok
  end
end

  # POST /seance_templates
  def create
    @seance_template = current_user.seance_templates.build(seance_template_params)

    if @seance_template.save
      render json: @seance_template, status: :created
    else
      render json: @seance_template.errors, status: :unprocessable_entity
    end
  end

  # PUT /seance_templates/:id
  def update
    if @current_seance_template.update(seance_template_params)
      render json: @seance_template
    else
      render json: @seance_template.errors, status: :unprocessable_entity
    end
  end

  private

  def set_seance_template
    @current_seance_template = SeanceTemplate.find(params[:id])
  end

  def seance_template_params
    params.require(:seance_template).permit(:name, exercice: [:name])
  end
end
