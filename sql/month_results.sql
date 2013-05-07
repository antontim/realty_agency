select emp.name, m.name, avg(COALESCE(tr.result,0)) +
    COALESCE((select avg(ev_.mark) from employee_evaluations ev_
        inner join questions q_ on q_.id = ev_.question_id
        inner join measures m_ on m_.id = q_.measure_id
        inner join employees emp_ on emp_.id = ev_.employee_id
        where ev_.created between '2013-05-01' and '2013-05-30'
            and emp_.id = emp.id and m_.id = m.id
        group by m_.id),0)/10 as res
, tr.passed from employees emp
left outer join measures m on m.id <> -1
left outer join tests t on m.id = t.measure_id
left outer join test_results tr on emp.id = tr.employee_id and t.id = tr.test_id
where (tr.passed between '2013-05-01' and '2013-05-30' 
    and tr.passed = (
        select max(tr1.passed) 
            from test_results tr1 
            where tr1.employee_id = emp.id 
                and tr1.test_id = t.id)
    ) or tr.passed is null
group by m.id,emp.id
order by emp.id, m.id;
