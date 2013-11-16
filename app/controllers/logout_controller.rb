class LogoutController < ApplicationController
skip_before_filter :authenticated_user


  def index
    destroy_current_user
    current_url = root_url #'https://sleepy-reaches-5474.herokuapp.com/'  #request.original_url
    redirect_to_idp_logout(current_url)
  end
end
