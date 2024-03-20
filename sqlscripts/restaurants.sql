-- public.restaurants definition

-- Drop table

-- DROP TABLE public.restaurants;

CREATE TABLE public.restaurants (
	id int4 GENERATED ALWAYS AS IDENTITY NOT NULL,
	longitude float8 NOT NULL,
	latitude float8 NOT NULL,
	"name" varchar NOT NULL,
	CONSTRAINT restaurants_pk PRIMARY KEY (id)
);
