class ApplicationController < ActionController::Base
  include ApplicationHelper
  include SessionsHelper
  include DecoratorHelper
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end
