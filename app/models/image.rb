class Image < ApplicationRecord
  belongs_to :picture, polymorphic: true
end
