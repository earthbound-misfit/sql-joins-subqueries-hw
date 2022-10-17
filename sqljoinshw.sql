-- 1. List all customers who live in Texas (use JOINs)
select customer.first_name, customer.last_name, district from customer
full join address 
on customer.address_id = address.address_id
where district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full Name
select customer.first_name, customer.last_name, count(payment.amount) from payment
full join customer 
on customer.customer_id = payment.customer_id 
where payment.amount > 6.99
group by customer.first_name, customer.last_name 
order by count(amount) desc;


-- 3. Show all customers names who have made payments over $175
select distinct customer.customer_id, first_name, last_name, payment.amount from customer
left join payment
on customer.customer_id = payment.customer_id 
where payment.amount > 175


-- 4. List all customers that live in Nepal (use the city table) Answer ---> 1, Kevin Schuler

select first_name, last_name, country from customer 
full join address 
on customer.address_id = address.address_id 
full join city 
on address.city_id = city.city_id 
full join country 
on city.country_id = country.country_id 
where country = 'Nepal'


-- 5. Which staff member had the most transactions? Jon Stephens

select first_name, last_name, count(payment.staff_id)
from payment 
full join staff 
on staff.staff_id = payment.staff_id 
group by first_name, last_name;

-- 6. How many movies of each rating are there?
select count(film_id), rating
from film
group by rating;


-- 7. Show all customers who have made a single payment above $6.99? (Use Subqueries)
select first_name, last_name
from customer 
where customer_id in (
	select customer_id 
	from payment 
	group by customer_id, amount 
	having amount > 6.99
);

-- 8. How many free rentals did our stores give away? 

select count(amount) from payment where amount = 0;













