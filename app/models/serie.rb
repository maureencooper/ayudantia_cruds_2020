class Serie < ApplicationRecord

    validates :nombre, presence:true
    validates :puntuacion, presence:true, length: { in: 1..10 }, numericality: { only_integer: true }, inclusion: { in: 1..10}
end
