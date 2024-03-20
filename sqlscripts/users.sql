-- public.users definition

-- Drop table

-- DROP TABLE public.users;

CREATE TABLE public.users (
	id uuid NOT NULL,
	"name" varchar NOT NULL,
	nickname varchar NULL,
	CONSTRAINT user_pk PRIMARY KEY (id)
);
