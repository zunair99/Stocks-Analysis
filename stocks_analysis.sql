-- Stock Price Analysis for 5 firms, analyzing changing in closing stock prices over a period of 4 months
-- Data found from: https://www.cnbc.com/nasdaq-100/

-- Stock Prices that were above the average relative stock price (All from Amazon)
SELECT * FROM Stocks
WHERE Price >(
	SELECT AVG(Price) FROM Stocks
);

-- Stocks ordered by price from lowest to highest
SELECT * FROM Stocks
ORDER BY Price;

-- Stocks ordered by price from highest to lowest
SELECT * FROM Stocks
ORDER BY Price DESC;

-- Stocks ordered by Symbol
SELECT * FROM Stocks
GROUP BY Price;  

-- Selecting companies that have stocks with a price above $100
SELECT Name FROM Stocks
WHERE Price > 100;
-- All 5 companies have stock prices that are all above $100

 -- Selecting companies that have stocks with a price above $1000
SELECT Name FROM Stocks
WHERE Price > 1000;
-- Amazon.com Inc is the only company with stock prices above $1000


-- Determining the minimum stock price for each company (Same can be done to find maximum stock price for each company, simply replace the MIN() function with the MAX() function
SELECT MIN(Price) FROM Stocks
WHERE Name = 'Amazon.com Inc';
-- Minimum Amazon.com Inc stock price: 3299.18
SELECT MIN(Price) FROM Stocks
WHERE Name = 'Advanced Micro Devices';
-- Minimum Advanced Micro Devices stock price: 108.16
SELECT MIN(Price) FROM Stocks
WHERE Name = 'Align Technology Inc';
-- Minimum Align Technology Inc stock price: 589.81
SELECT MIN(Price) FROM Stocks
WHERE Name = 'Adobe Inc';
-- Minimum Adobe Inc stock price: 603.65
SELECT MIN(Price) FROM Stocks
WHERE Name = 'Amgen Inc';
-- Minimum Adobe Inc stock price: 203.97

--Calculating the overall median Stock Price: 625.31
SELECT AVG(Price)
FROM (SELECT Price
      FROM Stocks
      ORDER BY Price
      LIMIT 2 - (SELECT COUNT(*) FROM Stocks) % 2    -- odd 1, even 2
      OFFSET (SELECT (COUNT(*) - 1) / 2
              FROM Stocks));

-- Creating 2 Sub-Divided Data Tables from the Primary Stocks Tables  
CREATE TABLE Stocks_Information AS SELECT Symbol, Name FROM Stocks; -- New table to look at information regarding a stock company only
CREATE TABLE Stocks_Prices AS SELECT Symbol, datetime, Price FROM Stocks; -- New table to look at price information regarding stocks only

-- Joined table created  
SELECT Price,Name FROM Stocks_Information
INNER JOIN Stocks_Prices ON Stocks_Prices.Symbol = Stocks_Information.Symbol;

