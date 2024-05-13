# == Schema Information
#
# Table name: equipment
#
#  id            :bigint           not null, primary key
#  serial_number :string
#  make          :string
#  model         :string
#  created_at    :datetime
#  updated_at    :datetime
#
require "test_helper"

class EquipmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
