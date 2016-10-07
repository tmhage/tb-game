Warden::Manager.after_set_user except: :fetch do |user, auth, opts|
  char = user.active_character
  char.update(online:true)
end
