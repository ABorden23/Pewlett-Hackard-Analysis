--Deliverable 1

-- CREATE VIEW retirement_titles AS
SELECT e.emp_no, first_name, e. last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS t
	ON (e.emp_no=t.emp_no)
--filter on birth_date
WHERE(e.birth_date BETWEEN ('1952-01-01') AND ('1955-12-31'))
ORDER BY e.emp_no
;

--using starter code
-- Use Dictinct with Orderby to remove duplicate rows
-- get employee number, first name, title
--from retirment_titles
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unq_titles
FROM retirement_titles AS rt
ORDER BY rt.emp_no, rt.to_date DESC;

--
SELECT COUNT(ut.title), ut.title
INTO retiring_titles_
FROM unq_titles AS ut
GROUP BY ut.title
ORDER BY Count DESC;

--End of Deliverable 1

--Deliverable 2 
--Mentorship Eligbility Table

SELECT DISTINCT ON (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
	ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ti
	ON (e.emp_no = de.emp_no)
-- filter on to_date to get current employees ('9999-01-01')
WHERE de.to_date = '9999-01-01'
AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER by e.emp_no;
