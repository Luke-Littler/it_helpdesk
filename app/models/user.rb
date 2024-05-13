# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  phone      :string
#  email      :string
#  job_title  :string
#  department :string
#  created_at :datetime
#  updated_at :datetime
#
class User < ApplicationRecord
    has_many :problems
    has_many :poly_notes, as: :notable
    has_and_belongs_to_many :poly_notes, through: :poly_notes_creators
end
