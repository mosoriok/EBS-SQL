SELECT 
   fcr.request_id request_id,
   fcr.phase_code phase,
   decode(fcr.status_code,'E','ERROR'
                         ,'G','Warning'
                          ,'C','Normal') status,
   fcr.actual_start_date start_date,
   fcp.concurrent_program_name conc_prog,
   fcpt.user_concurrent_program_name user_conc_prog,
   fu.user_name,
   fcr.argument_text
FROM 
  applsys.fnd_concurrent_programs fcp,
  applsys.fnd_concurrent_programs_tl fcpt,
  applsys.fnd_concurrent_requests fcr,
  applsys.fnd_user fu
WHERE fcr.request_id=&request
  AND fu.user_id=fcr.requested_by
  AND fcr.concurrent_program_id = fcp.concurrent_program_id
  AND fcr.program_application_id = fcp.application_id
  AND fcr.concurrent_program_id = fcpt.concurrent_program_id
  AND fcr.program_application_id = fcpt.application_id
  AND fcpt.language = USERENV('Lang');
