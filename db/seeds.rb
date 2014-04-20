Cart.create!([
  {user_id: nil, payed: nil, done: nil},
  {user_id: nil, payed: nil, done: nil},
  {user_id: nil, payed: nil, done: nil}
])
Category.create!([
  {name: "Торты", image_url: "1_soup.jpg"},
  {name: "Пироги", image_url: "2_pasta.jpg"},
  {name: "Пирожные", image_url: "3_cakes.jpg"},
  {name: "Напитки", image_url: "4_drinks.jpg"}
])
Order.create!([
  {count: 1, sum: "5.0", discount_sum: nil, cart_id: 21, weight: 0, note: "Write text from image", image_url: "62_logo.png"}
])
Product.create!([
  {title: "Cake", description: "wonderful dish", image_url: "1_item2.jpg", price: "10.0", today_special: 2, by_weight: 0, category_id: 2},
  {title: "Apple pie", description: "Pie with fresh apples", image_url: "2_item2.jpg", price: "5.0", today_special: 2, by_weight: 0, category_id: 2},
  {title: "Honey tart", description: "Tart with honey", image_url: "3_item1.jpg", price: "3.0", today_special: 0, by_weight: 100, category_id: 1},
  {title: "Snikers", description: "Pirozhnoe with nuts", image_url: "4_item3.jpg", price: "5.0", today_special: 2, by_weight: 0, category_id: 3},
  {title: "Coca-Cola", description: "Coca-cola drink", image_url: "5_soup.jpg", price: "3.0", today_special: 0, by_weight: 0, category_id: 4},
  {title: "Chachlik", description: "Fresh meet", image_url: "6_today_special.jpg", price: "10.0", today_special: 1, by_weight: 0, category_id: 3}
])
User.create!([
  {name: "Chef1", email: "chef1@example.org", phone: "", password_digest: "$2a$10$tBk6hWVIsRKl3UxomWTXEudVk1Lw6vKQJGrexut/zjpEr48/eOCHe", remember_token: "sI7gGtjMAKgbL2nxuM1HFw", string: nil, admin: true, discount_rate: nil}
])
