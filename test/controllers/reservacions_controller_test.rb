require 'test_helper'

class ReservacionsControllerTest < ActionController::TestCase
  setup do
    @reservacion = reservacions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reservacions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reservacion" do
    assert_difference('Reservacion.count') do
      post :create, reservacion: { id_cliente: @reservacion.id_cliente, id_estado: @reservacion.id_estado, id_tour: @reservacion.id_tour, num_cupos_adulto: @reservacion.num_cupos_adulto, num_cupos_nino: @reservacion.num_cupos_nino }
    end

    assert_redirected_to reservacion_path(assigns(:reservacion))
  end

  test "should show reservacion" do
    get :show, id: @reservacion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reservacion
    assert_response :success
  end

  test "should update reservacion" do
    patch :update, id: @reservacion, reservacion: { id_cliente: @reservacion.id_cliente, id_estado: @reservacion.id_estado, id_tour: @reservacion.id_tour, num_cupos_adulto: @reservacion.num_cupos_adulto, num_cupos_nino: @reservacion.num_cupos_nino }
    assert_redirected_to reservacion_path(assigns(:reservacion))
  end

  test "should destroy reservacion" do
    assert_difference('Reservacion.count', -1) do
      delete :destroy, id: @reservacion
    end

    assert_redirected_to reservacions_path
  end
end
