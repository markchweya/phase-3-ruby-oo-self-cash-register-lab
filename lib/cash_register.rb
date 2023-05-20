
class CashRegister
  attr_accessor :discount, :total, :items, :items_total_prices

  def initialize(discount=0)
    @discount = discount
    @total = 0
    @items = []
    @items_total_prices =[]
  end

  def add_item name, price, quantity=1
    item_total = price.to_f * quantity
    self.total += item_total
    quantity.times {items << name}
    items_total_prices << item_total
  end

  def apply_discount
    if discount > 0
      discount_amount = total * (discount.to_f/100)
      self.total -= discount_amount
       "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= items_total_prices.pop

    self.total = 0.0 if items_total_prices.empty?

    return self.total
  end

end

new = CashRegister.new(5)
new.total = 15
new.add_item 'Milk',45, 1
new.add_item 'Sugar', 65,1
new.add_item 'Bread',60,2
new.apply_discount

puts new.void_last_transaction