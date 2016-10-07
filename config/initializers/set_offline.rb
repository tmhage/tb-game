Warden::Manager.before_logout do |user, auth, opts|
  char = user.active_character
  char.update(online:false)
end
