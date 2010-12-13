class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    #render :text => env["omniauth.auth"].to_yaml
    omniauth = env["omniauth.auth"]

    @user = User.find_for_facebook_oauth(omniauth)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @user, :event => :authentication
    else
      flash[:error] = I18n.t "devise.omniauth_callbacks.failure", :kind => "Facebook", :reason => "costam"
      redirect_to "/"
      #session["omniauth"] = omniauth
      #redirect_to new_user_path
    end
  end
end
