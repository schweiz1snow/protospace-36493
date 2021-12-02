class Prototype < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  # imageは決まっているファイル名、「prototype.image」で添付されたファイルにアクセスできる。
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true

  has_many :comments, dependent: :destroy

end
