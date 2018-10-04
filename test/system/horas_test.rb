require "application_system_test_case"

class HorasTest < ApplicationSystemTestCase
  setup do
    @hora = horas(:one)
  end

  test "visiting the index" do
    visit horas_url
    assert_selector "h1", text: "Horas"
  end

  test "creating a Hora" do
    visit horas_url
    click_on "New Hora"

    fill_in "Fim", with: @hora.fim
    fill_in "Inicio", with: @hora.inicio
    click_on "Create Hora"

    assert_text "Hora was successfully created"
    click_on "Back"
  end

  test "updating a Hora" do
    visit horas_url
    click_on "Edit", match: :first

    fill_in "Fim", with: @hora.fim
    fill_in "Inicio", with: @hora.inicio
    click_on "Update Hora"

    assert_text "Hora was successfully updated"
    click_on "Back"
  end

  test "destroying a Hora" do
    visit horas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hora was successfully destroyed"
  end
end
