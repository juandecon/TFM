class Competency < ApplicationRecord
  belongs_to :competency_framework
  validates :nombre, presence: true
end
