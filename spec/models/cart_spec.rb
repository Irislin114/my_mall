require 'rails_helper'

RSpec.describe Cart, type: :model do

  let(:cart) { Cart.new }

  describe "add or get item from cart" do

    # Add a item to cart, then the cart won't be empty.
    context "1 item" do
      it "Add a item to cart, then the cart won't be empty." do
        # cart = Cart.new
        expect(cart).to be_empty

        cart.add_item(1)
        expect(cart).not_to be_empty
      end
    end

    # Add more same items to cart, but the item count won't change.
    context "more same item" do
      it "Add more same items to cart, but the item count won't change." do
        # cart = Cart.new

        3.times { cart.add_item(1) }
        5.times { cart.add_item(2) }

        expect(cart.items.length).to be 2
        expect(cart.items.first.quantity).to be 3
      end
    end

    # After the item added to cart, you can get the item 	back from the cart. 
    context "get item from cart" do
      it "After the item added to cart, you can get the item back from the cart. " do
        # cart = Cart.new
        p1 = create(:ruby_book)
        p2 = create(:php_book)

        4.times {cart.add_item(p1.id)}
        2.times {cart.add_item(p2.id)}
        2.times {cart.add_item(p1.id)}

        expect(cart.items.first.product_id).to be p1.id
        expect(cart.items.second.product_id).to be p2.id

        expect(cart.items.first.product).to be_a Product
      end
    end

  end


  describe "cart serialize" do

    context "cart to hash" do
      it "Can serialize all it's items to hash structure for further usage." do
        3.times { cart.add_item(2) }
        4.times { cart.add_item(5) }

        expect(cart.serialize).to eq result_hash
      end
    end

    context "hash to cart" do
      it "Cart also rebuilt by import a hash structure." do
        result_hash = {
          cart: {
            items: [
              {product_id: 2, quantity: 3},
              {product_id: 5, quabtity: 4}
            ]
          }
        }

        Cart = build_from_hash(result_hash)

        expect(item.first.product_id).to be 2
        expect(item.first.quantity).to be 3
        expect(item.second.product_id).to be 5
        expect(item.second.quantity).to be 4

      end
    end

  end

  # Calculate total price of this cart.

  describe "calculator" do
    it "Calculate total price of this cart." do
      p1 = create(:ruby_book, price: 1000)
      p2 = create(:php_book, price: 600)

      3.times{
        cart.add_item(p1.id)
        cart.add_item(p2.id)
      }
      expect(cart.total_price).to be 4800
    end
  end

  describe "special events" do
    context "XMas" do
      it "10% off on XMas" do
        p = create(:ruby_book, price: 100)

        10.times { cart.add_item(p.id) }

        Timecop.travel(2015, 12, 25) do
          expect(cart.total_price).to be (1000 * 0.9)
        end
      end
    end
  end

# Homework
  describe "Special Offer" do
    it "滿千折百" do
      p = create(:ruby_book, price: 300)
      3.times{cart.add_item(p.id)}
      expect(cart.total_price).to be 900

      cart.add_item(p.id)
      expect(cart.total_price).to be 1100
    end
  end



  private
  def result_hash
    result_hash = {
      cart: {
        items: [
          {product_id: 2, quantity: 3},
          {product_id: 5, quabtity: 4}
        ]
      }
    }
  end
end
