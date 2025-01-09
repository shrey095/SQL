create database PROJECT;
use project;

select * from laptop_dataset;

alter table laptop_dataset change column ï»¿Company company text;
alter table laptop_dataset change column `CPU_Frequency (GHz)` CPU_Frequency_GHz double;
alter table laptop_dataset change column `RAM (GB)` ram_gb int;
alter table laptop_dataset change column `weight (kg)` weight_kg int;
alter table laptop_dataset change column `Price(inr)` price_inr int;



-- 1) What are the top 5 most expensive laptops in the dataset?
SELECT 
    *
FROM
    laptop_dataset
ORDER BY price_inr DESC
LIMIT 5;

-- INSIGHT :- Knowing the top 5 most expensive models gives insight into the high-end market and showcases which features or brands command the highest prices. 
-- These models likely focus on cutting-edge performance and luxury features.


-- 2)What is the average price of laptops in the dataset?
SELECT 
    AVG(price_inr)
FROM
    laptop_dataset;

--  -> '105847.2659' is average price of laptops in dataset.
-- INSIGHT :-The average price gives an understanding of the general price level for laptops. 
-- It helps identify if the market is skewed toward high-end or budget models.

-- 3) How many laptop brand company in data set?
SELECT 
    COUNT(DISTINCT company) AS count
FROM
    laptop_dataset;

-- here total 19 company laptops in this data set 

-- 4)What is the price range of laptops in the dataset?
SELECT 
    MIN(price_inr) AS min_price, MAX(price_inr) AS max_price
FROM
    laptop_dataset;
    
-- INSIGHT: The price range reveals the spread of laptops, from budget models to premium ones. 
-- This helps identify the type of consumers the market serves and what gaps might exist for certain price points.    

-- 5) Which laptop model has the highest RAM at the lowest price?
SELECT 
    *
FROM
    laptop_dataset
ORDER BY ram_gb DESC , price_inr
LIMIT 1;

-- INSIGHT:- This insight identifies the best deal for consumers looking for high-performance memory without paying premium prices, 
-- which is a valuable marketing tool for cost-conscious buyers.

-- 6)What is the most common screen size in the dataset?
SELECT 
    inches, COUNT(inches) AS count
FROM
    laptop_dataset
GROUP BY inches
ORDER BY count DESC
LIMIT 1;

-- 15.6 inches screen size is the most common screen size in the dataset.
-- INSIGHT: Knowing the most common screen size helps in understanding consumer demand and preferences. 
-- This can guide manufacturers in deciding the optimal screen size for mass production.

-- 7)Which laptop brand offers the most models in the dataset?
SELECT 
    company, COUNT(product) AS total_product
FROM
    laptop_dataset
GROUP BY company
ORDER BY total_product DESC;

-- 8)Which brand has the highest average laptop price?
SELECT 
    company, AVG(price_inr) AS average_price
FROM
    laptop_dataset
GROUP BY company
ORDER BY average_price DESC
LIMIT 1;

-- 9) How many laptops have more than 8GB of RAM?
SELECT 
    COUNT(*)
FROM
    laptop_dataset
WHERE
    ram_gb > 8;
-- 244 laptops have more than 8gb ram

-- 10) how many laptops have more than 2 kg of weight?
SELECT 
    COUNT(*)
FROM
    laptop_dataset
WHERE
    weight_kg > 2;
-- 204 laptops have more than 2 kg of weight.

-- 11)How many laptops have SSD storage?
SELECT 
    COUNT(*)
FROM
    laptop_dataset
WHERE
    memory LIKE '%ssd%';

-- 837 laptops have ssd storage.

-- 12)Which processor is the most common in the dataset?
SELECT 
    cpu_company, COUNT(*)
FROM
    laptop_dataset
GROUP BY cpu_company;

-- -- intel processor is the most common in the datset

