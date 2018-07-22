class OmniauthSessionsController < ApplicationController
  # OmniAuth Steam GemがSCRF対策の回避をできていない
  skip_before_action :verify_authenticity_token, only: [:steam]

  def twitter
    callback(request.env['omniauth.auth'])
  end

  def steam
    callback(request.env['omniauth.auth'])
  end

  private

  def callback(omniauth)
    @user = User.from_omniauth(omniauth)
    if @user.persisted?
      flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: omniauth.provider.capitalize) if is_navigational_format?
      sign_in_and_redirect @user
    else
      session["devise.#{omniauth.provider}_data"] = omniauth
      redirect_to new_user_registration_url
    end
  end
end
