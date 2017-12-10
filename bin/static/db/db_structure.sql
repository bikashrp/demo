CREATE TABLE springboot.role
(
    role_id integer NOT NULL DEFAULT nextval('springboot.role_role_id_seq'::regclass),
    role character varying(255) COLLATE pg_catalog."default" DEFAULT NULL::character varying,
    CONSTRAINT role_pkey PRIMARY KEY (role_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE springboot.role
    OWNER to postgres;


CREATE TABLE springboot."user"
(
    user_id integer NOT NULL,
    active integer,
    email character varying(255) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    password character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT user_pkey PRIMARY KEY (user_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE springboot."user"
    OWNER to postgres;




CREATE TABLE springboot.user_role
(
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    CONSTRAINT user_role_pkey PRIMARY KEY (role_id, user_id),
    CONSTRAINT fka68196081fvovjhkek5m97n3y FOREIGN KEY (role_id)
        REFERENCES springboot.role (role_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fkrs2hccpig3ejp109q8367ow9r FOREIGN KEY (user_id)
        REFERENCES springboot."user" (user_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE springboot.user_role
    OWNER to postgres;