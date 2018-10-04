require "application_system_test_case"

class MatTurmasTest < ApplicationSystemTestCase
  setup do
    @mat_turma = mat_turmas(:one)
  end

  test "visiting the index" do
    visit mat_turmas_url
    assert_selector "h1", text: "Mat Turmas"
  end

  test "creating a Mat turma" do
    visit mat_turmas_url
    click_on "New Mat Turma"

    fill_in "Aluno", with: @mat_turma.aluno_id
    fill_in "Turma", with: @mat_turma.turma_id
    click_on "Create Mat turma"

    assert_text "Mat turma was successfully created"
    click_on "Back"
  end

  test "updating a Mat turma" do
    visit mat_turmas_url
    click_on "Edit", match: :first

    fill_in "Aluno", with: @mat_turma.aluno_id
    fill_in "Turma", with: @mat_turma.turma_id
    click_on "Update Mat turma"

    assert_text "Mat turma was successfully updated"
    click_on "Back"
  end

  test "destroying a Mat turma" do
    visit mat_turmas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mat turma was successfully destroyed"
  end
end
