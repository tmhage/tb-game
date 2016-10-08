Warden::Manager.after_set_user except: :fetch do |user, auth, opts|
  if user.active_character then user.active_character.update(online:true) end
end
