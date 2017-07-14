class Page < ApplicationRecord
  has_many :content_blocks, dependent: :destroy
  accepts_nested_attributes_for :content_blocks, reject_if: :all_blank,
      allow_destroy: true

  validates :title, presence: true

  scope :ordered, -> { order(:title) }
end