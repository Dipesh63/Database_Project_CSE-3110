create table SemesterPlan(
    dept varchar(100),
    semester varchar(100),
    course_name varchar(100),
    course_no varchar(100),
    year varchar(20),
    primary key(course_name)
    );


create table CoursePlan(
    course_name varchar(100),
    course_no varchar(100),
    teacher_name varchar(100),
    experence_year varchar(100),
    semester varchar(100),
    primary key(course_name),
    foreign key(course_name) references SemesterPlan(course_name)
    on delete cascade
    );


create table StudentRegistration(
    student_name varchar(100),
    roll number(10),
    dept varchar(100),
    semester varchar(100),
    course_name varchar(100),
    primary key(roll),
    foreign key(course_name) references CoursePlan(course_name)
    on delete cascade
    );


create table EventHandling(
    Event_name varchar(100),
    Registration_Fees number(10),
    venue varchar(100),
    Event_Type varchar(100),
    Event_Date Date,
    primary key(Event_name)
    );


create table RegStudAtEvent(
    Event_name varchar(100),
    Student_name varchar(100),
    roll number(10),
    Payment_status char(10),
    foreign key(Event_name) references EventHandling(Event_name),
    foreign key(roll) references StudentRegistration(roll)
    on delete cascade
    );




create table WorkshopHandling(
    Workshop_name varchar(100),
    Registration_Fees number(10),
    venue varchar(100),
    Workshop_Type varchar(100),
    Workshop_Date Date,
    primary key(Workshop_name)
    );


create table RegStudAtWorkshop(
    Workshop_name varchar(100),
    Student_name varchar(100),
    roll number(10),
    Payment_status char(10),
    foreign key(Workshop_name) references WorkshopHandling(Workshop_name),
    foreign key(roll) references StudentRegistration(roll)
    on delete cascade
    );


create table EventFeedback(
    Event_name varchar(100),
    Dept varchar(50),
    Roll number(7),
    CommentText varchar(1000),
    CommentDate Date,
    
    foreign key(Event_name) references EventHandling(Event_name),
    foreign key(roll) references StudentRegistration(roll)
    on delete cascade
    );
create table StudentRegistrationBackUp(
    student_name varchar(100),
    roll number(10),
    dept varchar(100),
    semester varchar(100),
    course_name varchar(100),
    primary key(roll),
    foreign key(course_name) references CoursePlan(course_name)
    on delete cascade
    );