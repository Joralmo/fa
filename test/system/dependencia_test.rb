require "application_system_test_case"

class DependenciaTest < ApplicationSystemTestCase
  setup do
    @dependencium = dependencia(:one)
  end

  test "visiting the index" do
    visit dependencia_url
    assert_selector "h1", text: "Dependencia"
  end

  test "creating a Dependencium" do
    visit dependencia_url
    click_on "New Dependencium"

    fill_in "Descripcion", with: @dependencium.descripcion
    click_on "Create Dependencium"

    assert_text "Dependencium was successfully created"
    click_on "Back"
  end

  test "updating a Dependencium" do
    visit dependencia_url
    click_on "Edit", match: :first

    fill_in "Descripcion", with: @dependencium.descripcion
    click_on "Update Dependencium"

    assert_text "Dependencium was successfully updated"
    click_on "Back"
  end

  test "destroying a Dependencium" do
    visit dependencia_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dependencium was successfully destroyed"
  end
end
