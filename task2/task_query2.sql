SELECT *
FROM
  (SELECT `worker_id`,
          sum(`united_payments_data`.`money`) AS `reward`
   FROM
     (SELECT *
      FROM `mytable`
      UNION ALL SELECT *
      FROM `mytable5`
      WHERE FROM_UNIXTIME(`timestamp`, '%Y-%m-%d') >= "2019-02-10"
        AND FROM_UNIXTIME(`timestamp`, '%Y-%m-%d') <= "2019-03-03") AS `united_payments_data`
   GROUP BY `worker_id`
   HAVING `reward` >=300) AS `rewards`
INNER JOIN
  (SELECT *
   FROM
     (SELECT `worker_id`,
             count(*) AS `tasks_number`
      FROM `mytable`
      WHERE FROM_UNIXTIME(`timestamp`, '%Y-%m-%d') >= "2019-02-10"
        AND FROM_UNIXTIME(`timestamp`, '%Y-%m-%d') <= "2019-03-03"
      GROUP BY `worker_id`) AS `worker_tasks`
   WHERE `worker_tasks`.`tasks_number` <= 200) AS `completed_tasks` ON `completed_tasks`.`worker_id` = `rewards`.`worker_id`

