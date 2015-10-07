select variable_name, value
from fnd_env_context
where variable_name like '%\_TOP' escape '\'
and concurrent_process_id = (select max(concurrent_process_id) from fnd_env_context)
order by 1;
