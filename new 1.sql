declare
strsql varchar2(1000);
region varchar2(20);
yf varchar2(20);
cs varchar2(20);
begin
region:='572';
yf:='$YYYYMM-M1$';
cs:='@to_zwbcd';
strsql:='update  /*+ parallel(a,5) */jhmid_crm_boss_prepay_572 a set state= (select distinct b.state from
 aicbs.am_app_bal_rec_h_'||region||'_'||yf||cs||' b where a.user_id=b.user_id and a.offer_id=b.offer_id and b.state in(2,4))
 where exists (select b.state from
 aicbs.am_app_bal_rec_h_'||region||'_'||yf||cs||' b where a.user_id=b.user_id and a.offer_id=b.offer_id and b.state in(2,4))
 and a.state is null';
 --dbms_output.put_line(strsql);
execute immediate strsql;
 

end;

create table jhret_crm_boss_prepay_month as select '20170214' check_day,'571' region_id,a.*,sysdate op_date from jhmid_crm_boss_prepay_571 a;

update  /*+ parallel(a,5) */jhmid_crm_boss_prepay_572 a set state= (select distinct b.state from
 aicbs.am_app_bal_rec_h_572_201612@to_zwbca b where a.user_id=b.user_id and a.offer_id=b.offer_id and b.state in(2,4))
 where exists (select b.state from
 aicbs.am_app_bal_rec_h_572_201612@to_zwbca b where a.user_id=b.user_id and a.offer_id=b.offer_id and b.state in(2,4))
 and a.state is null
 
select * from   jhmid_crm_boss_prepay_572 a where  a.state= (select distinct b.state from
 aicbs.am_app_bal_rec_h_572_201612@to_zwbca b,jhmid_crm_boss_prepay_572 a where a.user_id=b.user_id and a.offer_id=b.offer_id and b.state in(2,4) 
 and a.state is null)
 where exists (select b.state from
 aicbs.am_app_bal_rec_h_572_201612@to_zwbca b,jhmid_crm_boss_prepay_572 a where a.user_id=b.user_id and a.offer_id=b.offer_id and b.state in(2,4)
 and a.state is null)
 
 
 insert into jhret_crm_boss_prepay_month  select '20170216' check_day,a.*,sysdate op_date from jhmid_crm_boss_prepay_571 a;
 
 
 7427783806  5550100000088  5550100000089  5520100000678
 
 
SELECT * FROM sjjh_tongji_result_detail a where a.check_name LIKE '%营业侧重复基本策划%' and a.check_day='20170216';
SELECT * FROM sjjh_tongji_result_detail a where a.check_name LIKE '%营业侧重复默认支付关系%' and a.check_day='20170216';
SELECT * FROM sjjh_tongji_result_detail a where a.check_name LIKE '%策划done_code异常%' and a.check_day='20170216';
SELECT * FROM sjjh_tongji_result_detail a where a.check_name LIKE '%营业侧预缴关联促销或捆绑缺失稽核%' and a.check_day='20170216';
select  * from jhret_diff_crm_rule_month a where a.check_day='20170216';   --每天明细
select a.table_name, a.check_day,a.check_name
  from jhret_diff_crm_rule_month a
 where a.check_day = '20170216'
 group by a.table_name, a.check_day,a.check_name;

SELECT * FROM sjjh_tongji_result_detail a where a.check_name LIKE '%产品促销依赖互斥稽核%' and a.check_day='20170216';
select * from jhret_prod_prom_month  a where  a.check_day = '20170216';  --每天明细

SELECT * FROM sjjh_tongji_result_detail a where a.check_name LIKE '%CRM-BOSS预缴不一致稽核%' and a.check_day='20170216';
select * from jh_data.jhret_crm_boss_prepay_month a where a.check_day = '20170216';  --每天明细

SELECT * FROM sjjh_tongji_result_detail a where a.check_name LIKE '%账务侧预缴关联促销缺失稽核%' and a.check_day='20170216';
select * from jhret_am_app_bal_month a where a.check_day = '20170216';    --每天明细




 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 


