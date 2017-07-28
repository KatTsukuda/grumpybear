class ActionTakersController < ApplicationController
  def index
    @action_takers = ActionTaker.all
  end

  def new
    @action_taker = ActionTaker.new
  end

  def create
    # TODO: create an ActionTaker using action_taker_params

    @action_taker = ActionTaker.new(action_taker_params)

    if @action_taker.valid?
      @action_taker.save!
      redirect_to campaigns_path
      flash[:notice] = "Thank you for taking action!"
    else
      flash[:error] = @action_taker.errors.full_messages.to_sentence
      redirect_to campaigns_path
    end

  end

  def show
    set_action_taker

    if !set_action_taker
      redirect_to root_path
    end
  end

  private

  def set_action_taker
    @action_taker = ActionTaker.find(params[:id])
  end

  def action_taker_params
    params.require(:action_taker).permit(:email, :first_name, :last_name, :phone, :country, :zip_code, :campaign_id)
  end

end
