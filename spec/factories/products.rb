FactoryGirl.define do
  factory :product do
    category
    name('test_product')
    description('lorem ipsum')
    price(5.00)
  end
end
