class ApplicationController < ActionController::Base
  def check_admin!
    p('checking admin')
    unless user_signed_in? && current_user.role == 'admin'
      redirect_back(fallback_location: root_path,
                    notice: 'You dont have enough permissions to be here'
                   )
    end
  end
end
