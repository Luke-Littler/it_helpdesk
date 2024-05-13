require "test_helper"

class Software_product_productsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @software_product = software_product_products(:one)
  end

  test "should get index" do
    get software_product_products_url
    assert_response :success
  end

  test "should get new" do
    get new_software_product_url
    assert_response :success
  end

  test "should create software_product" do
    assert_difference("Software_product.count") do
      post software_product_products_url, params: { software_product: { licence_exp_date: @software_product.licence_exp_date, licence_number: @software_product.licence_number, name: @software_product.name, status: @software_product.status } }
    end

    assert_redirected_to software_product_url(Software_product.last)
  end

  test "should show software_product" do
    get software_product_url(@software_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_software_product_url(@software_product)
    assert_response :success
  end

  test "should update software_product" do
    patch software_product_url(@software_product), params: { software_product: { licence_exp_date: @software_product.licence_exp_date, licence_number: @software_product.licence_number, name: @software_product.name, status: @software_product.status } }
    assert_redirected_to software_product_url(@software_product)
  end

  test "should destroy software_product" do
    assert_difference("Software_product.count", -1) do
      delete software_product_url(@software_product)
    end

    assert_redirected_to software_product_products_url
  end
end
