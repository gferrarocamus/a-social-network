# frozen_string_literal: true

# Post Model
class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  mount_uploader :picture, PictureUploader

  validates :content, presence: true
  validate :picture_size

  scope :date_sorted, -> { order(created_at: :desc) }

  scope :with_associations,
        lambda {
          includes(
            :user,
            :likes,
            comments: [:user]
          )
        }
  
  private

  def picture_size
    if picture.size > 1.megabytes
      errors.add(:picture, "should be less than 1MB")
    end
  end
end
