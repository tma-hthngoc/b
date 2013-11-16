class ReportPeriodsController < ApplicationController
  # GET /report_periods
  # GET /report_periods.json
  def index
    @report_periods = ReportPeriod.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @report_periods }
    end
  end

  # GET /report_periods/1
  # GET /report_periods/1.json
  def show
    @report_period = ReportPeriod.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @report_period }
    end
  end

  # GET /report_periods/new
  # GET /report_periods/new.json
  def new
    @report_period = ReportPeriod.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @report_period }
    end
  end

  # GET /report_periods/1/edit
  def edit
    @report_period = ReportPeriod.find(params[:id])
  end

  # POST /report_periods
  # POST /report_periods.json
  def create
    @report_period = ReportPeriod.new(params[:report_period])

    respond_to do |format|
      if @report_period.save
        format.html { redirect_to @report_period, notice: 'Report period was successfully created.' }
        format.json { render json: @report_period, status: :created, location: @report_period }
      else
        format.html { render action: "new" }
        format.json { render json: @report_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /report_periods/1
  # PUT /report_periods/1.json
  def update
    @report_period = ReportPeriod.find(params[:id])

    respond_to do |format|
      if @report_period.update_attributes(params[:report_period])
        format.html { redirect_to @report_period, notice: 'Report period was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @report_period.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /report_periods/1
  # DELETE /report_periods/1.json
  def destroy
    @report_period = ReportPeriod.find(params[:id])
    @report_period.destroy

    respond_to do |format|
      format.html { redirect_to report_periods_url }
      format.json { head :no_content }
    end
  end
end
