DO $$
BEGIN

    IF NOT EXISTS(
        SELECT schema_name
          FROM information_schema.schemata
          WHERE schema_name = 'guard'
      )
    THEN
      EXECUTE 'CREATE SCHEMA guard';
    END IF;

END
$$;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE TYPE guard.user_status AS ENUM ('ACTIVE', 'DELETED');

CREATE TABLE IF NOT EXISTS guard.user (
  id uuid NOT NULL DEFAULT uuid_generate_v4(),
  login text NOT NULL,
  password text NOT NULL,
  status guard.user_status NOT NULL DEFAULT 'ACTIVE',
  PRIMARY KEY(id),
  UNIQUE(login)
);
