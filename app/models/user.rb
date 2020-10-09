class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :pres


  validates :nickname, presence: true
  validates :email, uniqueness: true
  validates :email, exclusion: { in: %w(＠)}
  validates :first_name, presence: true
  validates :first_name, format: /\A[ぁ-んァ-ン一-龥]+\z/
  validates :last_name, presence: true
  validates :last_name, format: /\A[ぁ-んァ-ン一-龥]+\z/
  validates :password, length: { minimum:6}
  validates :password, confirmation: true
  validates :password, format: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}$+\z/
  validates :first_name_kana, presence: true
  validates :first_name_kana, format: /\A([ァ-ン]|ー)+$+\z/
  validates :last_name_kana, presence: true
  validates :last_name_kana, format: /\A([ァ-ン]|ー)+$+\z/
  validates :birth_date, presence: true

end