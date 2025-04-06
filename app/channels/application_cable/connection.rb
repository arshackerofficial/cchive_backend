module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      pp request.params
      self.current_user = find_verified_user
      puts "\n \n \tUSER IDENTIFIED AS: \n\n "
      pp self.current_user
      puts "\n\n"
    end

    private
    def find_verified_user
      uid = request.params[:uid]
      User.where(uid: uid)
    end
  end
end
