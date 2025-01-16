require 'rails_helper'

RSpec.describe PatientsController, type: :controller do
  let(:user) { create(:user) }
  let(:patient) { create(:patient) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    let!(:patients) { create_list(:patient, 5) }

    it 'assigns patients and renders the index template' do
      get :index, params: { page: 1 }
      expect(assigns(:patients)).to eq(Patient.order(:first_name).page(1).per(10))
      expect(response).to render_template(:index)
    end

    it 'filters patients based on the query' do
      get :index, params: { query: patient.first_name }
      expect(assigns(:patients)).to include(patient)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #relevant' do
    let!(:relevant_patient) { create(:patient, next_appointment: 2.days.from_now) }
    let!(:irrelevant_patient) { create(:patient, next_appointment: 10.days.from_now) }

    it 'assigns patients with upcoming appointments and renders the relevant template' do
      get :relevant, params: { page: 1 }
      expect(assigns(:patients)).to include(relevant_patient)
      expect(assigns(:patients)).not_to include(irrelevant_patient)
      expect(response).to render_template(:relevant)
    end
  end

  describe 'GET #new' do
    it 'assigns a new patient and renders the new template' do
      get :new
      expect(assigns(:patient)).to be_a_new(Patient)
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new patient and redirects to the patients path' do
        expect {
          post :create, params: { patient: attributes_for(:patient) }
        }.to change(Patient, :count).by(1)
        expect(response).to redirect_to(patients_path)
        expect(flash[:notice]).to eq("Patient created successfully.")
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new patient and renders the new template' do
        expect {
          post :create, params: { patient: attributes_for(:patient, email: nil) }
        }.not_to change(Patient, :count)
        expect(response).to render_template(:new)
        expect(flash[:alert]).to be_nil
      end
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested patient to @patient and renders the edit template' do
      get :edit, params: { id: patient.id }
      expect(assigns(:patient)).to eq(patient)
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    context 'with valid attributes' do
      it 'updates the patient and redirects to the patients path' do
        patch :update, params: { id: patient.id, patient: { first_name: 'Updated' } }
        patient.reload
        expect(patient.first_name).to eq('Updated')
        expect(response).to redirect_to(patients_path)
        expect(flash[:notice]).to eq("Patient updated successfully.")
      end
    end

    context 'with invalid attributes' do
      it 'does not update the patient and renders the edit template' do
        patch :update, params: { id: patient.id, patient: { email: nil } }
        expect(patient.reload.email).not_to be_nil
        expect(response).to render_template(:edit)
      end
    end
  end
end
