# coding: utf-8
class NotificationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_authorize!, :except => [:index]

  # GET /notifications
  # GET /notifications.json
  def index
    @notifications = Notification.all
    @notification = Notification.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @notifications }
    end
  end

  # GET /notifications/1/edit
  def edit
    @notification = Notification.find(params[:id])
  end

  # POST /notifications
  # POST /notifications.json
  def create
    @notification = Notification.new(params[:notification])

    respond_to do |format|
      if @notification.save
        format.html { redirect_to notifications_url, notice: 'Notificación creada correctamente.' }
      else
        format.html { render action: "index" }
      end
    end
  end

  # PUT /notifications/1
  # PUT /notifications/1.json
  def update
    @notification = Notification.find(params[:id])

    respond_to do |format|
      if @notification.update_attributes(params[:notification])
        format.html { redirect_to notifications_url, notice: 'Notificación modificada correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notifications/1
  # DELETE /notifications/1.json
  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy

    respond_to do |format|
      format.html { redirect_to notifications_url, :notice => "Notificación eliminada correctamente." }
      format.json { head :no_content }
    end
  end
end
