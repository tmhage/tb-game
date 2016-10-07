class PagesController < ApplicationController
  def home
    @user = current_user
    @char = @user.characters.new
  end
end
