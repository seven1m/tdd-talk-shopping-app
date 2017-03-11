100.times do
  Product.create!(
    name: Faker::Commerce.product_name,
    description: Faker::Lorem.sentence,
    cost: '%d.%02d' % [rand(100), rand(100)]
  )
end
