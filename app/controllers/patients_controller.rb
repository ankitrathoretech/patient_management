class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: %i[edit update]

  def index
    @patients = Patient.order(:last_name).page(params[:page]).per(10)
    @patients = @patients.where("first_name ILIKE ? OR email ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%") if params[:query].present?
  end

  def relevant
    @patients = Patient.relevant_soon.page(params[:page]).per(10)
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to patients_path, notice: "Patient created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @patient.update(patient_params)
      redirect_to patients_path, notice: "Patient updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :email, :next_appointment)
  end
end
