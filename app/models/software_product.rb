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
class SoftwareProduct < ApplicationRecord
    enum status: [ :active, :expired ]
    has_and_belongs_to_many :equipment, through: :equipment_software_products
    before_save :set_status

    def set_status
        if self.licence_exp_date < Time.now
            self.status = :expired
        else
            self.status = :active
        end
    end
end
