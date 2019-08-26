class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

    has_many :scores
    has_many :calenders
    has_many :microposts, dependent: :destroy
include Gravtastic
 gravtastic
end
