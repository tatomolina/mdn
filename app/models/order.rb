class Order < ApplicationRecord
  belongs_to :client

  has_many :articles, dependent: :destroy, inverse_of: :order
  accepts_nested_attributes_for :articles, allow_destroy: true,
   reject_if: :reject_posts

  def reject_posts(attributes)
    attributes['quantity'].blank? && attributes['width'].blank? && attributes['height'].blank?
  end

  def done?
    self.articles.select{|x| x.done == 1 }.count == self.articles.count
  end

  def delivered?
    self.articles.select{|x| x.delivered == 1 }.count == self.articles.count
  end

  def invoiced?
    self.articles.select{|x| x.invoiced == 1 }.count == self.articles.count
  end

end
