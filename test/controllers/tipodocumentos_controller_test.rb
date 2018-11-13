require 'test_helper'

class TipodocumentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tipodocumento = tipodocumentos(:one)
  end

  test "should get index" do
    get tipodocumentos_url
    assert_response :success
  end

  test "should get new" do
    get new_tipodocumento_url
    assert_response :success
  end

  test "should create tipodocumento" do
    assert_difference('Tipodocumento.count') do
      post tipodocumentos_url, params: { tipodocumento: { descripcion: @tipodocumento.descripcion } }
    end

    assert_redirected_to tipodocumento_url(Tipodocumento.last)
  end

  test "should show tipodocumento" do
    get tipodocumento_url(@tipodocumento)
    assert_response :success
  end

  test "should get edit" do
    get edit_tipodocumento_url(@tipodocumento)
    assert_response :success
  end

  test "should update tipodocumento" do
    patch tipodocumento_url(@tipodocumento), params: { tipodocumento: { descripcion: @tipodocumento.descripcion } }
    assert_redirected_to tipodocumento_url(@tipodocumento)
  end

  test "should destroy tipodocumento" do
    assert_difference('Tipodocumento.count', -1) do
      delete tipodocumento_url(@tipodocumento)
    end

    assert_redirected_to tipodocumentos_url
  end
end
