module Api
  module V1
    class MoviesController < ApplicationController
      before_action :set_movie, only: %i[ show edit update destroy ]
    
      # GET /movies or /movies.json
      def index
        @movies = Movie.all

        render json: @movies
      end
    
      # GET /movies/1 or /movies/1.json
      def show
        render json: @movie
      end
    
      # GET /movies/new
      def new
        @movie = Movie.new
      end
    
      # GET /movies/1/edit
      def edit
      end
    
      # POST /movies or /movies.json
      def create
        @movie = Movie.new(movie_params)
    
        respond_to do |format|
          if @movie.save
            render json: @movie, status: :created, location: @movie
          else
            render json: @movie.errors, status: :unprocessable_entity
          end
        end
      end
    
      # PATCH/PUT /movies/1 or /movies/1.json
      def update
        respond_to do |format|
          if @movie.update(movie_params)
            render json: @movie
          else
            render json: @movie.errors, status: :unprocessable_entity
          end
        end
      end
    
      # DELETE /movies/1 or /movies/1.json
      def destroy
        @movie.destroy
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_movie
          @movie = Movie.find(params[:id])
        end
    
        # Only allow a list of trusted parameters through.
        def movie_params
          params.require(:movie).permit(:name, :rating)
        end
    end      
  end
end
