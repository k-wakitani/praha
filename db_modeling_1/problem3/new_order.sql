-- 新しい注文をOrdersテーブルに挿入
INSERT INTO Orders (customer_id, order_date, total_items, payment_status)
VALUES ((SELECT customer_id FROM Customers WHERE customer_name = '山田 太郎'), '2024-06-08 15:00:00', 3, FALSE);

-- OrderItemsテーブルに注文アイテムを挿入
INSERT INTO OrderItems (order_id, item_id, quantity, price, wasabi, shari)
VALUES 
(LAST_INSERT_ID(), 1, 1, 8560, TRUE, '大'),  -- わだつみ1つわさび有りシャリ大
(LAST_INSERT_ID(), 4, 2, 100, TRUE, '大');  -- 玉子2つわさび有りシャリ大
