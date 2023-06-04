


--Q1.How many olympics games have been held?

select count(distinct games) as total_games from olympics_history;

--Q2.List down all Olympics games held so far.

select distinct years,season,city from olympics_history
order by years;


--Q3.Mention the total no of nations who participated in each olympics game?


select games,count(distinct region)as total from olympics_history
join olympics_history_noc_regions on olympics_history.noc=olympics_history_noc_regions.noc
group by games
order by games;



--Q4.Which game had the highest no of countries participating in olympics


SELECT games, COUNT(DISTINCT region) AS ParticipatingCountries
FROM Olympics_history
join olympics_history_noc_regions on olympics_history.noc=olympics_history_noc_regions.noc
GROUP BY games
ORDER BY ParticipatingCountries DESC
LIMIT 1;

--Q5.Which game has the lowest no of countries participating in olympics

select games,count(distinct region)as participatingcountries from olympics_history
join olympics_history_noc_regions on olympics_history.noc=olympics_history_noc_regions.noc
group by games
order by participatingcountries asc
limit 1;


--Q6.Which nation has participated in all of the olympic games

select region,count(distinct games) from olympics_history
join olympics_history_noc_regions on olympics_history.noc=olympics_history_noc_regions.noc
group by region 
having count(distinct games)>=51;

--Q7.Identify the sport which was played in all summer olympics.

 SELECT sport
FROM olympics_history
WHERE season = 'Summer'
GROUP BY sport
HAVING COUNT(DISTINCT games) = (SELECT COUNT(DISTINCT games) FROM olympics_history WHERE season = 'Summer');

--Q8.Which Sports were just played only once in the olympics.

 SELECT sport
FROM olympics_history
GROUP BY sport
HAVING COUNT(DISTINCT games) = 1;


--Q9.Fetch the total no of sports played in each olympic games.

select games,count(distinct sport) from olympics_history
group by games
order by count(distinct sport) desc,games asc;


--Q10.Fetch the top 5 athletes who have won the most gold medals.

  select name,count(medal) from olympics_history
  where medal='Gold' 
  group by name
  order by count(medal) desc
  limit 5;

--Q11.Fetch the top 5 athletes who have won the most medal.

SELECT name, COUNT(medal) AS total_medals
FROM olympics_history
WHERE medal <> 'NA'
GROUP BY name
ORDER BY total_medals DESC
LIMIT 5;


--Q12.Fetch the top 5 most successful countries in olympics. Success is defined by no of medals won.

SELECT noc, COUNT(*) AS total_medals
FROM olympics_history
WHERE medal <> 'NA'
GROUP BY noc
ORDER BY total_medals DESC;



















