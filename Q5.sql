-- Please provide a list of all customer names, which store they go to, whether or not they are currently active, and their full addresses – street address, city, and country.

--To view tables needed

SELECT 
	(first_name + ' ' + last_name) AS customer_name , 
	store_id, (address + ' ' + district + ',' + city + ',' +country) AS customer_address,
	CASE 
		WHEN active = 0 THEN 'not active'
		ELSE 'active'									--To show active and non active customers
	END AS customer_active
FROM Movie_Rentals.dbo.customer Cus
INNER JOIN Movie_Rentals.dbo.address Adr ON Cus.address_id = Adr.address_id
INNER JOIN Movie_Rentals.dbo.city Cty ON Cty.city_id = Adr.city_id
INNER JOIN Movie_Rentals.dbo.country Cnt ON Cnt.country_id = Cty.country_id
