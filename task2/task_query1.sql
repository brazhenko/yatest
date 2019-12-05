SELECT `a`.`worker_id`, max(`a`.`money_sum`), `a`.`date`
from (
    SELECT FROM_UNIXTIME(`timestamp`, '%Y-%m-%d') as `date` , sum(`money`) as `money_sum`,`worker_id`

FROM `mytable` 
group by `worker_id`, `date`
) as `a`

group by `a`.`date
