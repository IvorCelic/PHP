drop database if exists assign;
create database assign;
use assign;

create table assign(
        assign_ID                       bigint(10) not null primary key auto_increment,
        course                          bigint(10) not null,
        name                            varchar(255) not null,
        intro                           longtext not null,
        intro_format                    smallint(4) not null,
        always_show_description         tinyint(2) not null,
        no_submission                   tinyint(2) not null,
        submission_drafts               tinyint(2) not null,
        send_notifications              tinyint(2) not null,
        send_late_notifications         tinyint(2) not null,
        due_date                        bigint(10) not null,
        allow_submissions_from_date     bigint(10) not null,
        grade                           bigint(10) not null,
        time_modified                   bigint(10) not null,
        require_submission_statement    tinyint(2) not null,
        completion_submit               tinyint(2) not null,
        cut_off_date                    bigint(10) not null,
        team_submission                 tinyint(2) not null,
        require_all_team_members_submit tinyint(2) not null,
        team_submission_grouping_ID     bigint(10) not null,
        blind_marking                   tinyint(2) not null,
        reveal_identities               tinyint(2) not null,
        attempt_tre_open_method         varchar(10) not null,
        max_attempts                    mediumint(6) not null,
        marking_work_flow               tinyint(2) not null,
        marking_all_location            tinyint(2) not null,
        send_student_notifications      tinyint(2) not null
    );

create table assign_plugin_config(
        assign_plugin_config_ID bigint(10) not null primary key auto_increment,
        assignment              bigint(10) not null, /** FK **/
        plugin                  varchar(28) not null,
        sub_type                varchar(28) not null,
        name                    varchar(28) not null,
        value                   longtext
    );

create table assign_submission_file(
        assign_submission_file_ID   bigint(10) not null primary key auto_increment,
        assignment                  bigint(10) not null, /** FK **/
        submission                  bigint(10) not null, /** FK **/
        num_files                   bigint(10) not null
    );

create table assign_submission(
        assign_submission_ID    bigint(10) not null primary key auto_increment,
        assignment              bigint(10) not null, /** FK **/
        user_ID                 bigint(10) not null,
        time_created            bigint(10) not null,
        time_modified           bigint(10) not null,
        status                  varchar(10),
        group_ID                bigint(10) not null,
        attempt_number          bigint(10) not null
    );

create table assign_submission_online_text(
        assign_submission_online_text_ID    bigint(10) not null primary key auto_increment,
        assignment                          bigint(10) not null, /** FK **/
        submission                          bigint(10) not null, /** FK **/
        online_text                         longtext,
        online_form_at                      smallint(4) not null
    );

create table assign_user_flags(
        assign_user_flags_ID    bigint(10) not null primary key auto_increment,
        user_ID                 bigint(10) not null, /** FK **/
        assignment              bigint(10) not null, /** FK **/
        locked                  bigint(10) not null,
        mailed                  smallint(4) not null,
        extension_due_date      bigint(10) not null,
        work_flow_state         varchar(20),
        allocated_marker        bigint(10) not null
    );

create table assign_feedback_edit_pdf_quick(
        assign_feedback_edit_pdf_quick_ID   bigint(10) not null primary key auto_increment,
        user_ID                             bigint(10) not null, /** FK **/
        raw_text                            longtext not null,
        width                               bigint(10) not null,
        colour                              varchar(10)
    );

create table assign_feedback_file(
        assign_feedback_file_ID     bigint(10) not null primary key auto_increment,
        assignment                  bigint(10) not null, /** FK **/
        grade                       bigint(10) not null, /** FK **/
        num_files                   bigint(10) not null
    );

create table assign_grades(
        assign_grades_ID    bigint(10) not null primary key auto_increment,
        assignment          bigint(10) not null, /** FK **/
        user_ID             bigint(10) not null,
        time_created        bigint(10) not null,
        time_modified       bigint(10) not null,
        grader              bigint(10) not null,
        grade               decimal(10,5),
        attempt_number      bigint(10) not null
    );

create table assign_feedback_edit_pdf_cmnt(
        assign_feedback_edit_pdf_cmnt_ID    bigint(10) not null primary key auto_increment,
        grade_ID                            bigint(10) not null, /** FK **/
        x                                   bigint(10),
        y                                   bigint(10),
        width                               bigint(10),
        raw_text                            longtext,
        page_no                             bigint(10) not null,
        colour                              varchar(10),
        draft                               tinyint(2) not null
    );

create table assign_user_mapping(
        assign_user_mapping_ID  bigint(10) not null primary key auto_increment,
        assignment              bigint(10) not null, /** FK **/ klklk
        user_ID                 bigint(10) not null /** FK **/
    );

create table assign_feedback_edit_pdf_annot(
        assign_feedback_edit_pdf_annot_ID   bigint(10) not null primary key auto_increment,
        grade_ID                            bigint(10) not null, /** FK **/
        page_no                             bigint(10) not null,
        x                                   bigint(10),
        y                                   bigint(10),
        end_x                               bigint(10),
        end_y                               bigint(10),
        path                                longtext,
        type                                varchar(10),
        colour                              varchar(10),
        draft                               tinyint(2) not null
    );

create table assign_feedback_comments(
        assign_feedback_comments_ID     bigint(10) not null primary key auto_increment,
        assignment                      bigint(10) not null, /** FK **/
        grade                           bigint(10) not null, /** FK **/
        comment_text                    longtext,
        comment_format                  smallint(4) not null
    );



alter table assign_plugin_config add foreign key (assignment) references assign(assign_ID);

alter table assign_submission_file add foreign key (assignment) references assign(assign_ID);
alter table assign_submission_file add foreign key (submission) references assign_submission(assign_submission_ID);

alter table assign_submission add foreign key (assignment) references assign(assign_ID);

alter table assign_submission_online_text add foreign key (assignment) references assign(assign_ID);
alter table assign_submission_online_text add foreign key (submission) references assign_submission(assign_submission_ID);

alter table assign_user_flags add foreign key (user_ID) references assign(assign_ID);

alter table assign_feedback_edit_pdf_quick add foreign key (user_ID) references assign(assign_ID);

alter table assign_feedback_file add foreign key (assignment) references assign_feedback_edit_pdf_quick(assign_feedback_edit_pdf_quick_ID);
alter table assign_feedback_file add foreign key (grade) references assign_grades(assign_grades_ID);

alter table assign_grades add foreign key (assignment) references assign(assign_ID);

alter table assign_feedback_edit_pdf_cmnt add foreign key (grade_ID) references assign_grades(assign_grades_ID);

alter table assign_user_mapping add foreign key (assignment) references assign(assign_ID);
alter table assign_user_mapping add foreign key (user_ID) references assign(assign_ID);

alter table assign_feedback_edit_pdf_annot add foreign key (grade_ID) references assign_grades(assign_grades_ID);

alter table assign_feedback_comments add foreign key (assignment) references assign(assign_ID);
alter table assign_feedback_comments add foreign key (grade) references assign_grades(assign_grades_ID);
