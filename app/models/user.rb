class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  acts_as_token_authenticatable


  has_many :accounts, foreign_key: :owner_id

  has_many :contacts
end
