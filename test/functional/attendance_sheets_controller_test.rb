require 'test_helper'

class AttendanceSheetsControllerTest < ActionController::TestCase
  setup do
    @attendance_sheet = attendance_sheets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attendance_sheets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attendance_sheet" do
    assert_difference('AttendanceSheet.count') do
      post :create, :attendance_sheet => @attendance_sheet.attributes
    end

    assert_redirected_to attendance_sheet_path(assigns(:attendance_sheet))
  end

  test "should show attendance_sheet" do
    get :show, :id => @attendance_sheet.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @attendance_sheet.to_param
    assert_response :success
  end

  test "should update attendance_sheet" do
    put :update, :id => @attendance_sheet.to_param, :attendance_sheet => @attendance_sheet.attributes
    assert_redirected_to attendance_sheet_path(assigns(:attendance_sheet))
  end

  test "should destroy attendance_sheet" do
    assert_difference('AttendanceSheet.count', -1) do
      delete :destroy, :id => @attendance_sheet.to_param
    end

    assert_redirected_to attendance_sheets_path
  end
end
