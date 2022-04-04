
create database university;
use university;

create table student(
sname varchar(20),
student_number int primary key,
class int,
major varchar(7)
);


create table course(
course_name varchar(50),
course_number varchar(15) primary key,
credit_hours int,
department varchar(10));

create table section(
section_identifier int primary key,
course_number varchar(15),
semester varchar(10),
syear int,
instructor varchar(20),
foreign key(course_number) references course(course_number)
on delete cascade
on update cascade
);

create table grade_report(
student_number int,
section_identifier int,
grade varchar(2),
foreign key(student_number) references student(student_number),
foreign key(section_identifier) references section(section_identifier)
on delete cascade
on update cascade
);

create table prerequisite(
course_number varchar(15),
prerequisite_number varchar(20) primary key,
foreign key(course_number) references course(course_number)
on delete cascade
on update cascade
);

/* Question 2 */

insert into student values('Smith',17,1,'CS');
insert into student values('Brown',8,2,'CS');

insert into course values('Intro to Computer Science','CS1310',4,'CS');
insert into course values('Data Structures','CS3320',4,'CS');
insert into course values('Discrete Mathematics','MATH2410',3,'MATH');
insert into course values('Database','CS3380',3,'CS');

insert into section values(85,'MATH2410','Fall',07,'King');
insert into section values(92,'CS1310','Fall',07,'Anderson');
insert into section values(102,'CS3320','Spring',08,'Knuth');
insert into section values(112,'MATH2410','Fall',08,'Chang');
insert into section values(119,'CS1310','Fall',08,'Anderson');
insert into section values(135,'CS3380','Fall',08,'Stone');

insert into grade_report values(17,112,'B');
insert into grade_report values(17,119,'C');
insert into grade_report values(8,85,'A');
insert into grade_report values(8,92,'A');
insert into grade_report values(8,102,'B');
insert into grade_report values(8,135,'A');

insert into prerequisite values('CS3380', 'CS3320');
insert into prerequisite values('CS3380', 'MATH2410');
insert into prerequisite values('CS3320', 'CS1310');

/* Question 3 */
SELECT student.sname,grade_report.grade,course.course_name FROM student INNER JOIN grade_report ON student.student_number=grade_report.student_number INNER JOIN section ON grade_report.section_identifier=section.section_identifier INNER JOIN  course ON section.course_number=course.course_number WHERE student.sname='Smith';

/* Question 4 */
SELECT student.sname,grade_report.grade,course.course_name FROM student INNER JOIN grade_report ON student.student_number=grade_report.student_number INNER JOIN section ON grade_report.section_identifier=section.section_identifier INNER JOIN  course ON section.course_number=course.course_number WHERE course.course_name='Database' AND section.semester='fall' AND section.syear='08';

/* Question 5 */
SELECT prerequisite.prerequisite_number FROM prerequisite INNER JOIN course ON prerequisite.course_number=course.course_number WHERE course.course_name='Database';

/* Question 6 */
select sname from student where major='CS' and class=4;

/* Question 7 */
SELECT course.course_name FROM section INNER JOIN course ON section.course_number=course.course_number WHERE section.instructor='King' AND section.syear IN('07','08'); 

/* Question 8 */
SELECT section.course_number,section.semester,section.syear,count(DISTINCT grade_report.student_number) FROM section INNER JOIN grade_report ON grade_report.section_identifier=section.section_identifier WHERE section.instructor='king' GROUP BY grade_report.section_identifier;

/* Question 9 */
SELECT student.sname,course.course_name,course.course_number,course.credit_hours,section.semester,section.syear,grade_report.grade FROM student INNER JOIN grade_report ON grade_report.student_number=student.student_number INNER JOIN section ON section.section_identifier=grade_report.section_identifier INNER JOIN course ON course.course_number=section.course_number WHERE student.class=4;

/* Question 10.Write SQL update statements to do the following on the database schema */

/* A.Insertanewstudent,<‘Johnson’,25,1,‘Math’>,inthedatabase.  */
INSERT INTO student VALUES('Johnson',25,1,'MATH');		
SELECT * FROM student;

/* B.Change th eclass of student ‘Smith’ to 2.  */
UPDATE student SET class=2 WHERE sname='Smith';
SELECT * FROM student;

/* C.Insertanewcourse,<‘KnowledgeEngineering’,‘CS4390’,3,‘CS’>  */
INSERT INTO course VALUES('Knowledge Engineering','CS4390',3,'CS');
SELECT * FROM course;

/* D.Delete the record for the student whose name is ‘Smith’and whose student number is 17.  */
set foreign_key_checks=0;
DELETE FROM student WHERE sname='Smith' AND student_number=17;
set foreign_key_checks=1;
SELECT * FROM student;
