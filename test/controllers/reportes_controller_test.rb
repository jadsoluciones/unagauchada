require 'test_helper'

class ReportesControllerTest < ActionController::TestCase
  test "should get ingresos" do
    get :ingresos
    assert_response :success
  end

  test "should get gauchadas" do
    get :gauchadas
    assert_response :success
  end

end
