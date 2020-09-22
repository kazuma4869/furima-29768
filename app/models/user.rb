class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, uniqueness: true
  validates :email, exclusion: { in: %w(＠)}
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum:6}
  validates :password, confirmation: true
  validates :password, format: /\A[A-Za-z0-9]+\z/
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :birth_date, presence: true

end
