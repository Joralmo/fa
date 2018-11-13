require "application_system_test_case"

class TipodocumentosTest < ApplicationSystemTestCase
  setup do
    @tipodocumento = tipodocumentos(:one)
  end

  test "visiting the index" do
    visit tipodocumentos_url
    assert_selector "h1", text: "Tipodocumentos"
  end

  test "creating a Tipodocumento" do
    visit tipodocumentos_url
    click_on "New Tipodocumento"

    fill_in "Descripcion", with: @tipodocumento.descripcion
    click_on "Create Tipodocumento"

    assert_text "Tipodocumento was successfully created"
    click_on "Back"
  end

  test "updating a Tipodocumento" do
    visit tipodocumentos_url
    click_on "Edit", match: :first

    fill_in "Descripcion", with: @tipodocumento.descripcion
    click_on "Update Tipodocumento"

    assert_text "Tipodocumento was successfully updated"
    click_on "Back"
  end

  test "destroying a Tipodocumento" do
    visit tipodocumentos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tipodocumento was successfully destroyed"
  end
end
