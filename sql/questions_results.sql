select emp.name, q.text, m.name, avg(ev.mark) from employee_evaluations ev
inner join questions q on q.id = ev.question_id
inner join measures m on m.id = q.measure_id
inner join employees emp on emp.id = ev.employee_id
where ev.created between '2013-05-01' and '2013-05-30'
group by m.id;
