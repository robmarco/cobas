class FilesController < ApplicationController
  def index
  	@registers = Register.all	
  	@avatars = Avatar.all
  end
end
