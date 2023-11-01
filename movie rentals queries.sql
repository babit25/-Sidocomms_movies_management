--QUESTION 1
--Please send over the managers’ names at each store, with the full address of each property (street address, district, city, and country please).

SELECT 
	sto.store_id,
	(first_name + ' ' + last_name) as manager_name, 
	(address + ',' + city + ',' + country) as store_address
FROM
	Movie_Rentals.dbo.store sto
INNER JOIN Movie_Rentals.dbo.staff stf ON sto.store_id = stf.store_id
INNER JOIN Movie_Rentals.dbo.address adr ON adr.address_id = sto.address_id
INNER JOIN Movie_Rentals.dbo.city cty ON cty.city_id = adr.city_id
INNER JOIN Movie_Rentals.dbo.country cnt ON cnt.country_id = cty.country_id


 -- QUESTION 2
 --Please pull together a list of each inventory item you have stocked, including the store_id number,the inventory_id, the name of the film, the film’s rating, its rental rate and replacement cost.

SELECT 
	inventory_id, store_id, 
	title, rating, 
	rental_rate, 
	replacement_cost
FROM 
	Movie_Rentals.dbo.inventory inv
INNER JOIN Movie_Rentals.dbo.film flm ON inv.film_id = flm.film_id

--QUESTION 3
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

--QUESTION 4
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

--QUESTION 5
-- Please provide a list of all customer names, which store they go to, whether or not they are currently active, and their full addresses – street address, city, and country.

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

--QUESTION 6
-- Please pull together a list of customer names, their total lifetime rentals, and the sum of all payments you have collected from them. It would be great to see this ordered on total lifetime value, with the most valuable customers at the top of the list.

SELECT 
	(first_name + ' ' + last_name) AS customer_name,
	COUNT(Ren.rental_id) AS total_lifetime_rentals, 
	ROUND (SUM(amount),2) AS customer_payment
FROM
	Movie_Rentals.dbo.customer Cus
INNER JOIN Movie_Rentals.dbo.rental Ren ON Cus.customer_id = Ren.customer_id
INNER JOIN Movie_Rentals.dbo.payment Pay ON Pay.rental_id = Ren.rental_id
GROUP BY
	first_name, last_name
ORDER BY
	customer_payment DESC

--QUESTION 7
-- Could you please provide a list of advisor and investor names in one table? Could you please note whether they are an investor or an advisor, and for investors, it would be good to include which company they work with.

ALTER TABLE 
	Movie_Rentals.dbo.advisor	-- To add a new column to the advisor table
	add role varchar(50);					
UPDATE 
	Movie_Rentals.dbo.advisor		-- To update the new column
	SET role  = 'Advisor'

ALTER TABLE	
	Movie_Rentals.dbo.investor	-- To add a new column to the investor table
	add role varchar(50);					
UPDATE 
	Movie_Rentals.dbo.investor		-- To update the new column
	SET role  = 'Investor'

SELECT  
	(first_name +' ' + last_name) as Name, role,
	CASE													-- To select the company of investors
		WHEN investor_id = 1
			THEN (SELECT 
					company_name 
				FROM
					Movie_Rentals.dbo.investor 
				WHERE 
					investor_id = 1)
		WHEN investor_id = 2
			THEN (SELECT 
					company_name 
				FROM 
					Movie_Rentals.dbo.investor
				WHERE 
					investor_id = 2)
		WHEN investor_id = 3
			THEN (SELECT
					company_name
				FROM	
					Movie_Rentals.dbo.investor
				WHERE 
					investor_id = 3)
		WHEN investor_id = 4
			THEN (SELECT 
					company_name 
				FROM
					Movie_Rentals.dbo.investor
				WHERE 
					investor_id = 4)
	END AS company
FROM
	Movie_Rentals.dbo.investor Ins
UNION 
SELECT 
	(first_name +' ' + last_name) as Name,role,
	CASE
		WHEN advisor_id > 0
			THEN 'no_company'
	END AS company
FROM 
	Movie_Rentals.dbo.advisor Adv
ORDER BY 
	role

--QUESTION 8
--Of all the actors with three types of awards, for what % of them do we carry a film? And how about for actors with two types of awards? Same questions. Finally, how about actors with just one award?

WITH Award AS								-- Create a CTE to extract the number of awards from the list
	(SELECT 
		actor_id,
		actor_award_id, 
		(first_name + ' ' +  last_name)  AS name, 
		COUNT(awards) AS number_of_awards
	FROM
		Movie_Rentals.dbo.actor_award Aca
	CROSS APPLY 
		string_split(awards,',')		-- To split the words in the list of awards as seperated by ',' to get the number of awards
	GROUP by
		actor_award_id, 
		actor_id,
		first_name, 
		last_name
	),
Inv AS										-- Create a CTE for film Inventory
	(SELECT 
		actor_id,
		count(film_id) AS number_of_films
	FROM 
		Movie_Rentals.dbo.film_actor
	GROUP BY	
		actor_id
	),
Paf AS										-- Create a CTE to join the Award and INV CTE to together
	(SELECT 
		COUNT(Awa.actor_id)AS number_of_actors,
		number_of_awards,
		COUNT(Inv.actor_id) AS actors_with_film
	FROM 
		Award Awa
	FULL OUTER JOIN Inv ON Awa.actor_id = Inv.actor_id
	GROUP BY 
		number_of_awards
	HAVING
		number_of_awards > 0
)

SELECT 
	number_of_awards, 
	number_of_actors, 
	actors_with_film,
	( (actors_with_film * 100)/number_of_actors)  AS percentage_of_actors
FROM 
	Paf
ORDER BY 
	number_of_awards DESC

