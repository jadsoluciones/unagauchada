require 'test_helper'

class LogrosControllerTest < ActionController::TestCase
  setup do
    @logro = logros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:logros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create logro" do
    assert_difference('Logro.count') do

      post :create, logro: { rango: @logro.rango, titulo: @logro.titulo }

    end

    assert_redirected_to logro_path(assigns(:logro))
  end

  test "should show logro" do
    get :show, id: @logro
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @logro
    assert_response :success
  end

  test "should update logro" do

    patch :update, id: @logro, logro: { rango: @logro.rango, titulo: @logro.titulo }

    assert_redirected_to logro_path(assigns(:logro))
  end

  test "should destroy logro" do
    assert_difference('Logro.count', -1) do
      delete :destroy, id: @logro
    end

    assert_redirected_to logros_path
  end
end
