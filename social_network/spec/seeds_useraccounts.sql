TRUNCATE TABLE user_accounts RESTART IDENTITY CASCADE; -- replace with your own table name.
TRUNCATE TABLE posts RESTART IDENTITY;


-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO user_accounts (email_address, username) VALUES ('cg@makers', 'CyrylG');
INSERT INTO user_accounts (email_address, username) VALUES ('cp@makers', 'cshjp');
INSERT INTO posts (title, content, views, user_account_id) VALUES ('title', 'content', 5, 1);
INSERT INTO posts (title, content, views, user_account_id) VALUES ('no one can see me', 'alone', 0, 2);
