Warden::Manager.after_set_user except: :fetch do |user, auth, opts|
  if user.active_character
    user.active_character.toggle!(:online)
  end
end
