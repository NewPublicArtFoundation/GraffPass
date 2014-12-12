class InstagramArtsController < ApplicationController
  before_action :set_instagramt_art, only: [:show, :edit, :update, :destroy, :vote]

  # GET /arts
  # GET /arts.json
  def index
    @instagram_arts = InstagramArt.page params[:page]
  end

  # GET /arts
  # GET /arts.json
  def indexlocation
    if params[:search].present?
      next_page = 1
      if params[:page].present?
        next_page = params[:page].to_i + 1
      end
      @search_url = 'http://www.graffpass.com/find.json/?search=' + params[:search] + "&page=" + next_page.to_s
      @instagram_arts = InstagramArt.near(params[:search], 10).page params[:page]
      @result_count = InstagramArt.near(params[:search], 10).count(:all)
      @result_coordinates = Geocoder.coordinates(params[:search])
      respond_to do |format|
        format.html {
          render :indexlocation
        }
        format.json {
          render :file => 'instagram_arts/indexlocation.json.erb',
                 :content_type => 'application/json'
        }
      end
    end

  end

  # GET /arts/1
  # GET /arts/1.json
  def show
    @distance_away = ""
    if(params[:dist] != nil)
      @distance_away = params[:dist]
    end
    @instagram_arts = InstagramArt.find(params[:id])
  end

  # GET /arts/1
  # GET /arts/1.json
  def image
    @instagram_arts = InstagramArt.find(params[:id])
  end

  # GET /arts/new
  def new
    @instagram_arts = InstagramArt.new
  end

  # GET /arts/1/edit
  def edit
  end

  # POST /arts
  # POST /arts.json
  def create
    @instagram_arts = InstagramArt.new(instagramt_art_params)
    @instagram_arts_uploads = @instagram_arts.uploads.build

    respond_to do |format|
      if @instagram_arts.save
        format.html { redirect_to root_url, notice: 'Art was successfully created.' }
        format.json { render :show, status: :created, location: @instagram_arts }
      else
        format.html { render :new }
        format.json { render json: @instagram_arts.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /arts/1
  # PATCH/PUT /arts/1.json
  def update
    respond_to do |format|
      if @instagram_arts.update(instagramt_art_params)
        track_activity @instagram_arts
        format.html { redirect_to @instagram_arts, notice: 'Art was successfully updated.' }
        format.json { render :show, status: :ok, location: @instagram_arts }
      else
        format.html { render :edit }
        format.json { render json: @instagram_arts.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arts/1
  # DELETE /arts/1.json
  def destroy
    @instagram_arts.destroy
    respond_to do |format|
      format.html { redirect_to arts_url, notice: 'Art was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instagramt_art
      @instagram_arts = InstagramArt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instagramt_art_params
      params.require(:instagramt_arts).permit(:everything, :image_url, :date_found, :tags, :caption, :user_name, :user_id, :user_avatar, :location_name, :longitude, :latitude, :location_id, :image_id, :created_at, :updated_at)
    end

end
