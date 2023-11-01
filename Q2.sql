--Please pull together a list of each inventory item you have stocked, including the store_id number,the inventory_id, the name of the film, the film’s rating, its rental rate and replacement cost.

SELECT 
	inventory_id, store_id, 
	title, rating, 
	rental_rate, 
	replacement_cost
FROM 
	Movie_Rentals.dbo.inventory inv
INNER JOIN Movie_Rentals.dbo.film flm ON inv.film_id = flm.film_id