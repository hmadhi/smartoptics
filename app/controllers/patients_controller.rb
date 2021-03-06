class PatientsController < ApplicationController
  def new
    @patient=Patient.new
    1.times do
      consult = @patient.consults.build
      2.times { consult.dispenses.build }
    end
    
    #3.times do
    #question = @survey.questions.build
    #4.times { question.answers.build }
  end
  
  def create 
    @patient = Patient.new(params[:patient])
    #@consult = @patient.consults.build(params[:consults_attributes])
    @patient.save
    redirect_to "/patients/#{@patient.id}"
  end
  
  def show
    @patient = Patient.find(params[:id])
    @consults = Consult.find_by_patient_id(params[:id])
  end
  
  def edit
    @patient = Patient.find(params[:id])
    @consult = Consult.find_by_patient_id(params[:id])
    
    
  end
  
  def update 
    @patient = Patient.find(params[:id])
    @patient.update_attributes(params[:patient])
    
   # @consult = Consult.find_by_patient_id(params[:id])
   # @consult.update_attributes(params[:consult])
    
    #redirect_to @patient #redirect to patient record [:id] 
    redirect_to @patient
    
  end
  
  def index
    @patients = Patient.all
  end
  
  def destroy
    @patient = Patient.find(params[:id]) # find patient to destroy 
    @patient.destroy
    redirect_to patients_url
  end
end
