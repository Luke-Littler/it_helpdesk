# == Schema Information
#
# Table name: specialists
#
#  id                  :bigint           not null, primary key
#  name                :string
#  phone               :string
#  email               :string
#  specialist_type     :string
#  specialist_sub_type :string
#  created_at          :datetime
#  updated_at          :datetime
#
require "test_helper"

class SpecialistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
