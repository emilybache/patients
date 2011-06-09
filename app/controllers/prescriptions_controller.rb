class PrescriptionsController < ApplicationController
  # GET /prescriptions
  # GET /prescriptions.xml
  def index
    @patient = Patient.find_by_id(params[:patient])
    @prescriptions = @patient ? @patient.prescriptions : Prescription.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @prescriptions }
    end
  end

  # GET /prescriptions/1
  # GET /prescriptions/1.xml
  def show
    @prescription = Prescription.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @prescription }
    end
  end

  # GET /prescriptions/new
  # GET /prescriptions/new.xml
  def new
    @prescription = Prescription.new
    @patient = Patient.find_by_id(params[:patient])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @prescription }
    end
  end

  # GET /prescriptions/1/edit
  def edit
    @prescription = Prescription.find(params[:id])
    @patient = Patient.find_by_id(params[:patient])
  end

  # POST /prescriptions
  # POST /prescriptions.xml
  def create
    @prescription = Prescription.create!(params[:prescription])

    respond_to do |format|
      if @prescription.save
        format.html { redirect_to(@prescription, :notice => 'Prescription was successfully created.') }
        format.xml  { render :xml => @prescription, :status => :created, :location => @prescription }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @prescription.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /prescriptions/1
  # PUT /prescriptions/1.xml
  def update
    @prescription = Prescription.find(params[:id])
    respond_to do |format|
      if @prescription.update_attributes(params[:prescription])
        format.html { redirect_to(@prescription, :notice => 'Prescription was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @prescription.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /prescriptions/1
  # DELETE /prescriptions/1.xml
  def destroy
    @prescription = Prescription.find(params[:id])
    @patient = @prescription.patient
    @prescription.destroy

    respond_to do |format|
      format.html { redirect_to(prescriptions_path(:patient => @patient)) }
      format.xml  { head :ok }
    end
  end
end
