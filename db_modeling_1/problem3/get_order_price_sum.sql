-- CustomerIDが1の顧客の最新の注文の合計金額を得る
-- 注文IDを取得
SELECT @order_id := order_id FROM Orders
WHERE customer_id = 1
ORDER BY order_date DESC
LIMIT 1;

-- 合計金額を取得
SELECT SUM(quantity * price) AS total_amount
FROM OrderItems
WHERE order_id = @order_id;
