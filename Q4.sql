--We would like to see the number of films, as well as the average replacement cost, and total replacement cost, sliced by store and film category.

SELECT
	store_id,name,
	COUNT(title) as number_of_films,
	ROUND( AVG(replacement_cost),2) average_replacement_cost, --To round the column to 2 dp
	ROUND(SUM(replacement_cost),2) AS total_replacement_cost  --To round the column to 2 dp
FROM 
	Movie_Rentals.dbo.inventory Inv
INNER JOIN Movie_Rentals.dbo.film Flm ON Inv.film_id = Flm.film_id
INNER JOIN Movie_Rentals.dbo.film_category Flc ON Flc.film_id = Flm.film_id
INNER JOIN Movie_Rentals.dbo.category Cat ON Cat.category_id = Flc.category_id
GROUP BY 
	store_id, name
ORDER BY 
	store_id, name





