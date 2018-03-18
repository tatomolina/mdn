class Order < ApplicationRecord
  belongs_to :client

  has_many :articles, dependent: :destroy, inverse_of: :order
  accepts_nested_attributes_for :articles, allow_destroy: true,
   reject_if: :reject_posts

  def reject_posts(attributes)
    attributes['quantity'].blank? && attributes['width'].blank? && attributes['height'].blank?
  end

  def done?
    self.articles.inject(true){|sum,x| sum && x.done }
  end

  def delivered?
    self.articles.inject(true){|sum,x| sum && x.delivered }
  end

  def invoiced?
    self.articles.inject(true){|sum,x| sum && x.invoiced }
  end

end
