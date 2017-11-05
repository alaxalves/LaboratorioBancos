require 'test_helper'

class PersonagemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personagem = personagems(:one)
  end

  test "should get index" do
    get personagems_url
    assert_response :success
  end

  test "should get new" do
    get new_personagem_url
    assert_response :success
  end

  test "should create personagem" do
    assert_difference('Personagem.count') do
      post personagems_url, params: { personagem: { cache_ator: @personagem.cache_ator, nome: @personagem.nome, nome_ator: @personagem.nome_ator, nome_filme: @personagem.nome_filme } }
    end

    assert_redirected_to personagem_url(Personagem.last)
  end

  test "should show personagem" do
    get personagem_url(@personagem)
    assert_response :success
  end

  test "should get edit" do
    get edit_personagem_url(@personagem)
    assert_response :success
  end

  test "should update personagem" do
    patch personagem_url(@personagem), params: { personagem: { cache_ator: @personagem.cache_ator, nome: @personagem.nome, nome_ator: @personagem.nome_ator, nome_filme: @personagem.nome_filme } }
    assert_redirected_to personagem_url(@personagem)
  end

  test "should destroy personagem" do
    assert_difference('Personagem.count', -1) do
      delete personagem_url(@personagem)
    end

    assert_redirected_to personagems_url
  end
end
