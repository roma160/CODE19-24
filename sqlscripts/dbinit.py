#%%
import psycopg2
import click

with open("./sqlscripts/pspass.txt", "r") as f:
    password = f.read()

conn = psycopg2.connect(
    host="code1924-db.postgres.database.azure.com",
    database="postgres",
    user="code1924",
    password=password
)

cur = conn.cursor()

# Drop all tables
cur.execute('''
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;
''')

#make tables
print(cur.execute('''CREATE TABLE public.users (
	id int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	"name" varchar NULL,
	"password" varchar NOT NULL,
	email varchar NOT NULL,
    phone_number varchar NULL,
	height float4 NULL,
	weight float4 NULL,
    age int4 NULL,
	CONSTRAINT user_pk PRIMARY KEY (id)
    )'''))

cur.execute('''CREATE TABLE public.restaurants (
	id int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	longitude float8 NOT NULL,
	latitude float8 NOT NULL,
	"name" varchar NOT NULL,
	CONSTRAINT restaurants_pk PRIMARY KEY (id)
    );''')

cur.execute('''CREATE TABLE public.orders (
	id int4 GENERATED ALWAYS AS IDENTITY( INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1 NO CYCLE) NOT NULL,
	"user" int4 NULL,
	restaurant int4 NOT NULL,
	food int4 NOT NULL,
	CONSTRAINT orders_pk PRIMARY KEY (id)
);''')

cur.execute('''CREATE TABLE public.foods (
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
);''')


cur.execute('ALTER TABLE public.orders ADD CONSTRAINT orders_foods_fk FOREIGN KEY (food) REFERENCES public.foods(id);')
cur.execute('ALTER TABLE public.orders ADD CONSTRAINT orders_restaurants_fk FOREIGN KEY (id) REFERENCES public.restaurants(id);')
cur.execute('ALTER TABLE public.orders ADD CONSTRAINT orders_user_fk FOREIGN KEY ("user") REFERENCES public.users(id);')

cur.execute('ALTER TABLE public.foods ADD CONSTRAINT foods_restaurants_fk FOREIGN KEY (restaurant) REFERENCES public.restaurants(id);')

conn.commit()

cur.close()
conn.close()
