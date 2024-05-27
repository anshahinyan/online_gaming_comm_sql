CREATE DATABASE IF NOT EXISTS online_gaming_comm;
USE online_gaming_comm;

CREATE TABLE IF NOT EXISTS users (
    user_id VARCHAR(8) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    username VARCHAR(30) UNIQUE, 
    email VARCHAR(100)UNIQUE,
    date_joined DATE
);

INSERT IGNORE INTO users (user_id, name, surname, username, email, date_joined) VALUES
('u1234567', 'Mary', 'Wilson', 'marywilson', 'marywilson@gmail.com', '2022-01-10'),
('u2345678', 'George', 'Davis', 'georgedavis', 'georgedavis@gmail.com', '2022-02-15'),
('u3456789', 'Melissa', 'Hebert', 'melissahebert', 'melissahebert@yahoo.com', '2022-03-20'),
('u4567890', 'Ryan', 'Ferguson', 'ryanferguson', 'ryanferguson@mail.com', '2022-04-25'),
('u5678901', 'Rodney', 'Woodward', 'rodneywoodward', 'rodneywoodward@mail.com', '2022-05-30'),
('u6789012', 'Elizabeth', 'Krueger', 'elizabethkrueger', 'elizabethkrueger@edu.aua.am', '2022-06-04'),
('u7890123', 'Sean', 'Joseph', 'seanjoseph', 'seanjoseph@hgmail.com', '2022-07-09'),
('u8901234', 'Megan', 'Cole', 'megancole', 'megancole@yahoo.com', '2022-08-14'),
('u9012345', 'Malik', 'Grant', 'malikgrant', 'malikgrant@yandex.com', '2022-09-19'),
('u0123456', 'Brooke', 'Wright', 'brookewright', 'brookewright@yandex.com', '2022-10-24');


CREATE TABLE IF NOT EXISTS games (
    game_id VARCHAR(8) PRIMARY KEY,
    game_name VARCHAR(100),
    publisher VARCHAR(100),
    release_date DATE
);

INSERT IGNORE INTO games (game_id, game_name, publisher, release_date) VALUES
('a1b2c3d4', 'Realm of Valor', 'Tencent Games', '2015-10-10'),
('e5f6g7h8', 'Legends Reborn', 'Riot Games', '2016-03-12'),
('i9j0k1l2', 'Skyward Journey', 'NetEase', '2017-07-07'),
('m3n4o5p6', 'Fortress Fury', 'Epic Games', '2018-08-08'),
('q7r8s9t0', 'BattleQuest', 'Blizzard Entertainment', '2019-09-15'),
('u1v2w3x4', 'Elden Path', 'FromSoftware', '2020-11-20'),
('y5z6a7b8', 'Ocean Mysteries', 'Ubisoft', '2021-05-25'),
('c9d0e1f2', 'Cyber Realm', 'CD Projekt Red', '2022-01-01'),
('g3h4i5j6', 'Star Voyagers', 'Hello Games', '2023-03-27'),
('k7l8m9n0', 'Monsters Saga', 'Capcom', '2024-04-14');

CREATE TABLE IF NOT EXISTS servers (
    server_id VARCHAR(8) PRIMARY KEY,
    game_id VARCHAR(8),
    location VARCHAR(100) NOT NULL,
    capacity INT,
    FOREIGN KEY (game_id) REFERENCES games(game_id)
);

INSERT IGNORE INTO servers (server_id, game_id, location, capacity) VALUES
('s1234567', 'a1b2c3d4', 'North America', 1000),
('s2345678', 'a1b2c3d4', 'Europe', 800),
('s3456789', 'e5f6g7h8', 'North America', 1200),
('s4567890', 'e5f6g7h8', 'Europe', 1500),
('s5678901', 'i9j0k1l2', 'Japan', 500),
('s6789012', 'm3n4o5p6', 'North America', 2000),
('s7890123', 'q7r8s9t0', 'Europe', 950),
('s8901234', 'u1v2w3x4', 'Asia', 600),
('s9012345', 'y5z6a7b8', 'Australia', 300),
('s0123456', 'c9d0e1f2', 'Europe', 1000);


CREATE TABLE IF NOT EXISTS guilds (
    guild_id VARCHAR(8) PRIMARY KEY,
    game_id VARCHAR(8),
    leader_user_id VARCHAR(8),
    guild_name VARCHAR(100) UNIQUE,
    creation_date DATE,
    FOREIGN KEY (game_id) REFERENCES games(game_id) ON DELETE CASCADE,
    FOREIGN KEY (leader_user_id) REFERENCES users(user_id) ON DELETE SET NULL
);

INSERT IGNORE INTO guilds (guild_id, game_id, leader_user_id, guild_name, creation_date) VALUES
('g1234567', 'a1b2c3d4', 'u1234567', 'Valor Guardians', '2022-01-01'),
('g2345678', 'a1b2c3d4', 'u2345678', 'Valor Challengers', '2022-02-02'),
('g3456789', 'e5f6g7h8', 'u3456789', 'Legends of Tomorrow', '2022-03-03'),
('g4567890', 'e5f6g7h8', 'u4567890', 'Legacy Defenders', '2022-04-04'),
('g5678901', 'i9j0k1l2', 'u5678901', 'Skyward Circle', '2022-05-05'),
('g6789012', 'm3n4o5p6', 'u6789012', 'Fortress Knights', '2022-06-06'),
('g7890123', 'q7r8s9t0', 'u7890123', 'Quest Seekers', '2022-07-07'),
('g8901234', 'u1v2w3x4', 'u8901234', 'Elden Pathfinders', '2022-08-08'),
('g9012345', 'y5z6a7b8', 'u9012345', 'Ocean Explorers', '2022-09-09'),
('g0123456', 'c9d0e1f2', 'u0123456', 'Cybernetic Alliance', '2022-10-10');

