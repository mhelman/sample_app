class CampaignsController < ApplicationController
  before_filter :authenticate
  before_filter :authorized_user, :only => :destroy
  
  def create
    @campaign = current_user.Campaigns.build(params[:campaign])
    if @campaign.save
      redirect_to root_path, :flash => { :success => "campaign created!" }
    else
      @feed_items = []
      render 'pages/home'
    end
  end

  def destroy
    @campaign.destroy
    redirect_to root_path, :flash => { :success => "campaign deleted!" }
  end
  
  private
  
    def authorized_user
      @campaign = current_user.Campaigns.find_by_id(params[:id])
      redirect_to root_path if @campaign.nil?
    end
end