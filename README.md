# Sidocomms_movies_management

![image](https://github.com/babit25/-Sidocomms_movies_management/assets/108529070/ee4f2567-616f-4b28-9edc-fe28f956bcdb)

[Image credit](https://www.myfame.org/blog/10-movies-that-changed-the-visual-effects-industry-forever)

# THE SITUATION
You and your business partner were recently approached by another local business owner who is interested in purchasing your movie rental Business. He primarily owns restaurants and bars, so he has lots of questions for you about your business and the rental business in general. His offer seems very generous, so you are going to entertain his questions. 

# THE OBJECTIVE
Leverage your SQL skills to extract and analyze data from various tables in the Movies Database to answer your potential Acquirer’s questions. Each question will require you to write a multi-table SQL query, joining at least two tables.

# Tools required
SQL - Microsoft SQL Server Management Studio

# Skills Demonstrated
•	Joins

•	Case statement

•	CTEs

•	Sub queries

# Dataset
The dataset contains the following tables;

• actor          • actor_award

• address        • advisor

• category       • city

• country        • customer

• film           • film_actor

• film_category  • film_text

• inventory      • investor

• language      • payment

• rental        • staff

• store

# THE LETTER
Dear Sidocomms Movies Management, 

I am excited about the potential acquisition and learning more about your rental business. Please bear with me as I am new to the industry. I have a number of questions for you. Assuming you can answer them all, and that there are no major surprises, we should be able to move forward with the purchase. 

**Best, Elijah Moneybags**

# QUESTIONS
1.	My partner and I want to come by each of the stores in person and meet the managers. Please send over the managers’ names at each store, with the full address of each property (street address, district, city, and country please).
   
   **QUERY**
   
![Q1](https://github.com/babit25/-Sidocomms_movies_management/assets/108529070/7f8ff290-8c20-490e-a99a-2b7b08afe7e6)

  **RESULT**
  
![Q1 Table](https://github.com/babit25/-Sidocomms_movies_management/assets/108529070/72ee0180-ba90-476f-91f6-d4119d6dfd4a)

2.	I would like to get a better understanding of all inventory that would come along with the business. Please pull together a list of each inventory item you have stocked, including the store_id number, the inventory_id, the name of the film, the film’s rating, its rental rate, and replacement cost.

**QUERY**

![Q2](https://github.com/babit25/-Sidocomms_movies_management/assets/108529070/9a72bdd0-d802-45b4-9281-a5b832240872)

**RESULT**

![Q2 Table](https://github.com/babit25/-Sidocomms_movies_management/assets/108529070/08a441db-0f28-41f5-8bb9-32511884c7ec)

3.	From the same list of films you just pulled, please roll that data up and provide a summary-level overview of your inventory. We would like to know how many inventory items you have with each rating at each store.
   
**QUERY**

![Q3](https://github.com/babit25/-Sidocomms_movies_management/assets/108529070/dde51c60-83f5-4eb9-9a00-4205be259e59)

**TOP 15 RESULT**

![Q3 Table](https://github.com/babit25/-Sidocomms_movies_management/assets/108529070/2eb88942-cb8d-478c-b54f-cde31e61e432)


4.	Similarly, we want to understand how diversified the inventory is in terms of replacement costs. We want to see how big of a hit it would be if a certain category of film became unpopular at a certain store. We would like to see the number of films, as well as the average replacement cost, and total replacement cost, sliced by store and film category.

**QUERY**

![Q4](https://github.com/babit25/-Sidocomms_movies_management/assets/108529070/a8ec3a85-d0b3-4461-a0eb-d3604be29dbe)


**TOP 15 RESULT**

![Q4 Table](https://github.com/babit25/-Sidocomms_movies_management/assets/108529070/e5e902bc-901e-4e54-8d9f-98a225c13aec)


5.	We want to make sure you folks have a good handle on who your customers are. Please provide a list of all customer names, which store they go to, whether or not they are currently active, and their full addresses – street address, city, and country.
   
   **QUERY**

 ![Q5](https://github.com/babit25/-Sidocomms_movies_management/assets/108529070/90ec04e7-9c15-4852-826d-f25807541500)
  
**TOP 15 RESULT**

![Q5 Table](https://github.com/babit25/-Sidocomms_movies_management/assets/108529070/10ebecd6-0d1b-417a-b35e-bdf050f15bf5)


6.	We would like to understand how much your customers are spending with you and also to know who your most valuable customers are. Please pull together a list of customer names, their total lifetime rentals, and the sum of all payments you have collected from them. It would be great to see this ordered on total lifetime value, with the most valuable customers at the top of the list.
   
**QUERY**'

![Q6](https://github.com/babit25/-Sidocomms_movies_management/assets/108529070/607b117f-08cc-423a-ba91-a8b5f3a63e84)


**TOP 15 RESULT**

![Q6 Table](https://github.com/babit25/-Sidocomms_movies_management/assets/108529070/b145fe69-2cb2-40ec-b187-a7fdaa1bcd8d)

7.	My partner and I would like to get to know your board of advisors and any current investors. Could you please provide a list of advisor and investor names in one table? Could you please note whether they are an investor or an advisor, for investors, it would be good to include which company they work with.

   Added new columns to the investor and advisor tables
   
   Query
   
   ![Q7 add Column](https://github.com/babit25/-Sidocomms_movies_management/assets/108529070/6e270159-8727-419c-a51d-6d98f3b607e5)
   
![Q7 new_tables](https://github.com/babit25/-Sidocomms_movies_management/assets/108529070/a87a4906-5d47-4cfe-94d4-5ea3a106a9ab)

**QUERY**

![Q7](https://github.com/babit25/-Sidocomms_movies_management/assets/108529070/b28ff27d-2de7-48d4-beb0-2da5a2eb8ea7)


**RESULT**

![Q7 Table](https://github.com/babit25/-Sidocomms_movies_management/assets/108529070/d9fb7c99-6f81-4f7f-8be2-a16bfc5ecae6)


8.	We’re interested in how well you have covered the most-awarded actors. Of all the actors with three types of awards, for what % of them do we carry a film? And how about actors with two types of awards? Same questions. Finally, how about actors with just one award?

**QUERY**

![Q8](https://github.com/babit25/-Sidocomms_movies_management/assets/108529070/617afe59-93e4-4bc9-8e7d-448ffaf92a73)


**RESULT**

![Q8 Table](https://github.com/babit25/-Sidocomms_movies_management/assets/108529070/b4e13c49-7c78-4601-910c-c71409dfb628)

# THE RESPONSE
Dear Elijah Moneybags,

Please find the information requested.
we hope to hear from you soon.

**Sidocomms Movies Management**

**THANK YOU**



