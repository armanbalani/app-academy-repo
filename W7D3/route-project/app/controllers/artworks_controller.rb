class ArtworksController < ApplicationController
    def index
        user = User.find(params[:user_id])
        render json: user.artworks + user.shared_artworks
    end

    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        render json: Artwork.find(params[:id])
    end

    def update
        artwork = Artwork.find(params[:id])
        if artwork.update!(artwork_params)
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        artwork = Artwork.find(params[:id])
        artwork.destroy
        render json: Artwork.all
    end

    
    private
    
    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end

end