class PatientsController < ApplicationController
    
    def index
        
      patients = Patient.joins(:appointments, :physicians).uniq.order('id ASC')
      
      @patients = patients.paginate(:page => params[:page], :per_page => 5)
      
    end
end
