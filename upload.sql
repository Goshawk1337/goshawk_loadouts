ALTER TABLE users
ADD COLUMN available_slots INT DEFAULT 3;
 
CREATE TABLE created_loadouts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identifier VARCHAR(100) NOT NULL,
    items TEXT NOT NULL,
    import_code VARCHAR(15) NOT NULL,
    imported INT DEFAULT 0
);

CREATE TABLE saved_loadouts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identifier VARCHAR(100) NOT NULL,
    creator VARCHAR(100) NOT NULL,
    items TEXT NOT NULL,
    import_code VARCHAR(15) NOT NULL,
    imported INT DEFAULT 0
);