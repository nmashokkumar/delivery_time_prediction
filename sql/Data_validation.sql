-- 1. CHECK MISSING VALUES
-- deliveries table
select 
    sum(case when distance_km is null then 1 else 0 end) as null_distance,
    sum(case when delivery_time_min is null then 1 else 0 end) as null_delivery_time,
    sum(case when traffic is null then 1 else 0 end) as null_traffic,
    sum(case when weather is null then 1 else 0 end) as null_weather,
    sum(case when store_load is null then 1 else 0 end) as null_store_load,
    sum(case when rider_batch_count is null then 1 else 0 end) as null_batch
from deliveries;


-- orders table
select 
    sum(case when drop_lat is null then 1 else 0 end),
    sum(case when drop_lon is null then 1 else 0 end),
    sum(case when time_ordered is null then 1 else 0 end)
from orders;


-- 2. OUTLIER DETECTION
-- Distance check
select 
    min(distance_km), 
    max(distance_km), 
    avg(distance_km)
from deliveries;


-- Delivery time check
select 
    min(delivery_time_min),
    max(delivery_time_min),
    avg(delivery_time_min)
from deliveries;

-- 3. BUSINESS SANITY CHECKS
-- Distance vs Time relationship
select 
    distance_km,
    delivery_time_min
from deliveries
order by distance_km desc
limit 20;


-- Traffic impact
select 
    traffic,
    avg(delivery_time_min)
from deliveries
group by traffic;


-- Weather impact
select 
    weather,
    avg(delivery_time_min)
from deliveries
group by weather;


-- Store load impact
select 
    store_load,
    avg(delivery_time_min)
from deliveries
group by store_load
order by store_load desc;


-- 4. DISTRIBUTION CHECKS
-- order per hour
select 
    hour(time_ordered) as hour,
    count(*) as orders
from orders
group by hour
order by hour;


-- Traffic distribution
select 
    traffic,
    count(*) as cnt
from deliveries
group by traffic;


-- Weather distribution
select 
    weather,
    count(*) as cnt
from deliveries
group by weather;