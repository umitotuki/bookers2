class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

validates :name, presence: true, length: { minimum: 2 }
validates :name, length: { maximum: 20 }
validates :introduction, length: { maximum: 50 }
validates_uniqueness_of :name

has_many :books, dependent: :destroy

 has_one_attached :profile_image
 
  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/Image/noimage.png')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

end
