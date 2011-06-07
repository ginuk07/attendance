require 'test_helper'

class AssignmentsControllerTest < ActionController::TestCase
  setup do
    @assignment = assignments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assignments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create assignment" do
    assert_difference('Assignment.count') do
      @assignment.client = clients(:john)
      assignment_attr = @assignment.attributes
      assignment_attr[:client_attributes] = @assignment.client.attributes
      assignment_attr[:sheet_attributes] = @assignment.sheet.attributes
      assignment_attr[:sheet_attributes]["date(1i)"] = @assignment.sheet.date.year
      assignment_attr[:sheet_attributes]["date(2i)"] = @assignment.sheet.date.month
      assignment_attr[:sheet_attributes]["date(3i)"] = @assignment.sheet.date.day
      post :create, :assignment => assignment_attr
    end

    assert_redirected_to assignment_path(assigns(:assignment))
  end

  test "should show assignment" do
    get :show, :id => @assignment.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @assignment.to_param
    assert_response :success
  end

  test "should update assignment" do
    put :update, :id => @assignment.to_param, :assignment => @assignment.attributes
    assert_redirected_to assignment_path(assigns(:assignment))
  end

  test "should destroy assignment" do
    assert_difference('Assignment.count', -1) do
      delete :destroy, :id => @assignment.to_param
    end

    assert_redirected_to assignments_path
  end
end
