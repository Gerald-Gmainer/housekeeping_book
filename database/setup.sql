CREATE TYPE category_type AS ENUM
  ('INCOME', 'OUTCOME');

CREATE TABLE category_icons (
  id SERIAL PRIMARY KEY,
  icon_path text NOT NULL,
  color text DEFAULT '#FFFFFF'
);

CREATE TABLE account_icons (
  id SERIAL PRIMARY KEY,
  icon_path text NOT NULL,
  color text DEFAULT '#FFFFFF'
);

CREATE TABLE currencies (
  id SERIAL PRIMARY KEY,
  name text  NOT NULL,
  precesion int default 2,
);

CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  name text  NOT NULL,
  icon references account_icons(id)  NOT NULL,
  init_balance_amount numeric(12, 3) DEFAULT 0,
  init_balance_date timestamp  NOT NULL,
  include_in_balance boolean DEFAULT TRUE
);

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  name text  NOT NULL,
  icon references category_icons(id)  NOT NULL,
  type category_type  NOT NULL
);

CREATE TABLE balances (
  id SERIAL PRIMARY KEY,
  year int NOT NULL,
  month int NOT NULL,
  amount numeric(12, 3) DEFAULT 0
);

CREATE TABLE balance_account_links (
  id SERIAL PRIMARY KEY,
  account_id accounts(id)  NOT NULL,
  balance_id balances(id)  NOT NULL
);

CREATE TABLE bookings (
  id SERIAL PRIMARY KEY,
  booking_date date NOT NULL,
  description text,
  amount numeric(12, 3) DEFAULT 0 NOT NULL,
  category_id categories(id)  NOT NULL,
  account_id accounts(id) NOT NULL,
  currency_id currencies(id) NOT NULL,
)

CREATE TABLE settings (
  id SERIAL PRIMARY KEY
);
