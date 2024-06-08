以下に、顧客が「わだつみ1つ」と「にぎりのしおん1つ」を注文した場合のデータベースへのデータ格納方法を説明する。

---

# 注文データのデータベース格納方法

## 1. 初期設定

### MenuItems テーブル

| item_id | item_name | category   | price  | unit |
|---------|-----------|------------|--------|------|
| 1       | わだつみ | 盛り込み   | 8,560  | 個   |
| 2       | しおん   | にぎり     | 1,060  | 個   |

### Customers テーブル

顧客「田中 太郎」が既に`Customers`テーブルに登録されているとする。

| customer_id | customer_name |
|-------------|---------------|
| 1           | 田中 太郎     |

## 2. 注文データの挿入

顧客が「わだつみ1つ」と「にぎりのしおん1つ」を注文した場合、データを以下のようにデータベースに格納する。

### Orders テーブル

まず、新しい注文を`Orders`テーブルに追加する。

| order_id | customer_id | order_date           | total_items | payment_status |
|----------|-------------|----------------------|-------------|----------------|
| 1        | 1           | 2024-06-08 12:34:56  | 2           | 未             |

### OrderItems テーブル

次に、注文の詳細を`OrderItems`テーブルに追加する。このテーブルには、注文ごとに注文されたアイテムの情報を保存する。

| order_item_id | order_id | item_id | quantity | price |
|---------------|----------|---------|----------|-------|
| 1             | 1        | 1       | 1        | 8,560 |
| 2             | 1        | 2       | 1        | 1,060 |

## データベースに格納されたデータの詳細

### 1. Orders テーブル

- `order_id`: 注文の一意識別子。ここでは1。
- `customer_id`: 顧客のID。1（田中 太郎）。
- `order_date`: 注文日。2024-06-08 12:34:56。
- `total_items`: 注文の合計アイテム数。2。
- `payment_status`: 支払い状況。未（未払い）。

### 2. OrderItems テーブル

- 各注文に対して、注文されたアイテムの詳細を記録する。
- `order_item_id`: 注文明細の一意識別子。
- `order_id`: この明細が属する注文のID。
- `item_id`: メニューアイテムのID。`MenuItems`テーブルへの外部キー。
- `quantity`: 注文数量。1。
- `price`: 注文時の価格。8,560（わだつみ）と1,060（しおん）。

## クエリ例

### 顧客ID 1の注文を取得するクエリ

```sql
SELECT o.order_id, o.order_date, o.total_items, o.payment_status, c.customer_name
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
WHERE o.customer_id = 1;
```

### 注文ID 1の詳細を取得するクエリ

```sql
SELECT oi.order_item_id, oi.order_id, mi.item_name, oi.quantity, oi.price
FROM OrderItems oi
JOIN MenuItems mi ON oi.item_id = mi.item_id
WHERE oi.order_id = 1;
```

---

以下に、顧客が「玉子1皿」と「えび1皿」を注文した場合のデータベースへのデータ格納方法を説明する。

---

# 注文データのデータベース格納方法

## 1. 初期設定

### MenuItems テーブル

| item_id | item_name | category   | price | unit |
|---------|-----------|------------|-------|------|
| 1       | 玉子      | お好みすし | 100   | 皿   |
| 2       | えび      | お好みすし | 180   | 皿   |

### Customers テーブル

顧客「田中 太郎」が既に`Customers`テーブルに登録されているとする。

| customer_id | customer_name |
|-------------|---------------|
| 1           | 田中 太郎     |

## 2. 注文データの挿入

顧客が「玉子1皿」と「えび1皿」を注文した場合、データを以下のようにデータベースに格納する。

### Orders テーブル

まず、新しい注文を`Orders`テーブルに追加する。

| order_id | customer_id | order_date           | total_items | payment_status |
|----------|-------------|----------------------|-------------|----------------|
| 2        | 1           | 2024-06-08 12:45:00  | 2           | 未             |

### OrderItems テーブル

次に、注文の詳細を`OrderItems`テーブルに追加する。このテーブルには、注文ごとに注文されたアイテムの情報を保存する。

| order_item_id | order_id | item_id | quantity | price |
|---------------|----------|---------|----------|-------|
| 3             | 2        | 1       | 1        | 100   |
| 4             | 2        | 2       | 1        | 180   |

## データベースに格納されたデータの詳細

### 1. Orders テーブル

- `order_id`: 注文の一意識別子。ここでは2。
- `customer_id`: 顧客のID。1（田中 太郎）。
- `order_date`: 注文日。2024-06-08 12:45:00。
- `total_items`: 注文の合計アイテム数。2。
- `payment_status`: 支払い状況。未（未払い）。

### 2. OrderItems テーブル

- 各注文に対して、注文されたアイテムの詳細を記録する。
- `order_item_id`: 注文明細の一意識別子。
- `order_id`: この明細が属する注文のID。
- `item_id`: メニューアイテムのID。`MenuItems`テーブルへの外部キー。
- `quantity`: 注文数量。1。
- `price`: 注文時の価格。100（玉子）と180（えび）。

## クエリ例

### 顧客ID 1の注文を取得するクエリ

```sql
SELECT o.order_id, o.order_date, o.total_items, o.payment_status, c.customer_name
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
WHERE o.customer_id = 1;
```

### 注文ID 2の詳細を取得するクエリ

```sql
SELECT oi.order_item_id, oi.order_id, mi.item_name, oi.quantity, oi.price
FROM OrderItems oi
JOIN MenuItems mi ON oi.item_id = mi.item_id
WHERE oi.order_id = 2;
```


---