require 'test_helper'

class PostulacionsControllerTest < ActionController::TestCase
  setup do
    @postulacion = postulacions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:postulacions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create postulacion" do
    assert_difference('Postulacion.count') do
      post :create, postulacion: { descripcion: @postulacion.descripcion, estado: @postulacion.estado, fecha: @postulacion.fecha }
    end

    assert_redirected_to postulacion_path(assigns(:postulacion))
  end

  test "should show postulacion" do
    get :show, id: @postulacion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @postulacion
    assert_response :success
  end

  test "should update postulacion" do
    patch :update, id: @postulacion, postulacion: { descripcion: @postulacion.descripcion, estado: @postulacion.estado, fecha: @postulacion.fecha }
    assert_redirected_to postulacion_path(assigns(:postulacion))
  end

  test "should destroy postulacion" do
    assert_difference('Postulacion.count', -1) do
      delete :destroy, id: @postulacion
    end

    assert_redirected_to postulacions_path
  end
end
