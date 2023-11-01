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
