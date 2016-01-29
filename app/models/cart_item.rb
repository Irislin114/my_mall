class CartItem

  attr_reader :product_id, :quantity
  # def product_id
  #   @product_id
  # end
  #
  # def quantity
  #   @quantity
  # end

  def initialize(product_id, quantity = 1)
    @product_id = product_id
    @quantity = quantity
  end

# define method 'product_id'


  def increment
    @quantity = @quantity + 1
  end

  def product
    Product.find_by(id: @product_id)
  end

  def price
    product.price * @quantity   #call 'product' method which is above this method
  end

end



# CartItem.new(1, 100)
# CartItem.new(2)
