class CharactersController < ApplicationController

  def show
  end

  def new
  end

  def create
    @character = current_user.characters.new(character_params)

    respond_to do |format|
      if @character.save
        format.html  { redirect_to(@character,
                      :notice => 'Character was successfully created.') }
        format.json  { render :json => @character,
                      :status => :created, :location => @character }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @character.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def update
  end

  private

  def character_params
    params.require(:character).permit(:name, :gender)
  end

end
