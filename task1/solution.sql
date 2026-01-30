create view v_users_age as 
  select first_name, last_name, age from users where age<=30 and age>=20 order by users.age

