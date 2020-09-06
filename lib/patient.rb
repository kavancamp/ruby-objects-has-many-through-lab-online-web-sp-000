class Patient
    attr_accessor :name, :appointment, :doctor
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end
    def self.all
        @@all
    end
    def appointments
        Appointment.all.select do |appointment|
            appointment.patient == self
        end
    end
    def new_appointment(name, date)
        Appointment.new(name, self, date)
    end
    def doctors
    self.appointments.map do |appointment|
      appointment.patient
    end
  end

end
