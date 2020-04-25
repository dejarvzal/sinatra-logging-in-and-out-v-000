class Helpers

  def self.current_user(session)
<<<<<<< HEAD
    @user = User.find_by_id(session[:user_id])
=======
    @user = User.find(session[:user_id])
>>>>>>> d78add487b67220da793137e62834deed310d1a3
  end

  def self.is_logged_in?(session)
    !!self.current_user(session)
  end

end
