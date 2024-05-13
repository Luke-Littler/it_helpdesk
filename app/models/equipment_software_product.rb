# == Schema Information
#
# Table name: equipment_software_products
#
#  id                  :bigint           not null, primary key
#  equipment_id        :bigint
#  software_product_id :bigint
#
class EquipmentSoftwareProduct < ApplicationRecord
  belongs_to :equipment
  belongs_to :software_product
end
