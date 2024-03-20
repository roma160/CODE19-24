-- public.foods definition

-- Drop table

-- DROP TABLE public.foods;

CREATE TABLE public.foods (
	id int4 NOT NULL,
	"name" varchar NOT NULL,
	restaurant int4 NOT NULL,
	calories float4 NULL,
	fat float4 NULL,
	saturated_fat float4 NULL,
	trans_fat float4 NULL,
	cholesterol float4 NULL,
	carbohydrates float4 NULL,
	sodium float4 NULL,
	fiber float4 NULL,
	total_sugars float4 NULL,
	added_sugars float4 NULL,
	calcium float4 NULL,
	iron float4 NULL,
	potassium float4 NULL,
	has_gluten bool NULL,
	has_eggs bool NULL,
	has_nuts bool NULL,
	has_milk bool NULL,
	has_celery bool NULL,
	has_sesame bool NULL,
	has_lupin bool NULL,
	has_crustaceans bool NULL,
	has_fish bool NULL,
	has_soy bool NULL,
	has_tree_nuts bool NULL,
	has_mustard bool NULL,
	has_sulphites bool NULL,
	has_mollusks bool NULL,
	CONSTRAINT foods_pk PRIMARY KEY (id)
);


-- public.foods foreign keys

ALTER TABLE public.foods ADD CONSTRAINT foods_restaurants_fk FOREIGN KEY (restaurant) REFERENCES public.restaurants(id);
