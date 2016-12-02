select t.team_name, t.team_ID, count(*) as tweet_count
from Team t join Tweet s
on t.Team_ID = s.team_ID
group by t.team_name, t.team_ID
order by tweet_count desc;

select t.team_name, t.team_ID, count(s.tweet_id) as tweet_count
from Team t left outer join Tweet s
on t.team_ID = s.team_ID
group by t.team_name, t.team_ID
order by tweet_count desc;


select t.team_name, t.team_ID, count(distinct s.screen_name) as user_count
from Team t left outer join Tweet s
on t.team_ID = s.team_ID
group by t.team_name, t.team_ID
order by user_count desc;

select t.team_name, t.team_ID, count(s.favorite_count) as favorites
from Team t left outer join Tweet s
on t.team_ID = s.team_ID
where favorite_count > 0
group by t.team_name, t.team_ID
order by favorites desc;

select screen_name, favorite_count
from tweet
where favorite_count > 0
order by favorite_count desc;








