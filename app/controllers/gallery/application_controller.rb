module Gallery
  class ApplicationController < ::ApplicationController
    # User ability
    def current_ability
      @current_ability ||= Gallery::Ability.new current_user
    end
  end
end
