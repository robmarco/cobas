class FilesController < ApplicationController
  def index
  	@registers = Register.all	
  	@responds = Respond.all

  	@assets = Asset.all 		
  	@avatars = Avatar.all

  	@files = @assets.size + @avatars.size
  end
end