-- -- 13)What is the average price of gaming laptops?
SELECT 
    AVG(price_inr) AS avg_gaming_laptop_price
FROM
    laptop_dataset
WHERE
    typename = 'gaming';
-- 161468.6683 is the average price of gaming laptops.

-- -- 14) How does weight impact the price of laptops?
SELECT 
    weight_kg, AVG(price_inr) AS average_price
FROM
    laptop_dataset
GROUP BY weight_kg
ORDER BY weight_kg;

-- -- nsight: Lighter laptops, which tend to be more portable, are often priced higher due to their engineering and design 
-- -- (e.g., ultrabooks or premium laptops), offering convenience for on-the-go users.


-- -- 15)Which laptop models have both SSD and HDD storage?
SELECT 
    product, memory
FROM
    laptop_dataset
WHERE
    memory LIKE '%SSD%'
        AND memory LIKE '%HDD%';

-- -- Insight: Models with both SSD and HDD offer a balance between speed (SSD) and storage capacity (HDD). 
-- -- These hybrid models can be marketed as versatile options for both performance and storage needs.

-- -- 16) What is the price distribution of laptops in different price ranges (e.g., budget, mid-range, high-end)?
SELECT 
    CASE
        WHEN price_inr < 50000 THEN 'Budget'
        WHEN price_inr BETWEEN 50000 AND 120000 THEN 'Mid-range'
        ELSE 'High-end'
    END AS price_range,
    COUNT(*) AS laptop_count
FROM
    laptop_dataset
GROUP BY price_range;


-- 17) What is the most common operating system(os) in the dataset?
SELECT 
    opsys, COUNT(*) AS count
FROM
    laptop_dataset
GROUP BY opsys
ORDER BY opsys DESC;

-- 18) How many laptops have more than 16GB of RAM?
SELECT 
    COUNT(*)
FROM
    laptop_dataset
WHERE
    ram_gb > 16;

-- Insight: Shows the availability of high-performance laptops, often preferred by gamers or power users.

-- 19)Which company has the lightest laptop on average?
SELECT 
    company, AVG(weight_kg) AS avg_weight
FROM
    laptop_dataset
GROUP BY company
ORDER BY avg_weight;

-- Insight: Highlights companies that focus on ultra-portability, appealing to users who prioritize lightweight designs.

-- 20)What is the average CPU frequency by company?
SELECT 
    company, AVG(CPU_Frequency_GHz) AS avg_cpu_frequency
FROM
    laptop_dataset
GROUP BY company;
 
--  Insight: Reveals which companies tend to equip their laptops with faster processors, potentially indicating better performance.
 
-- 21)What is the average screen size for each company?
SELECT 
    company, AVG(Inches) AS avg_screen_size
FROM
    laptop_dataset
GROUP BY company;

-- Insight: Shows whether a company targets compact devices or larger, more media-centric laptops.

-- 22) How many laptops are in the dataset by each GPU company?
SELECT 
    GPU_Company, COUNT(*) AS count
FROM
    laptop_dataset
GROUP BY GPU_Company;

-- Insight: Indicates which GPU manufacturers dominate the market, providing insight into trends in graphics processing.

-- 23)What is the average price of laptops that have NVIDIA GPUs?
SELECT 
    AVG(price_inr) AS avg_price
FROM
    laptop_dataset
WHERE
    GPU_Company = 'NVIDIA';

-- Insight: Highlights the cost premium associated with NVIDIA GPUs, commonly found in gaming or high-performance laptops.

-- 24)Which operating system has the highest average price?
SELECT 
    OpSys, AVG(price_inr) AS avg_price
FROM
    laptop_dataset
GROUP BY OpSys
ORDER BY avg_price DESC;

-- Insight: Demonstrates how operating systems affect pricing, with macOS typically commanding higher prices than Windows or Linux.

-- 25)  What is the most common CPU type in the dataset?
SELECT 
    CPU_Type, COUNT(*) AS count
