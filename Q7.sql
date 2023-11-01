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