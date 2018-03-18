class Article < ApplicationRecord
  belongs_to :order, optional: true
end
