class CampaignsController < ApplicationController
  before_action :require_login, only: [:new, :create]
  before_action :campaign_owner, only: [:edit, :update, :destroy]

  def index
    @campaigns = Campaign.all
  end

  def new
    @campaign = Campaign.new
  end

  def edit
    set_campaign
  end

  def show
    set_campaign
    @action_taker = ActionTaker.new(campaign_id: @campaign.id)
  end

  def update
    set_campaign
      if set_campaign.update campaign_params
        redirect_to @campaign
      end
  end

  def create
    @campaign = current_user.campaigns.build(campaign_params)

    if @campaign.valid?
        @campaign.save
        redirect_to @campaign
    else
      @campaign = Campaign.create
      flash[:error] = @campaign.errors.full_messages.to_sentence
      redirect_to new_campaign_path
    end
  end

  def destroy
    set_campaign
    @campaign.destroy
    redirect_to campaigns_path
  end

  private

    def require_login
      unless logged_in?
        flash[:error] = "You must be logged in to access this section."
        redirect_to login_path
      end
    end

    def set_campaign
      @campaign = Campaign.friendly.find(params[:id])
    end

    def campaign_params
      params.require(:campaign).permit(:category, :campaign_title, :description, :call_to_action, :target_email, :target_name, :target_signers_goal, :user_id, :action_taker_id, :image, :attributes, action_takers_attributes: [:action_takers, :attributes])
    end

    def campaign_owner
      set_campaign

      unless set_campaign.user_id == current_user.id
        flash[:notice] = 'Access denied.'
        redirect_to campaigns_path
      end
    end
end
