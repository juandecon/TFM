class Perfil < ApplicationRecord
    has_many :admin_user
    validates :nombre, presence: true
    def to_s
        nombre
    end
end
