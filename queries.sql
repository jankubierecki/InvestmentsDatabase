/* get full adresses of all apartments */
select concat(`l`.`partial_address`, ' ',
              `b`.`number`, '/', `a`.`number`) as `full_address`
from `apartments` as `a`
left join `buildings` as `b` on `b`.`building_id` = `a`.`building_id` 
left join `locations` as `l` on `l`.`location_id` = `b`.`location_id`
left join `cities` as `c` on `c`.`city_id` = `l`.`city_id`;

/*get full adresses of all apartments with garages */
select concat(`l`.`partial_address`, ' ',
              `b`.`number`, '/', `a`.`number`) as `garages`
from `apartments` as `a`
left join `apartment_assets` as `aa` on `a`.`apartment_id` = `aa`.`apartment_id`
left join `apartment_asset_values` as `aav` on `aa`.`asset_value` = `aav`.`asset_value`
left join `buildings` as `b` on `b`.`building_id` = `a`.`building_id` 
left join `locations` as `l` on `l`.`location_id` = `b`.`location_id`
where `aav`.`asset_value_name` = 'garaż';

/*# get possible assets in buildings*/
select distinct `b`.`name`, `aav`.`asset_value_name`
from `apartments` as `a`
left join `apartment_assets` as `aa` on `a`.`apartment_id` = `aa`.`apartment_id`
left join `apartment_asset_values` as `aav` on `aa`.`asset_value` = `aav`.`asset_value`
left join `buildings` as `b` on `b`.`building_id` = `a`.`building_id`
order by `b`.`name`, `aav`.`asset_value_name`;

/*#get apartment areas including all assets*/
select sum(`aa`.`area`) as `total area`
from `asset_areas` as `aa` 
join `apartments` as `a`
on `aa`.`apartment_id` = `a`.`apartment_id`
group by `aa`.`apartment_id`;

/*#find apartments with the largest garage area*/
select `a`.`apartment_id`, `aa`.`area`
from `apartments` as `a`
left join `asset_areas` as `aa` on `a`.`apartment_id` = `aa`.`apartment_id`
left join `apartment_asset_values` as `aav` on `aa`.`asset_value` = `aav`.`asset_value`
where `aav`.`asset_value_name` = 'garaż'
order by `aa`.`area` desc
limit 1;

/*#get number of pomieszczenias gospodarczes offered by developers*/
select `d`.`name`, 
  (select count(`aav`.`asset_value_name`)
    from `investments` as `i` 
    left join `buildings` as `b` on `b`.`investment_id` = `i`.`investment_id`
    left join `apartments` as `a` on `a`.`building_id` = `b`.`building_id`
    left join `apartment_assets` as `aa` on `aa`.`apartment_id` = `a`.`apartment_id`
    left join `apartment_asset_values` as `aav` on `aav`.`asset_value` = `aa`.`asset_value`
    where `d`.`developer_id` = `i`.`developer_id`
      and `aav`.`asset_value_name` = 'pomieszczenie gospodarcze') as `count`
from `developers` as `d`;

