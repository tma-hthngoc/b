class PipelineController < ApplicationController
  skip_before_filter :admin_user, :power_user

  def index
    #
    #session[:tkid]=nil

    @scope = :active
    @tit = "Project Pipeline"
    @risk_summary = RiskSummary.find_by_project_id(nil)
    @projects = Project.active

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: Project.active }
    end
  end

  def archive
    @scope = :inactive
    @tit = "Project Archive"
    @projects = Project.inactive
    respond_to do |format|
      format.html { render 'index' }
      format.json { render json: Project.inactive }
    end
  end

  def planner
    @tit = 'Staff Planner'
  end
end
