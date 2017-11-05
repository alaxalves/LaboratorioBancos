require 'test_helper'

class PapelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @papel = papels(:one)
  end

  test "should get index" do
    get papels_url
    assert_response :success
  end

  test "should get new" do
    get new_papel_url
    assert_response :success
  end

  test "should create papel" do
    assert_difference('Papel.count') do
      post papels_url, params: { papel: { descricao: @papel.descricao } }
    end

    assert_redirected_to papel_url(Papel.last)
  end

  test "should show papel" do
    get papel_url(@papel)
    assert_response :success
  end

  test "should get edit" do
    get edit_papel_url(@papel)
    assert_response :success
  end

  test "should update papel" do
    patch papel_url(@papel), params: { papel: { descricao: @papel.descricao } }
    assert_redirected_to papel_url(@papel)
  end

  test "should destroy papel" do
    assert_difference('Papel.count', -1) do
      delete papel_url(@papel)
    end

    assert_redirected_to papels_url
  end
end
