# == Schema Information
#
# Table name: software_products
#
#  id               :bigint           not null, primary key
#  name             :string
#  status           :string
#  licence_number   :string
#  licence_exp_date :datetime
#  created_at       :datetime
#  updated_at       :datetime
#
require "test_helper"

class SoftwareProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
