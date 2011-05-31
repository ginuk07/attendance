class AttendanceSheetsController < ApplicationController
  # GET /attendance_sheets
  # GET /attendance_sheets.xml
  def index
    @attendance_sheets = AttendanceSheet.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @attendance_sheets }
    end
  end

  # GET /attendance_sheets/1
  # GET /attendance_sheets/1.xml
  def show
    @attendance_sheet = AttendanceSheet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @attendance_sheet }
    end
  end

  # GET /attendance_sheets/new
  # GET /attendance_sheets/new.xml
  def new
    @new_clients = Client.all
    @attendance_sheet = AttendanceSheet.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @attendance_sheet }
    end
  end

  # GET /attendance_sheets/1/edit
  def edit
    @attendance_sheet = AttendanceSheet.find(params[:id])
  end

  # POST /attendance_sheets
  # POST /attendance_sheets.xml
  def create
    client_ids = params[:attendance_sheet][:clients_attributes].values.collect { |x| x["id"] }
    av = params[:attendance_sheet][:clients_attributes].values.collect { |x| x["attendance_values_attributes"].values }
    #params[:attendance_sheet].delete(:clients_attributes)
    @attendance_sheet = AttendanceSheet.new(params[:attendance_sheet])

    respond_to do |format|
      if @attendance_sheet.save
        format.html { redirect_to(@attendance_sheet, :notice => 'Attendance sheet was successfully created.') }
        format.xml  { render :xml => @attendance_sheet, :status => :created, :location => @attendance_sheet }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @attendance_sheet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /attendance_sheets/1
  # PUT /attendance_sheets/1.xml
  def update
    @attendance_sheet = AttendanceSheet.find(params[:id])

    respond_to do |format|
      if @attendance_sheet.update_attributes(params[:attendance_sheet])
        format.html { redirect_to(@attendance_sheet, :notice => 'Attendance sheet was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @attendance_sheet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /attendance_sheets/1
  # DELETE /attendance_sheets/1.xml
  def destroy
    @attendance_sheet = AttendanceSheet.find(params[:id])
    @attendance_sheet.destroy

    respond_to do |format|
      format.html { redirect_to(attendance_sheets_url) }
      format.xml  { head :ok }
    end
  end
end
