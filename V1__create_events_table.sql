CREATE TABLE events (
                    event_id VARCHAR(40) NOT NULL PRIMARY KEY,
                    event_type VARCHAR(20) NOT NULL,
                    timestamp TIMESTAMP NOT NULL,
                    details JSON NOT NULL
                );