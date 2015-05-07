require 'test_helper'

class CTypesControllerTest < ActionController::TestCase
  setup do
    @c_type = c_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:c_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create c_type" do
    assert_difference('CType.count') do
      post :create, c_type: { name: @c_type.name }
    end

    assert_redirected_to c_type_path(assigns(:c_type))
  end

  test "should show c_type" do
    get :show, id: @c_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @c_type
    assert_response :success
  end

  test "should update c_type" do
    patch :update, id: @c_type, c_type: { name: @c_type.name }
    assert_redirected_to c_type_path(assigns(:c_type))
  end

  test "should destroy c_type" do
    assert_difference('CType.count', -1) do
      delete :destroy, id: @c_type
    end

    assert_redirected_to c_types_path
  end
end
