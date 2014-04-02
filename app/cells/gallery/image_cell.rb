module Gallery
  class ImageCell < Cell::Rails
    # include CanCan::ControllerAdditions
    # include Core::ApplicationHelper
    # helper Core::ApplicationHelper
    # append_view_path 'app/views'

    def show args = {}
      @images = Gallery::Image.random.limit(args[:limit] || 10)
      args[:view] ? render(view: args[:view]) : render unless @images.empty?
    end
  end
end