class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 has_one_attached :profile_image
 has_many :books, dependent: :destroy

  validates :name, presence: true
  validates :name, length: {minimum: 2 }
  validates :name, length: {maximum: 20 }
  validates :name, uniqueness: {sccpe: :user }

  validates :introduction, length: {maximum: 50 },allow_blank:true
  # validates :profile_image, allow_blank, on: :update



def get_profile_image(width, height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/no_image.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  profile_image.variant(resize_to_limit: [width, height]).processed
end

end
