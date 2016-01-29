FactoryGirl.define do
  factory :ruby_book, class: Product do
    title "Ruby"
    description "A textbook for Ruby"
    price 1000
  end

  factory :php_book, class: Product do
    title "PHP"
    description "A textbook for PHP"
    price 660
  end
end
