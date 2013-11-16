class WelcomeController < ApplicationController
  before_filter :authenticated_user
  def index
  end
end
