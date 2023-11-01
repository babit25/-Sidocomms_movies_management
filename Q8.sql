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

