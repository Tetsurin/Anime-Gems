class AnimesController < ApplicationController
  before_action :set_anime, only: %i[ show edit update destroy ]

  # GET /animes or /animes.json
  def index
    @genres = Genre.all
  end

  def _anime_posters
    @genres = Genre.all
    selected_genres = params[:genre]&.split(',') || []
    selected_status = params[:status]&.capitalize
    selected_type = params[:type]
    from_year = params[:from]&.to_i
    to_year = params[:to]&.to_i
  
    genre_ids = Genre.where(name: selected_genres).pluck(:id)
    @animes = genre_ids.empty? ? Anime.all : Anime.joins(:genres)
                   .where(genres: { id: genre_ids })
                   .group('animes.id')
                   .having('COUNT(DISTINCT genres.id) = ?', genre_ids.count)
  
    @animes = @animes.where(release_status: selected_status) if selected_status
    @animes = @animes.where(content_type: selected_type) if selected_type
  
    if from_year && to_year
      from_date = Date.new(from_year, 1, 1)
      to_date = Date.new(to_year, 12, 31).end_of_day
      @animes = @animes.where(release_date: from_date..to_date)
    end
  
    @pagy, @animes = pagy(@animes)
  end

  def search
    @query = params[:query]
    @animes = Anime.where("name LIKE :query OR original_name LIKE :query", query: "%#{@query}%")
  end

  # GET /animes/1 or /animes/1.json
  def show
  end

  # GET /animes/new
  def new
    @anime = Anime.new
  end

  # GET /animes/1/edit
  def edit
  end

  # POST /animes or /animes.json
  def create
    @anime = Anime.new(anime_params)

    respond_to do |format|
      if @anime.save
        format.html { redirect_to anime_url(@anime), notice: "Anime was successfully created." }
        format.json { render :show, status: :created, location: @anime }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @anime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animes/1 or /animes/1.json
  def update
    respond_to do |format|
      if @anime.update(anime_params)
        format.html { redirect_to anime_url(@anime), notice: "Anime was successfully updated." }
        format.json { render :show, status: :ok, location: @anime }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @anime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animes/1 or /animes/1.json
  def destroy
    @anime.destroy!

    respond_to do |format|
      format.html { redirect_to animes_url, notice: "Anime was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anime
      @anime = Anime.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def anime_params
      params.require(:anime).permit(:name, :original_name, :description, :poster, :release_date, :type, :total_episodes, :studio, :director, :logo, :horizontal_poster)
    end
end
