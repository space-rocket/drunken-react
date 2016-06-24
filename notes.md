Login:
/usr/local/bin/psql -d postgres
List Users:
\du
List Tables:
\list
To Switch Databases:
\connect database_name
List all tables in the current database:
\dt
Query a table:
SELECT * FROM users;
Change User to Admin:
UPDATE users SET is_admin = TRUE WHERE name = 'bigbassroller' RETURNING is_admin