FROM
    laptop_dataset
GROUP BY CPU_Type
ORDER BY count DESC
LIMIT 1;

-- Insight: Shows which CPU models are most popular, reflecting user preferences for different performance levels.

-- 26)How many laptops weigh less than 2kg?
SELECT 
    COUNT(*)
FROM
    laptop_dataset
WHERE
    weight_kg < 2;

-- Insight: Provides an overview of how many lightweight laptops are available, catering to users who value portability.

-- 27) What is the average price of gaming laptops (with 16GB RAM and NVIDIA GPU)?
SELECT 
    AVG(price_inr) AS avg_price
FROM
    laptop_dataset
WHERE
    ram_gb = 16 AND GPU_Company = 'NVIDIA';

-- Insight: Establishes the cost of gaming or performance laptops, which often have higher specifications.

-- 28)Which company has the most products with SSD storage?
SELECT 
    company, COUNT(*) AS count
FROM
    laptop_dataset
WHERE
    Memory LIKE '%SSD%'
GROUP BY company
ORDER BY count DESC;

-- Insight: Shows which companies are leading the shift toward faster storage technologies.

-- 29) What is the average price of laptops by screen size (inches)?
SELECT 
    Inches, AVG(price_inr) AS avg_price
FROM
    laptop_dataset
GROUP BY Inches
ORDER BY avg_price DESC;

-- Insight: Reveals the impact of screen size on price, with larger screens typically costing more.

-- 30) What is the average weight of laptops by screen size?
SELECT 
    Inches, AVG(weight_kg) AS avg_weight
FROM
    laptop_dataset
GROUP BY Inches;

-- Insight: Highlights how screen size correlates with weight, as larger screens generally lead to heavier laptops.

-- 31) Which laptop company offers the largest variety of CPU types?
SELECT 
    company, COUNT(DISTINCT CPU_Type) AS unique_cpu_types
FROM
    laptop_dataset
GROUP BY company
ORDER BY unique_cpu_types DESC;

-- Insight: Shows which company provides the most diverse range of processor options, appealing to various user needs.

-- 32) What is the total number of laptops with more than 1TB of storage?
SELECT 
    COUNT(*)
FROM
    laptop_dataset
WHERE
    Memory LIKE '%1TB%'
        OR Memory LIKE '%2TB%';

-- Insight: Indicates the availability of high-storage models, useful for data-intensive users.

-- 33)What is the average price of laptops with AMD CPUs?
SELECT 
    AVG(price_inr) AS avg_price
FROM
    laptop_dataset
WHERE
    CPU_Company = 'AMD';

-- Insight: Compares the pricing of AMD-based laptops to Intel-based ones, helping consumers choose based on budget and performance.

-- 34) Which company offers the most variety in GPU types?
SELECT 
    company, COUNT(DISTINCT GPU_Type) AS unique_gpus
FROM
    laptop_dataset
GROUP BY company
ORDER BY unique_gpus DESC;

-- Insight: Demonstrates which company provides the widest range of graphics options, catering to different user needs (e.g., gaming vs. productivity).

-- 35)How many laptops have a screen size greater than 15 inches?
SELECT 
    COUNT(*)
FROM
    laptop_dataset
WHERE
    Inches > 15;

-- Insight: Provides an overview of large-screen laptops available, typically used for gaming, media consumption, or productivity.

-- 36)Which CPU company is most commonly used in laptops?
SELECT 
    CPU_Company, COUNT(*) AS count
FROM
    laptop_dataset
GROUP BY CPU_Company
ORDER BY count DESC
LIMIT 1;

-- Insight: Shows the dominance of Intel or AMD processors in the market, reflecting consumer and industry preferences.

-- 37) What is the highest frequency CPU in a laptop with a screen size of less than 14 inches?
SELECT 
    Product, CPU_Frequency_GHz
FROM
    laptop_dataset
WHERE
    Inches < 14
