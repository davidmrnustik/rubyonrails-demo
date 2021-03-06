class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy, :mail, :spam]
  before_filter :authenticate

  def mail # mail_movie_path
    UserMailer.newsletter(@movie, current_user).deliver
    redirect_to @movie, notice: "Message was successfully sent."
  end
  
  def spam # spam_movie_path
    # Get all of the users
    # Loop through and send an email to each one
    users = User.all #.where(newsletter: true) 
    users.each do |user|
      UserMailer.newsletter(@movie, user).deliver
    end
    redirect_to movies_path, notice: "Message was successfully sent."
  end
  
  # GET /movies
  # GET /movies.json
  def index
    #@movies = Movie.all # returns an array of objects - one movie object per record
    #@page = params['page']
    #@prev_page = @page - 1 unless @page == 0
    #@next_page = @page + 1 unless @page*5 > Movie.count
    #@movies = Movie.limit(5).offset(@page * 5).order(updated_at: :desc) # rails combines all together into one SQL command, no matter a sort
    @movies = Movie.page(params['page']).order(updated_at: :desc)
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @comment = Comment.new
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save # boolean, if it is saved, do this
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    users = User.all.where(newsletter: true)
    respond_to do |format|
      if @movie.update(movie_params)
        users.each do |user|
  	      UserMailer.newsletter(@movie, user).deliver
        end
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def authenticate
      authenticate_user! && current_user.try(:admin?)
      if !current_user.try(:admin?)
        redirect_to root_path
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:name, :director, :description, :year, :length, :format, :image, :thumbnail)
    end
end
