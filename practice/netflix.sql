-- part 1
create table R(
                  FK1 INT NOT NULL,
                  FK2 INT NOT NULL,
                  PRIMARY KEY (FK1, FK2),
                  C1 VARCHAR(100),
                  C2 VARCHAR(100),
                  C3 VARCHAR(100),
                  C4 INT NOT NULL,
                  C5 INT
);

INSERT INTO R (FK1, FK2, C1, C2, C3, C4, C5) VALUES (1, 2, 'Caeleb Dressel', 'US', '50m freestyle swim', 50, 1);
INSERT INTO R (FK1, FK2, C1, C2, C3, C4, C5) VALUES (1, 4, 'Fred Ker', 'US', '100m running', 100, 2);
INSERT INTO R (FK1, FK2, C1, C2, C3, C4, C5) VALUES (1, 5, 'Eliud Kipe', 'Kenya', 'Marathon', 300, 3);
INSERT INTO R (FK1, FK2, C1, C2, C3, C4, C5) VALUES (2, 1, 'Florend Manadoua', 'France', '50m freestyle swim', 25, 2);
INSERT INTO R (FK1, FK2, C1, C2, C3, C4, C5) VALUES (2, 2, 'Caeleb Dressel', 'US', '100m freestyle swim', 100, 0);
INSERT INTO R (FK1, FK2, C1, C2, C3, C4, C5) VALUES (2, 3, 'Kyle Chalmers', 'Australia', '100m freestyle swim', 45, 2);
INSERT INTO R (FK1, FK2, C1, C2, C3, C4, C5) VALUES (3, 1, 'Ahmed Hafnoui', 'Netherlands', '400m freestyle swim', 35, 1);
INSERT INTO R (FK1, FK2, C1, C2, C3, C4, C5) VALUES (3, 3, 'Andre', 'Canada', '100m running', 10, 3);
INSERT INTO R (FK1, FK2, C1, C2, C3, C4, C5) VALUES (3, 4, 'Abdi', 'Netherlands', 'Marathon', 250, 3);
INSERT INTO R (FK1, FK2, C1, C2, C3, C4, C5) VALUES (4, 2, 'Marcell', 'Canada', '100m running', 70, 1);
INSERT INTO R (FK1, FK2, C1, C2, C3, C4, C5) VALUES (4, 3, 'Bruno', 'Brazil', '50m freestyle swim', 25, 3);
INSERT INTO R (FK1, FK2, C1, C2, C3, C4, C5) VALUES (4, 4, 'Bashir', 'Kenya', 'Marathon', 255, 2);

CREATE OR ALTER TRIGGER TrOnUpdate
    ON R
    FOR UPDATE
    AS
    DECLARE @total INT = 1
    SELECT @total = @total + SUM(i.C5 + d.C5)
    FROM deleted d INNER JOIN inserted i ON d.FK1 = i.FK1 AND d.FK1 = i.FK2
    WHERE d.C5 <= i.C5
    PRINT @total

UPDATE R
SET C5 = 0
WHERE FK1 = FK2
