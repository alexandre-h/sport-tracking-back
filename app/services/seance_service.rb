class SeanceService
  def initialize(seance_params, current_user)
    @seance_params = seance_params
    @current_user = current_user
    @exercices = @seance_params[:exercices_attributes]
  end

  def call
    if (!@seance_params[:seance_template_id])
      exercice_filter =  @exercices.map { |hash| hash.except("repetition") }.uniq
      seance_template = SeanceTemplate.create(user_id: @current_user.id, name: @seance_params[:name], exercice: exercice_filter)
      return [false, parent_model.errors.full_messages] unless seance_template.valid?
      template_id = seance_template.id
    else
      template_id = @seance_params[:seance_template_id]
    end

    seance = Seance.create(@seance_params.merge(seance_template_id: template_id, user_id: @current_user.id))
    if seance.valid?
      [true, "Your seance has been created"]
    else
      [false, seance.errors.full_messages]
    end
  end
end
