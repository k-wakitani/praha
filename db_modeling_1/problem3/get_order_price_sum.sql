-- 注文IDを取得
SELECT @order_id := order_id FROM Orders
WHERE customer_id = (SELECT customer_id FROM Customers WHERE customer_name = '山田 太郎')
AND order_date = '2024-06-08 15:00:00';

-- 合計金額を取得
SELECT SUM(quantity * price) AS total_amount
FROM OrderItems
WHERE order_id = @order_id;
