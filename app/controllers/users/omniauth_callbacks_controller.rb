class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    # add code to check for role
    # role = User.find_by(from_google_params).role

    # try catch to access the role
    # exception if the user is not found, which means the user is a member
    begin
      # try to find user by email and get their role, will throw error if user is not found
      role = User.find_by(email: from_google_params[:email]).role
      if role == 'admin'
        @user = User.from_google_admin(from_google_params)

      elsif role == 'member'
        @user = User.from_google_member(from_google_params)
      end
    rescue StandardError => e
      role = 'member'
      @user = User.from_google_member(from_google_params)
    end

    sign_out_all_scopes
    flash[:success] =
      t('devise.omniauth_callbacks.success', kind: 'Google',
                                             reason: "Successfully signed in as a #{role}"
      )
    # "users/index" sign_in_and_redirect user, event: :authentication
    sign_in_and_redirect(@user, event: :authentication)

    # if role == "admin"
    #     sign_out_all_scopes
    #     flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Google', reason: "you are an admin"
    #     # "users/index" sign_in_and_redirect user, event: :authentication
    #     puts "elaine #{user_path(@user)}"
    #     sign_in_and_redirect @user, event: :authentication
    # elsif role == "member"
    #     # flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
    #     flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Google', reason: "Successfully signed in as a member."
    #     # redirect_to new_user_session_path
    #     sign_in_and_redirect @user, event: :authentication
    # end
  end

  protected

  def stored_location_for(resource)
    if resource.is_a?(User) && resource.role == 'admin'
      return user_path(resource)
    elsif resource.is_a?(User) && resource.role == 'member'
      return user_path(resource)
    end

    super(resource)
  end

  # def after_sign_in_path_for(resource)
  #     stored_location_for(resource) ||
  #     if resource.is_a?(User) && resource.role == 'admin'
  #         p "kangaroo"
  #         p root_path
  #         root_path
  #     elseif resource.is_a?(User) && resource.role == 'member'
  #         p "kangaroo2"
  #         p user_root
  #         user_root
  #     else
  #         p "kangaroo1"
  #         super
  #     end
  # end

  def after_omniauth_failure_path_for(_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || root_path
  end

  private

  def from_google_params
    @from_google_params ||= {
      uid: auth.uid,
      email: auth.info.email,
      full_name: auth.info.name,
      avatar_url: auth.info.image
    }
  end

  def auth
    @auth ||= request.env['omniauth.auth']
  end
end
