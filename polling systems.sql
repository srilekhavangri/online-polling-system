show databases;
use polling_systems;
-- README

-- SCHEMA DESIGN DECISIONS:
-- 1. Separated users, polls, options, and votes for normalization.
-- 2. Used foreign keys to maintain relationships and data integrity.
-- 3. is_deleted field allows soft deletion without removing data.

-- HOW TO RUN:
-- 1. Run schema creation queries first.
-- 2. Insert sample data.
-- 3. Use the feature queries to test functionalities.

-- BONUS IMPLEMENTED:
-- ✔ Soft deletion
-- ✔ Trending polls
-- ✔ Most active users

-- Created by: vangari srilekha
-- Assignment: DevifyX Online Polling/Voting System
select * from options;
select * from polls;
select * from votes;
select * from users;
SELECT user_id, COUNT(*) AS total_votes
FROM votes
GROUP BY user_id
ORDER BY total_votes DESC
LIMIT 3;
SELECT poll_id, COUNT(*) AS votes_last_24hr
FROM votes
WHERE vote_time >= NOW() - INTERVAL 1 DAY
GROUP BY poll_id
ORDER BY votes_last_24hr DESC;
