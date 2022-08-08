-- 1. All PropertyIDs and PropertyNames for Owner 1426

SELECT p.Id AS PropertyID, p.Name AS PropertyName
FROM Property p
LEFT JOIN OwnerProperty op ON 
	p.Id=op.PropertyId 
WHERE 
	op.OwnerId = 1426;



-- 2. Current home value for the properties for Owner 1426.

SELECT p.Id AS PropertyID, p.Name AS PropertyName, hv.Value AS CurrentHomeValue
FROM Property p
LEFT JOIN OwnerProperty op ON 
	p.Id = op.PropertyId
LEFT JOIN PropertyHomeValue hv ON
	op.PropertyId = hv.PropertyId AND 
	hv.IsActive =1 AND 
	hv.HomeValueTypeId = 1  -- HomeValueType = Current 
WHERE 
	op.OwnerId = 1426;
	 

-- 3. 
SELECT p.Id AS PropertyID, p.Name AS PropertyName, hv.Value AS CurrentHomeValue,tp.PaymentAmount,tp.PaymentFrequencyId ,
		CAST(tp.StartDate AS date) AS TenancyStartDate, CAST(tp.EndDate AS date) TenancyEndDate, 
		CASE 
			WHEN tp.PaymentFrequencyId = 1 -- Weekly
				THEN (tp.PaymentAmount * DATEDIFF(Week, tp.StartDate,tp.EndDate))
			WHEN tp.PaymentFrequencyId = 2 --Fortnightly 
				THEN (tp.PaymentAmount * DATEDIFF(Week, tp.StartDate,tp.EndDate)/2) 
			WHEN tp.PaymentFrequencyId = 3 --Monthly
				THEN (tp.PaymentAmount * (DATEDIFF(Month, tp.StartDate ,tp.EndDate)+1))
			ELSE 0 
		END AS TotalRent
FROM Property p
LEFT JOIN PropertyHomeValue hv ON
	p.Id = hv.PropertyId AND 
	hv.IsActive =1 AND 
	hv.HomeValueTypeId = 1  -- HomeValueType = Current 
LEFT JOIN TenantProperty tp ON
	p.id = tp.PropertyId
WHERE 
	tp.PropertyID IN ('5597','5637','5638');  



-- 4. Display the yield

SELECT p.Id AS PropertyID, p.Name AS PropertyName,  pf.Yield AS PropertyYield
FROM Property p
LEFT JOIN PropertyHomeValue hv ON
	p.Id = hv.PropertyId AND 
	hv.IsActive =1 AND 
	hv.HomeValueTypeId = 1  -- HomeValueType = Current 
LEFT JOIN TenantProperty tp ON
	p.Id = tp.PropertyId	
LEFT JOIN PropertyFinance pf ON
	p.Id = pf.PropertyId
WHERE 
	tp.PropertyId IN ('5597','5637','5638')  






