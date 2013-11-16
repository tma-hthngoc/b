class RiskSummariesController < ApplicationController
  skip_before_filter :admin_user, :except => :destroy    #remove admin privs
  before_filter :power_user, :except => [:show, :index]  #add power user privs

  # GET /risk_summaries
  # GET /risk_summaries.json
  def index
    @risk_summaries = RiskSummary.sorted

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @risk_summaries }
    end
  end

  # GET /risk_summaries/1
  # GET /risk_summaries/1.json
  def show
    @risk_summary = RiskSummary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @risk_summary }
    end
  end

  # GET /risk_summaries/new
  # GET /risk_summaries/new.json
  def new
    @risk_summary = RiskSummary.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @risk_summary }
    end
  end

  # GET /risk_summaries/1/edit
  def edit
    @risk_summary = RiskSummary.find(params[:id])
  end

  # POST /risk_summaries
  # POST /risk_summaries.json
  def create
    @risk_summary = RiskSummary.new(params[:risk_summary])

    respond_to do |format|
      if @risk_summary.save
        format.html { redirect_to @risk_summary, notice: 'Risk summary was successfully created.' }
        format.json { render json: @risk_summary, status: :created, location: @risk_summary }
      else
        format.html { render action: "new" }
        format.json { render json: @risk_summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /risk_summaries/1
  # PUT /risk_summaries/1.json
  def update
    @risk_summary = RiskSummary.find(params[:id])

    respond_to do |format|
      if @risk_summary.update_attributes(params[:risk_summary])
        format.html { redirect_to @risk_summary, notice: 'Risk summary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @risk_summary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /risk_summaries/1
  # DELETE /risk_summaries/1.json
  def destroy
    @risk_summary = RiskSummary.find(params[:id])
    @risk_summary.destroy

    respond_to do |format|
      format.html { redirect_to risk_summaries_url }
      format.json { head :no_content }
    end
  end

end
