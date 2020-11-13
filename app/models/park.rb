class Park < ApplicationRecord
  belongs_to :state
  belongs_to :city

  enum status: { active:1,  inactive: 2 }
end
