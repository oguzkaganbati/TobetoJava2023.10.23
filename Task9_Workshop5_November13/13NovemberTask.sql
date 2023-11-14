-- 86. a.Bu ülkeler hangileri..?

SELECT DISTINCT country FROM customers;


--- 87. En Pahalı 5 ürün

SELECT product_name, unit_price FROM products
ORDER BY unit_price DESC
LIMIT 5;


-- 88. ALFKI CustomerID’sine sahip müşterimin sipariş sayısı..?

SELECT COUNT(order_id) AS number_of_orders FROM orders
WHERE customer_id = 'ALFKI';



-- 89. Ürünlerimin toplam maliyeti

SELECT SUM(unit_price * units_in_stock) FROM products;



-- 90. Şirketim, şimdiye kadar ne kadar ciro yapmış..?

SELECT SUM((od.unit_price * od.quantity) - ((od.unit_price * od.quantity)*od.discount)) AS Total_Sales
FROM order_details od;



-- 91. Ortalama Ürün Fiyatım

SELECT AVG(unit_price) 
FROM products;



-- 92. En Pahalı Ürünün Adı

SELECT product_name, unit_price FROM products
ORDER BY unit_price DESC
LIMIT 1;



-- 93. En az kazandıran sipariş

SELECT order_id, (od.unit_price * od.quantity) - ((od.unit_price * od.quantity)*od.discount) AS Total_Sales
FROM order_details od
ORDER BY TOTAL_SALES
LIMIT 1;



-- 94. Müşterilerimin içinde en uzun isimli müşteri

SELECT contact_name FROM customers
ORDER BY LENGTH (contact_name) DESC
LIMIT 1;

SELECT company_name FROM customers
ORDER BY LENGTH (company_name) DESC
LIMIT 1;



-- 95. Çalışanlarımın Ad, Soyad ve Yaşları

SELECT first_name, last_name, EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM birth_date) AS Age
FROM employees;



-- 96. Hangi üründen toplam kaç adet alınmış..?

SELECT product_id, SUM(quantity) FROM order_details
GROUP BY product_id;



-- 97. Hangi siparişte toplam ne kadar kazanmışım..?

SELECT order_id, (od.unit_price * od.quantity) - ((od.unit_price * od.quantity)*od.discount) AS Total_Sales
FROM order_details od
ORDER BY TOTAL_SALES;



-- 98. Hangi kategoride toplam kaç adet ürün bulunuyor..?

SELECT category_name, COUNT(products.product_id) FROM categories
JOIN products ON categories.category_id = products.category_id
GROUP BY category_name;



-- 99. 1000 Adetten fazla satılan ürünler?

SELECT product_id, SUM(quantity) AS total_quantity FROM order_details
GROUP BY product_id
HAVING SUM(quantity) > 1000;



-- 100. Hangi Müşterilerim hiç sipariş vermemiş..?

SELECT c.customer_id, c.contact_name AS ContactName, c.company_name AS CompanyName
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.customer_id IS NULL;



-- 101. Hangi tedarikçi hangi ürünü sağlıyor ?

SELECT suppliers.supplier_id, suppliers.company_name AS SupplierName, products.product_id, products.product_name AS ProductName
FROM suppliers
JOIN products ON suppliers.supplier_id = products.supplier_id
GROUP BY suppliers.supplier_id, suppliers.company_name, products.product_id, products.product_name;



-- 102. Hangi sipariş hangi kargo şirketi ile ne zaman gönderilmiş..?

SELECT orders.order_id AS OrderID, shippers.company_name AS ShipperName
FROM orders
JOIN shippers ON orders.ship_via = shippers.shipper_id;



-- 103. Hangi siparişi hangi müşteri verir..?

SELECT order_id, customers.customer_id, customers.company_name FROM orders
INNER JOIN customers ON orders.customer_id = customers.customer_id;


--104. Hangi çalışan, toplam kaç sipariş almış..?

SELECT employee_id, COUNT(order_id) AS total_order
FROM orders
GROUP BY employee_id
ORDER BY employee_id

--105. En fazla siparişi kim almış..?

SELECT employee_id, COUNT(order_id) AS total_order
FROM orders
GROUP BY employee_id
ORDER BY total_order DESC
LIMIT 1


--106. Hangi siparişi, hangi çalışan, hangi müşteri vermiştir..?

SELECT order_id, employee_id, customer_id
FROM orders
GROUP BY order_id
ORDER BY order_id

--107. Hangi ürün, hangi kategoride bulunmaktadır..? Bu ürünü kim tedarik etmektedir..?

SELECT p.product_name, c.category_name, s.company_name
FROM products p
INNER JOIN categories c ON c.category_id = p.category_id
INNER JOIN suppliers s ON s.supplier_id = p.supplier_id
GROUP BY p.product_name, c.category_name, s.company_name
ORDER BY p.product_name


