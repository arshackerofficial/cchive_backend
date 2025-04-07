class AppointmentMailer < ApplicationMailer
  def notify_tutor(appointment)
    @appointment = appointment
    @tutor = appointment.tutor_profile.user
    @student = appointment.student

    mail(
      to: @tutor.email,
      subject: "New tutoring request from #{@student.first_name} (CCHive)"
    )
  end
end
