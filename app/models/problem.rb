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
class Problem < ApplicationRecord
    enum status: [ :unresolved, :resolved, :specialist_assigned ]
    enum problem_type: [ :computer, :mobile, :network, :general ]
    enum problem_sub_type: [ :software, :hardware, :services, :other ]
    belongs_to :user, optional: true
    belongs_to :operator, optional: true
    belongs_to :equipment, optional: true
    has_many :poly_notes, as: :notable
    has_and_belongs_to_many :specialist, through: :problem_specialists
end
