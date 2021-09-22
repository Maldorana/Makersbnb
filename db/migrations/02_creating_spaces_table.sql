CREATE TABLE spaces(id SERIAL PRIMARY KEY, name VARCHAR, description VARCHAR, price VARCHAR, user_id INTEGER REFERENCES users (id));

