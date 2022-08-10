-- 1. All PropertyIDs and PropertyNames for Owner 1426

SELECT 
	p.Id AS PropertyID, p.Name AS PropertyName
FROM Property p
LEFT JOIN OwnerProperty op ON 
	p.Id=op.PropertyId 
WHERE 
	op.OwnerId = 1426;

-- 2. Current home value for the properties for Owner 1426.

SELECT
	p.Id AS PropertyID, p.Name AS PropertyName, hv.Value AS CurrentHomeValue
FROM Property p
LEFT JOIN OwnerProperty op ON 
	p.Id = op.PropertyId
LEFT JOIN PropertyHomeValue hv ON
	op.PropertyId = hv.PropertyId 
WHERE 
	op.OwnerId = 1426  AND 
	hv.IsActive =1 AND 
	hv.HomeValueTypeId = 1  -- HomeValueType = Current 
ORDER BY
	hv.Value DESC
	 

-- 3. 
SELECT 
	p.Id AS PropertyID, p.Name AS PropertyName, hv.Value AS CurrentHomeValue,
	CAST(tp.StartDate AS date) AS TenancyStartDate, CAST(tp.EndDate AS date) TenancyEndDate, 
	CASE 
		WHEN tp.PaymentFrequencyId = 1 -- Weekly
			THEN CONVERT(DECIMAL(10,2),(tp.PaymentAmount * DATEDIFF(Week, tp.StartDate,tp.EndDate)))
		WHEN tp.PaymentFrequencyId = 2 --Fortnightly 
			THEN CONVERT(DECIMAL(10,2),(tp.PaymentAmount * DATEDIFF(Week, tp.StartDate,tp.EndDate)/2))
		WHEN tp.PaymentFrequencyId = 3 --Monthly
			THEN CONVERT(DECIMAL(10,2),(tp.PaymentAmount * (DATEDIFF(Month, tp.StartDate ,tp.EndDate)+1)))
		ELSE 0 
	END AS TotalRent
FROM Property p
LEFT JOIN OwnerProperty op ON 
	p.Id = op.PropertyId
LEFT JOIN PropertyHomeValue hv ON
	p.Id = hv.PropertyId AND 
	hv.IsActive =1 AND 
	hv.HomeValueTypeId = 1  -- HomeValueType = Current 
LEFT JOIN TenantProperty tp ON
	p.id = tp.PropertyId
WHERE 
	op.OwnerId = 1426 
ORDER BY 
	TotalRent DESC
	



-- 4. Display the yield

SELECT 
	p.Id AS PropertyID, p.Name AS PropertyName,  pf.Yield AS PropertyYield
FROM Property p
LEFT JOIN OwnerProperty op ON 
	p.Id = op.PropertyId
LEFT JOIN PropertyHomeValue hv ON
	p.Id = hv.PropertyId AND 
	hv.IsActive =1 AND 
	hv.HomeValueTypeId = 1  -- HomeValueType = Current 
LEFT JOIN TenantProperty tp ON
	p.Id = tp.PropertyId	
LEFT JOIN PropertyFinance pf ON
	p.Id = pf.PropertyId
WHERE 
	op.OwnerId = 1426  
ORDER BY 
	pf.Yield DESC



-- 5. Display all available jobs

SELECT 
	 DISTINCT j.Id,j.PropertyId, j.JobDescription, COUNT(j.Id) AS No_Of_Jobs
FROM Job j
LEFT JOIN JobMedia jm  ON j.Id = jm.JobId
WHERE 	
	jm.IsActive = 1
GROUP BY
	j.Id, j.PropertyId,j.JobDescription;

	

--6. Display all property names, tenant first and last name, rental payments per week/fortnight/month  
--   for propeties owned by Owner 1426

SELECT 
	p.Id AS PropertyID, p.Name AS PropertyName, 
	CONCAT(pr.FirstName,' ', pr.LastName) AS CurrentTenantName,
	trt.Name AS PaymentFrequency, tp.PaymentAmount AS RentAmount
FROM Property p
INNER JOIN OwnerProperty op ON 
	p.Id = op.PropertyId
INNER JOIN TenantProperty tp ON
	p.id = tp.PropertyId AND
	tp.IsActive = 1			-- tenant is current
LEFT JOIN PropertyRentalPayment prp ON
	tp.PaymentFrequencyId = prp.Id
LEFT JOIN TargetRentType trt ON
	tp.PaymentFrequencyId = trt.Id
LEFT JOIN Person pr ON
	pr.Id = tp.TenantId
WHERE 
	op.OwnerId = 1426
ORDER BY
	tp.PaymentAmount DESC; 
	








