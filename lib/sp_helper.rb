require 'open-uri' # for checking available connection
require 'base64' #for decode saml2response
require 'nokogiri' #for extracting Saml2Response
require 'net/https'
require 'time'
require 'securerandom'

module SP_HELPER

  #1===================================================================
  def reverse_string(string)
    loop = string.length
    word = '' # this is what we will use to output the        reversed word
    while loop > 0
      loop -= 1
      word += string[loop]
    end
    word # return the reversed word
  end

  #2===================================================================
  def decrypt_token(encrypted_token)
    k = ProjectStatus::Application.config.token_key.length
    token = encrypted_token.from(k)
    reverse_string(token)
  end

  #3===================================================================
  def is_online(destination_url)
    #file_name = "output.txt"
    #output = File.open(file_name, "a")
    begin
      web_page = open(destination_url)
      return true
    rescue Exception
      #output.puts "#{Time.now}: Connection failed !"
      false
    ensure
      #output.close
    end
  end

  #4===================================================================
  def get_online_server(server01, server02)
    if is_online(server01)
      server01
    else
      if is_online(server02)
        server02
      else
        nil # throw exception
      end
    end
  end

  #5===================================================================
  def check_idp_network
    server = get_online_server(
        "#{ProjectStatus::Application.config.master_server}#{ProjectStatus::Application.config.sso_service}",
        "#{ProjectStatus::Application.config.backup_server}#{ProjectStatus::Application.config.sso_service}")
    if server.nil?
      nil
    else
      if server.include? ProjectStatus::Application.config.master_server
        ProjectStatus::Application.config.master_server
      else
        ProjectStatus::Application.config.backup_server
      end
    end
  end

  #6===================================================================
  def redirect_to_idp
    server = check_idp_network()
    server.nil? ? nil : redirect_to_idp1(server)
  end

  #7===================================================================
  def redirect_to_idp1(server)
    current_url = URI.escape(request.original_url)
    redirect_to("#{server}#{ProjectStatus::Application.config.login_service}?tkfrom=#{current_url}")
  end

  #8===================================================================
  def post_token(token, is_allow)
    server = check_idp_network()
    if server.blank?
      'error'
    else
      post_token1(token, is_allow, "#{server}#{ProjectStatus::Application.config.sso_service}")
    end
  end

  #9==================================================================
  def post_token1(token, is_allow, server)
    begin
      uri = URI.parse(server)
      current_time = Time.now.utc.strftime('%Y-%m-%d %H:%M:%S')
      current_time += 'Z'
      @body = {:ID => token,
               :Issuer => request.original_url,
               :Version => "2.0",
               :AssertionConsumerServiceIndex => "0",
               :IssueInstant => current_time.to_s,
               :Format =>
                   "urn:oasis:names:tc:SAML:2.0:nameid-format:transient",
               :AllowCreate => is_allow}.to_json
      request = Net::HTTP::Post.new(uri.path,
                                    initheader = {'Content-Type' => 'application/json'})

      request.body = @body
      response2 = Net::HTTP.new(uri.host, uri.port).start { |http|
        http.request(request) }
      @message = "#{response2.body}"
      return @message
    rescue Exception
      return 'Error SSO: '
    ensure
    end
  end


  #10==================================================================
  def decrypt_response(encrypted_response)
    time_plus = 0
    begin
      plain = Base64.decode64(encrypted_response)
      xml_object = Nokogiri::XML(plain)
      variant = xml_object.xpath("//ns:AttributeValue", {'ns' => 'urn:oasis:names:tc:SAML:2.0:assertion'})
      token = variant[0].text
      user_name = variant[1].text
      is_allow = variant[2].text
      from_sp = variant[3].text
      on_date = variant[4].text
      time_plus = variant[5].text

      rs = Array.new
      rs<< user_name # index 0
      rs<< is_allow
      rs<< from_sp
      rs<< on_date
      rs<< time_plus
      rs<< token # index 5

      return rs
    rescue Exception
      #Log
      return nil
    ensure
    end
  end

  ##11==================================================================
  def is_logged (user_id, expire_on, id)
    if user_id.nil?
      0
    else
      begin
        if id.nil?
          0
        else
          check_rs = check_token(id)
          if check_rs != 1
            0
          else
            if !expire_on.nil?
              current_time = Time.now.utc
              if expire_on < current_time
                destroy_current_user
                0
              else
              end
            end
          end
        end
      end
    end
  end

  #12===================================================================
  def redirect_to_idp_logout1(server, current_url)
    a = "#{server}#{ProjectStatus::Application.config.logout_service}?tkfrom=#{current_url}"
    redirect_to a
  end

  #13===================================================================
  def redirect_to_idp_logout(current_url)
    server = check_idp_network()
    server.nil? ? nil : redirect_to_idp_logout1(server, current_url)
  end

  #14===================================================================
  def time_length seconds
    days = (seconds / 1.day).floor
    seconds -= days.days
    hours = (seconds / 1.hour).floor
    seconds -= hours.hours
    minutes = (seconds / 1.minute).floor
    seconds -= minutes.minutes
    {days: days, hours: hours, minutes: minutes, seconds: seconds}
  end


  #15===================================================================
  def check_token1(token, server)
    uri = URI.parse("#{server}/#{token}")
    data = open(uri).read
    if data.nil?|| data == "null"
      0
    else
      1
    end
  end

  #16===================================================================
  def check_token(token)
    server = check_idp_network()
    if server.blank?
      'error'
    else
      check_token1(token, "#{server}#{ProjectStatus::Application.config.sso_service}")
    end
  end

  #17====================================================================
  def convert_datetime_to_string(value, format)
    #http://apidock.com/ruby/DateTime/strftime
    #format: "%b %d, %Y" => Aug 30, 2013
    dt_obj = DateTime.parse(value.to_s)
    mm = dt_obj.strftime(format)
    i = mm.to_s
    Time.parse(i)
  end

  #18====================================================================
  def calc_time_out(on_time, is_internal)
    # in case of external access, session will be shorter
    current_time = Time.now.utc
    time_end = convert_datetime_to_string(on_time, '%Y-%m-%d %H:%M:%S UTC')
    rs = 0
    adding_time = 0
    if is_internal.to_s.downcase
      adding_time = current_time + 5.minutes
    else
      adding_time = current_time + 14.minutes
    end
    t1 = time_end.to_i
    t2 = adding_time.to_i
    temp = t2 - t1
    temp /= 60 # get minutes
    diff_time = temp.to_i
    if diff_time > 0
      remain_time = time_end.to_i- current_time.to_i
      remain_time /= 60
      rs = current_time + remain_time.minutes
    else
      if diff_time <= 10
        rs = adding_time
      else
        diff_time *= -1
        rs = current_time + diff_time.minutes
      end
    end
    rs
  end



  #19==================================================================
  def validate_data(username, password, server)
    begin
      uri = URI.parse(server)
      @body = {:Username => username,
               :Password => password,
               :UserDomain => ProjectStatus::Application.config.domain}.to_json
      request = Net::HTTP::Post.new(uri.path,
                                    initheader = {'Content-Type' => 'application/json'})

      request.body = @body
      response2 = Net::HTTP.new(uri.host, uri.port).start { |http|
        http.request(request) }
      @message = "#{response2.body}"
      @message
    rescue Exception
      'Error SSO: '
    ensure
    end
  end

  #20==================================================================
  def get_unique_token
    half_size = 16
    SecureRandom.hex(half_size)
  end
end
