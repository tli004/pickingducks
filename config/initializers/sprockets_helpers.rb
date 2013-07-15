# Support all ActionView goodness in asset files with *.erb extension
# More info at : https://github.com/rails/rails/issues/3116 and https://github.com/sstephenson/sprockets/issues/218
Rails.application.assets.context_class.class_eval do
  include ERB::Util
  include ActionView::Helpers
  include Rails.application.routes.url_helpers
end