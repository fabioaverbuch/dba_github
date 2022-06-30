select to_char(startup_time, 'DD-MM-YYYY HH24:MI:SS'),floor(sysdate-startup_time) DAYS from v$Instance; 