--108. Hangi siparişi hangi müşteri vermiş, hangi çalışan almış, hangi tarihte, hangi kargo şirketi tarafından gönderilmiş hangi üründen kaç adet alınmış, hangi fiyattan alınmış, ürün hangi kategorideymiş bu ürünü hangi tedarikçi sağlamış

SELECT o.order_id, cs.company_name, (e.first_name || ' ' || e.last_name) AS employee_name, sh.company_name, p.product_name, od.quantity, od.unit_price, c.category_name, s.company_name
FROM orders o
INNER JOIN employees e ON e.employee_id = o.employee_id
INNER JOIN shippers sh ON sh.shipper_id = o.ship_via
INNER JOIN order_details od ON od.order_id = o.order_id
INNER JOIN products p ON p.product_id = od.product_id
INNER JOIN categories c ON c.category_id = p.category_id
INNER JOIN suppliers s ON s.supplier_id = p.supplier_id
INNER JOIN customers cs ON cs.customer_id = o.customer_id



--109. Altında ürün bulunmayan kategoriler

SELECT c.category_name
FROM categories c
INNER JOIN products p ON c.category_id = p.category_id
WHERE p.product_id IS NULL



--110. Manager ünvanına sahip tüm müşterileri listeleyiniz.

SELECT company_name
FROM customers
WHERE contact_title LIKE '%Manager%'


--111. FR ile başlayan 5 karekter olan tüm müşterileri listeleyiniz.

SELECT company_name
FROM customers
WHERE company_name LIKE 'Fr%'
AND LENGTH(company_name) = 5




--112. (171) alan kodlu telefon numarasına sahip müşterileri listeleyiniz.

SELECT company_name
FROM customers 
WHERE phone LIKE '(171)%'


--113. BirimdekiMiktar alanında boxes geçen tüm ürünleri listeleyiniz.

SELECT product_name
FROM products
WHERE quantity_per_unit LIKE '%boxes%'


--114. Fransa ve Almanyadaki (France,Germany) Müdürlerin (Manager) Adını ve Telefonunu listeleyiniz.(MusteriAdi,Telefon)

SELECT contact_name, phone
FROM customers
WHERE country IN ('France', 'Germany')
AND contact_title LIKE '%Manager%'


--115. En yüksek birim fiyata sahip 10 ürünü listeleyiniz.

SELECT product_name
FROM products
ORDER BY unit_price DESC
LIMIT 10


--116. Müşterileri ülke ve şehir bilgisine göre sıralayıp listeleyiniz.

SELECT company_name, country, city
FROM customers
ORDER BY company_name

--117. Personellerin ad,soyad ve yaş bilgilerini listeleyiniz.

SELECT 
    (first_name || ' ' || last_name) AS employee_name,
    EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM birth_date) AS age
FROM employees;



--118. 35 gün içinde sevk edilmeyen satışları listeleyiniz.

SELECT order_id
FROM orders
WHERE EXTRACT(DAY FROM age(shipped_date, order_date)) > 35;


--119. Birim fiyatı en yüksek olan ürünün kategori adını listeleyiniz. (Alt Sorgu)

SELECT category_name
FROM(
	SELECT c.category_name, p.unit_price
	FROM categories c
	INNER JOIN products p ON p.category_id = c.category_id
	ORDER BY p.unit_price DESC
) AS SUBQUERY
LIMIT 1

--120. Kategori adında 'on' geçen kategorilerin ürünlerini listeleyiniz. (Alt Sorgu)

SELECT product_name
FROM(
	SELECT p.product_name, c.category_name
	FROM categories c
	INNER JOIN products p ON p.category_id = c.category_id
	WHERE c.category_name LIKE '%on%'
) AS SUBQUERY


--121. Konbu adlı üründen kaç adet satılmıştır.

SELECT SUM(od.quantity) AS total_sales_of_Konbu
FROM order_details od
INNER JOIN products p ON p.product_id = od.product_id
WHERE p.product_name = 'Konbu'

--122. Japonyadan kaç farklı ürün tedarik edilmektedir.

SELECT COUNT(p.product_id) AS number_of_product_from_japan
FROM suppliers s
INNER JOIN products p ON p.supplier_id = s.supplier_id
WHERE s.country = 'Japan'


--123. 1997 yılında yapılmış satışların en yüksek, en düşük ve ortalama nakliye ücretlisi ne kadardır?

SELECT MAX(o.freight) as max_freight, MIN (o.freight) AS min_freight, AVG(o.freight) AS avg_freight
FROM orders o
INNER JOIN order_details od ON o.order_id = od.order_id
WHERE EXTRACT (YEAR FROM o.order_date) = 1997



--124. Faks numarası olan tüm müşterileri listeleyiniz.

SELECT company_name
FROM customers
WHERE fax IS NOT NULL



--125. 1996-07-16 ile 1996-07-30 arasında sevk edilen satışları listeleyiniz. 

SELECT order_id
FROM orders
WHERE shipped_date BETWEEN '1996-07-16' AND '1996-07-30'



