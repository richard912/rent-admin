class ListingsController < ApplicationController
  before_action :authenticate_agent!
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
    if flash[:search].blank?
      @listings = Listing.all
    else
      @listings = Listing.all
      s_params = flash[:search]

      if !s_params["status"].blank?
        @listings = @listings.where( :status=>s_params["status"] )
        @status = s_params["status"]
      end

      if !s_params["state"].blank?
        @listings = @listings.where( :state=>s_params["state"] )
        @state = s_params["state"]
      end

      if !s_params["search"].blank?
        @search = s_params["search"]
        @listings = @listings.where("walk_score LIKE ? OR beds LIKE ? OR baths LIKE ? OR year_built LIKE ?", "%#{@search}%", "%#{@search}%", "%#{@search}%", "%#{@search}%")
      end
    end

    @cur_id = current_agent.id
    @listing = Listing.new
  end

  def show
    @agents = Agent.select(:first_name).where('id!=?', 1)
    @agents = @agents.map {|c| c.first_name}
    @pics = ListingPic.where('listing_id=?', @listing.id )
  end

  def new
    @listing = Listing.new
  end

  def edit
  end

  def activate_listing
    @listing = Listing.find(params[:format])
    @listing.activate?
    redirect_to listing_path(@listing)
  end

  def search
    redirect_to listings_path, flash: { search: search_params }
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.status = 'Active'

    respond_to do |format|
      if @listing.save
        @pic = ListingPic.new(pic_params)
        @pic.listing_id = @listing.id
        @pic.save 

        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def listing_params
      params.require(:listing).permit(:listing_type, :state, :year_built, :lot_size, :price_per_sqft, :beds, :walk_score, :mls_id, :description, :status)
    end

    def pic_params
      params.require(:listing).permit(:avatar)
    end

    def search_params
      params.permit(:status, :state, :listing_type, :search)
    end

end
