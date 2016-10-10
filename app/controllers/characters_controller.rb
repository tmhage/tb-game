class CharactersController < ApplicationController

  def show
    @character = Character.all.find(params[:id])
  end

  def new
    @character = Character.new
  end

  def edit
    @character = current_user.active_character
  end

  def create
    @character = current_user.characters.new(character_params)

    respond_to do |format|
      if @character.save
        format.html  { redirect_to(@character,
                      :notice => 'Character was successfully created. Good luck!') }
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
    @character = current_user.active_character

    respond_to do |format|
      if @character.update_attributes(params[:post])
        format.html  { redirect_to(@character,
                      :notice => 'Character was successfully updated.') }
        format.json  { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @character.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  private

  def character_params
    params.require(:character).permit(:name, :gender,:image,:online)
  end

end
