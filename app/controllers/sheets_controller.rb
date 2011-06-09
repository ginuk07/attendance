class SheetsController < ApplicationController
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

  def create
    @assignments = Array.new

    qyear = params["assignment"]["date(1i)"].to_i
    qmonth = params["assignment"]["date(2i)"].to_i
    qday = params["assignment"]["date(3i)"].to_i
    qdate = Date.new(year=qyear,month=qmonth,day=qday)

    params[:assignments].values.collect { |values|
      @assignments.push(Assignment.new(:client_id => values["assignment"]["client_id"],
                                       :status => values["assignment"]["status"],
                                       :date => qdate))
    }

    respond_to do |format|
      @assignments.each do |assignment|
        if assignment.save
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => assignment.errors, :status => :unprocessable_entity }
        end
      end
      format.html { redirect_to(sheet_path(qdate)) }
    end
  end
end
