alter table server_logs add column Session_Dur
update server_logs set Session_Dur=24*60*(julianday(Session_End)-julianday(Session_Start))

create view v_users_activity as
select users.User_ID as User_ID, users.First_Name as First_Name, users.Last_Name as Last_Name, count(Log_ID) as Num_Sessions,sum(Session_Dur) as Total_Session_Time from users 
left join server_logs on users.User_ID=server_logs.User_ID
group by First_Name
order by Total_Session_Time desc
