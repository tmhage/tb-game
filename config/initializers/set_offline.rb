Warden::Manager.before_logout do |user, auth, opts|
  if user.active_character
    user.active_character.toggle!(:online)
  end
end
