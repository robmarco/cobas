class RespondsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_authorize!, :except => [:index]
  
  def index
    @responds = Respond.all  
    @registers = Register.all.size
    @files = Avatar.all.size + Asset.all.size
  end

  # GET /responds/1/edit
  def edit
    @register = Register.find(params[:register_id])
    @respond = Respond.find(params[:id])

    @respond.assets.build
  end

  # POST /responds
  # POST /responds.json
  def create
    @register = Register.find(params[:register_id])
    @respond = @register.responds.new(params[:respond])

    respond_to do |format|
      if @respond.save
        format.html { redirect_to @register, notice: 'Respuesta creada correctamente.' }
        format.json { render json: @register, status: :created, location: @register }
      else
        format.html { redirect_to @register }
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /responds/1
  # PUT /responds/1.json
  def update
    @register = Register.find(params[:register_id])
    @respond = Respond.find(params[:id])

    respond_to do |format|
      if @respond.update_attributes(params[:respond])
        format.html { redirect_to @register, notice: 'Respuesta modificada correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @respond.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responds/1
  # DELETE /responds/1.json
  def destroy
    @register = Register.find(params[:register_id])
    @respond = Respond.find(params[:id])
    @respond.destroy

    respond_to do |format|
      format.html { redirect_to register_url(@register), notice: 'Respuesta eliminada correctamente.' }
      format.json { head :no_content }
    end
  end
end
