class Usuario < ApplicationRecord
  belongs_to :rol
  belongs_to :dependencium
  belongs_to :tipodocumento
  has_secure_password
  validates :email, presence: true, uniqueness: true
end
