class CampaignsController < ApplicationController
  before_filter :authenticate
  before_filter :authorized_user, :only => :destroy
  
  def create
    @campaign = current_user.campaigns.build(params[:campaign])
    if @campaign.save
      redirect_to root_path, :flash => { :success => "campaign created!" }
    else
      render 'pages/home'
    end
  end

  def destroy
    @campaign.destroy
    redirect_to root_path, :flash => { :success => "campaign deleted!" }
  end
  
  def index
    @campaigns = current_user.campaigns.paginate(:page => params[:page])
    @title = "All campaigns"
  end    
  def new
    @campaign = current_user.campaigns.build(params[:campaign])
    
    @title = "New Campaign" 
  end
  
  def show
    @campaign = current_user.campaigns.find(params[:id])
    @title = @campaign.name
  end

  def authorized_user
      @campaign = current_user.campaigns.find_by_id(params[:id])
      redirect_to root_path if @campaign.nil?
  end
  
  def reports
      @chart = LazyHighCharts::HighChart.new('graph') do |f|
      f.title({ :text=>"Combination chart"})
      f.options[:xAxis][:categories] = ['Apples', 'Oranges', 'Pears', 'Bananas', 'Plums']
      f.labels(:items=>[:html=>"Total fruit consumption", :style=>{:left=>"40px", :top=>"8px", :color=>"black"} ])      
      f.series(:type=> 'column',:name=> 'Jane',:data=> [3, 2, 1, 3, 4])
      f.series(:type=> 'column',:name=> 'John',:data=> [2, 3, 5, 7, 6])
      f.series(:type=> 'column', :name=> 'Joe',:data=> [4, 3, 3, 9, 0])
      f.series(:type=> 'spline',:name=> 'Average', :data=> [3, 2.67, 3, 6.33, 3.33])
      f.series(:type=> 'pie',:name=> 'Total consumption', 
        :data=> [
          {:name=> 'Jane', :y=> 13, :color=> 'red'}, 
          {:name=> 'John', :y=> 23,:color=> 'green'},
          {:name=> 'Joe', :y=> 19,:color=> 'blue'}
        ],
        :center=> [100, 80], :size=> 100, :showInLegend=> false)
        @h = LazyHighCharts::HighChart.new('graph') do |f|
                        f.series(:name=>'John', :data=>[3, 20, 3, 5, 4, 10, 12 ,3, 5,6,7,7,80,9,9])
                        f.series(:name=>'Jane', :data=> [1, 3, 4, 3, 3, 5, 4,-46,7,8,8,9,9,0,0,9] )
                end
 end
  end
  
  
    
end