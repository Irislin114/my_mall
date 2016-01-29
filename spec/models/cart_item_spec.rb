require 'rails_helper'

RSpec.describe CartItem, type: :model do

  descirbe "calculator" do
    let(:cart) { Cart.new }
      it "Every item can calculate it's total price itself." do
        p1 = create(:ruby_book, price: 1000)
        p2 = create(:php_book, price: 800)

        4.times {
          cart.add_item(p1.id)
          cart.add_item(p2.id)
        }

        expect(cart.items.first.price).to be 7200
      end
  end

    # Some Special Event (e.g. 10% off on XMas), Optional

end
