require 'test_helper'

class StuffsControllerTest < ActionController::TestCase
  setup do
    @stuff = stuffs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stuffs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stuff" do
    assert_difference('Stuff.count') do
      post :create, stuff: { borrowed: @stuff.borrowed, name: @stuff.name, user_id: @stuff.user_id }
    end

    assert_redirected_to stuff_path(assigns(:stuff))
  end

  test "should show stuff" do
    get :show, id: @stuff
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stuff
    assert_response :success
  end

  test "should update stuff" do
    patch :update, id: @stuff, stuff: { borrowed: @stuff.borrowed, name: @stuff.name, user_id: @stuff.user_id }
    assert_redirected_to stuff_path(assigns(:stuff))
  end

  test "should destroy stuff" do
    assert_difference('Stuff.count', -1) do
      delete :destroy, id: @stuff
    end

    assert_redirected_to stuffs_path
  end
end
