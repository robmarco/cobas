require 'test_helper'

class DossiersControllerTest < ActionController::TestCase
  setup do
    @dossier = dossiers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dossiers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dossier" do
    assert_difference('Dossier.count') do
      post :create, dossier: { description: @dossier.description, title: @dossier.title }
    end

    assert_redirected_to dossier_path(assigns(:dossier))
  end

  test "should show dossier" do
    get :show, id: @dossier
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dossier
    assert_response :success
  end

  test "should update dossier" do
    put :update, id: @dossier, dossier: { description: @dossier.description, title: @dossier.title }
    assert_redirected_to dossier_path(assigns(:dossier))
  end

  test "should destroy dossier" do
    assert_difference('Dossier.count', -1) do
      delete :destroy, id: @dossier
    end

    assert_redirected_to dossiers_path
  end
end
