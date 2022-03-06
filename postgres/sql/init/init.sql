DO $$
BEGIN
    IF NOT EXISTS(
        SELECT schema_name
          FROM information_schema.schemata
          WHERE schema_name = 'main'
    )
    THEN
      EXECUTE 'CREATE SCHEMA main';
    END IF;
END
$$;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE TYPE main.user_status AS ENUM ('ACTIVE', 'DELETED', 'PENDING');

CREATE TABLE IF NOT EXISTS main.users (
  id uuid NOT NULL DEFAULT uuid_generate_v4(),
  login text NOT NULL,
  password text NOT NULL,
  status main.user_status NOT NULL DEFAULT 'PENDING',

  PRIMARY KEY(id),
  UNIQUE(login)
);
