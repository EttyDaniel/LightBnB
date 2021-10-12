SELECT properties.*, reservations.*, avg(rating) as average_rating
FROM reservations
JOIN properties ON reservations.property_id = properties.id
JOIN property_reviews ON properties.id = property_reviews.property_id
WHERE reservations.guest_id = 1
AND reservations.end_date < now()::date
GROUP BY properties.id, reservations.id
ORDER BY reservations.start_date
LIMIT 10;


/*
SELECT properties.id, properties.title, cost_per_night, start_date, AVG(rating) as average_rating
FROM reservations JOIN properties
ON reservations.property_id = properties.id
JOIN property_reviews
ON properties.id = property_reviews.property_id
WHERE reservations.guest_id = 1 AND end_date < now()
GROUP BY properties.id, start_date
ORDER BY start_date ASC
LIMIT 10;

*/