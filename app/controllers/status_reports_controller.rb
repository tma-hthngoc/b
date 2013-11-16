class StatusReportsController < ApplicationController
  skip_before_filter :admin_user, :except => :destroy    #remove admin privs
  before_filter :power_user, :except => [:show, :index]  #add power user privs

  # GET /status_reports
  # GET /status_reports.json
  def index
    if params[:project_id].nil?
      @status_reports = StatusReport.all
      @risk_summary = RiskSummary.find_by_project_id(nil)
    else
      @project = Project.find params[:project_id]
      @status_reports = @project.status_reports.reversed
      @risk_summary = @project.risk_summary
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @status_reports }
    end
  end

  # GET /status_reports/1
  # GET /status_reports/1.json
  def show
    @status_report = StatusReport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @status_report }
    end
  end

  # GET /status_reports/new
  # GET /status_reports/new.json
  def new
    if params[:project_id].nil?
      @status_report = StatusReport.new
    else
      @project = Project.find params[:project_id]
      @latest_report = @project.status_reports.last
      if @latest_report.nil?
        @next_period = ReportPeriod.first
      else
        @next_period = ReportPeriod.next(@latest_report.report_period.week_ending)
      end
      @status_report = @project.status_reports.new
      @status_report.report_period = @next_period if @next_period
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @status_report }
    end
  end

  # GET /status_reports/1/edit
  def edit
    @status_report = StatusReport.find(params[:id])
  end

  # POST /status_reports
  # POST /status_reports.json
  def create
    @status_report = StatusReport.new(params[:status_report])

    respond_to do |format|
      if @status_report.save
        format.html { redirect_to @status_report, notice: 'Status report was successfully created.' }
        format.json { render json: @status_report, status: :created, location: @status_report }
      else
        format.html { render action: "new" }
        format.json { render json: @status_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /status_reports/1
  # PUT /status_reports/1.json
  def update
    @status_report = StatusReport.find(params[:id])

    respond_to do |format|
      if @status_report.update_attributes(params[:status_report])
        format.html { redirect_to @status_report, notice: 'Status report was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @status_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /status_reports/1
  # DELETE /status_reports/1.json
  def destroy
    @status_report = StatusReport.find(params[:id])
    project = @status_report.project
    @status_report.destroy
    respond_to do |format|
      format.html { redirect_to project_status_reports_url(project) }
      format.json { head :no_content }
    end
  end
end
