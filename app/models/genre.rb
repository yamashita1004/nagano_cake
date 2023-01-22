class Genre < ApplicationRecord
  has_many :item, dependent: :destoroy
end
