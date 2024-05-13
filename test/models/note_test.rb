# == Schema Information
#
# Table name: notes
#
#  id          :bigint           not null, primary key
#  description :text
#  comment     :text
#  created_at  :datetime
#  updated_at  :datetime
#  problem_id  :bigint
#
require "test_helper"

class NoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
