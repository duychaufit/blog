class Physician < ActiveRecord::Base
    has_many :appointments
    # has_many :patients, through: :appointments
    has_many :patients, -> { order 'appointments.appointment_date' }, :through => :appointments
end
