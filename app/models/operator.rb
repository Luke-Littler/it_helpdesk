# == Schema Information
#
# Table name: operators
#
#  id         :bigint           not null, primary key
#  name       :string
#  phone      :string
#  email      :string
#  created_at :datetime
#  updated_at :datetime
#
class Operator < ApplicationRecord
    has_many :problems
    has_many :poly_notes, as: :notable
    validates :name, length: { maximum: 255 }
end
