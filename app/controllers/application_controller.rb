class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    render text: exception.message, layout: false , status: :unauthorized
  end
end
