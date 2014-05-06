class AdvertisingkeywordsController < ApplicationController
 respond_to :html, :xml, :json, :js
def index
    @advertisingkeywords = Advertisingkeyword.paginate(:page => params[:page])
    @title = "All advertisingkeywords"
    respond_with(@advertisingkeywords) do |format|
      format.js  { render :json => @product, :callback => params[:callback] }
      format.json  { render :json => @advertisingkeywords }
    end 
end

def advkeywordsStream
    @advertisingkeywords = Advertisingkeyword.all
    json = JSON.encode(advertisingkeywords)

end
  
  def show
    @advertisingkeyword = Advertisingkeyword.find(params[:id])
    @title = @advertisingkeyword.keyword
    respond_with(@advertisingkeyword) do |format|
      format.js  { render :json => @product, :callback => params[:callback] }
      format.json  { render :json => @advertisingkeyword }
      format.xml  { render :xml => @advertisingkeyword }
    end 
  end

  def new
    @advertisingkeyword  = Advertisingkeyword.new
    @title = "Sign up"
  end
  
  def create
    @advertisingkeyword = Advertisingkeyword.new(params[:user])
    if @advertisingkeyword.save
      redirect_back_or @advertisingkeyword
    else
      @title = "Sign up"
      render 'new'
    end
  end
  
  def edit
    @title = "Edit advertiser keyword"
  end
  
  def update
    if @advertisingkeyword.update_attributes(params[:user])
      redirect_to @advertisingkeyword, :flash => { :success => "Profile updated." }
    else
      @title = "Edit advertiser keyword"
      render 'edit'
    end
  end

  def destroy
    @advertisingkeyword.destroy
    redirect_to advertisingkeywords_path, :flash => { :success => "keyword destroyed." }
  end
  
 
end