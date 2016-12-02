use irb2014;

drop table if exists Tweet;
create table Tweet (
  tweet_id varchar(32) generated always 
     as (json_unquote(json_extract(tweet_doc, '$.id_str'))) stored primary key,
  screen_name varchar(32) generated always 
     as (json_unquote(json_extract(tweet_doc, '$.user.screen_name'))) stored,
  created_at datetime generated always 
     as (str_to_date(json_unquote(json_extract(tweet_doc, '$.created_at')), 
     '%a %b %d %H:%i:%s +0000 %Y')) stored,
  favorite_count varchar(32) generated always 
     as (json_unquote(json_extract(tweet_doc, '$.favorite_count'))) stored,
  tweet_doc json,
  team_ID int,
  foreign key (Team_ID) references Team(Team_ID)
);