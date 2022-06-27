show data_directory;

SELECT name, setting FROM pg_settings WHERE category = 'File Locations';
