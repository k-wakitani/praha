Table Orders {
  order_id integer [primary key]
  customer_id int
  order_date datetime
  payment_status boolean
}

Table OrderItems {
  order_item_id integer [primary key]
  order_id integer
  item_id integer
  quantity int
  price int
  wasabi bool
}

Table MenuItems {
  item_id integer [primary key]
  item_name varchar
  category varchar
  price int
  unit int
}

Table Customers {
  customer_id int
  name varchar
}

Ref: Orders.order_id < OrderItems.order_id
Ref: MenuItems.item_id < OrderItems.item_id
Ref: Orders.customer_id - Customers.customer_id


