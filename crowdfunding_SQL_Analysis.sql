-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT ca.backers_count, ca.cf_id, ca.outcome
FROM campaign as ca
WHERE (ca.outcome = 'live')
ORDER BY ca.backers_count DESC;

-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT COUNT (bk.cf_id), bk.cf_id
FROM backers as bk
GROUP BY bk.cf_id
ORDER BY COUNT(bk.cf_id) DESC;


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT co.first_name, co.last_name, co.email, (ca.goal - ca.pledged) as remaining_goal_amount 
INTO email_contacts_remaining_goal_amount
FROM campaign as ca
INNER JOIN contacts as co
ON (ca.contact_id = co.contact_id)
WHERE (ca.outcome = 'live')
ORDER BY remaining_goal_amount DESC;

-- Check the table
SELECT * FROM email_contacts_remaining_goal_amount;

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT bk.email, bk.first_name, bk.last_name, ca.cf_id, ca.company_name, ca.description, (ca.goal - ca.pledged) as left_of_goal 
INTO email_backers_remaining_goal_amount
FROM campaign as ca
INNER JOIN backers as bk
ON (ca.cf_id = bk.cf_id)
WHERE (ca.outcome = 'live')
ORDER BY bk.last_name, bk.email;

-- Check the table
SELECT * FROM email_backers_remaining_goal_amount;