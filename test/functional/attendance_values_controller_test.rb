require 'test_helper'

class AttendanceValuesControllerTest < ActionController::TestCase
  setup do
    @attendance_value = attendance_values(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attendance_values)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attendance_value" do
    assert_difference('AttendanceValue.count') do
      @attendance_value.client = clients(:john)
      attendance_value_attr = @attendance_value.attributes
      attendance_value_attr[:client_attributes] = @attendance_value.client.attributes
      attendance_value_attr[:sheet_attributes] = @attendance_value.sheet.attributes
      attendance_value_attr[:sheet_attributes]["date(1i)"] = @attendance_value.sheet.date.year
      attendance_value_attr[:sheet_attributes]["date(2i)"] = @attendance_value.sheet.date.month
      attendance_value_attr[:sheet_attributes]["date(3i)"] = @attendance_value.sheet.date.day
      post :create, :attendance_value => attendance_value_attr
    end

    assert_redirected_to attendance_value_path(assigns(:attendance_value))
  end

  test "should show attendance_value" do
    get :show, :id => @attendance_value.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @attendance_value.to_param
    assert_response :success
  end

  test "should update attendance_value" do
    put :update, :id => @attendance_value.to_param, :attendance_value => @attendance_value.attributes
    assert_redirected_to attendance_value_path(assigns(:attendance_value))
  end

  test "should destroy attendance_value" do
    assert_difference('AttendanceValue.count', -1) do
      delete :destroy, :id => @attendance_value.to_param
    end

    assert_redirected_to attendance_values_path
  end
end
