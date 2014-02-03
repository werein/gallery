require_dependency "gallery/application_controller"

module Gallery
  class VideosController < ApplicationController
    before_action :set_video, only: [:show, :edit, :update, :destroy] 
    before_action :set_title, only: [:new, :edit]
    load_and_authorize_resource
    respond_to :html, only: [:edit, :update]
    respond_to :json

    def edit
    end

    def create
      @video = Video.new
      @video.video = video_params.fetch(:video).shift
      @video.exposition_id = params.fetch(:exposition_id)
      if @video.save
        response = @video.to_jqfu_response
        respond_to do |format|
          flash[:notice] = t('.notice')
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
      respond_with(@video) do |format|
        if @video.update(video_params)
          format.html { redirect_to @video.exposition, notice: t('.notice') }
          format.json
        else
          format.html { render action: :edit }
          format.json
        end
      end
    end

    def destroy
      flash[:notice] =  t('.notice') if @video.destroy
    end

    private
      def set_video
        @video = Video.find(params[:id])  
      end

      def set_title
        set_meta_tags title: t('.title')
      end

      def video_params
        params.require(:video).permit! if params[:video]
      end
  end
end