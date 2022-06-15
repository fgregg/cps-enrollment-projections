enrollment.csv :
	bq query --format csv -n 100000 'select * from cps.enrollment' > $@

district_enrollment.csv : enrollment.csv
	csvsql --query "SELECT fiscal_year, sum(students) as students from enrollment WHERE metric='TA' group by fiscal_year" $< > $@
