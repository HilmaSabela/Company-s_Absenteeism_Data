--Join Table--
/*
SELECT * 
FROM Absenteeism_at_work AS work
LEFT JOIN compensation AS comp
	ON work.ID = comp.ID
LEFT JOIN Reasons AS rea
	ON work.Reason_for_absence = rea.Number
*/

---Identification BMI---
SELECT work.ID
,work.Day_of_the_week
,work.Distance_from_Residence_to_Work
,work.Service_time
,work.Age
,work.Work_load_Average_day
,work.Hit_target
,work.Social_drinker
,work.Social_smoker
,work.Pet
,work.Weight
,work.Height
,work.Body_mass_index
,CASE WHEN Body_mass_index <= (18.5) Then 'Underweight'
	 WHEN Body_mass_index <= (24.9) Then 'Normal' 
	 WHEN Body_mass_index <= (29.9) Then 'Overweight' 
	 WHEN Body_mass_index >= (30) Then 'Obese'
	 ELSE 'Unkwon' END AS 'Classification'
,work.Absenteeism_time_in_hours
,comp.comp_hr
,UPPER(LEFT(rea.Reason,1)) + SUBSTRING(rea.Reason, 2, len(rea.Reason)) AS Reasons_of_absence
,CASE WHEN Month_of_absence IN (1) Then 'January'
	  WHEN Month_of_absence IN (2) Then 'February'
	  WHEN Month_of_absence IN (3) Then 'March' 
	  WHEN Month_of_absence IN (4) Then 'April'
	  WHEN Month_of_absence IN (5) Then 'Mei'
	  WHEN Month_of_absence IN (6) Then 'June'
	  WHEN Month_of_absence IN (7) Then 'July'
	  WHEN Month_of_absence IN (8) Then 'August'
	  WHEN Month_of_absence IN (9) Then 'September'
	  WHEN Month_of_absence IN (10) Then 'October'
	  WHEN Month_of_absence IN (11) Then 'November'
	  WHEN Month_of_absence IN (12) Then 'December'
	  ELSE 'Unkwon' END AS 'Name_of_Month'
,CASE WHEN Month_of_absence IN (12, 1, 2) Then 'Winter'
	 WHEN Month_of_absence IN (3, 4, 5) Then 'Spring'
	 WHEN Month_of_absence IN (6, 7, 8) Then 'Summer' 
	 WHEN Month_of_absence IN (9, 10, 11) Then 'Autumn'
	 ELSE 'Unkwon' END AS 'Name_of_Seasons'
FROM Absenteeism_at_work AS work
RIGHT JOIN compensation AS comp
	ON work.ID = comp.ID
RIGHT JOIN Reasons AS rea
	ON work.Reason_for_absence = rea.Number
WHERE work.ID IS NOT null
