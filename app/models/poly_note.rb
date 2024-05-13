class PolyNote < ApplicationRecord
  belongs_to :notable, polymorphic: true
  belongs_to :user, optional: true
  belongs_to :operator, optional: true
  belongs_to :specialist, optional: true
end
