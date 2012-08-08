class RegistersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_authorize!, :except => [:index]

  def index
    @registers = Register.all
  end

  # GET /registers/new
  # GET /registers/new.json
  def new
    @dossier = Dossier.find(params[:dossier_id])    
    @register = @dossier.registers.new

    2.times { @register.avatars.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @register }
    end
  end

  # GET /registers/1/edit
  def edit
    @dossier = Dossier.find(params[:dossier_id])
    @register = @dossier.registers.find(params[:id])

    2.times { @register.avatars.build }
  end

  # POST /registers
  # POST /registers.json
  def create
    @dossier = Dossier.find(params[:dossier_id])
    @register = @dossier.registers.new(params[:register])

    respond_to do |format|
      if @register.save
        format.html { redirect_to @dossier, notice: 'Escrito creado correctamente.' }
        format.json { render json: @dossier, status: :created, location: @dossier }
      else
        format.html { render action: "new"}
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /registers/1
  # PUT /registers/1.json
  def update
    @dossier = Dossier.find(params[:dossier_id]) 
    @register = @dossier.registers.find(params[:id])

    respond_to do |format|
      if @register.update_attributes(params[:register])
        format.html { redirect_to @dossier, notice: 'Escrito modificado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registers/1
  # DELETE /registers/1.json
  def destroy
    @dossier = Dossier.find(params[:dossier_id])
    @register = Register.find(params[:id])
    @register.destroy

    respond_to do |format|
      format.html { redirect_to @dossier }
      format.json { head :no_content }
    end
  end
end
