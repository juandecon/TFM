class Empresa < ApplicationRecord
    has_many :admin_user
    validates :razonsocial, presence: true
    def to_s
        razonsocial
    end
end
