class PagesController < ApplicationController
  before_filter :authenticate_user!

  def home
    @user = current_user
  end

  def pretty_crime
  end

end
