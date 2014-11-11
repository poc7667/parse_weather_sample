require 'test_helper'

class WeatherLogsControllerTest < ActionController::TestCase
  setup do
    @weather_log = weather_logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weather_logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create weather_log" do
    assert_difference('WeatherLog.count') do
      post :create, weather_log: { air_temperature: @weather_log.air_temperature, datatime: @weather_log.datatime, latitude: @weather_log.latitude, longitude: @weather_log.longitude }
    end

    assert_redirected_to weather_log_path(assigns(:weather_log))
  end

  test "should show weather_log" do
    get :show, id: @weather_log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @weather_log
    assert_response :success
  end

  test "should update weather_log" do
    patch :update, id: @weather_log, weather_log: { air_temperature: @weather_log.air_temperature, datatime: @weather_log.datatime, latitude: @weather_log.latitude, longitude: @weather_log.longitude }
    assert_redirected_to weather_log_path(assigns(:weather_log))
  end

  test "should destroy weather_log" do
    assert_difference('WeatherLog.count', -1) do
      delete :destroy, id: @weather_log
    end

    assert_redirected_to weather_logs_path
  end
end
