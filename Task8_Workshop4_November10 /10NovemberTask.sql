--26. Stokta bulunmayan ürünlerin ürün listesiyle birlikte tedarikçilerin ismi ve iletişim numarasını (`ProductID`, `ProductName`, `CompanyName`, `Phone`) almak için bir sorgu yazın.
SELECT product_id, product_name, company_name, phone FROM products p
RIGHT JOIN suppliers s ON p.supplier_id = s.supplier_id
WHERE units_in_stock = 0


--27. 1998 yılı mart ayındaki siparişlerimin adresi, siparişi alan çalışanın adı, çalışanın soyadı

SELECT order_date, ship_address, (first_name || ' ' || last_name) as employee_name
FROM orders o
INNER JOIN employees e ON e.employee_id = o.employee_id
WHERE EXTRACT(YEAR FROM order_date) = 1998
  AND EXTRACT(MONTH FROM order_date) = 3


--28. 1997 yılı şubat ayında kaç siparişim var?
SELECT COUNT(order_id) AS order_number FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 1997
  AND EXTRACT(MONTH FROM order_date) = 2



--29. London şehrinden 1998 yılında kaç siparişim var?

SELECT ship_city, COUNT(order_id) AS order_number
FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 1998
  AND ship_city = 'London'
GROUP BY ship_city



--30. 1997 yılında sipariş veren müşterilerimin contact name ve telefon numarası

SELECT contact_name, phone
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
WHERE EXTRACT(YEAR FROM order_date) = 1997
GROUP BY contact_name, phone



--31. Taşıma ücreti 40 üzeri olan siparişlerim

SELECT order_id, freight
FROM orders
WHERE freight > 40


--32. Taşıma ücreti 40 ve üzeri olan siparişlerimin şehri, müşterisinin adı

SELECT ship_city, company_name
FROM customers c
INNER JOIN orders o ON o.customer_id = c.customer_id
WHERE freight > 40
GROUP BY ship_city, company_name


--33. 1997 yılında verilen siparişlerin tarihi, şehri, çalışan adı -soyadı ( ad soyad birleşik olacak ve büyük harf),

SELECT order_date, ship_city, UPPER(first_name || ' ' || last_name) employee_name
FROM orders o
JOIN employees e ON e.employee_id = o.employee_id 
WHERE EXTRACT (YEAR FROM order_date) = 1997


--34. 1997 yılında sipariş veren müşterilerin contactname i, ve telefon numaraları ( telefon formatı 2223322 gibi olmalı )

SELECT order_date, contact_name, 
       TRANSLATE(phone, '()- .', '') AS phone_number
FROM customers c
INNER JOIN orders o ON o.customer_id = c.customer_id
WHERE EXTRACT(YEAR FROM order_date) = 1997
GROUP BY contact_name, phone, order_date
ORDER BY order_date



--35. Sipariş tarihi, müşteri contact name, çalışan ad, çalışan soyad

SELECT order_date, contact_name, first_name, last_name
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN employees e ON o.employee_id = e.employee_id


--36. Geciken siparişlerim?

SELECT order_id 
FROM orders
WHERE required_date < shipped_date


--37. Geciken siparişlerimin tarihi, müşterisinin adı

SELECT order_date, company_name
FROM orders o 
INNER JOIN order_details od ON o.order_id = od.order_id
INNER JOIN customers c ON c.customer_id = o.customer_id
WHERE required_date < shipped_date
GROUP BY order_date, company_name


--38. 10248 nolu siparişte satılan ürünlerin adı, kategorisinin adı, adedi

SELECT product_name, category_name, quantity
FROM products p
INNER JOIN categories c ON c.category_id = p.category_id
INNER JOIN order_details od ON od.product_id = p.product_id
WHERE order_id = 10248


--39. 10248 nolu siparişin ürünlerinin adı , tedarikçi adı

SELECT product_name AS "Order10248_Product_Names", company_name AS supplier_name
FROM products p
INNER JOIN suppliers s ON s.supplier_id = p.supplier_id
INNER JOIN order_details od ON od.product_id = p.product_id
WHERE order_id = 10248


