CREATE TABLE date (
  id SERIAL PRIMARY KEY,
  date date NOT NULL UNIQUE,
  day int NOT NULL CHECK (day >= 1 AND day <= 7),
  week int NOT NULL CHECK (week >= 1 AND week <= 53),
  month int NOT NULL CHECK (month >= 1 AND month <= 12),
  year int NOT NULL,
  weekend boolean NOT NULL
);

CREATE TABLE product (
  id int PRIMARY KEY,
  name text NOT NULL UNIQUE,
  category text NOT NULL,
  energy numeric NOT NULL,
  carbohydrates numeric NOT NULL,
  fat numeric NOT NULL,
  protein numeric NOT NULL
);

CREATE TABLE location (
  id int PRIMARY KEY,
  type text NOT NULL,
  city text NOT NULL,
  country text NOT NULL,
  gdp numeric NOT NULL,
  population int NOT NULL,
  life_expectancy numeric NOT NULL,
  avg_annual_income numeric NOT NULL
);

CREATE TABLE product_price (
  date int NOT NULL REFERENCES date (id),
  product int NOT NULL REFERENCES product (id),
  location int NOT NULL REFERENCES location (id),
  price numeric NOT NULL
);