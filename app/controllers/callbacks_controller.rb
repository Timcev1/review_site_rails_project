class CallbacksController < Devise::OmniauthCallbacksController
  def github
  @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "github") if is_navigational_format?
    else
      session["devise.github_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to jobs_path
  end
  def self.new_with_session(params, session)
   super.tap do |user|
     if data = session["devise.github_data"] && session["devise.github_data"]["extra"]["raw_info"]
       user.email = data["email"] if user.email.blank?
     end
   end
 end


end
