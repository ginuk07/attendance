class AttendanceValuesController < ApplicationController
  # GET /attendance_values
  # GET /attendance_values.xml
  def index
    @attendance_values = AttendanceValue.all.sort

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @attendance_values }
    end
  end

  # GET /attendance_values/1
  # GET /attendance_values/1.xml
  def show
    @attendance_value = AttendanceValue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @attendance_value }
    end
  end

  # GET /attendance_values/new
  # GET /attendance_values/new.xml
  def new
    @attendance_value = AttendanceValue.new
    @client = Client.new
    @attendance_sheet = AttendanceSheet.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @attendance_value }
    end
  end

  # GET /attendance_values/1/edit
  def edit
    @attendance_value = AttendanceValue.find(params[:id])
  end

  # POST /attendance_values
  # POST /attendance_values.xml
  def create
    status = params[:attendance_value]["status"]
    client_id = params[:attendance_value][:client_attributes]["id"]
    qyear = params[:attendance_value][:attendance_sheet_attributes].values_at("date(1i)")[0].to_i
    qmonth = params[:attendance_value][:attendance_sheet_attributes].values_at("date(2i)")[0].to_i
    qday = params[:attendance_value][:attendance_sheet_attributes].values_at("date(3i)")[0].to_i
    qdate = Date.new(y=qyear,m=qmonth,d=qday).to_s
    attendance_sheet = AttendanceSheet.where(:date => qdate).limit(1)[0]
    if attendance_sheet.nil?
      attendance_sheet = AttendanceSheet.new(params[:attendance_value][:attendance_sheet_attributes])
    end
    @attendance_value = AttendanceValue.new(:client_id => client_id, :attendance_sheet => attendance_sheet, :status => status)

    respond_to do |format|
      if @attendance_value.save
        format.html { redirect_to(@attendance_value, :notice => 'Attendance value was successfully created.') }
        format.xml  { render :xml => @attendance_value, :status => :created, :location => @attendance_value }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @attendance_value.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /attendance_values/1
  # PUT /attendance_values/1.xml
  def update
    @attendance_value = AttendanceValue.find(params[:id])

    respond_to do |format|
      if @attendance_value.update_attributes(params[:attendance_value])
        format.html { redirect_to(@attendance_value, :notice => 'Attendance value was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @attendance_value.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /attendance_values/1
  # DELETE /attendance_values/1.xml
  def destroy
    @attendance_value = AttendanceValue.find(params[:id])
    @attendance_value.destroy

    respond_to do |format|
      format.html { redirect_to(attendance_values_url) }
      format.xml  { head :ok }
    end
  end
end
