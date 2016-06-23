class PhysiciansController < ApplicationController
    
    def index
      physicians = Physician.joins(:appointments, :patients).uniq.order('appointments.appointment_date ASC')
      @physicians = physicians.paginate(:page => params[:page], :per_page => 5)
    end
end
