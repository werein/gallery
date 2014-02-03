require_dependency "gallery/application_controller"

module Gallery
  class ExpositionsController < ApplicationController
    before_action :set_exposition, only: [:show, :edit, :update, :destroy] 
    before_action :set_title, only: [:index, :new, :edit]
    load_and_authorize_resource
    respond_to :html, :json
    respond_to :js, only: :show

    def index
      @expositions = Exposition.with_translations(I18n.locale).roots.latest
      respond_with @expositions
    end

    def show
      @images = @exposition.images.uploaded.page(params[:images_page])
      @videos = @exposition.videos.uploaded.page(params[:videos_page])

      set_meta_tags title:        @exposition.title,
                    description:  @exposition.description,
                    keywords:     @exposition.title

      respond_with @exposition
    end

    def new
      @exposition = Exposition.new
      @exposition.translations.build
      respond_with @exposition
    end

    def edit
    end

    def create
      @exposition = Exposition.new(exposition_params)
      flash[:notice] = t('.notice') if @exposition.save
      respond_with @exposition
    end

    def update
      flash[:notice] = t('.notice') if @exposition.update(exposition_params)
      respond_with @exposition
    end

    def destroy
      redirect_to expositions_path, notice: t('.notice') if @exposition.destroy
    end

    private
      def set_exposition
        @exposition = Exposition.find(params[:id])
      end

      def set_title
        set_meta_tags title: t('.title')
      end
      
      def exposition_params
        params.require(:exposition).permit(:cover, :parent_id, translations_attributes: [:id, :title, :slug, :locale, :description, :_destroy])
      end
  end
end