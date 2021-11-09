INSERT INTO users (name, email, password)
VALUES ('Bob Cat', 'bobthecat@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Ross Geller', 'rossgeller@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Max Stock', 'maxstock@gmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');


INSERT INTO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code)
VALUES (1, 'house of fun', 'description', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg', 100, 1, 2, 3,'Canada', '555 blackstone drive', 'Toronto', 'Ontario', '88888'),
(2, 'my dream catle', 'description', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg', 120, 3, 3, 3, 'Canada', '45 best street', 'Ottawa', 'Ontario', '12AA1'),
(3, 'a cabin in the woods', 'description', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg', 250, 4, 2, 4, 'Canada', '14 moon crescent', 'Mont Tremblent', 'Quebec', '48484'),
(1, 'luxurious penthouse', 'description', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg', 300, 2, 3, 6, 'Canada', '123 yellow brick road', 'New hamf', 'Nova Scotia', '2585');


INSERT INTO reservations (start_date, end_date, property_id, guest_id)
VALUES ('2018-09-11', '2018-09-26', 1,2),
('2019-01-04', '2019-02-01', 2,3),
('2018-09-11', '2018-09-26', 2,1),
('2019-01-04', '2019-02-01', 3,2),
('2022-10-04', '2022-10-23', 3,1),
('2023-05-27', '2023-05-28', 4,1),
('2023-04-23', '2023-05-02', 4,2);


INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message)
VALUES (1, 1, 1, 3, 'message'),
(2, 2, 2, 4, 'message'),
(3, 4, 3, 4, 'message'),
(1, 3, 4, 2, 'message'),
(2, 4, 5, 5, 'message'),
(3, 4, 6, 4, 'message');
