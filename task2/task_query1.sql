SELECT `a`.`worker_id`,
       max(`a`.`money_sum`),
       `a`.`date`
FROM
  (SELECT FROM_UNIXTIME(`timestamp`, '%Y-%m-%d') AS `date`,
          sum(`money`) AS `money_sum`,
          `worker_id`
   FROM
     (SELECT *
      FROM `mytable`
      UNION ALL SELECT *
      FROM `mytable5`) AS `united_table`
   GROUP BY `worker_id`,
            `date`) AS `a`
GROUP BY `a`.`date`
