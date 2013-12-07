require_dependency "gallery/application_controller"

module Gallery
  class ImagesController < ApplicationController
    before_action :set_image, only: [:show, :edit, :update, :destroy] 
    before_action :set_title, only: [:new, :edit]
    load_and_authorize_resource
    respond_to :html, :json

    def edit
    end

    def create
      @image = Image.new
      @image.image = image_params.fetch(:image).shift
      @image.exposition_id = params.fetch(:exposition_id)
      if @image.save
        response = @image.to_jqfu_response
        respond_to do |format|
          flash[:notice] =  t(:'notice.success.gallery.image.create')
          format.html { render  json: response,
                                content_type: 'text/html',
                                layout: false }
          format.json { render  json: response }
        end
      else
        render json: [{ error: :failed }], status: 400
      end
    end

    def update
      respond_with(@image) do |format|
        if @image.update(image_params)
          format.html { redirect_to @image.exposition, notice: t(:'notice.success.gallery.image.update') }
          format.json
        else
          format.html { render action: :edit }
          format.json
        end
      end
    end

    def destroy
      flash[:notice] = t(:'notice.success.gallery.image.destroy') if @image.destroy
    end

    private
      def set_image
        @image = Image.find(params[:id])  
      end

      def set_title
        set_meta_tags title: t('.title')
      end

      def image_params
        params.require(:image).permit! if params[:image]
      end
  end
end