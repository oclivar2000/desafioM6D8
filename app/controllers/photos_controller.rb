class PhotosController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
  
    def show
      @photo = Photo.find(params[:id])
      @comments = @photo.comments
    end
  
    def index
        @photos = Photo.all
    end

    def new
      if current_user.email == 'karina@example.com' # Solo Karina puede subir fotos
        @photo = Photo.new
      else
        redirect_to root_path, alert: 'No tienes permiso para subir fotos'
      end
    end
  
    def create
      if current_user.email == 'karina@example.com'
        @photo = current_user.photos.build(photo_params)
        if @photo.save
          redirect_to @photo, notice: 'Foto subida exitosamente'
        else
          render :new
        end
      else
        redirect_to root_path, alert: 'No tienes permiso para subir fotos'
      end
    end
  
    private
  
    def photo_params
      params.require(:photo).permit(:title, :description, :image)
    end
  end
  