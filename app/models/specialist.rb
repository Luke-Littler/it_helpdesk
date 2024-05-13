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
class Specialist < ApplicationRecord  
    enum specialist_type: [ :computer, :mobile, :network, :general ]
    enum specialist_sub_type: [ :software, :hardware, :services, :other ]
    has_and_belongs_to_many :problems, through: :problem_specialists
    has_many :poly_notes, as: :notable
end
