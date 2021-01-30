create view rented as
select i.film_id,if(max(r.rental_date)  like '%2006-02-14%','yes','no') as rented
from inventory as i
left join rental as r using (inventory_id) 
group by i.film_id
order by i.film_id;

select f.title, f.rental_duration, f.rental_rate,f.rating,c.name as category,count(r.rental_ID) as times_rented, r2.rented 
from film as f
join film_category as fc using(film_id)
join inventory as i using (film_id)
join rental as r using (inventory_id)
join rented as r2 using (film_id)
join category as c using (category_id)
group by f.title
order by f.title;
