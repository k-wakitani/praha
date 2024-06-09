## セット商品の売上は無視して，単品の売上だけ集計する（月ごと）

テーブル設計は変えなくても，集計できそう  
categoryをお好みすしで限定して，月ごとの売れたメニュー一覧を出す．

### クエリ


```sql
SELECT mi.item_name, SUM(oi.quantity) AS total_quantity
FROM OrderItems oi
JOIN MenuItems mi ON oi.item_id = mi.item_id
WHERE mi.category = 'お好みすし'
AND oi.order_date BETWEEN '2024-06-01' AND '2024-06-30'
GROUP BY mi.item_name;
```

### クエリの実行結果(予定)

| item_name | total_quantity |
|-----------|----------------|
| 玉子      | 1              |
| えび      | 1              |


---

## 今後発生しそうな仕様追加

ポイントシステムの導入．顧客の購買に応じてポイントを付与．ポイントは支払いに使える．  
例えば，次のようなテーブル設計が考えられる．

### 1. テーブル設計

#### Customers テーブル

既存の`Customers`テーブルにポイント情報を追加。

| customer_id | customer_name | phone_number   | points |
|-------------|---------------|----------------|--------|
| 1           | 田中 太郎     | 090-1234-5678  | 100    |

#### Orders テーブル

既存の`Orders`テーブルに使用ポイントと付与ポイントのカラムを追加。

| order_id | customer_id | order_date           | total_items | payment_status | points_used | points_earned |
|----------|-------------|----------------------|-------------|----------------|-------------|---------------|
| 6        | 1           | 2024-06-08 14:00:00  | 2           | 未             | 10          | 5             |

### 2. テーブルの関係図

```plaintext
Customers
---------------------------------
| customer_id (PK)      | INT   |
| customer_name         | VARCHAR|
| phone_number          | VARCHAR|
| points                | INT   |
---------------------------------

Orders
----------------------------------------------
| order_id (PK)         | INT       |
| customer_id (FK)      | INT       |
| order_date            | DATETIME  |
| total_items           | INT       |
| payment_status        | BOOLEAN   |
| points_used           | INT       |
| points_earned         | INT       |
----------------------------------------------
```

### クエリの例

#### 顧客のポイント残高を確認するクエリ

```sql
SELECT customer_name, points
FROM Customers
WHERE customer_id = 1;
```

#### ポイント使用履歴を確認するクエリ

```sql
SELECT order_id, order_date, points_used, points_earned
FROM Orders
WHERE customer_id = 1;
```

このほかにも食品のアレルギー情報をDBに保存する追加仕様などもありそう．