--Generate "apps_initialize" 
Set Define On
Set ServerOutput On
declare
    lv_app_resp_id  number;
    lv_resp_id      number;
    lv_user_id      number;
begin
    select  application_id,responsibility_id 
    into    lv_app_resp_id,lv_resp_id
    from    FND_RESPONSIBILITY_TL
    where   language=USERENV('LANG')
    and     responsibility_name='&RESPNAME';

    select  user_id
    into    lv_user_id
    from    FND_USER
    where   user_name='&USER';
    dbms_output.put_line('begin '||chr(10));    
    dbms_output.put_line('  apps.fnd_global.apps_initialize ( '||
        to_char(lv_user_id)||','||
        to_char(lv_resp_id)||','||
        to_char(lv_app_resp_id)||');'||chr(10));    
    dbms_output.put_line('end;'||chr(10)||'/'||chr(10));            
end;