ORDER BY CPU_Frequency_GHz DESC
LIMIT 1;

-- Insight: Identifies compact laptops with powerful CPUs, ideal for users seeking performance in a small form factor.

-- 38)Which company offers the most high-end laptops (price > 1,00,000 INR)?
SELECT 
    company, COUNT(*) AS high_end_laptops
FROM
    laptop_dataset
WHERE
    price_inr > 100000
GROUP BY company
ORDER BY high_end_laptops DESC;

-- Insight: Highlights premium brands and their focus on high-performance, luxury laptops.


-- 39) What is the distribution of laptops by RAM size?
SELECT 
    ram_gb, COUNT(*) AS count
FROM
    laptop_dataset
GROUP BY ram_gb
ORDER BY ram_gb;

-- Insight: Shows the most common RAM configurations, helping to understand the typical performance level of available laptops.

-- 40) What is the average price of laptops with an Intel CPU?
SELECT 
    AVG(price_inr) AS avg_price
FROM
    laptop_dataset
WHERE
    CPU_Company = 'Intel';

-- Insight: Compares the price of Intel-based laptops, which often dominate the market, with other CPU brands.

-- 41) How many laptops run on Windows OS?
SELECT 
    COUNT(*)
FROM
    laptop_dataset
WHERE
    OpSys LIKE '%Windows%';

-- Insight: Indicates the popularity of Windows among laptop manufacturers, the most common OS for general consumers.

-- 42) Which company produces the heaviest laptops on average?
SELECT 
    company, AVG(weight_kg) AS avg_weight
FROM
    laptop_dataset
GROUP BY company
ORDER BY avg_weight DESC;

--  Insight: Identifies brands that focus on more powerful, perhaps gaming-focused or workstation-class devices, which tend to be heavier.

-- 43)What is the price difference between laptops with SSD vs HDD storage?
SELECT 
    Memory, AVG(price_inr) AS avg_price
FROM
    laptop_dataset
WHERE
    Memory LIKE '%SSD%'
        OR Memory LIKE '%HDD%'
GROUP BY Memory
ORDER BY avg_price DESC;

-- Insight: Demonstrates the cost premium associated with SSDs, reflecting their faster performance compared to traditional HDDs.

-- 44)Which GPU company offers the most affordable laptops on average?
SELECT 
    GPU_Company, AVG(price_inr) AS avg_price
FROM
    laptop_dataset
GROUP BY GPU_Company
ORDER BY avg_price ASC;

-- Insight: Highlights the GPU brand that provides the most budget-friendly options, useful for price-conscious consumers.

-- 45)Which laptop has the smallest screen size?
SELECT 
    Product, Inches
FROM
    laptop_dataset
ORDER BY Inches ASC
LIMIT 1;

-- Insight: Identifies the most compact laptop, appealing to users who need ultra-portability.

-- 46)What is the average price of laptops with screen sizes less than 14 inches?
SELECT 
    AVG(price_inr) AS avg_price
FROM
    laptop_dataset
WHERE
    Inches < 14;


-- Insight: Shows the price trend of small-screen laptops, typically for users who prioritize portability over large displays.

-- 47)Which laptop has the lowest price?
SELECT 
    Product, price_inr
FROM
    laptop_dataset
ORDER BY price_inr ASC
LIMIT 1;

-- Insight: Highlights the most budget-friendly option, valuable for consumers looking for affordable laptops.

-- 48) How many laptops have 4K screen resolution?
SELECT 
    COUNT(*)
FROM
    laptop_dataset
WHERE
    ScreenResolution LIKE '%3840x2160%';

-- Insight: Indicates the availability of ultra-high-resolution laptops, which are popular for media consumption and creative professionals.


-- 49)What is the most common storage configuration in laptops?
SELECT 
    Memory, COUNT(*) AS count
FROM
    laptop_dataset
GROUP BY Memory
ORDER BY count DESC
LIMIT 1;

