# == Schema Information
#
# Table name: problems_specialists
#
#  id            :bigint           not null, primary key
#  problem_id    :bigint
#  specialist_id :bigint
#
class ProblemsSpecialists < ActiveRecord::Base
  belongs_to :problem
  belongs_to :specialist
end
