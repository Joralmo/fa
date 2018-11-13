require 'test_helper'

class DependenciaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dependencium = dependencia(:one)
  end

  test "should get index" do
    get dependencia_url
    assert_response :success
  end

  test "should get new" do
    get new_dependencium_url
    assert_response :success
  end

  test "should create dependencium" do
    assert_difference('Dependencium.count') do
      post dependencia_url, params: { dependencium: { descripcion: @dependencium.descripcion } }
    end

    assert_redirected_to dependencium_url(Dependencium.last)
  end

  test "should show dependencium" do
    get dependencium_url(@dependencium)
    assert_response :success
  end

  test "should get edit" do
    get edit_dependencium_url(@dependencium)
    assert_response :success
  end

  test "should update dependencium" do
    patch dependencium_url(@dependencium), params: { dependencium: { descripcion: @dependencium.descripcion } }
    assert_redirected_to dependencium_url(@dependencium)
  end

  test "should destroy dependencium" do
    assert_difference('Dependencium.count', -1) do
      delete dependencium_url(@dependencium)
    end

    assert_redirected_to dependencia_url
  end
end
