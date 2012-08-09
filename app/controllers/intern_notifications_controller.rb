class InternNotificationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :admin_authorize!, :except => [:index, :download]

  # GET /intern_notifications
  # GET /intern_notifications.json
  def index
    @intern_notifications = InternNotification.all
    @intern_notification = InternNotification.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @intern_notifications }
    end
  end

  # GET /intern_notifications/1/edit
  def edit
    @intern_notification = InternNotification.find(params[:id])
  end

  # POST /intern_notifications
  # POST /intern_notifications.json
  def create
    @intern_notification = InternNotification.new(params[:intern_notification])

    respond_to do |format|
      if @intern_notification.save
        format.html { redirect_to intern_notifications_url, notice: 'Intern notification was successfully created.' }
        format.json { render json: @intern_notification, status: :created, location: @intern_notification }
      else
        format.html { render action: "new" }
        format.json { render json: @intern_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /intern_notifications/1
  # PUT /intern_notifications/1.json
  def update
    @intern_notification = InternNotification.find(params[:id])

    respond_to do |format|
      if @intern_notification.update_attributes(params[:intern_notification])
        format.html { redirect_to intern_notifications_url, notice: 'Intern notification was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @intern_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /intern_notifications/1
  # DELETE /intern_notifications/1.json
  def destroy
    @intern_notification = InternNotification.find(params[:id])
    @intern_notification.destroy

    respond_to do |format|
      format.html { redirect_to intern_notifications_url }
      format.json { head :no_content }
    end
  end

  def download
    @intern_notification = InternNotification.find(params[:id])
    redirect_to @intern_notification.intern_notification_file.expiring_url(10)
  end
end
