require 'test_helper'

class MatTurmasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mat_turma = mat_turmas(:one)
  end

  test "should get index" do
    get mat_turmas_url
    assert_response :success
  end

  test "should get new" do
    get new_mat_turma_url
    assert_response :success
  end

  test "should create mat_turma" do
    assert_difference('MatTurma.count') do
      post mat_turmas_url, params: { mat_turma: { aluno_id: @mat_turma.aluno_id, turma_id: @mat_turma.turma_id } }
    end

    assert_redirected_to mat_turma_url(MatTurma.last)
  end

  test "should show mat_turma" do
    get mat_turma_url(@mat_turma)
    assert_response :success
  end

  test "should get edit" do
    get edit_mat_turma_url(@mat_turma)
    assert_response :success
  end

  test "should update mat_turma" do
    patch mat_turma_url(@mat_turma), params: { mat_turma: { aluno_id: @mat_turma.aluno_id, turma_id: @mat_turma.turma_id } }
    assert_redirected_to mat_turma_url(@mat_turma)
  end

  test "should destroy mat_turma" do
    assert_difference('MatTurma.count', -1) do
      delete mat_turma_url(@mat_turma)
    end

    assert_redirected_to mat_turmas_url
  end
end
