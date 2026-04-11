-- 1. CORE KPI DASHBOARD
select 
    count(*) as total_orders,
    avg(delivery_time_min) as avg_delivery_time,
    min(delivery_time_min) as fastest_delivery,
    max(delivery_time_min) as slowest_delivery
from deliveries;

-- 2. DELIVERY PERFORMANCE SEGMENTATION
select 
    case 
        when distance_km < 2 then 'short'
        when distance_km between 2 and 5 then 'medium'
        else 'long'
    end as distance_type,
    
    count(*) as orders,
    avg(delivery_time_min) as avg_time
from deliveries
group by distance_type;


-- 3. TIME-BASED ANALYSIS
-- Orders & delivery time by hour
select 
    hour(o.time_ordered) as hour,
    count(*) as total_orders,
    avg(d.delivery_time_min) as avg_time
from orders o
join deliveries d on o.order_id = d.order_id
group by hour
order by total_orders desc;

-- 4. WEEKEND VS WEEKDAY
select 
    case 
        when dayofweek(order_date) in (1,7) then 'weekend'
        else 'weekday'
    end as day_type,
    
    count(*) as orders,
    avg(d.delivery_time_min) as avg_time
from orders o
join deliveries d on o.order_id = d.order_id
group by day_type;


-- 5. TRAFFIC IMPACT
select 
    traffic,
    count(*) as orders,
    avg(delivery_time_min) as avg_time
from deliveries
group by traffic
order by avg_time desc;

-- 6. RIDER EFFICIENCY
select 
    rider_batch_count,
    avg(delivery_time_min) as avg_time
from deliveries
group by rider_batch_count
order by rider_batch_count desc;

select 
    traffic,
    rider_batch_count,
    avg(delivery_time_min)
from deliveries
group by traffic, rider_batch_count
order by avg(delivery_time_min) desc;

select 
    rider_batch_count,
    count(*) as orders,
    avg(delivery_time_min) as avg_time
from deliveries
group by rider_batch_count;