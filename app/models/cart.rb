class Cart

  attr_reader :items
  # def items
  #   @items
  # end

  def initialize(items = [])
    @items = items
  end

  def add_item(id)

    # find item
    item = @items.find { |item| item.product_id == id}
    # if item exists, + quantity
    if item
      item.increment
    else
      # else push a new item
      @items << CartItem.new(id)
    end

    # @items << product_id
  end

  def empty?
    @items.empty?
  end

  def serialize
    # items = []
    # @items.each do |item|
    #   items << {product_id: item.product_id, quantity: item.quantity}
    # end
    items = @items.map {
      {product_id: item.product_id, quantity: item.quantity}
    }

    {
      cart: { items: items }
    }

  end

  def self.build_from_hash(hash)  #class method
    # result_hash = {
    #   cart: {
    #     items: [
    #       {product_id: 2, quantity: 3},
    #       {product_id: 5, quabtity: 4}
    #     ]
    #   }
    # }

    if hash.nil?
      items = []
    else
      # hash[:cart][:items].each do |item_hash|
      #   items << CartItem.new(item_hash[:product_id], item_hash[:quantity])
      # end
      items = hash[:cart][:items].map {
        |item_hash|
          items << CartItem.new(item_hash[:product_id], item_hash[:quantity])
      }
    end

    new items
    # Cart.new(items)
  end

  def total_price
    # s = 0
    # @items.each do |item|
    #   s = s + item.price
    # end
    # s

    total = @itmes.inject(0){|s, item| s + item.price}

    #Use Strategy Pattern
    total = total * 0.9 if xmas?
    total
  end

  private
  def xmas?
    Time.now.month == 12 and Time.now.day == 25
  end
end
