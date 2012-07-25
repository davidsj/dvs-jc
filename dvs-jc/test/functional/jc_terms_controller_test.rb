require 'test_helper'

class JcTermsControllerTest < ActionController::TestCase
  setup do
    @jc_term = jc_terms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jc_terms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jc_term" do
    assert_difference('JcTerm.count') do
      post :create, :jc_term => { :start_date => @jc_term.start_date }
    end

    assert_redirected_to jc_term_path(assigns(:jc_term))
  end

  test "should show jc_term" do
    get :show, :id => @jc_term
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @jc_term
    assert_response :success
  end

  test "should update jc_term" do
    put :update, :id => @jc_term, :jc_term => { :start_date => @jc_term.start_date }
    assert_redirected_to jc_term_path(assigns(:jc_term))
  end

  test "should destroy jc_term" do
    assert_difference('JcTerm.count', -1) do
      delete :destroy, :id => @jc_term
    end

    assert_redirected_to jc_terms_path
  end
end
