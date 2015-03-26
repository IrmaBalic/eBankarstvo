require 'test_helper'

class ReportedIncidentsControllerTest < ActionController::TestCase
  setup do
    @reported_incident = reported_incidents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reported_incidents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reported_incident" do
    assert_difference('ReportedIncident.count') do
      post :create, reported_incident: { category_id: @reported_incident.category_id, description: @reported_incident.description, name: @reported_incident.name }
    end

    assert_redirected_to reported_incident_path(assigns(:reported_incident))
  end

  test "should show reported_incident" do
    get :show, id: @reported_incident
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reported_incident
    assert_response :success
  end

  test "should update reported_incident" do
    patch :update, id: @reported_incident, reported_incident: { category_id: @reported_incident.category_id, description: @reported_incident.description, name: @reported_incident.name }
    assert_redirected_to reported_incident_path(assigns(:reported_incident))
  end

  test "should destroy reported_incident" do
    assert_difference('ReportedIncident.count', -1) do
      delete :destroy, id: @reported_incident
    end

    assert_redirected_to reported_incidents_path
  end
end
