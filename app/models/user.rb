class User < ApplicationRecord

  attachment :profile_image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true,  length: { in: 2..20 }

  validates :introduction, length: {maximum: 50}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:name]

  has_many :books
end
