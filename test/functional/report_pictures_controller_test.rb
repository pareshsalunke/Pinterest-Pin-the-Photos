require 'test_helper'

class ReportPicturesControllerTest < ActionController::TestCase
  setup do
    @report_picture = report_pictures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:report_pictures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create report_picture" do
    assert_difference('ReportPicture.count') do
      post :create, report_picture: { action_taken: @report_picture.action_taken, rep_description: @report_picture.rep_description }
    end

    assert_redirected_to report_picture_path(assigns(:report_picture))
  end

  test "should show report_picture" do
    get :show, id: @report_picture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @report_picture
    assert_response :success
  end

  test "should update report_picture" do
    put :update, id: @report_picture, report_picture: { action_taken: @report_picture.action_taken, rep_description: @report_picture.rep_description }
    assert_redirected_to report_picture_path(assigns(:report_picture))
  end

  test "should destroy report_picture" do
    assert_difference('ReportPicture.count', -1) do
      delete :destroy, id: @report_picture
    end

    assert_redirected_to report_pictures_path
  end
end
