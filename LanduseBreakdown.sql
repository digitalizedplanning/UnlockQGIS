SELECT LU_DESC, round(SUM(st_area(geometry))/10000,1) AS hectares, 
       round(
		((SUM(st_area(geometry))) / 
		(SELECT SUM(st_area(geometry)) FROM MasterPlan2014LandUseChangi)
		* 100),	1) 
	   AS percent
FROM MasterPlan2014LandUseChangi
GROUP BY LU_DESC
UNION ALL
SELECT 'Total' AS LU_DESC, 
	round((SUM(st_area(geometry)))/10000,1) AS hectares, 
	100 AS percent
FROM MasterPlan2014LandUseChangi

