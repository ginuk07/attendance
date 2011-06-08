class AssignmentsController < ApplicationController
  # GET /assignments
  # GET /assignments.xml
  def index
    @assignments = Assignment.all.sort

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @assignments }
    end
  end

  # GET /assignments/1
  # GET /assignments/1.xml
  def show
    @assignment = Assignment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @assignment }
    end
  end

  # GET /assignments/new
  # GET /assignments/new.xml
  def new
    @assignment = Assignment.new
    @client = Client.new
    @sheet = Sheet.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @assignment }
    end
  end

  # GET /assignments/1/edit
  def edit
    @assignment = Assignment.find(params[:id])
  end

  # POST /assignments
  # POST /assignments.xml
  def create
    status = params[:assignment]["status"]
    client_id = params[:assignment]["client_id"]
    qyear = params[:assignment][:sheet_attributes].values_at("date(1i)")[0].to_i
    qmonth = params[:assignment][:sheet_attributes].values_at("date(2i)")[0].to_i
    qday = params[:assignment][:sheet_attributes].values_at("date(3i)")[0].to_i
    qdate = Date.new(y=qyear,m=qmonth,d=qday).to_s
    sheet = Sheet.where(:date => qdate).limit(1)[0]
    if sheet.nil?
      sheet = Sheet.new(params[:assignment][:sheet_attributes])
    end
    @assignment = Assignment.new(:client_id => client_id, :sheet => sheet, :status => status)

    respond_to do |format|
      if @assignment.save
        format.html { redirect_to(@assignment, :notice => 'Attendance assignment was successfully created.') }
        format.xml  { render :xml => @assignment, :status => :created, :location => @assignment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @assignment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /assignments/1
  # PUT /assignments/1.xml
  def update
    @assignment = Assignment.find(params[:id])

    respond_to do |format|
      if @assignment.update_attributes(params[:assignment])
        format.html { redirect_to(@assignment, :notice => 'Attendance assignment was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @assignment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.xml
  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.destroy

    respond_to do |format|
      format.html { redirect_to(assignments_url) }
      format.xml  { head :ok }
    end
  end
end
