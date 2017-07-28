class ActionTakersController < ApplicationController
  def index
    @action_takers = ActionTaker.all
  end

  def new
    @action_taker = ActionTaker.new
  end

  def create
    @action_taker = ActionTaker.new(action_taker_params)

    if @action_taker.valid?
      @action_taker.save!
      flash[:notice] = "Thank you for taking action!"
      redirect_to campaigns_path
    else
      flash[:error] = @action_taker.errors.full_messages.to_sentence
      redirect_to campaign_path(@action_taker.campaign_id)
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
