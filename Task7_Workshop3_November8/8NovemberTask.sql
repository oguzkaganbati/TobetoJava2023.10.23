-- 1. Product isimlerini (`ProductName`) ve birim başına miktar (`QuantityPerUnit`) değerlerini almak için sorgu yazın.
SELECT product_name, quantity_per_unit FROM products

-- 2. Ürün Numaralarını (`ProductID`) ve Product isimlerini (`ProductName`) değerlerini almak için sorgu yazın. Artık satılmayan ürünleri (`Discontinued`) filtreleyiniz.

SELECT product_id, product_name FROM products
WHERE discontinued = 1

-- 3. Durdurulan Ürün Listesini, Ürün kimliği ve ismi (`ProductID`, `ProductName`) değerleriyle almak için bir sorgu yazın.

SELECT product_id, product_name FROM products
WHERE discontinued IN (1)

-- 4. Ürünlerin maliyeti 20'dan az olan Ürün listesini (`ProductID`, `ProductName`, `UnitPrice`) almak için bir sorgu yazın.

SELECT product_id, product_name, unit_price FROM products
WHERE unit_price < 20


-- 5. Ürünlerin maliyetinin 15 ile 25 arasında olduğu Ürün listesini (`ProductID`, `ProductName`, `UnitPrice`) almak için bir sorgu yazın.

SELECT product_id, product_name, unit_price FROM products
WHERE unit_price BETWEEN 15 AND 25

SELECT product_id, product_name, unit_price FROM products
WHERE unit_price >= 15 AND unit_price =< 25


-- 6. Ürün listesinin (`ProductName`, `UnitsOnOrder`, `UnitsInStock`) stoğun siparişteki miktardan az olduğunu almak için bir sorgu yazın.

SELECT product_name, units_on_order, units_in_stock FROM products
WHERE units_on_order > units_in_stock


-- 7. İsmi `a` ile başlayan ürünleri listeleyeniz.

SELECT * FROM products
WHERE LOWER(product_name) LIKE 'a%'


-- 8. İsmi `i` ile biten ürünleri listeleyeniz.

SELECT * FROM products
WHERE LOWER(product_name) LIKE '%i'



--9. Ürün birim fiyatlarına %18’lik KDV ekleyerek listesini almak (ProductName, UnitPrice, UnitPriceKDV) için bir sorgu yazın.

SELECT product_name, unit_price, (unit_price * 1.18) AS unit_price_kdv FROM products;


-- 10. Fiyatı 30 dan büyük kaç ürün var?

SELECT COUNT(*) FROM products
WHERE unit_price > 30


--11. Ürünlerin adını tamamen küçültüp fiyat sırasına göre tersten listele

SELECT LOWER(product_name), unit_price FROM products
ORDER BY unit_price DESC


--12. Çalışanların ad ve soyadlarını yanyana gelecek şekilde yazdır

SELECT first_name, last_name FROM employees



--13. Region alanı NULL olan kaç tedarikçim var?

SELECT COUNT(*) FROM suppliers 
WHERE region IS NULL



--14. a.Null olmayanlar?

SELECT COUNT(*) FROM suppliers 
WHERE region IS NOT NULL


--15. Ürün adlarının hepsinin soluna TR koy ve büyültüp olarak ekrana yazdır.

SELECT 'TR' || UPPER(product_name) AS modified_product_name
FROM products


--16. a.Fiyatı 20den küçük ürünlerin adının başına TR ekle

SELECT 'TR' || product_name AS modified_product_name, unit_price
FROM products
WHERE unit_price < 20



--17. En pahalı ürün listesini (`ProductName` , `UnitPrice`) almak için bir sorgu yazın.

SELECT * FROM products
WHERE unit_price = (SELECT MAX(unit_price) FROM products)



--18. En pahalı on ürünün Ürün listesini (`ProductName` , `UnitPrice`) almak için bir sorgu yazın.

SELECT * FROM products
ORDER BY unit_price DESC
LIMIT 10


--19. Ürünlerin ortalama fiyatının üzerindeki Ürün listesini (`ProductName` , `UnitPrice`) almak için bir sorgu yazın.

SELECT product_name, unit_price FROM products
WHERE unit_price > (SELECT AVG(unit_price) FROM products)
ORDER BY unit_price DESC



-- 20. Stokta olan ürünler satıldığında elde edilen miktar ne kadardır.

SELECT SUM(unit_price*units_in_stock)
FROM products 

--21. Mevcut ve Durdurulan ürünlerin sayılarını almak için bir sorgu yazın.


SELECT
    SUM(CASE WHEN discontinued = 0 THEN 1 ELSE 0 END) AS available_products,
    SUM(CASE WHEN discontinued = 1 THEN 1 ELSE 0 END) AS discontinued_products
FROM
    products

-- 22. Ürünleri kategori isimleriyle birlikte almak için bir sorgu yazın.

SELECT product_name, (SELECT category_name FROM categories WHERE categories.category_id = products.category_id) AS CategoryName
FROM products;



--23. Ürünlerin kategorilerine göre fiyat ortalamasını almak için bir sorgu yazın.


SELECT C.category_name, AVG(A.unit_price) AS AvgPrice
FROM Products AS A 
JOIN Categories AS C ON A.category_id = C.category_id
GROUP BY C.category_name



--24. En pahalı ürünümün adı, fiyatı ve kategorisin adı nedir?

SELECT P.product_name, P.unit_price, C.category_name
FROM products AS P
JOIN categories AS C ON P.category_id = C.category_id
WHERE P.unit_price = (SELECT MAX(unit_price) FROM products)



--25. En çok satılan ürününün adı, kategorisinin adı ve tedarikçisinin adı

SELECT P.product_name, C.category_name, A.company_name
FROM products AS P
JOIN categories AS C ON P.category_id = C.category_id
JOIN suppliers AS A ON P.supplier_id = A.supplier_id
WHERE product_id = (

SELECT product_id
FROM order_details
GROUP BY product_id
ORDER BY COUNT(product_id) DESC
LIMIT 1

)


