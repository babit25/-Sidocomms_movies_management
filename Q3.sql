--We would like to know how many inventory items you have with each rating at each store.


SELECT 
	store_id, 
	rating,
	COUNT(title) as number_of_movies
FROM 
	Movie_Rentals.dbo.inventory Inv
INNER JOIN Movie_Rentals.dbo.film Flm ON Inv.film_id = Flm.film_id
GROUP BY
	rating,store_id
ORDER BY
	store_id
