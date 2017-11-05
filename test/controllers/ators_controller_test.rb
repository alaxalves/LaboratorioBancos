require 'test_helper'

class AtorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ator = ators(:one)
  end

  test "should get index" do
    get ators_url
    assert_response :success
  end

  test "should get new" do
    get new_ator_url
    assert_response :success
  end

  test "should create ator" do
    assert_difference('Ator.count') do
      post ators_url, params: { ator: { idade: @ator.idade, nacionalidade: @ator.nacionalidade, nome: @ator.nome, nome_artistico: @ator.nome_artistico, seguro_social: @ator.seguro_social } }
    end

    assert_redirected_to ator_url(Ator.last)
  end

  test "should show ator" do
    get ator_url(@ator)
    assert_response :success
  end

  test "should get edit" do
    get edit_ator_url(@ator)
    assert_response :success
  end

  test "should update ator" do
    patch ator_url(@ator), params: { ator: { idade: @ator.idade, nacionalidade: @ator.nacionalidade, nome: @ator.nome, nome_artistico: @ator.nome_artistico, seguro_social: @ator.seguro_social } }
    assert_redirected_to ator_url(@ator)
  end

  test "should destroy ator" do
    assert_difference('Ator.count', -1) do
      delete ator_url(@ator)
    end

    assert_redirected_to ators_url
  end
end
