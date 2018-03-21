class Area < ApplicationRecord
  has_many :orders

  def not_delivered
    self.orders.select{|x| x.delivered? == false}
  end
end
