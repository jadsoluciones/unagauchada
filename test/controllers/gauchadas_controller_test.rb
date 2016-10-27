require 'test_helper'

class GauchadasControllerTest < ActionController::TestCase
  setup do
    @gauchada = gauchadas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gauchadas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gauchada" do
    assert_difference('Gauchada.count') do
      post :create, gauchada: { ciudad: @gauchada.ciudad, descripcion: @gauchada.descripcion, imagen: @gauchada.imagen, titulo: @gauchada.titulo }
    end

    assert_redirected_to gauchada_path(assigns(:gauchada))
  end

  test "should show gauchada" do
    get :show, id: @gauchada
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gauchada
    assert_response :success
  end

  test "should update gauchada" do
    patch :update, id: @gauchada, gauchada: { ciudad: @gauchada.ciudad, descripcion: @gauchada.descripcion, imagen: @gauchada.imagen, titulo: @gauchada.titulo }
    assert_redirected_to gauchada_path(assigns(:gauchada))
  end

  test "should destroy gauchada" do
    assert_difference('Gauchada.count', -1) do
      delete :destroy, id: @gauchada
    end

    assert_redirected_to gauchadas_path
  end
end
