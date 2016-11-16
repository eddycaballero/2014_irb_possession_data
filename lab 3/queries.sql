SELECT Origin, count(Poss_ID) 
FROM Possession 
group by origin 
order by count(poss_ID) DESC;

CREATE VIEW Close_Games_Raw as 
select Team_1 as Team1,(select distinct t.Team_Name from team t inner join game g on t.Team_ID = g.Team_1 where g.Team_1 = Team1) as 
Team1Name, Score_1, Score_2, Team_2 as Team2, (select distinct t.Team_Name from team t inner join game g on t.Team_ID = g.Team_2 where g.Team_2 = Team2) as Team2Name 
from game g inner join tournament t on g.T_ID = t.T_ID where (abs(Score_1 - Score_2) < 7) 
order by t.T_Date;

SELECT Team1Name as Team_1, Score_1, Score_2, Team2Name as Team_2 
from Close_Games_Raw 
order by abs(Score_1 - Score_2) ASC;


CREATE VIEW Blowouts_Raw as 
select Team_1 as Team1,(select distinct t.Team_Name from team t inner join game g on t.Team_ID = g.Team_1 where g.Team_1 = Team1) as Team1Name, Score_1, Score_2, Team_2 as Team2, (select distinct t.Team_Name from team t inner join game g on t.Team_ID = g.Team_2 where g.Team_2 = Team2) as Team2Name 
from game g inner join tournament t on g.T_ID = t.T_ID 
where (abs(Score_1 - Score_2) > 21) 
order by t.T_Date;



SELECT Team1Name as Team_1, Score_1, Score_2, Team2Name as Team_2 
from Blowouts_Raw 
order by abs(Score_1 - Score_2) DESC;

SELECT t.Team_Name, origin, count(poss_ID) 
from Team t inner join possession p on t.Team_ID = p.Team_ID 
where t.Team_ID = [1] group by p.Origin;



create view Choose_Diff_Raw as 
select Team_1 as Team1,(select distinct t.Team_Name from team t inner join game g on t.Team_ID = g.Team_1 where g.Team_1 = Team1) as Team1Name, Score_1, Score_2, Team_2 as Team2, (select distinct t.Team_Name from team t inner join game g on t.Team_ID = g.Team_2 where g.Team_2 = Team2) as Team2Name 
from game g inner join tournament t on g.T_ID = t.T_ID where (abs(Score_1 - Score_2) < [6]) 
order by t.T_Date;

select Team1Name as Team_1, Score_1, Score_2, Team2Name as Team_2 
from Choose_Diff_Raw 
order by abs(Score_1 - Score_2) ASC;


create view Tournaments_Played as 
select t.team_name, tour.T_ID as Tournament_ID, (select Tournament.T_Name from Tournament where T_ID = Tournament_ID) as Tournament_Name, (select Tournament.T_Date from Tournament where T_ID = Tournament_ID) as Date 
from Team t left outer join Team_Tournament tour on tour.Team_ID = t.Team_ID;


select Tournament_Name 
from Tournaments_Played 
where team_name = ['Argentina 7s'];

Select team_name, count(*) 
from Tournaments_Played 
group by team_name 
having count(*) < 4;


select Team_Name 
from Tournaments_Played 
group by Team_Name 
having count(*) = 9;

select Team_Name, count(Tournament_ID) 
from Tournaments_Played 
group by Team_Name 
having count(*) >= [1] and count(*) <= [9];


create view Tournament_Winner_Raw as 
select T_ID as Tournament_ID, (select Tournament.T_Name from Tournament where T_ID = Tournament_ID) as Tournament_Name, winner 
from game 
where T_Game_Number = 45;


select Tournament_Name, winner as Winner 
From Tournament_Winner_Raw;








































