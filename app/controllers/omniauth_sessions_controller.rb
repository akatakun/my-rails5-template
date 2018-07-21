class OmniauthSessionsController < ApplicationController
  # 外部からのコールバックに対してはSCRF対策をしない
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    omniauth = request.env['omniauth.auth']
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
