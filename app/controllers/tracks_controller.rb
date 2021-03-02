class TracksController < ApplicationController
  before_action :set_track, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]

  layout 'courses'

  # GET /tracks
  # GET /tracks.json
  def index
    if params[:course]
      # @searched = params[:course]
      # @tracks = Track.where("title ILIKE ?", "%#{params[:course]}%")
      @q = Track.ransack(params[:course])
      @tracks = @q.result(distinct: true)
    else 
      @q = Track.ransack(params[:q])
      @tracks = @q.result(distinct: true)
    end
  end

  # GET /tracks/1
  # GET /tracks/1.json
  def show
  end

  # GET /tracks/new
  def new
    @track = Track.new
    authorize @track
    @levels = ['Beginner', 'Intermediate', 'Advanced']
    @languages = ['English', 'Russian', 'Spanish', 'German']
  end

  # GET /tracks/1/edit
  def edit
    authorize @track
  end

  # POST /tracks
  # POST /tracks.json
  def create
    @track = Track.new(track_params)
    authorize @track
    @track.user = current_user

    respond_to do |format|
      if @track.save
        format.html { redirect_to @track, notice: 'Track was successfully created.' }
        format.json { render :show, status: :created, location: @track }
      else
        format.html { render :new }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tracks/1
  # PATCH/PUT /tracks/1.json
  def update
    authorize @track
    respond_to do |format|
      if @track.update(track_params)
        format.html { redirect_to @track, notice: 'Track was successfully updated.' }
        format.json { render :show, status: :ok, location: @track }
      else
        format.html { render :edit }
        format.json { render json: @track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tracks/1
  # DELETE /tracks/1.json
  def destroy
    authorize @track
    @track.destroy
    respond_to do |format|
      format.html { redirect_to tracks_url, notice: 'Track was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_track
      @track = Track.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def track_params
      params.require(:track).permit(:title, :description, :short, :language, :level, :price)
    end
end
