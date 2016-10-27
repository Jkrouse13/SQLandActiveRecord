# SQLandActiveRecord
How many users are there?
  `'User.count'`
    `50`

What are the 5 most expensive items?
  `'Item.order(price: :desc).limit(5)'`
      `[#<Item:0x007faab4370260
      id: 25,
      title: "Small Cotton Gloves",
      category: "Automotive, Shoes & Beauty",
      description: "Multi-layered modular service-desk",
      price: 9984>,
      #<Item:0x007faab436bee0
      id: 83,
      title: "Small Wooden Computer",
      category: "Health",
      description: "Re-engineered fault-tolerant adapter",
      price: 9859>,
      #<Item:0x007faab436bcd8
      id: 100,
      title: "Awesome Granite Pants",
      category: "Toys & Books",
      description: "Upgradable 24/7 access",
      price: 9790>,
      #<Item:0x007faab436bad0
      id: 40,
      title: "Sleek Wooden Hat",
      category: "Music & Baby",
      description: "Quality-focused heuristic info-mediaries",
      price: 9390>,
      #<Item:0x007faab436b940
      id: 60,
      title: "Ergonomic Steel Car",
      category: "Books & Outdoors",
      description: "Enterprise-wide secondary firmware",
      price: 9341>]`

What's the cheapest book?
  `Item.order(price: :asc).where("category =  ?", "Books").limit(1)`
      `[#<Item:0x007faab425ace0
      id: 76,
      title: "Ergonomic Granite Chair",
      category: "Books",
      description: "De-engineered bi-directional portal",
      price: 1496>]`

Who lives at "6439 Zetta Hills, Willmouth, WY"? Do they have another address?
  `Address.find_by("street = ?", "6439 Zetta Hills").user`
    `#<User:0x007faab18d3e58 id: 40, first_name: "Corrine", last_name: "Little", email: "rubie_kovacek@grimes.net">`

Correct Virginie Mitchell's address to "New York, NY, 10108".
  `User.find_by(first_name: "Virginie", last_name: "Mitchell").address.update(city: "New York", state: "NY", zip: "10108")`
      `[#<Address:0x007faab41701e0
      id: 41,
      user_id: 39,
      street: "12263 Jake Crossing",
      city: "New York",
      state: "NY",
      zip: 10108>,
      #<Address:0x007faab41700a0
      id: 42,
      user_id: 39,
      street: "83221 Mafalda Canyon",
      city: "New York",
      state: "NY",
      zip: 10108>]`

How much would it cost to buy one of each tool?
  `Item.where(category: "Tools").sum("price")`
    `7383`

How many total items did we sell?
  `Order.sum("quantity")`
    `2125`

How much was spent on books?
  `money = Item.where("category like '%Books%'").collect do |item|
      item.price * item.order.sum("quantity")
      end `
      `money.reduce(:=+)`
        `1081352`

Simulate buying an item by inserting a User for yourself and an Order for that User.
  `User.create(first_name: "Jon", last_name: "Krouse", email: "jk@haha.net")`
     `#<User:0x007faab45427f0 id: 51, first_name: "Jon", last_name: "Krouse", email: "jk@haha.net">`
  `Order.create(user_id: "51", item_id: 13, quantity: "13")`
    `#<Order:0x007faab4488d00
    id: 378,
    user_id: 51,
    item_id: 13,
    quantity: 13,
    created_at: Tue, 25 Oct 2016 18:05:39 UTC +00:00>`

Adventurer Mode

What item was ordered most often? Grossed the most money?
`orders = Item.joins(:order).select('item *', 'sum(order.quantity) as total').order('total :desc').first`

What user spent the most?


What were the top 3 highest grossing categories?