--40. 3 numaralı ID ye sahip çalışanın 1997 yılında sattığı ürünlerin adı ve adeti

SELECT product_name, quantity
FROM products p
INNER JOIN order_details od ON od.product_id = p.product_id
INNER JOIN orders o ON o.order_id = od.order_id
WHERE employee_id = 3
AND EXTRACT (YEAR FROM order_date ) = 1997


--41. 1997 yılında bir defasinda en çok satış yapan çalışanımın ID,Ad soyad

SELECT employee_id, employee_name
FROM(
SELECT o.order_date, o.employee_id, e.first_name || ' ' || e.last_name AS employee_name, od.order_id, CAST((od.unit_price * od.quantity) as decimal (10,2)) as sales_amount
FROM order_details od
INNER JOIN orders o ON o.order_id = od.order_id
INNER JOIN employees e ON e.employee_id = o.employee_id
WHERE EXTRACT(YEAR FROM o.order_date) = 1997
ORDER BY sales_amount DESC
LIMIT 1
)AS SUBQUERY

--42. 1997 yılında en çok satış yapan çalışanımın ID,Ad soyad ****

SELECT employee_id, employee_name
FROM (
    SELECT e.employee_id, 
           e.first_name || ' ' || e.last_name AS employee_name, 
           CAST(SUM(od.quantity * od.unit_price) AS DECIMAL(10,2)) AS Total_Sales
    FROM employees e
    INNER JOIN orders o ON o.employee_id = e.employee_id
    INNER JOIN order_details od ON o.order_id = od.order_id
    WHERE EXTRACT(YEAR FROM o.order_date) = 1997
    GROUP BY e.employee_id, employee_name
    ORDER BY Total_Sales DESC
    LIMIT 1
) AS subquery;

--43. En pahalı ürünümün adı,fiyatı ve kategorisin adı nedir?

SELECT product_name, unit_price, category_name 
FROM products p
INNER JOIN categories c ON c.category_id = p.category_id
ORDER BY unit_price DESC
LIMIT 1


--44. Siparişi alan personelin adı,soyadı, sipariş tarihi, sipariş ID. Sıralama sipariş tarihine göre

SELECT e.first_name || ' ' || e.last_name AS employee_name, order_date, order_id
FROM orders o
INNER JOIN employees e ON e.employee_id = o.employee_id
ORDER BY order_date

--45. SON 5 siparişimin ortalama fiyatı ve orderid nedir?

SELECT order_id, AVG(average_price) 

	FROM(

SELECT order_id, product_id, AVG((unit_price * quantity)::decimal(10,2)) AS average_price
FROM order_details
GROUP BY order_id, product_id
ORDER BY order_id
	) AS SUBQUERY
GROUP BY order_id
ORDER BY ordeR_id DESC
LIMIT 5

--46. Ocak ayında satılan ürünlerimin adı ve kategorisinin adı ve toplam satış miktarı nedir?

SELECT p.product_name, c.category_name, CAST(SUM(od.unit_price * od.quantity) as decimal (10,2)) AS total_sales--, o.order_date
FROM products p
INNER JOIN categories c ON c.category_id = p.category_id
INNER JOIN order_details od ON od.product_id = p.product_id
INNER JOIN orders o ON o.order_id = od.order_id
WHERE EXTRACT(MONTH FROM o.order_date) = 1
GROUP BY p.product_name, c.category_name



--47. Ortalama satış miktarımın üzerindeki satışlarım nelerdir?

SELECT order_id, total_sales
FROM (
    SELECT order_id, 
           CAST(SUM((od.unit_price * od.quantity) - ((od.unit_price * od.quantity) * od.discount)) AS DECIMAL(10,2)) AS total_sales
    FROM order_details od
    GROUP BY order_id
) AS order_totals
WHERE total_sales > (
    SELECT CAST(AVG((od.unit_price * od.quantity) - ((od.unit_price * od.quantity) * od.discount)) AS DECIMAL(10,2)) AS average_sale
    FROM order_details od
)


