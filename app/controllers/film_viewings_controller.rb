class FilmViewingsController < ApplicationController
  before_action :set_film_viewing, only: %i[show edit update destroy]
  before_action :authenticate

  # GET /film_viewings or /film_viewings.json
  def index
    @film_viewings = FilmViewing.all
  end

  # GET /film_viewings/1 or /film_viewings/1.json
  def show; end

  # GET /film_viewings/new
  def new
    @film_viewing = FilmViewing.new
  end

  # GET /film_viewings/1/edit
  def edit; end

  # POST /film_viewings or /film_viewings.json
  def create
    @film_viewing = FilmViewing.new(film_viewing_params)
    @film_viewing.author_id = current_user.id

    respond_to do |format|
      if @film_viewing.save
        group_id = params[:film_viewing][:group_id]
        GroupsFilmViewing.create(group_id: group_id, film_viewing_id: @film_viewing.id) if group_id

        format.html { redirect_to film_viewings_path }
        format.json { render :show, status: :created, location: @film_viewing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @film_viewing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /film_viewings/1 or /film_viewings/1.json
  def update
    respond_to do |format|
      if @film_viewing.update(film_viewing_params)
        format.html { redirect_to @film_viewing }
        format.json { render :show, status: :ok, location: @film_viewing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @film_viewing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /film_viewings/1 or /film_viewings/1.json
  def destroy
    @film_viewing.destroy
    respond_to do |format|
      format.html { redirect_to film_viewings_url, notice: 'Film viewing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_film_viewing
    @film_viewing = FilmViewing.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def film_viewing_params
    params.require(:film_viewing).permit(:name, :running_time, :rating)
  end
end
