class ApplicationController < ActionController::Base
  protect_from_forgery
  force_ssl
  before_filter :authenticated_user
  before_filter :admin_user, :except => [:show, :index]
  before_filter :enable_printing
  include SP_HELPER

  public
  def is_restful?
    u = request.url.split('?').first
    (params['restful'] || (params['format'] == 'json') || u.ends_with?('json') || request.content_type == "application/json")
    false # Force to false for now
  end

  def verified_request?
    if is_restful?
      true
    else
      super()
    end
  end

  protected
  def authenticated_user
    # intend to replace by LDAP validation but NOT FINISH

    #if is_restful?
    #  authenticate_or_request_with_http_basic do |username, password|
    #    user = User.find_by_name(username)
    #    if user
    #      # intend to replace by LDAP validation but NOT FINISH
    #      #validate_LDAP= validate_data(username, password, ProjectStatus::Application.config.AuthenServer)
    #      #if validate_LDAP == true || validate_LDAP == True
    #        session[:user_id] = user.id
    #        #session[:expiry_time] = Time.now + 30.minutes
    #        #token = decrypt_token(token)
    #        ## post token to SSO
    #        #response_data= post_token(token, is_allow)
    #        ## decode response
    #        #data= decrypt_response(response_data)
    #        #if data.nil?
    #        #  redirect_to_idp()
    #        #else
    #        #  create(data)
    #      #end
    #    end
    #  end
    #end
    # Check and apply Single Sign Off
    is_logged = is_logged(session[:user_id], session[:expiry_time], session[:tkid])
    if is_logged == 0
      redirect_to :controller => 'sessions', :action => 'index'
    else
      if session[:is_internal].to_s.downcase == 'false'
        client_token = params[:externaltoken]
        if client_token != session[:external_token]
          destroy_current_user
          redirect_to :controller => 'sessions', :action => 'index'
        end
      end
    end
  end


  # Jira 24 SSO
  # for the redirection for root: Session/created
  # and actions links of controller
  def default_url_options
    k, v = ''
    if !session[:external_token].nil?
      k = 'externaltoken'
      v = session[:external_token].to_s
    end
    { k => v }
  end

  #if is_restful?
  #  authenticate_or_request_with_http_basic do |username, password|
  #    user = User.find_by_name(username)
  #    if user && user.authenticate(password)
  #      session[:user_id] = user.id
  #    end
  #  end
  #end
  #redirect_to root_url, notice: "Please log into the system" if session[:user_id].nil?


  def admin_user
    redirect_to root_url, notice: "You are not authorised for that" unless admin_user?
  end

  def power_user
    redirect_to root_url, notice: "You are not authorised for that" unless power_user?
  end

  private

  def enable_printing
    u = request.url.split('?').first
    @printing = ((params['print']) || (params['format'] == 'pdf') || u.ends_with?('pdf'))
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def destroy_current_user
    ## SSO
    #reset_session

    session[:user_id] = nil
    session[:tkid] = nil
    session[:expiry_time] =nil
    @current_user = nil
  end

  def power_user?
    admin_user? || (current_user && current_user.role == 'pm')
  end

  def admin_user?
    current_user && current_user.role == 'admin'
  end

  def ro_full_menu?
    admin_user? || (current_user && current_user.role == 'ro-full')
  end

  helper_method :current_user, :admin_user?, :power_user?, :ro_full_menu?, :destroy_current_user
end