--48. En çok satılan ürünümün(adet bazında) adı, kategorisinin adı ve tedarikçisinin adı
SELECT product_name, category_name, supplier_name
FROM(
SELECT p.product_id, SUM(od.quantity) as total_quantity, p.product_name, c.category_name, s.company_name as supplier_name
FROM products p
INNER JOIN categories c ON c.category_id = p.category_id
INNER JOIN suppliers s ON s.supplier_id = p.supplier_id
INNER JOIN order_details od ON od.product_id = p.product_id
GROUP BY p.product_id, c.category_name, s.company_name
ORDER BY total_quantity DESC
LIMIT 1
) AS SUBQUERY


--49. Kaç ülkeden müşterim var

SELECT COUNT(DISTINCT country) AS country_num
FROM customers


--50. 3 numaralı ID ye sahip çalışan (employee) son Ocak ayından BUGÜNE toplamda ne kadarlık ürün sattı?

SELECT o.employee_id, SUM(od.unit_price * od.quantity) AS total_items_sold
FROM orders o
INNER JOIN order_details od ON o.order_id = od.order_id
WHERE employee_id = 3
AND order_date >= '1998-01-01'
GROUP BY employee_id



--51. 10248 nolu siparişte satılan ürünlerin adı, kategorisinin adı, adedi

 SELECT p.product_name, c.category_name, od.quantity
 FROM products p
 INNER JOIN categories c ON c.category_id = p.category_id
 INNER JOIN order_details od ON od.product_id = p.product_id
 WHERE order_id = 10248

--52. 10248 nolu siparişin ürünlerinin adı , tedarikçi adı

SELECT p.product_name, s.company_name
FROM products p
INNER JOIN suppliers s ON s.supplier_id = p.supplier_id
INNER JOIN order_details od ON od.product_id = p.product_id
WHERE order_id = 10248

--53. 3 numaralı ID ye sahip çalışanın 1997 yılında sattığı ürünlerin adı ve adeti

SELECT p.product_name, SUM(od.quantity)
FROM products p
INNER JOIN order_details od ON od.product_id = p.product_id
INNER JOIN orders o ON o.order_id = od.order_id
WHERE o.employee_id = 3
AND EXTRACT (YEAR FROM o.order_date) = 1997
GROUP BY p.product_name



--54. 1997 yılında bir defasinda en çok satış yapan çalışanımın ID,Ad soyad

SELECT employee_id, employee_name
FROM(
SELECT e.employee_id,(e.first_name || ' ' || e.last_name) as employee_name,
		CAST(SUM((od.unit_price * od.quantity) - ((od.unit_price * od.quantity) * od.discount)) AS DECIMAL(10,2)) AS total_sales
FROM employees e
INNER JOIN orders o ON o.employee_id = e.employee_id
INNER JOIN order_details od ON od.order_id = o.order_id
WHERE EXTRACT (YEAR FROM o.order_date) = 1997
GROUP BY e.employee_id, o.order_id
ORDER BY total_sales DESC
LIMIT 1
)

--55. 1997 yılında en çok satış yapan çalışanımın ID,Ad soyad ****

SELECT employee_id, employee_name
FROM(
SELECT e.employee_id,(e.first_name || ' ' || e.last_name) as employee_name,
		CAST(SUM((od.unit_price * od.quantity) - ((od.unit_price * od.quantity) * od.discount)) AS DECIMAL(10,2)) AS total_sales
FROM employees e
INNER JOIN orders o ON o.employee_id = e.employee_id
INNER JOIN order_details od ON od.order_id = o.order_id
WHERE EXTRACT (YEAR FROM o.order_date) = 1997
GROUP BY e.employee_id
ORDER BY total_sales DESC
LIMIT 1
)



--56. En pahalı ürünümün adı,fiyatı ve kategorisin adı nedir?

SELECT p.product_name, p.unit_price, c.category_name
FROM products p
INNER JOIN categories c ON c.category_id = p.category_id
ORDER BY p.unit_price DESC
LIMIT 1


--57. Siparişi alan personelin adı,soyadı, sipariş tarihi, sipariş ID. Sıralama sipariş tarihine göre

