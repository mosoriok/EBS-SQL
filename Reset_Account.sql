--reset password
--for oracle ebs 
--M.Osorio.K.
declare
tmp_res varchar2(1) DEFAULT 'N';
begin 
    tmp_res := apps.fnd_web_sec.CHANGE_PASSWORD('EBS_USER','MyPassword123');
    UPDATE apps.fnd_user
    SET PASSWORD_DATE = (SYSDATE-20), 
        PASSWORD_LIFESPAN_ACCESSES = 90,
        END_DATE=NULL 
    WHERE user_name = 'EBS_USER';
    COMMIT;
end;
/
