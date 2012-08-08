require 'test_helper'

class InternNotificationsControllerTest < ActionController::TestCase
  setup do
    @intern_notification = intern_notifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:intern_notifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create intern_notification" do
    assert_difference('InternNotification.count') do
      post :create, intern_notification: { date_intern: @intern_notification.date_intern, description: @intern_notification.description, who: @intern_notification.who }
    end

    assert_redirected_to intern_notification_path(assigns(:intern_notification))
  end

  test "should show intern_notification" do
    get :show, id: @intern_notification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @intern_notification
    assert_response :success
  end

  test "should update intern_notification" do
    put :update, id: @intern_notification, intern_notification: { date_intern: @intern_notification.date_intern, description: @intern_notification.description, who: @intern_notification.who }
    assert_redirected_to intern_notification_path(assigns(:intern_notification))
  end

  test "should destroy intern_notification" do
    assert_difference('InternNotification.count', -1) do
      delete :destroy, id: @intern_notification
    end

    assert_redirected_to intern_notifications_path
  end
end
