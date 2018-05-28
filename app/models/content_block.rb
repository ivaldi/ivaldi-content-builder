class ContentBlock < ApplicationRecord
  belongs_to :page
  belongs_to :blockable, polymorphic: true, dependent: :destroy

  accepts_nested_attributes_for :blockable, allow_destroy: true
  validates :blockable_type, presence: true

  scope :ordered, -> { order(:sequence) }

  def build_blockable(params)
    self.blockable = blockable_type.constantize.new(params)
  end

end