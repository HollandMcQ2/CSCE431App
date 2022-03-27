class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
        # try catch to access the role
        # exception if the user is not found, which means the user is a member
        begin
            # try to find user by email and get their role, will throw error if user is not found
            role = User.find_by(email: from_google_params[:email]).role
            if role == "admin"
                @user = User.from_google_admin(from_google_params)
                
            elsif role == "member"
                @user = User.from_google_member(from_google_params)
            end
        rescue StandardError => e
            role = "member"
            @user = User.from_google_member(from_google_params)
        end

        sign_out_all_scopes
        flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Google', reason: "Successfully signed in as a #{role}"
        sign_in_and_redirect @user, event: :authentication

        
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