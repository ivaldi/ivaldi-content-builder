class TitleBlock < ApplicationRecord
  has_one :content_block, as: :blockable
end