SELECT (e.first_name || ' ' || e.last_name) as employee_name, o.order_date, o.order_id
FROM employees e 
INNER JOIN orders o ON e.employee_id = o.employee_id
ORDER BY order_date


--58. SON 5 siparişimin ortalama fiyatı ve orderid nedir?

SELECT CAST(AVG((od.unit_price * od.quantity) - ((od.unit_price * od.quantity) * od.discount)) AS DECIMAL(10,2)) AS average_sale, od.order_id
FROM order_details od
GROUP BY od.order_id
ORDER BY od.order_id DESC
LIMIT 5


--59. Ocak ayında satılan ürünlerimin adı ve kategorisinin adı ve toplam satış miktarı nedir?

SELECT p.product_name, c.category_name, CAST(SUM((od.unit_price * od.quantity) - ((od.unit_price * od.quantity) * od.discount)) AS DECIMAL(10,2)) AS total_sale
FROM products p
INNER JOIN order_details od ON od.product_id = p.product_id
INNER JOIN categories c ON p.category_id = c.category_id
INNER JOIN orders o ON o.order_id = od.order_id
WHERE EXTRACT (MONTH FROM o.order_date) = 01
GROUP BY p.product_name, c.category_name

--60. Ortalama satış miktarımın üzerindeki satışlarım nelerdir?

SELECT order_id, total_sales
FROM (
    SELECT order_id, 
           CAST(SUM((od.unit_price * od.quantity) - ((od.unit_price * od.quantity) * od.discount)) AS DECIMAL(10,2)) AS total_sales
    FROM order_details od
    GROUP BY order_id
) AS order_totals
WHERE total_sales > (
    SELECT CAST(AVG((od.unit_price * od.quantity) - ((od.unit_price * od.quantity) * od.discount)) AS DECIMAL(10,2)) AS average_sale
    FROM order_details od
)


--61. En çok satılan ürünümün(adet bazında) adı, kategorisinin adı ve tedarikçisinin adı

SELECT p.product_name, c.category_name, s.company_name
FROM products p
INNER JOIN categories c ON c.category_id = p.category_id
INNER JOIN suppliers s ON s.supplier_id = p.supplier_id
INNER JOIN order_details od ON od.product_id = p.product_id
GROUP BY p.product_name, s.company_name,c.category_name
ORDER BY SUM(od.quantity) DESC
LIMIT 1


--62. Kaç ülkeden müşterim var

SELECT COUNT(DISTINCT country) AS country_num
FROM customers

--63. Hangi ülkeden kaç müşterimiz var

SELECT c.country, Count(c.customer_id) AS customer_number
FROM customers c
GROUP BY c.country

--64. 3 numaralı ID ye sahip çalışan (employee) son Ocak ayından BUGÜNE toplamda ne kadarlık ürün sattı?

SELECT o.employee_id, SUM(od.unit_price * od.quantity) AS total_items_sold
FROM orders o
INNER JOIN order_details od ON o.order_id = od.order_id
WHERE employee_id = 3
AND order_date >= '1998-01-01'
GROUP BY employee_id

--65. 10 numaralı ID ye sahip ürünümden son 3 ayda ne kadarlık ciro sağladım?

SELECT CAST(SUM((od.unit_price * od.quantity) - ((od.unit_price * od.quantity) * od.discount)) AS DECIMAL(10,2)) AS total_sales
FROM order_details od
INNER JOIN orders o ON od.order_id = o.order_id
WHERE product_id = 10
AND order_date >= '1998-03-01'


--66. Hangi çalışan şimdiye kadar toplam kaç sipariş almış..?

SELECT e.employee_id, COUNT(o.order_id) AS order_num
FROM employees e
INNER JOIN orders o ON o.employee_id = e.employee_id
GROUP BY e.employee_id
ORDER BY e.employee_id


--67. 91 müşterim var. Sadece 89’u sipariş vermiş. Sipariş vermeyen 2 kişiyi bulun

SELECT c.company_name
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.customer_id
WHERE order_id IS NULL
GROUP BY c.company_name

