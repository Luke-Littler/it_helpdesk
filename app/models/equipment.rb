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
class Equipment < ApplicationRecord
    has_many :problems
    has_and_belongs_to_many :software_products, through: :equipment_software_products
end