CREATE TABLE IF NOT EXISTS transactions (
    transaction_id VARCHAR(8) PRIMARY KEY,
    user_id VARCHAR(8),
    game_id VARCHAR(8),
    amount DECIMAL(10, 2),
    item_type VARCHAR(50),
    transaction_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (game_id) REFERENCES games(game_id) ON DELETE CASCADE
);

INSERT IGNORE INTO transactions (transaction_id, user_id, game_id, amount, item_type, transaction_date) VALUES
('t1234567', 'u1234567', 'a1b2c3d4', 49.99, 'Skin', '2023-01-01'),
('t2345678', 'u2345678', 'a1b2c3d4', 19.99, 'Emote', '2023-01-02'),
('t3456789', 'u3456789', 'e5f6g7h8', 5.99, 'Boost', '2023-01-03'),
('t4567890', 'u4567890', 'e5f6g7h8', 29.99, 'DLC', '2023-01-04'),
('t5678901', 'u5678901', 'i9j0k1l2', 9.99, 'Pass', '2023-01-05'),
('t6789012', 'u6789012', 'm3n4o5p6', 99.99, 'Skin', '2023-01-06'),
('t7890123', 'u7890123', 'q7r8s9t0', 20.00, 'Emote', '2023-01-07'),
('t8901234', 'u8901234', 'u1v2w3x4', 50.00, 'Pass', '2023-01-08'),
('t9012345', 'u9012345', 'y5z6a7b8', 25.00,  'Pass', '2023-01-09'),
('t0123456', 'u0123456', 'c9d0e1f2', 15.00, 'Boost', '2023-01-10');

-- QUERIES
-- Simple queries
-- QUERY1: Select via joimn date
SELECT * FROM users WHERE date_joined > '2022-04-01';

-- QUERY2: Count # of games per publisher
SELECT publisher, COUNT(*) as num_games FROM games GROUP BY publisher;

-- QUERY3: finding games and corresponding server locaction
SELECT game_name, location FROM games JOIN servers ON games.game_id = servers.game_id;

-- QUERY4; Deleting users  who joined too early
DELETE FROM users WHERE date_joined < '2022-04-04';

-- QUERY5: Expensive transactions
SELECT * FROM transactions where amount >= 50.00;

-- QUERY6: latest transactons
SELECT * FROM transactions ORDER BY transaction_date DESC;

-- Complex queries
-- QUERY7: sort by higher spending in game
SELECT 
    g.game_name,
    u.username,
    MAX(t.amount) AS max_spent
FROM 
    transactions t
JOIN 
    users u ON t.user_id = u.user_id
JOIN 
    games g ON t.game_id = g.game_id
GROUP BY 
    t.game_id, u.user_id
ORDER BY 
    max_spent DESC;
    
-- QUERY8; average transaction amoiunts per game

SELECT 
    g.game_name,
    YEAR(t.transaction_date) AS year,
    MONTH(t.transaction_date) AS month,
    AVG(t.amount) AS avg_amount
FROM 
    transactions t
JOIN 
    games g ON t.game_id = g.game_id
GROUP BY 
    g.game_id, year, month;
    
-- QUERY9: High and Low spenders

SELECT 
    user_id, 
    SUM(amount) AS total_spent,
    CASE
        WHEN SUM(amount) > 50 THEN 'High Spender'
        WHEN SUM(amount) > 10 THEN 'Moderate Spender'
        ELSE 'Low Spender'
    END AS spender_status
FROM 
    transactions
GROUP BY 
    user_id;
    
-- QUERY 10; recent games and average transaction values for them
SELECT 
    games.game_name,
    AVG(transactions.amount) AS avg_transaction_amount
FROM 
    games
JOIN 
    transactions ON games.game_id = transactions.game_id
WHERE 
    games.release_date >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR)
GROUP BY 
    games.game_name;
    
-- TRIGGER 

ALTER TABLE users
ADD COLUMN last_activity_date DATE;

DELIMITER $$
CREATE TRIGGER update_last_activity
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN
    UPDATE users 
    SET last_activity_date = NOW() 
    WHERE user_id = NEW.user_id ;
END$$

-- Views

-- Revenue per game
CREATE VIEW RevenuePerGame AS
SELECT g.game_name, SUM(t.amount) AS total_revenue
FROM games g
JOIN transactions t ON g.game_id = t.game_id
GROUP BY g.game_name;

-- User activity
CREATE VIEW UserActivity AS
SELECT u.user_id, u.username, g.game_name, t.transaction_date, t.amount
FROM users u
JOIN transactions t ON u.user_id = t.user_id
JOIN games g ON g.game_id = t.game_id;

-- MEmbers of Guilds
CREATE VIEW GuildMembership AS
SELECT g.guild_name, g.creation_date, u.user_id, u.username, u.email
FROM guilds g
JOIN users u ON g.leader_user_id = u.user_id;