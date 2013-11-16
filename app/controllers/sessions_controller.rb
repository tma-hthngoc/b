#======================================================
# SSO integration - start on 7th Nov 2013
# List of effected files:
# - sessions_controller.rb
# - application_controller.rb
# - welcome_index_view ruby embed code#
# - application.rb
# - Config / production.rb
# ...
#======================================================

class SessionsController < ApplicationController
  skip_before_filter :authenticated_user
  skip_before_filter :authenticated_user, :admin_user, :power_user, :destroy
  include SP_HELPER

  #SSO==================================================================
  def create (data)
    user = User.find_by_name(data[0])
    #if user && user.authenticate(params[:password])
    if !user
      # Jira 35 SSO: generate users come from Wallem AD
      if ProjectStatus::Application.config.generate_user == true
        user = User.new(name: data[0].to_s,
                        email: "#{data[0].to_s}@#{ProjectStatus::Application.config.domain}",
                        password: 'nil', password_confirmation: 'nil',
                        role: ProjectStatus::Application.config.default_role)
        user.save
      else
        redirect_to root_url, notice: 'Invalid Credentials Provided'
      end
    end
    session[:user_id] = user.id
    session[:tkid] = data[5].to_s
    session[:expiry_time] = calc_time_out(data[3], data[1])
    session[:is_internal] = data[1].to_s
    if data[1].to_s.downcase == 'false'
      session[:external_token] = get_unique_token
    end
    redirect_to root_url, notice: 'Logged In!'

  end

  # not use this action in SSO
  def destroy
    destroy_current_user
    current_url = request.original_url
    redirect_to_idp_logout(current_url)
  end

  #0===================================================================
  def index
    destroy_current_user
    token = params[:tkid]
    is_allow = params[:tkallow]
    if token.nil?
      #redirect to idp
      redirect_to_idp()
    else
      # decrypt token
      token = decrypt_token(token)
      # post token to SSO
      response_data = post_token(token, is_allow)
      # decode response
      data= decrypt_response(response_data)
      if data.nil?
        redirect_to_idp()
      else
        create(data)
      end
    end
  end
end

#
#class SessionsController < ApplicationController
#  skip_before_filter :authenticated_user, :admin_user, :power_user
#
#  def create
#    user = User.find_by_name(params[:name])
#    if user && user.authenticate(params[:password])
#      session[:user_id] = user.id
#      redirect_to root_url, notice: 'Logged In!'
#     else
#      redirect_to root_url, notice: 'Invalid Credentials Provided'
#    end
#  end
#
#  def destroy
#    destroy_current_user
#    redirect_to root_url, notice: 'Logged Out!'
#  end
#end
