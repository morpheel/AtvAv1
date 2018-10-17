require 'test_helper'

class FrequenciaalunosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @frequenciaaluno = frequenciaalunos(:one)
  end

  test "should get index" do
    get frequenciaalunos_url
    assert_response :success
  end

  test "should get new" do
    get new_frequenciaaluno_url
    assert_response :success
  end

  test "should create frequenciaaluno" do
    assert_difference('Frequenciaaluno.count') do
      post frequenciaalunos_url, params: { frequenciaaluno: { data: @frequenciaaluno.data, disciplina_id: @frequenciaaluno.disciplina_id } }
    end

    assert_redirected_to frequenciaaluno_url(Frequenciaaluno.last)
  end

  test "should show frequenciaaluno" do
    get frequenciaaluno_url(@frequenciaaluno)
    assert_response :success
  end

  test "should get edit" do
    get edit_frequenciaaluno_url(@frequenciaaluno)
    assert_response :success
  end

  test "should update frequenciaaluno" do
    patch frequenciaaluno_url(@frequenciaaluno), params: { frequenciaaluno: { data: @frequenciaaluno.data, disciplina_id: @frequenciaaluno.disciplina_id } }
    assert_redirected_to frequenciaaluno_url(@frequenciaaluno)
  end

  test "should destroy frequenciaaluno" do
    assert_difference('Frequenciaaluno.count', -1) do
      delete frequenciaaluno_url(@frequenciaaluno)
    end

    assert_redirected_to frequenciaalunos_url
  end
end
