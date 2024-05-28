BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "extras" (
	"match_id"	INTEGER,
	"bowler_team_id"	INTEGER,
	"over_no"	INTEGER,
	"ball_no"	INTEGER,
	"extra_type"	TEXT,
	"extra_runs"	INTEGER,
	FOREIGN KEY("bowler_team_id") REFERENCES "team"("team_id"),
	FOREIGN KEY("match_id") REFERENCES "match"("match_id")
);
CREATE TABLE IF NOT EXISTS "innings" (
	"match_id"	INTEGER,
	"bat_team_id"	INTEGER NOT NULL,
	"ball_team_id"	INTEGER NOT NULL,
	"over_no"	INTEGER NOT NULL,
	"ball_no"	INTEGER NOT NULL,
	"batter"	INTEGER NOT NULL,
	"non_striker"	INTEGER NOT NULL,
	"bowler"	INTEGER NOT NULL,
	"batter_runs"	INTEGER NOT NULL,
	"total_runs"	INTEGER NOT NULL,
	FOREIGN KEY("bat_team_id") REFERENCES "team"("team_id"),
	FOREIGN KEY("ball_team_id") REFERENCES "team"("team_id"),
	FOREIGN KEY("bowler") REFERENCES "player"("player_id"),
	FOREIGN KEY("non_striker") REFERENCES "player"("player_id"),
	FOREIGN KEY("match_id") REFERENCES "match"("match_id"),
	FOREIGN KEY("batter") REFERENCES "player"("player_id")
);
CREATE TABLE IF NOT EXISTS "match" (
	"match_id"	INTEGER,
	"match_type"	TEXT NOT NULL,
	"season"	TEXT NOT NULL,
	"teams_involve"	TEXT NOT NULL,
	"match_no"	INTEGER NOT NULL,
	PRIMARY KEY("match_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "match_details" (
	"match_id"	INTEGER,
	"team_a"	INTEGER NOT NULL,
	"team_b"	INTEGER NOT NULL,
	"target"	INTEGER,
	"winner"	INTEGER,
	"by_runs"	INTEGER,
	"toss_win"	INTEGER,
	"decision"	TEXT,
	"player_of_match"	INTEGER,
	"venue_id"	INTEGER NOT NULL,
	"date"	TEXT NOT NULL,
	PRIMARY KEY("match_id"),
	FOREIGN KEY("team_a") REFERENCES "team"("team_id"),
	FOREIGN KEY("toss_win") REFERENCES "team"("team_id"),
	FOREIGN KEY("winner") REFERENCES "team"("team_id"),
	FOREIGN KEY("team_b") REFERENCES "team"("team_id"),
	FOREIGN KEY("match_id") REFERENCES "match"("match_id"),
	FOREIGN KEY("venue_id") REFERENCES "venue"("venue_id"),
	FOREIGN KEY("player_of_match") REFERENCES "player"("player_id")
);
CREATE TABLE IF NOT EXISTS "official" (
	"ofc_id"	INTEGER,
	"ofc_type"	TEXT NOT NULL,
	"ofc_name"	TEXT NOT NULL,
	PRIMARY KEY("ofc_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "official_match" (
	"match_id"	INTEGER,
	"ofc_id"	INTEGER,
	PRIMARY KEY("match_id","ofc_id"),
	FOREIGN KEY("match_id") REFERENCES "match"("match_id"),
	FOREIGN KEY("ofc_id") REFERENCES "official"("ofc_id")
);
CREATE TABLE IF NOT EXISTS "player" (
	"match_id"	INTEGER NOT NULL,
	"team_id"	INTEGER NOT NULL,
	"player_id"	INTEGER,
	"player_name"	TEXT NOT NULL,
	PRIMARY KEY("player_id" AUTOINCREMENT),
	FOREIGN KEY("match_id") REFERENCES "match"("match_id"),
	FOREIGN KEY("team_id") REFERENCES "team"("team_id")
);
CREATE TABLE IF NOT EXISTS "team" (
	"team_id"	INTEGER,
	"team_name"	TEXT NOT NULL UNIQUE,
	PRIMARY KEY("team_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "venue" (
	"venue_id"	INTEGER,
	"stadium_name"	text NOT NULL,
	"city"	text NOT NULL,
	PRIMARY KEY("venue_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "wickets" (
	"match_id"	INTEGER NOT NULL,
	"bowler_team_id"	INTEGER NOT NULL,
	"batter_team_id"	INTEGER NOT NULL,
	"over_no"	INTEGER NOT NULL,
	"ball_no"	INTEGER NOT NULL,
	"wicket_kind"	TEXT NOT NULL,
	"batsman_out"	INTEGER NOT NULL,
	"bowler"	INTEGER NOT NULL,
	FOREIGN KEY("bowler") REFERENCES "player"("player_id"),
	FOREIGN KEY("bowler_team_id") REFERENCES "team"("team_id"),
	FOREIGN KEY("match_id") REFERENCES "match"("match_id"),
	FOREIGN KEY("batter_team_id") REFERENCES "team"("team_id"),
	FOREIGN KEY("batsman_out") REFERENCES "player"("player_id")
);
INSERT INTO "extras" ("match_id","bowler_team_id","over_no","ball_no","extra_type","extra_runs") VALUES (1,1,1,1,'legbyes',1);
INSERT INTO "extras" ("match_id","bowler_team_id","over_no","ball_no","extra_type","extra_runs") VALUES (1,1,1,3,'wides',1);
INSERT INTO "extras" ("match_id","bowler_team_id","over_no","ball_no","extra_type","extra_runs") VALUES (1,1,1,6,'legbyes',1);
INSERT INTO "extras" ("match_id","bowler_team_id","over_no","ball_no","extra_type","extra_runs") VALUES (1,1,3,3,'legbyes',1);
INSERT INTO "extras" ("match_id","bowler_team_id","over_no","ball_no","extra_type","extra_runs") VALUES (1,1,4,1,'wides',5);
INSERT INTO "extras" ("match_id","bowler_team_id","over_no","ball_no","extra_type","extra_runs") VALUES (1,1,4,2,'legbyes',1);
INSERT INTO "extras" ("match_id","bowler_team_id","over_no","ball_no","extra_type","extra_runs") VALUES (1,1,11,6,'byes',4);
INSERT INTO "extras" ("match_id","bowler_team_id","over_no","ball_no","extra_type","extra_runs") VALUES (1,1,13,5,'wides',1);
INSERT INTO "extras" ("match_id","bowler_team_id","over_no","ball_no","extra_type","extra_runs") VALUES (1,1,15,5,'wides',2);
INSERT INTO "extras" ("match_id","bowler_team_id","over_no","ball_no","extra_type","extra_runs") VALUES (1,2,1,2,'wides',1);
INSERT INTO "extras" ("match_id","bowler_team_id","over_no","ball_no","extra_type","extra_runs") VALUES (1,2,2,3,'legbyes',4);
INSERT INTO "extras" ("match_id","bowler_team_id","over_no","ball_no","extra_type","extra_runs") VALUES (1,2,3,5,'wides',1);
INSERT INTO "extras" ("match_id","bowler_team_id","over_no","ball_no","extra_type","extra_runs") VALUES (1,2,4,4,'legbyes',1);
INSERT INTO "extras" ("match_id","bowler_team_id","over_no","ball_no","extra_type","extra_runs") VALUES (1,2,7,4,'wides',1);
INSERT INTO "extras" ("match_id","bowler_team_id","over_no","ball_no","extra_type","extra_runs") VALUES (1,2,7,4,'wides',1);
INSERT INTO "extras" ("match_id","bowler_team_id","over_no","ball_no","extra_type","extra_runs") VALUES (1,2,8,2,'legbyes',1);
INSERT INTO "extras" ("match_id","bowler_team_id","over_no","ball_no","extra_type","extra_runs") VALUES (1,2,9,4,'wides',1);
INSERT INTO "extras" ("match_id","bowler_team_id","over_no","ball_no","extra_type","extra_runs") VALUES (1,2,9,4,'wides',1);
INSERT INTO "extras" ("match_id","bowler_team_id","over_no","ball_no","extra_type","extra_runs") VALUES (1,2,10,4,'wides',1);
INSERT INTO "extras" ("match_id","bowler_team_id","over_no","ball_no","extra_type","extra_runs") VALUES (1,2,10,4,'legbyes',1);
INSERT INTO "extras" ("match_id","bowler_team_id","over_no","ball_no","extra_type","extra_runs") VALUES (1,2,13,2,'wides',2);
INSERT INTO "extras" ("match_id","bowler_team_id","over_no","ball_no","extra_type","extra_runs") VALUES (1,2,15,1,'wides',1);
INSERT INTO "extras" ("match_id","bowler_team_id","over_no","ball_no","extra_type","extra_runs") VALUES (1,2,15,4,'legbyes',1);
INSERT INTO "extras" ("match_id","bowler_team_id","over_no","ball_no","extra_type","extra_runs") VALUES (1,2,16,1,'wides',1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,1,1,1,2,20,0,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,1,2,2,1,20,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,1,3,2,1,20,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,1,4,2,1,20,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,1,5,2,1,20,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,1,6,2,1,20,0,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,2,1,2,1,21,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,2,2,2,1,21,4,4);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,2,3,2,1,21,4,4);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,2,4,2,1,21,6,6);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,2,5,2,1,21,4,4);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,2,6,2,1,21,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,3,1,1,2,20,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,3,2,1,2,20,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,3,3,1,2,20,0,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,3,4,2,1,20,4,4);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,3,5,2,1,20,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,3,6,1,2,20,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,4,1,2,1,19,6,6);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,4,2,2,1,19,0,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,4,3,1,2,19,4,4);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,4,4,1,2,19,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,4,5,1,2,19,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,4,6,2,1,19,6,6);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,5,1,1,2,20,4,4);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,5,2,1,2,20,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,5,3,2,1,20,4,4);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,5,4,2,1,20,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,5,5,2,1,20,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,5,6,1,2,20,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,6,1,2,1,21,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,6,2,1,2,21,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,6,3,3,2,21,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,6,4,3,2,21,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,6,5,3,2,21,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,6,6,3,2,21,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,7,1,2,3,19,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,7,2,3,2,19,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,7,3,2,3,19,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,7,4,3,2,19,2,2);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,7,5,3,2,19,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,7,6,2,3,19,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,8,1,2,3,21,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,8,2,2,3,21,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,8,3,3,2,21,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,8,4,2,3,21,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,8,5,3,2,21,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,8,6,2,3,21,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,9,1,2,3,15,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,9,2,2,3,15,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,9,3,2,3,15,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,9,4,2,3,15,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,9,5,3,2,15,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,9,6,2,3,15,2,2);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,10,1,3,2,22,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,10,2,2,3,22,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,10,3,3,2,22,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,10,4,2,3,22,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,10,5,2,3,22,6,6);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,10,6,2,3,22,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,11,1,2,3,15,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,11,2,3,2,15,4,4);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,11,3,3,2,15,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,11,4,3,2,15,6,6);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,11,5,3,2,15,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,11,6,3,2,15,0,4);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,12,1,2,3,22,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,12,2,2,3,22,6,6);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,12,3,2,3,22,2,2);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,12,4,2,3,22,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,12,5,3,2,22,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,12,6,3,2,22,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,13,1,3,2,15,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,13,2,2,4,15,4,4);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,13,3,2,4,15,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,13,4,2,4,15,2,2);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,13,5,2,4,15,4,4);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,13,6,2,4,15,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,14,1,2,4,22,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,14,2,4,2,22,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,14,3,4,2,22,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,14,4,2,4,22,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,14,5,4,2,22,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,14,6,2,4,22,2,2);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,15,1,4,2,16,4,4);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,15,2,4,2,16,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,15,3,2,4,16,6,6);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,15,4,2,4,16,4,4);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,15,5,4,2,16,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,15,6,2,4,16,6,6);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,16,1,4,2,19,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,16,2,4,2,19,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,16,3,2,4,19,2,2);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,16,4,2,4,19,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,16,5,2,4,19,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,16,6,4,2,19,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,17,1,2,4,21,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,17,2,4,2,21,2,2);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,17,3,4,2,21,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,17,4,2,4,21,6,6);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,17,5,2,4,21,2,2);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,17,6,2,4,21,2,2);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,18,1,4,2,19,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,18,2,2,5,19,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,18,3,5,2,19,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,18,4,5,2,19,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,18,5,2,5,19,4,4);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,18,6,2,5,19,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,19,1,2,5,15,6,6);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,19,2,2,5,15,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,19,3,2,5,15,6,6);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,19,4,2,5,15,4,4);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,19,5,2,5,15,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,19,6,5,2,15,4,4);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,20,1,2,5,20,6,6);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,20,2,2,5,20,6,6);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,20,3,2,5,20,2,2);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,20,4,2,5,20,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,20,5,2,5,20,2,2);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,2,1,20,6,2,5,20,6,6);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,1,1,12,13,9,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,1,2,13,12,9,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,1,3,13,12,9,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,1,4,12,13,9,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,1,5,13,12,9,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,1,6,13,12,9,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,2,1,12,13,11,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,2,2,14,13,11,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,2,3,14,13,11,0,4);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,2,4,14,13,11,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,2,5,13,14,11,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,2,6,13,14,11,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,3,1,14,13,9,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,3,2,14,13,9,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,3,3,15,13,9,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,3,4,13,15,9,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,3,5,13,15,9,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,3,6,13,15,9,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,4,1,13,15,11,2,2);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,4,2,13,15,11,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,4,3,15,13,11,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,4,4,15,13,11,0,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,4,5,13,15,11,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,4,6,13,15,11,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,5,1,15,13,8,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,5,2,13,15,8,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,5,3,15,13,8,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,5,4,15,13,8,6,6);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,5,5,15,13,8,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,5,6,16,13,8,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,6,1,13,16,9,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,6,2,13,16,9,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,6,3,17,16,9,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,6,4,17,16,9,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,6,5,16,17,9,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,6,6,17,16,9,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,7,1,16,17,8,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,7,2,16,17,8,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,7,3,16,17,8,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,7,4,17,16,8,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,7,5,17,16,8,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,7,6,17,16,8,4,4);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,8,1,16,17,1,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,8,2,17,16,1,0,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,8,3,16,17,1,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,8,4,17,16,1,2,2);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,8,5,17,16,1,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,8,6,16,18,1,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,9,1,18,16,8,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,9,2,18,16,8,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,9,3,19,16,8,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,9,4,19,16,8,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,9,5,16,19,8,2,2);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,9,6,16,19,8,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,10,1,19,20,1,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,10,2,20,19,1,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,10,3,20,19,1,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,10,4,20,19,1,0,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,10,5,19,20,1,4,4);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,10,6,19,20,1,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,11,1,19,20,8,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,11,2,19,20,8,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,11,3,19,20,8,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,11,4,19,20,8,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,11,5,20,19,8,4,4);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,11,6,20,19,8,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,12,1,19,20,1,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,12,2,21,20,1,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,12,3,21,20,1,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,12,4,21,20,1,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,12,5,20,21,1,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,12,6,20,21,1,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,13,1,20,21,6,6,6);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,13,2,21,20,6,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,13,3,20,21,6,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,13,4,21,20,6,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,13,5,21,20,6,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,13,6,21,20,6,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,14,1,21,20,1,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,14,2,22,20,1,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,14,3,20,22,1,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,14,4,20,22,1,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,14,5,20,22,1,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,14,6,20,22,1,6,6);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,15,1,22,20,11,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,15,2,22,20,11,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,15,3,22,20,11,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,15,4,20,22,11,0,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,15,5,22,20,11,1,1);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,15,6,20,22,11,0,0);
INSERT INTO "innings" ("match_id","bat_team_id","ball_team_id","over_no","ball_no","batter","non_striker","bowler","batter_runs","total_runs") VALUES (1,1,2,16,1,22,20,6,0,0);
INSERT INTO "match" ("match_id","match_type","season","teams_involve","match_no") VALUES (1,'T20','2007/08','club',1);
INSERT INTO "match_details" ("match_id","team_a","team_b","target","winner","by_runs","toss_win","decision","player_of_match","venue_id","date") VALUES (1,1,2,223,2,140,1,'field',2,1,'2008-04-18');
INSERT INTO "official" ("ofc_id","ofc_type","ofc_name") VALUES (1,'match_referees','J Srinath');
INSERT INTO "official" ("ofc_id","ofc_type","ofc_name") VALUES (2,'reserve_umpires','VN Kulkarni');
INSERT INTO "official" ("ofc_id","ofc_type","ofc_name") VALUES (3,'tv_umpires','AM Saheba');
INSERT INTO "official" ("ofc_id","ofc_type","ofc_name") VALUES (4,'umpires','Asad Rauf');
INSERT INTO "official" ("ofc_id","ofc_type","ofc_name") VALUES (5,'umpires','RE Koertzen');
INSERT INTO "official_match" ("match_id","ofc_id") VALUES (1,1);
INSERT INTO "official_match" ("match_id","ofc_id") VALUES (1,2);
INSERT INTO "official_match" ("match_id","ofc_id") VALUES (1,3);
INSERT INTO "official_match" ("match_id","ofc_id") VALUES (1,4);
INSERT INTO "official_match" ("match_id","ofc_id") VALUES (1,5);
INSERT INTO "player" ("match_id","team_id","player_id","player_name") VALUES (1,2,1,'SC Ganguly');
INSERT INTO "player" ("match_id","team_id","player_id","player_name") VALUES (1,2,2,'BB McCullum');
INSERT INTO "player" ("match_id","team_id","player_id","player_name") VALUES (1,2,3,'RT Ponting');
INSERT INTO "player" ("match_id","team_id","player_id","player_name") VALUES (1,2,4,'DJ Hussey');
INSERT INTO "player" ("match_id","team_id","player_id","player_name") VALUES (1,2,5,'Mohammad Hafeez');
INSERT INTO "player" ("match_id","team_id","player_id","player_name") VALUES (1,2,6,'LR Shukla');
INSERT INTO "player" ("match_id","team_id","player_id","player_name") VALUES (1,2,7,'WP Saha');
INSERT INTO "player" ("match_id","team_id","player_id","player_name") VALUES (1,2,8,'AB Agarkar');
INSERT INTO "player" ("match_id","team_id","player_id","player_name") VALUES (1,2,9,'AB Dinda');
INSERT INTO "player" ("match_id","team_id","player_id","player_name") VALUES (1,2,10,'M Kartik');
INSERT INTO "player" ("match_id","team_id","player_id","player_name") VALUES (1,2,11,'I Sharma');
INSERT INTO "player" ("match_id","team_id","player_id","player_name") VALUES (1,1,12,'R Dravid');
INSERT INTO "player" ("match_id","team_id","player_id","player_name") VALUES (1,1,13,'W Jaffer');
INSERT INTO "player" ("match_id","team_id","player_id","player_name") VALUES (1,1,14,'V Kohli');
INSERT INTO "player" ("match_id","team_id","player_id","player_name") VALUES (1,1,15,'JH Kallis');
INSERT INTO "player" ("match_id","team_id","player_id","player_name") VALUES (1,1,16,'CL White');
INSERT INTO "player" ("match_id","team_id","player_id","player_name") VALUES (1,1,17,'MV Boucher');
INSERT INTO "player" ("match_id","team_id","player_id","player_name") VALUES (1,1,18,'B Akhil');
INSERT INTO "player" ("match_id","team_id","player_id","player_name") VALUES (1,1,19,'AA Noffke');
INSERT INTO "player" ("match_id","team_id","player_id","player_name") VALUES (1,1,20,'P Kumar');
INSERT INTO "player" ("match_id","team_id","player_id","player_name") VALUES (1,1,21,'Z Khan');
INSERT INTO "player" ("match_id","team_id","player_id","player_name") VALUES (1,1,22,'SB Joshi');
INSERT INTO "team" ("team_id","team_name") VALUES (1,'Royal Challengers Bangalore');
INSERT INTO "team" ("team_id","team_name") VALUES (2,'Kolkata Knight Riders');
INSERT INTO "venue" ("venue_id","stadium_name","city") VALUES (1,'M Chinnaswamy Stadium','Bangalore');
INSERT INTO "wickets" ("match_id","bowler_team_id","batter_team_id","over_no","ball_no","wicket_kind","batsman_out","bowler") VALUES (1,1,2,6,2,'caught',1,21);
INSERT INTO "wickets" ("match_id","bowler_team_id","batter_team_id","over_no","ball_no","wicket_kind","batsman_out","bowler") VALUES (1,1,2,13,1,'caught',3,15);
INSERT INTO "wickets" ("match_id","bowler_team_id","batter_team_id","over_no","ball_no","wicket_kind","batsman_out","bowler") VALUES (1,1,2,18,1,'caught',4,19);
INSERT INTO "wickets" ("match_id","bowler_team_id","batter_team_id","over_no","ball_no","wicket_kind","batsman_out","bowler") VALUES (1,2,1,2,1,'bowled',12,11);
INSERT INTO "wickets" ("match_id","bowler_team_id","batter_team_id","over_no","ball_no","wicket_kind","batsman_out","bowler") VALUES (1,2,1,3,2,'bowled',14,9);
INSERT INTO "wickets" ("match_id","bowler_team_id","batter_team_id","over_no","ball_no","wicket_kind","batsman_out","bowler") VALUES (1,2,1,5,5,'caught',15,8);
INSERT INTO "wickets" ("match_id","bowler_team_id","batter_team_id","over_no","ball_no","wicket_kind","batsman_out","bowler") VALUES (1,2,1,6,2,'caught',13,9);
INSERT INTO "wickets" ("match_id","bowler_team_id","batter_team_id","over_no","ball_no","wicket_kind","batsman_out","bowler") VALUES (1,2,1,8,5,'caught',17,1);
INSERT INTO "wickets" ("match_id","bowler_team_id","batter_team_id","over_no","ball_no","wicket_kind","batsman_out","bowler") VALUES (1,2,1,9,2,'caught',18,8);
INSERT INTO "wickets" ("match_id","bowler_team_id","batter_team_id","over_no","ball_no","wicket_kind","batsman_out","bowler") VALUES (1,2,1,9,6,'caught',16,8);
INSERT INTO "wickets" ("match_id","bowler_team_id","batter_team_id","over_no","ball_no","wicket_kind","batsman_out","bowler") VALUES (1,2,1,12,1,'run out',19,1);
INSERT INTO "wickets" ("match_id","bowler_team_id","batter_team_id","over_no","ball_no","wicket_kind","batsman_out","bowler") VALUES (1,2,1,14,1,'bowled',21,1);
INSERT INTO "wickets" ("match_id","bowler_team_id","batter_team_id","over_no","ball_no","wicket_kind","batsman_out","bowler") VALUES (1,2,1,16,1,'caught',22,6);
COMMIT;