-- Insight: Identifies the most popular storage options, whether SSD, HDD, or hybrid configurations.

-- 50) Which company has the most models with dedicated GPUs?
SELECT 
    company, COUNT(*) AS dedicated_gpu_laptops
FROM
    laptop_dataset
WHERE
    GPU_Type IS NOT NULL
GROUP BY company
ORDER BY dedicated_gpu_laptops DESC;

-- Insight: Shows which companies cater to gamers and professionals who require dedicated graphics cards for performance.

-- 51) What is the most common operating system in the dataset?
SELECT 
    OpSys, COUNT(*) AS count
FROM
    laptop_dataset
GROUP BY OpSys
ORDER BY count DESC;

-- Insight: Highlights the dominant OS in the dataset, giving a sense of market trends.

-- 52)Which company has the most lightweight laptops (weight < 1.5kg)?
SELECT 
    company, COUNT(*) AS lightweight_laptops
FROM
    laptop_dataset
WHERE
    weight_kg < 1.5
GROUP BY company
ORDER BY lightweight_laptops DESC;

-- Insight: Identifies brands that focus on ultra-light laptops, targeting frequent travelers and portable workstations.

-- 53)What is the average price of laptops with an AMD Ryzen CPU?
SELECT 
    AVG(price_inr) AS avg_price
FROM
    laptop_dataset
WHERE
    CPU_Type LIKE '%Ryzen%';

-- Insight: Compares Ryzen-based laptops' pricing, reflecting AMD's competitive positioning in the CPU market.

-- 54) Which laptop has the most storage capacity?
SELECT 
    Product, Memory
FROM
    laptop_dataset
ORDER BY LENGTH(Memory) DESC
LIMIT 1;

-- Insight: Highlights the model with the most storage, ideal for users who need vast amounts of space for files, media, or data.

-- 55)How many laptops have a touchscreen display?
SELECT 
    COUNT(*)
FROM
    laptop_dataset
WHERE
    ScreenResolution LIKE '%Touchscreen%';

-- Insight: Shows the popularity of touchscreen-enabled laptops, often appealing to creative professionals or casual users.

-- 56)Which company offers the largest variety of RAM configurations?
SELECT 
    company, COUNT(DISTINCT ram_gb) AS unique_ram_configs
FROM
    laptop_dataset
GROUP BY company
ORDER BY unique_ram_configs DESC;

-- Insight: Demonstrates which company provides the widest range of options in terms of memory, catering to various user requirements.

-- 57)What is the average CPU frequency of laptops with Intel i7 processors?
SELECT 
    AVG(CPU_Frequency_GHz) AS avg_cpu_frequency
FROM
    laptop_dataset
WHERE
    CPU_Type LIKE '%i7%';

-- Insight: Highlights the performance range of high-end Intel i7 laptops, popular among professionals and gamers.

-- 58)Which company offers the most 2-in-1 laptops (convertible/tablet)?
SELECT 
    company, COUNT(*) AS convertible_laptops
FROM
    laptop_dataset
WHERE
    TypeName LIKE '%2 in 1%'
        OR TypeName LIKE '%Convertible%'
GROUP BY company
ORDER BY convertible_laptops DESC;

-- Insight: Identifies which brands focus on hybrid devices, appealing to users who want both laptop and tablet functionalities.

-- 59)What is the average price of laptops with more than 2TB of storage?
SELECT 
    AVG(price_inr) AS avg_price
FROM
    laptop_dataset
WHERE
    Memory LIKE '%2TB%'
        OR Memory LIKE '%4TB%';

-- Insight: Shows how storage capacity impacts pricing, with larger drives typically adding a premium to the laptop’s cost.

-- 60) How many laptops have a dedicated graphics card?
SELECT 
    COUNT(*)
FROM
    laptop_dataset
WHERE
    GPU_Company IS NOT NULL

-- Insight: Indicates the availability of high.