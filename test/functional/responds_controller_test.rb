require 'test_helper'

class RespondsControllerTest < ActionController::TestCase
  setup do
    @respond = responds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:responds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create respond" do
    assert_difference('Respond.count') do
      post :create, respond: { date_respond: @respond.date_respond, description: @respond.description, number_quit: @respond.number_quit, register_id: @respond.register_id }
    end

    assert_redirected_to respond_path(assigns(:respond))
  end

  test "should show respond" do
    get :show, id: @respond
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @respond
    assert_response :success
  end

  test "should update respond" do
    put :update, id: @respond, respond: { date_respond: @respond.date_respond, description: @respond.description, number_quit: @respond.number_quit, register_id: @respond.register_id }
    assert_redirected_to respond_path(assigns(:respond))
  end

  test "should destroy respond" do
    assert_difference('Respond.count', -1) do
      delete :destroy, id: @respond
    end

    assert_redirected_to responds_path
  end
end
