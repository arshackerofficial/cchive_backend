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
      client = request.params[:client]
      token = request.params[:'access-token']

      user = User.find_by(uid: uid)
      if user && user.valid_token?(token, client)
        user
      else
        reject_unauthorized_connection
      end
    end
  end
end
