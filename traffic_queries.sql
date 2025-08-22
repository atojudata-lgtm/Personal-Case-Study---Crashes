select * from State_Info;
select * from Crashes;
select State, AVG(Total_Crashes) AS Avg_Crashes from Crashes group by State order by Avg_Crashes DESC;
select c.State, s.Geopolitical_Zone, c.Total_Crashes from Crashes c inner join State_Info s on c.State= s.State where c.Year = 2023;
select c.State, s.Geopolitical_Zone, c.Quarter, c.Total_Crashes,c.Num_Killed from Crashes c inner JOIN State_Info s on c.State = s.State;