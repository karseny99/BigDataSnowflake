SELECT COUNT(*) FROM sales;
>>> 13151881



SELECT 
    c.first_name || ' ' || c.last_name AS customer,
    p.product_name,
    SUM(s.quantity) AS total_quantity,
    SUM(s.total_price) AS total_spent
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.first_name, c.last_name, p.product_name
ORDER BY total_spent DESC
LIMIT 10;

>>>
    Llywellyn Barmadier	    Dog Food	    13888	    6166549.76
    Hilario Edmons	        Dog Food	    75264	    4341133.44
    Mayor Bottomley	        Bird Cage	    18684	    3843952.74
    Guenna Laye	            Cat Toy	        7878	    3634121.40
    Zaccaria Sorbie	        Cat Toy	        51156	    3633464.52
    Freeman Itzcak	        Dog Food	    31752	    3565987.74
    Ford Freake	            Dog Food	    49910	    3337553.00
    Joyce Dalley	        Dog Food	    38976	    3335760.96
    Bret Caird	            Dog Food	    15876	    3313956.24
    Kermit Caudle	        Cat Toy	        6400	    3103424.00