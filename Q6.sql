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
