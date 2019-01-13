class Role < ApplicationRecord
    ##has_many :admin_user
    ##validates :name, presence: true
    ##def to_s
    ##    name
    ##end
    ADMIN = 'admin'
    GUEST = 'guest'
    EMPRESA = 'empresa'
end
