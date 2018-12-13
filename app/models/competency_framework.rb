class CompetencyFramework < ApplicationRecord
    has_many :competency
    validates :nombre, presence: true
    def to_s
        nombre
    end
end
