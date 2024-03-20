-- public.orders definition

-- Drop table

-- DROP TABLE public.orders;

CREATE TABLE public.orders (
	id int4 GENERATED ALWAYS AS IDENTITY NOT NULL,
	"user" uuid NULL,
	restaurant int4 NOT NULL,
	food int4 NOT NULL,
	CONSTRAINT orders_pk PRIMARY KEY (id)
);


-- public.orders foreign keys

ALTER TABLE public.orders ADD CONSTRAINT orders_foods_fk FOREIGN KEY (food) REFERENCES public.foods(id);
ALTER TABLE public.orders ADD CONSTRAINT orders_restaurants_fk FOREIGN KEY (id) REFERENCES public.restaurants(id);
ALTER TABLE public.orders ADD CONSTRAINT orders_user_fk FOREIGN KEY ("user") REFERENCES public.users(id);
