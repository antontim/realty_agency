select emp.name, m.name, avg(COALESCE(tr.result,0)), tr.passed from employees emp
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
