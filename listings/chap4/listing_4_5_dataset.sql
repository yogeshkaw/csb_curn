with observation_params as     
(
    select  interval '%metric_interval' as metric_period,
    '%from_yyyy-mm-dd'::timestamp as obs_start,
    '%to_yyyy-mm-dd'::timestamp as obs_end
)
select m.account_id, o.observation_date, is_churn,
sum(case when metric_name_id=0 then metric_value else 0 end) as Standard_Worklog_Added_per_month,
sum(case when metric_name_id=1 then metric_value else 0 end) as Project_Summary_Scheduled_per_month,
sum(case when metric_name_id=2 then metric_value else 0 end) as Payment_Failed_per_month,
sum(case when metric_name_id=3 then metric_value else 0 end) as Survey_Added_per_month,
sum(case when metric_name_id=4 then metric_value else 0 end) as Report_Signed_per_month,
sum(case when metric_name_id=5 then metric_value else 0 end) as Daily_Report_Generated_per_month,
sum(case when metric_name_id=6 then metric_value else 0 end) as Daily_Report_Emailed_per_month,
sum(case when metric_name_id=7 then metric_value else 0 end) as Attachment_Added_per_month,
sum(case when metric_name_id=8 then metric_value else 0 end) as Note_Added_per_month,
sum(case when metric_name_id=9 then metric_value else 0 end) as Project_Added_per_month,
sum(case when metric_name_id=10 then metric_value else 0 end) as Dashboard_Interacted_per_month,
sum(case when metric_name_id=11 then metric_value else 0 end) as User_Signed_In_per_month,
sum(case when metric_name_id=12 then metric_value else 0 end) as Insights_Interacted_per_month,
sum(case when metric_name_id=13 then metric_value else 0 end) as Timecard_Added_per_month,
sum(case when metric_name_id=14 then metric_value else 0 end) as Worker_Added_per_month,
sum(case when metric_name_id=15 then metric_value else 0 end) as Access_Project_Dashboard_per_month,
sum(case when metric_name_id=16 then metric_value else 0 end) as Team_Member_Invited_per_month,
sum(case when metric_name_id=17 then metric_value else 0 end) as App_Installed_per_month,
sum(case when metric_name_id=18 then metric_value else 0 end) as Super_Daily_Report_Emailed_per_month,
sum(case when metric_name_id=19 then metric_value else 0 end) as Auto_Email_Setup_per_month,
sum(case when metric_name_id=20 then metric_value else 0 end) as Partner_Service_Connected_per_month,
sum(case when metric_name_id=21 then metric_value else 0 end) as Template_Edited_per_month,
sum(case when metric_name_id=22 then metric_value else 0 end) as Template_Added_per_month,
sum(case when metric_name_id=23 then metric_value else 0 end) as Cost_Code_Added_per_month,
sum(case when metric_name_id=24 then metric_value else 0 end) as Material_Log_Added_per_month,
sum(case when metric_name_id=25 then metric_value else 0 end) as Super_Daily_Report_Generated_per_month,
sum(case when metric_name_id=26 then metric_value else 0 end) as TBT_Completed_per_month,
sum(case when metric_name_id=27 then metric_value else 0 end) as Sub_Collaborator_Invited_per_month,
sum(case when metric_name_id=28 then metric_value else 0 end) as Manpower_Report_Generated_per_month,
sum(case when metric_name_id=29 then metric_value else 0 end) as Time_Card_Report_Scheduled_per_month,
sum(case when metric_name_id=30 then metric_value else 0 end) as Production_Insights_Viewed_per_month,
sum(case when metric_name_id=31 then metric_value else 0 end) as Cost_Code_List_Uploaded_per_month,
sum(case when metric_name_id=32 then metric_value else 0 end) as Hours_Split_per_month,
sum(case when metric_name_id=33 then metric_value else 0 end) as Access_Project_Insights_per_month,
sum(case when metric_name_id=34 then metric_value else 0 end) as Task_Added_per_month,
sum(case when metric_name_id=35 then metric_value else 0 end) as Task_Completed_per_month,
sum(case when metric_name_id=36 then metric_value else 0 end) as Dashboard_View_Added_per_month,
sum(case when metric_name_id=37 then metric_value else 0 end) as Insights_Downloaded_per_month,
sum(case when metric_name_id=39 then metric_value else 0 end) as Quantities_Report_Downloaded_per_month,
sum(case when metric_name_id=40 then metric_value else 0 end) as Cloud_Service_Connected_per_month,
sum(case when metric_name_id=41 then metric_value else 0 end) as Cost_Code_Report_Scheduled_per_month,
sum(case when metric_name_id=42 then metric_value else 0 end) as Worker_List_Uploaded_per_month,
sum(case when metric_name_id=43 then metric_value else 0 end) as Production_Budget_Added_per_month,
sum(case when metric_name_id=44 then metric_value else 0 end) as Production_Insights_Downloaded_per_month,
sum(case when metric_name_id=45 then metric_value else 0 end) as Production_Budget_Uploaded_per_month,
sum(case when metric_name_id=46 then metric_value else 0 end) as Budgeted_Hours_Added_per_month,
sum(case when metric_name_id=47 then metric_value else 0 end) as Track_Time_Added_per_month,
sum(case when metric_name_id=50 then metric_value else 0 end) as account_tenure
from metric m inner join observation_params
on metric_time between obs_start and obs_end    
inner join observation o on m.account_id = o.account_id
    and m.metric_time > (o.observation_date - metric_period)::timestamp    
    and m.metric_time <= o.observation_date::timestamp
group by m.account_id, metric_time, observation_date, is_churn    
order by observation_date,m.account_id


