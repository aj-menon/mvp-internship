
SELECT p.Id AS PropertyId, p.Name AS PropertyName, CONCAT(pr.FirstName,' ',pr.LastName) AS FullName,
CONCAT(a.Number,' ',a.Street,', ',a.Suburb,', ',a.PostCode,', ',a.Region,', ',c.Name) AS PropertyAddress,
(CASE 
	WHEN p.Bedroom >1 and p.Bathroom >1 THEN CONCAT(p.bedroom,' Bedrooms, ',p.Bathroom,' Bathrooms')
	ELSE CONCAT(p.Bedroom,' Bedroom, ',p.Bathroom,' Bathroom')
END ) AS BedBath,
(CASE 
	WHEN trt.Name ='Weekly' THEN CONCAT(prt.Amount, ' per week')
	WHEN trt.Name ='Fortnightly' THEN CONCAT(prt.Amount, ' per fortnight')
	WHEN trt.Name='Monthly' THEN CONCAT(prt.Amount, ' per month')
	ELSE NULL
END )AS RentalAmt, pe.DescriptiON AS Expense, pe.Date AS ExpenseDate, pe.Amount AS ExpenseAmt
FROM Property p
LEFT JOIN OwnerProperty o ON  
	p.Id = o.PropertyId
INNER JOIN PersON pr ON 
	pr.Id = o.OwnerId
INNER JOIN Address a ON 
	a.AddressId = p.AddressId
INNER JOIN Country c ON 
	c.Id = a.CountryId
INNER JOIN  PropertyRentalPayment prt 
	ON prt.PropertyId =p.Id
INNER JOIN TargetRentType trt ON 
	trt.id = p.TargetRentTypeId
INNER JOIN PropertyExpense pe ON 
	pe.PropertyId = p.Id
WHERE 
	p.Name = 'Property A';

