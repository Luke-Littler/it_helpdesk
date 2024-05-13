# == Schema Information
#
# Table name: problems
#
#  id               :bigint           not null, primary key
#  problem_type     :string
#  problem_sub_type :string
#  status           :string
#  created_at       :datetime
#  updated_at       :datetime
#  operator_id      :bigint
#  user_id          :bigint
#  equipment_id     :bigint
#
require "test_helper"

class ProblemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