--68. Brazil’de bulunan müşterilerin Şirket Adı, TemsilciAdi, Adres, Şehir, Ülke bilgileri

SELECT c.company_name, c.contact_name, c.address, c.city, c.country
FROM customers c
WHERE c.country ='Brazil'


--69. Brezilya’da olmayan müşteriler

SELECT c.country, c.company_name, c.contact_name, c.address, c.city
FROM customers c
WHERE c.country != 'Brazil'
ORDER BY c.country

--70. Ülkesi (Country) YA Spain, Ya France, Ya da Germany olan müşteriler

SELECT c.country, c.company_name, c.contact_name, c.address, c.city
FROM customers c
WHERE c.country = 'Spain' OR c.country = 'France' OR c.country = 'Germany'
ORDER BY c.country


--71. Faks numarasını bilmediğim müşteriler

SELECT company_name
FROM customers 
WHERE fax IS NULL


--72. Londra’da ya da Paris’de bulunan müşterilerim


SELECT c.country, c.company_name, c.contact_name, c.address, c.city
FROM customers c
WHERE c.city= 'London' OR c.city='Paris'
ORDER BY c.city



--73. Hem Mexico D.F’da ikamet eden HEM DE ContactTitle bilgisi ‘owner’ olan müşteriler

SELECT c.country, c.company_name, c.contact_name, c.address, c.city
FROM customers c
WHERE c.city= 'México D.F.'
AND c.contact_title = 'Owner'
ORDER BY c.city


--74. C ile başlayan ürünlerimin isimleri ve fiyatları

SELECT product_name, unit_price
FROM products
WHERE product_name LIKE 'C%'


--75. Adı (FirstName) ‘A’ harfiyle başlayan çalışanların (Employees); Ad, Soyad ve Doğum Tarihleri

SELECT first_name, last_name, birth_date
FROM employees
WHERE first_name LIKE 'A%'


--76. İsminde ‘RESTAURANT’ geçen müşterilerimin şirket adları

SELECT company_name
FROM customers
WHERE company_name LIKE '%Restaurant'


--77. 50$ ile 100$ arasında bulunan tüm ürünlerin adları ve fiyatları

SELECT product_name, unit_price
FROM products
WHERE unit_price BETWEEN 50 AND 100


--78. 1 temmuz 1996 ile 31 Aralık 1996 tarihleri arasındaki siparişlerin (Orders), SiparişID (OrderID) ve SiparişTarihi (OrderDate) bilgileri

SELECT order_id, order_date
FROM orders 
WHERE order_date BETWEEN '1996-07-01' AND '1996-12-31'


--79. Ülkesi (Country) YA Spain, Ya France, Ya da Germany olan müşteriler

SELECT c.country, c.company_name, c.contact_name, c.address, c.city
FROM customers c
WHERE c.country = 'Spain' OR c.country = 'France' OR c.country = 'Germany'
ORDER BY c.country


--80. Faks numarasını bilmediğim müşteriler
SELECT company_name
FROM customers 
WHERE fax IS NULL


--81. Müşterilerimi ülkeye göre sıralıyorum:

SELECT *
FROM customers
ORDER BY country


--82. Ürünlerimi en pahalıdan en ucuza doğru sıralama, sonuç olarak ürün adı ve fiyatını istiyoruz

SELECT product_name, unit_price
FROM products
ORDER BY unit_price DESC


--83. Ürünlerimi en pahalıdan en ucuza doğru sıralasın, ama stoklarını küçükten-büyüğe doğru göstersin sonuç olarak ürün adı ve fiyatını istiyoruz

SELECT product_name, unit_price, units_in_stock
FROM products
ORDER BY unit_price DESC, units_in_stock 


--84. 1 Numaralı kategoride kaç ürün vardır..?

SELECT category_id, Count(product_id) AS number_of_product
FROM products
WHERE category_id = 1
GROUP BY category_id


--85. Kaç farklı ülkeye ihracat yapıyorum..?

SELECT Count(DISTINCT c.country) AS export_countries
FROM customers c
INNER JOIN orders o ON o.customer_id = c.customer_id
WHERE o.order_id IS NOT NULL


