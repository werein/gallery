require 'rails_admin'

RailsAdmin.config do |config|
  config.model Gallery::Exposition do
    navigation_icon 'icon-picture'
    field :active
    field :cover
    field :parent_id, :enum do
      enum_method do
        :parent_enum
      end
    end
    field :translations
    list do
      field :title
      field :cover
      field :created_at do
        column_width 200
      end
    end
    nestable_tree({
      position_field: :position,
      max_depth: 4
    })
  end
  config.model Gallery::Exposition::Translation do
    visible false
    field :title
    field :locale
    field :description, :ck_editor
  end

  config.model Gallery::Image do
    navigation_icon 'icon-chevron-right'
    field :image
    field :exposition
    field :translations
    list do
      field :title
      field :image
      field :created_at do
        column_width 200
      end
    end
  end
  config.model Gallery::Image::Translation do
    visible false
    field :title
    field :locale
    field :description
  end

  config.model Gallery::Video do
    navigation_icon 'icon-chevron-right'
    field :video
    field :thumb
    field :exposition
    field :translations
    list do
      field :title
      field :thumb
      field :created_at do
        column_width 200
      end
    end
  end

  config.model Gallery::Video::Translation do
    visible false
    field :title
    field :locale
    field :description
  end
end if defined? RailsAdmin