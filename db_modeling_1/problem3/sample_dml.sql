-- Customers テーブルにデータを挿入
INSERT INTO Customers (customer_name, phone_number) VALUES
('田中 太郎', '090-1234-5678'),
('山田 花子', '080-5678-1234');

INSERT INTO Categories (category_name) VALUES
('セット'),
('盛り込み'),
('お好みすし');

-- MenuItems テーブルにデータを挿入
INSERT INTO MenuItems (item_name, category, price, unit) VALUES
('わだつみ', 'セット', 8560, '個'),
('しおん', 'セット', 1060, '個'),
('鉄火ちらし', '盛り込み', 1200, '個'),
('玉子', 'お好みすし', 100, '皿'),
('えび', 'お好みすし', 180, '皿');

-- Orders テーブルにデータを挿入
INSERT INTO Orders (customer_id, order_date, total_items, payment_status) VALUES
(1, '2024-06-08 14:00:00', 2, FALSE),
(2, '2024-06-08 14:30:00', 2, TRUE);

-- OrderItems テーブルにデータを挿入
INSERT INTO OrderItems (order_id, item_id, quantity, price, tax, wasabi, shari) VALUES
(1, 1, 1, 8560, 0.1, TRUE, '大'), -- わだつみ1つわさび有りシャリ大
(1, 4, 1, 100, 0.1, FALSE, '小'), -- 玉子1つわさび無しシャリ小
(2, 4, 1, 100, 0.1, TRUE, '大'), -- 玉子1つわさび有りシャリ大
(2, 5, 1, 180, 0.1, TRUE, '大'); -- えび1つわさび有りシャリ大

-- Points　テーブルにデータを挿入
INSERT INTO Points (customer_id, points, expiration_date, get_date) VALUES
(1,100,'2024-10-08 14:00:00', '2024-06-08 14:00:00'),
(1,-100,'9999-01-01 14:00:00', '2024-06-08 14:00:00'),
(1,300,'2024-10-15 14:00:00', '2024-06-15 14:00:00');

