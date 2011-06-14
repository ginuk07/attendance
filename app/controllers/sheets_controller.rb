class SheetsController < ApplicationController
  def index
    @assignments = Assignment.select('DISTINCT date').order('date DESC')
  end

  def new
    @clients = Client.where('discharge_date IS NULL').all

    @assignments = []
    @clients.each do |c| @assignments.push(Assignment.new(:client_id => c.id)) end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @assignment }
    end
  end

  def show
    @assignments = Assignment.where(:date => params[:id])
  end

  def destroy
    Assignment.where(:date => params[:id]).destroy_all

    respond_to do |format|
      format.html { redirect_to(sheets_url) }
    end
  end

  def create
    @assignments = parse(params)
    qdate = parse_date(params[:assignment])
    respond_to do |format|
      @assignments.each do |assignment|
        if assignment.save
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => assignment.errors, :status => :unprocessable_entity }
        end
      end
      format.html { redirect_to(edit_sheet_path(qdate)) }
    end
  end

  def edit
    @assignments = Assignment.where(:date => params[:id])
  end

  def update
    qdate = Date.new(params[:id].to_i)
    assignment_keys = params[:assignments].keys
    respond_to do |format|
      assignment_keys.each do |k|
        assignment = Assignment.find(k)
        if assignment.update_attributes(params[:assignments][k][:assignment])
        else
          format.js { render :json => assignment.errors, :status => :unprocessable_entity }
        end
      end
      format.js { render :status => 204 }
    end
  end

  private
  def parse(params)
    assignments = Array.new
    qdate = parse_date(params[:assignment])

    params[:assignments].values.collect { |values|
      assignments.push(Assignment.new(:client_id => values["assignment"]["client_id"],
                                      :status => values["assignment"]["status"],
                                      :date => qdate))
    }
    return assignments
  end

  private
  def parse_date(d)
    qyear = d["date(1i)"].to_i
    qmonth = d["date(2i)"].to_i
    qday = d["date(3i)"].to_i
    return Date.new(year=qyear,month=qmonth,day=qday)
  end
end
