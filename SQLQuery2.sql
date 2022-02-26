SELECT * 
FROM dbo.housing;

SELECT PropertyAddress
FROM dbo.housing;

SELECT *
FROM housing;

SELECT UniqueID
FROM housing
WHERE UniqueID IS NULL;

SELECT ParcelID
FROM housing
WHERE ParcelID IS NULL;

SELECT LandUse
FROM housing
WHERE LandUse IS NULL;

SELECT PropertyAddress
FROM housing
WHERE PropertyAddress IS NULL;


SELECT COUNT(*)
FROM housing
WHERE PropertyAddress IS NULL;

SELECT ParcelID, PropertyAddress,OwnerAddress
FROM housing
WHERE PropertyAddress IS NULL
ORDER BY ParcelID ASC;

SELECT * 
FROM housing h1
JOIN housing h2
ON h1.ParcelID=h2.ParcelID
AND h1.[UniqueID ]!= h2.[UniqueID ];



SELECT h1.ParcelID,h2.PropertyAddress 
FROM housing h1
JOIN housing h2
ON h1.ParcelID=h2.ParcelID
AND h1.[UniqueID ]!= h2.[UniqueID ] ;


SELECT h1.ParcelID,h1.PropertyAddress,h2.ParcelID,h2.PropertyAddress,h1.[UniqueID ],h2.[UniqueID ]
FROM housing h1
JOIN housing h2
ON h1.ParcelID=h2.ParcelID
AND h1.[UniqueID ]!= h2.[UniqueID ] 
WHERE h1.PropertyAddress IS NULL;

UPDATE h1
SET
h1.PropertyAddress=h2.PropertyAddress
FROM housing h1
JOIN housing h2
ON h1.ParcelID=h2.ParcelID
AND h1.[UniqueID ]!= h2.[UniqueID ] 
WHERE h1.PropertyAddress IS NULL;


SELECT * 
FROM housing;

SELECT PropertyAddress
FROM housing;


SELECT 
PARSENAME(REPLACE(PropertyAddress,',','.'),1) AS Address,
PARSENAME(REPLACE(PropertyAddress,',','.'),2) AS City
FROM housing;

ALTER TABLE housing
ADD Address1 VARCHAR(100), City VARCHAR(100);

SELECT *
FROM housing;

UPDATE housing
SET Address1=PARSENAME(REPLACE(PropertyAddress,',','.'),2),
City=PARSENAME(REPLACE(PropertyAddress,',','.'),1);

SELECT *
FROM housing;

ALTER TABLE housing
DROP COLUMN ProAddress;

SELECT *
FROM housing;

SELECT SaleDate
FROM housing;

SELECT SaleDate, CONVERT(DATE,SaleDate) AS Date2
FROM housing;

UPDATE housing
SET SaleDate=CONVERT(DATE,SaleDate);

SELECT SaleDate
FROM housing;

ALTER TABLE housing
ADD SaleDate1 Date;

UPDATE housing
SET SaleDate1=CONVERT(DATE,SaleDate);

ALTER TABLE housing
DROP COLUMN date1;
ALTER TABLE housing
DROP COLUMN SaleDate;


ALTER TABLE housing
ADD OwnerAddress1 VARCHAR(100), OwnerCity VARCHAR(100);
ALTER TABLE housing
Add OwnerState VARCHAR(100);

SELECT OwnerAddress
FROM housing;

UPDATE housing
SET OwnerAddress1=PARSENAME(REPLACE(OwnerAddress,',','.'),3),
OwnerCity=PARSENAME(REPLACE(OwnerAddress,',','.'),2),
OwnerState=PARSENAME(REPLACE(OwnerAddress,',','.'),1);

SELECT SoldAsVacant
FROM housing;

SELECT DISTINCT SoldAsVacant ,count(SoldAsVacant)
FROM housing
GROUP BY SoldAsVacant;

SELECT SoldAsVacant,
CASE 
    WHEN SoldAsVacant='Y' THEN 'Yes'
	WHEN SoldAsVacant='N' THEN 'No'
	ELSE SoldAsVacant
END 
FROM housing;

UPDATE housing
SET SoldAsVacant=
CASE 
    WHEN SoldAsVacant='Y' THEN 'Yes'
	WHEN SoldAsVacant='N' THEN 'No'
	ELSE SoldAsVacant
END 

SELECT DISTINCT SoldAsVacant ,count(SoldAsVacant)
FROM housing
GROUP BY SoldAsVacant;


SELECT UniqueID, COUNT(UniqueID)
FROM housing
GROUP BY [UniqueID ]
HAVING COUNT([UniqueID ])>1;


WITH RowNumCTE  AS(
SELECT *,
ROW_NUMBER() OVER(
           PARTITION BY ParcelID,PropertyAddress, OwnerAddress,SalePrice,LegalReference
		   ORDER BY UniqueID
		   ) As Row_Num

FROM housing
)

DELETE 
FROM RowNumCTE
WHERE Row_Num>1

SELECT *
FROM housing

AL


























