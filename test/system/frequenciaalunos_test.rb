require "application_system_test_case"

class FrequenciaalunosTest < ApplicationSystemTestCase
  setup do
    @frequenciaaluno = frequenciaalunos(:one)
  end

  test "visiting the index" do
    visit frequenciaalunos_url
    assert_selector "h1", text: "Frequenciaalunos"
  end

  test "creating a Frequenciaaluno" do
    visit frequenciaalunos_url
    click_on "New Frequenciaaluno"

    fill_in "Data", with: @frequenciaaluno.data
    fill_in "Disciplina", with: @frequenciaaluno.disciplina_id
    click_on "Create Frequenciaaluno"

    assert_text "Frequenciaaluno was successfully created"
    click_on "Back"
  end

  test "updating a Frequenciaaluno" do
    visit frequenciaalunos_url
    click_on "Edit", match: :first

    fill_in "Data", with: @frequenciaaluno.data
    fill_in "Disciplina", with: @frequenciaaluno.disciplina_id
    click_on "Update Frequenciaaluno"

    assert_text "Frequenciaaluno was successfully updated"
    click_on "Back"
  end

  test "destroying a Frequenciaaluno" do
    visit frequenciaalunos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Frequenciaaluno was successfully destroyed"
  end
end
