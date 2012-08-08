class DossiersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_authorize!, :except => [:index, :show]

  # GET /dossiers
  # GET /dossiers.json
  def index
    @dossiers = Dossier.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dossiers }
    end
  end

  # GET /dossiers/1
  # GET /dossiers/1.json
  def show
    @dossier = Dossier.find(params[:id])
    @registers = @dossier.registers.order("date_register DESC")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dossier }
    end
  end

  # GET /dossiers/new
  # GET /dossiers/new.json
  def new
    @dossier = Dossier.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dossier }
    end
  end

  # GET /dossiers/1/edit
  def edit
    @dossier = Dossier.find(params[:id])
  end

  # POST /dossiers
  # POST /dossiers.json
  def create
    @dossier = Dossier.new(params[:dossier])

    respond_to do |format|
      if @dossier.save
        format.html { redirect_to @dossier, notice: 'Dossier was successfully created.' }
        format.json { render json: @dossier, status: :created, location: @dossier }
      else
        format.html { render action: "new" }
        format.json { render json: @dossier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dossiers/1
  # PUT /dossiers/1.json
  def update
    @dossier = Dossier.find(params[:id])

    respond_to do |format|
      if @dossier.update_attributes(params[:dossier])
        format.html { redirect_to @dossier, notice: 'Dossier was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dossier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dossiers/1
  # DELETE /dossiers/1.json
  def destroy
    @dossier = Dossier.find(params[:id])
    @dossier.destroy

    respond_to do |format|
      format.html { redirect_to dossiers_url }
      format.json { head :no_content }
    end
  end
end
