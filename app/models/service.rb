class Service < ApplicationRecord
	validates :numer, presence: true, uniqueness: true
	validates :numer, format: { with: /\A[S]\d{3}[\/]\d{4}\z/, message: "szablon: S{3-cyfry}/{rok}"}
	validates :klient, presence: true
	validates :opis, presence: true
	validates :data_zgloszenia, presence: true
end
