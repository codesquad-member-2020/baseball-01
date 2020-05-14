INSERT INTO team
    (team_id, team_name, team_type, logo_id, match_id, pitcher_id)
VALUES (1, '두산 베어스', 'home', 1, 1, 1),
       (2, '한화 이글스', 'away', 2, 1, 2),
       (3, '기기아 타이거스', 'home', 3, 2, 3),
       (4, '키움 히어로즈', 'away', 4, 2, 4),
       (5, 'KT 위즈', 'home', 5, 3, 5),
       (6, 'LG 트윈스', 'away', 6, 3, 6),
       (7, '롯데 자이언츠', 'home', 7, 4, 7),
       (8, 'NC 다이노스', 'away', 8, 4, 8),
       (9, '삼성 라이온즈', 'home', 9, 5, 9),
       (10, 'SK 와이번스', 'away', 10, 5, 10);

INSERT INTO logo
    (logo_id, url)
VALUES (1, 'https://sports-phinf.pstatic.net/team/kbo/default/OB.png'),
       (2, 'https://sports-phinf.pstatic.net/team/kbo/default/HH.png'),
       (3, 'https://sports-phinf.pstatic.net/team/kbo/default/HT.png'),
       (4, 'https://sports-phinf.pstatic.net/team/kbo/default/WO.png'),
       (5, 'https://sports-phinf.pstatic.net/team/kbo/default/KT.png'),
       (6, 'https://sports-phinf.pstatic.net/team/kbo/default/LG.png'),
       (7, 'https://sports-phinf.pstatic.net/team/kbo/default/LT.png'),
       (8, 'https://sports-phinf.pstatic.net/team/kbo/default/NC.png'),
       (9, 'https://sports-phinf.pstatic.net/team/kbo/default/SS.png'),
       (10, 'https://sports-phinf.pstatic.net/team/kbo/default/SK.png');

INSERT INTO user
    (user_id, name)
VALUES (1, 'poogle');

INSERT INTO hitter
    (hitter_name, hitter_number, average, team_id)
VALUES ('박건우', 1, 0.319, 1),
       ('오재원', 2, 0.164, 1),
       ('페르난데스', 3, 0.344, 1),
       ('김재환', 4, 0.283, 1),
       ('김인태', 5, 0.233, 1),
       ('김재호', 6, 0.268, 1),
       ('정수빈', 7, 0.265, 1),
       ('박세혁', 8, 0.279, 1),
       ('허경민', 9, 0.288, 1),
       ('김태균', 1, 0.305, 2),
       ('이동훈', 2, 0.290, 2),
       ('최재훈', 3, 0.290, 2),
       ('호잉', 4, 0.284, 2),
       ('정근우', 5, 0.278, 2),
       ('송광민', 6, 0.264, 2),
       ('하주석', 7, 0.263, 2),
       ('정은원', 8, 0.262, 2),
       ('이성열', 9, 0.256, 2),
       ('안치홍', 1, 0.315, 3),
       ('터커', 2, 0.311, 3),
       ('황윤호', 3, 0.301, 3),
       ('최형우', 4, 0.300, 3),
       ('한준수', 5, 0.300, 3),
       ('김주찬', 6, 0.300, 3),
       ('김선빈', 7, 0.292, 3),
       ('유민상', 8, 0.291, 3),
       ('이정훈', 9, 0.286, 3),
       ('이정후', 1, 0.336, 4),
       ('샌즈', 2, 0.307, 4),
       ('서건창', 3, 0.300, 4),
       ('박동원', 4, 0.297, 4),
       ('이지영', 5, 0.282, 4),
       ('박병호', 6, 0.280, 4),
       ('김혜성', 7, 0.276, 4),
       ('김웅빈', 8, 0.273, 4),
       ('김하성', 9, 0.307, 4),
       ('강백호', 1, 0.336, 5),
       ('로하스', 2, 0.322, 5),
       ('유한준', 3, 0.317, 5),
       ('송민섭', 4, 0.302, 5),
       ('조용호', 5, 0.293, 5),
       ('황재균', 6, 0.283, 5),
       ('김민혁', 7, 0.281, 5),
       ('심우준', 8, 0.279, 5),
       ('강민국', 9, 0.273, 5),
       ('채은성', 1, 0.315, 6),
       ('이천웅', 2, 0.308, 6),
       ('김현수', 3, 0.304, 6),
       ('페게로', 4, 0.286, 6),
       ('이형종', 5, 0.286, 6),
       ('박용택', 6, 0.282, 6),
       ('조셉', 7, 0.274, 6),
       ('유강남', 8, 0.270, 6),
       ('김민성', 9, 0.260, 6),
       ('민병헌', 1, 0.304, 7),
       ('전준우', 2, 0.301, 7),
       ('손아섭', 3, 0.295, 7),
       ('이대호', 4, 0.285, 7),
       ('김동한', 5, 0.282, 7),
       ('정준혁', 6, 0.273, 7),
       ('허일', 7, 0.255, 7),
       ('신본기', 8, 0.256, 7),
       ('고승민', 9, 0.253, 7),
       ('최승민', 1, 0.444, 8),
       ('나성범', 2, 0.366, 8),
       ('양의지', 3, 0.354, 8),
       ('박민우', 4, 0.344, 8),
       ('모창민', 5, 0.305, 8),
       ('이명기', 6, 0.293, 8),
       ('이상호', 7, 0.278, 8),
       ('김찬형', 8, 0.277, 8),
       ('김태진', 9, 0.275, 8),
       ('김헌곤', 1, 0.297, 9),
       ('박찬도', 2, 0.281, 9),
       ('러프', 3, 0.273, 9),
       ('윌리엄슨', 4, 0.271, 9),
       ('김상수', 5, 0.271, 9),
       ('구자욱', 6, 0.267, 9),
       ('이학주', 7, 0.262, 9),
       ('박한이', 8, 0.257, 9),
       ('박계범', 9, 0.260, 9),
       ('고종욱', 1, 0.323, 10),
       ('최정', 2, 0.292, 10),
       ('김재현', 3, 0.286, 10),
       ('정의윤', 4, 0.282, 10),
       ('김성현', 5, 0.246, 10),
       ('이재원', 6, 0.268, 10),
       ('로맥', 7, 0.276, 10),
       ('한동민', 8, 0.265, 10),
       ('노수광', 9, 0.250, 10);

INSERT INTO matches
    (home_team, away_team)
VALUES ('두산 베어스', '한화 이글스'),
       ('기아 타이거즈', '키움 히어로즈'),
       ('KT 위즈', 'LG 트윈스'),
       ('롯데 자이언츠', 'NC 다이노스'),
       ('삼성 라이온즈', 'SK 와이번스');

INSERT INTO pitcher
    (pitcher_id, pitcher_name)
VALUES (1, '곽빈'),
       (2, '안영명'),
       (3, '하준영'),
       (4, '김상수'),
       (5, '주권'),
       (6, '진해수'),
       (7, '진명호'),
       (8, '배재환'),
       (9, '임현준'),
       (10, '서진용');
INSERT INTO halfInning
(inning_id, round, hit_score, pitcher_name, number_of_pitches, outSum, status, match_id, change_status, game_over)
VALUES (1, '1회 초', 0, 'tbd', 0, 0, 'home', 1, 0, 0),
       (2, '1회 말', 0, 'tbd', 0, 0, 'away', 1, 0, 0),
       (3, '2회 초', 0, 'tbd', 0, 0, 'home', 1, 0, 0),
       (4, '2회 말', 0, 'tbd', 0, 0, 'away', 1, 0, 0),
       (5, '3회 초', 0, 'tbd', 0, 0, 'home', 1, 0, 0),
       (6, '3회 말', 0, 'tbd', 0, 0, 'away', 1, 0, 0),
       (7, '4회 초', 0, 'tbd', 0, 0, 'home', 1, 0, 0),
       (8, '4회 말', 0, 'tbd', 0, 0, 'away', 1, 0, 0),
       (9, '5회 초', 0, 'tbd', 0, 0, 'home', 1, 0, 0),
       (10, '5회 말', 0, 'tbd', 0, 0, 'away', 1, 0, 0),
       (11, '6회 초', 0, 'tbd', 0, 0, 'home', 1, 0, 0),
       (12, '6회 말', 0, 'tbd', 0, 0, 'away', 1, 0, 0),
       (13, '7회 초', 0, 'tbd', 0, 0, 'home', 1, 0, 0),
       (14, '7회 말', 0, 'tbd', 0, 0, 'away', 1, 0, 0),
       (15, '8회 초', 0, 'tbd', 0, 0, 'home', 1, 0, 0),
       (16, '8회 말', 0, 'tbd', 0, 0, 'away', 1, 0, 0),
       (17, '9회 초', 0, 'tbd', 0, 0, 'home', 1, 0, 0),
       (18, '9회 말', 0, 'tbd', 0, 0, 'away', 1, 0, 0),

       (19, '1회 초', 0, 'tbd', 0, 0, 'home', 2, 0, 0),
       (20, '1회 말', 0, 'tbd', 0, 0, 'away', 2, 0, 0),
       (21, '2회 초', 0, 'tbd', 0, 0, 'home', 2, 0, 0),
       (22, '2회 말', 0, 'tbd', 0, 0, 'away', 2, 0, 0),
       (23, '3회 초', 0, 'tbd', 0, 0, 'home', 2, 0, 0),
       (24, '3회 말', 0, 'tbd', 0, 0, 'away', 2, 0, 0),
       (25, '4회 초', 0, 'tbd', 0, 0, 'home', 2, 0, 0),
       (26, '4회 말', 0, 'tbd', 0, 0, 'away', 2, 0, 0),
       (27, '5회 초', 0, 'tbd', 0, 0, 'home', 2, 0, 0),
       (28, '5회 말', 0, 'tbd', 0, 0, 'away', 2, 0, 0),
       (29, '6회 초', 0, 'tbd', 0, 0, 'home', 2, 0, 0),
       (30, '6회 말', 0, 'tbd', 0, 0, 'away', 2, 0, 0),
       (31, '7회 초', 0, 'tbd', 0, 0, 'home', 2, 0, 0),
       (32, '7회 말', 0, 'tbd', 0, 0, 'away', 2, 0, 0),
       (33, '8회 초', 0, 'tbd', 0, 0, 'home', 2, 0, 0),
       (34, '8회 말', 0, 'tbd', 0, 0, 'away', 2, 0, 0),
       (35, '9회 초', 0, 'tbd', 0, 0, 'home', 2, 0, 0),
       (36, '9회 말', 0, 'tbd', 0, 0, 'away', 2, 0, 0),

       (37, '1회 초', 0, 'tbd', 0, 0, 'home', 3, 0, 0),
       (38, '1회 말', 0, 'tbd', 0, 0, 'away', 3, 0, 0),
       (39, '2회 초', 0, 'tbd', 0, 0, 'home', 3, 0, 0),
       (40, '2회 말', 0, 'tbd', 0, 0, 'away', 3, 0, 0),
       (41, '3회 초', 0, 'tbd', 0, 0, 'home', 3, 0, 0),
       (42, '3회 말', 0, 'tbd', 0, 0, 'away', 3, 0, 0),
       (43, '4회 초', 0, 'tbd', 0, 0, 'home', 3, 0, 0),
       (44, '4회 말', 0, 'tbd', 0, 0, 'away', 3, 0, 0),
       (45, '5회 초', 0, 'tbd', 0, 0, 'home', 3, 0, 0),
       (46, '5회 말', 0, 'tbd', 0, 0, 'away', 3, 0, 0),
       (47, '6회 초', 0, 'tbd', 0, 0, 'home', 3, 0, 0),
       (48, '6회 말', 0, 'tbd', 0, 0, 'away', 3, 0, 0),
       (49, '7회 초', 0, 'tbd', 0, 0, 'home', 3, 0, 0),
       (50, '7회 말', 0, 'tbd', 0, 0, 'away', 3, 0, 0),
       (51, '8회 초', 0, 'tbd', 0, 0, 'home', 3, 0, 0),
       (52, '8회 말', 0, 'tbd', 0, 0, 'away', 3, 0, 0),
       (53, '9회 초', 0, 'tbd', 0, 0, 'home', 3, 0, 0),
       (54, '9회 말', 0, 'tbd', 0, 0, 'away', 3, 0, 0),

       (55, '1회 초', 0, 'tbd', 0, 0, 'home', 4, 0, 0),
       (56, '1회 말', 0, 'tbd', 0, 0, 'away', 4, 0, 0),
       (57, '2회 초', 0, 'tbd', 0, 0, 'home', 4, 0, 0),
       (58, '2회 말', 0, 'tbd', 0, 0, 'away', 4, 0, 0),
       (59, '3회 초', 0, 'tbd', 0, 0, 'home', 4, 0, 0),
       (60, '3회 말', 0, 'tbd', 0, 0, 'away', 4, 0, 0),
       (61, '4회 초', 0, 'tbd', 0, 0, 'home', 4, 0, 0),
       (62, '4회 말', 0, 'tbd', 0, 0, 'away', 4, 0, 0),
       (63, '5회 초', 0, 'tbd', 0, 0, 'home', 4, 0, 0),
       (64, '5회 말', 0, 'tbd', 0, 0, 'away', 4, 0, 0),
       (65, '6회 초', 0, 'tbd', 0, 0, 'home', 4, 0, 0),
       (66, '6회 말', 0, 'tbd', 0, 0, 'away', 4, 0, 0),
       (67, '7회 초', 0, 'tbd', 0, 0, 'home', 4, 0, 0),
       (68, '7회 말', 0, 'tbd', 0, 0, 'away', 4, 0, 0),
       (69, '8회 초', 0, 'tbd', 0, 0, 'home', 4, 0, 0),
       (70, '8회 말', 0, 'tbd', 0, 0, 'away', 4, 0, 0),
       (71, '9회 초', 0, 'tbd', 0, 0, 'home', 4, 0, 0),
       (72, '9회 말', 0, 'tbd', 0, 0, 'away', 4, 0, 0),


       (73, '1회 초', 0, 'tbd', 0, 0, 'home', 5, 0, 0),
       (75, '2회 초', 0, 'tbd', 0, 0, 'home', 5, 0, 0),
       (76, '2회 말', 0, 'tbd', 0, 0, 'away', 5, 0, 0),
       (77, '3회 초', 0, 'tbd', 0, 0, 'home', 5, 0, 0),
       (78, '3회 말', 0, 'tbd', 0, 0, 'away', 5, 0, 0),
       (79, '4회 초', 0, 'tbd', 0, 0, 'home', 5, 0, 0),
       (80, '4회 말', 0, 'tbd', 0, 0, 'away', 5, 0, 0),
       (81, '5회 초', 0, 'tbd', 0, 0, 'home', 5, 0, 0),
       (82, '5회 말', 0, 'tbd', 0, 0, 'away', 5, 0, 0),
       (83, '6회 초', 0, 'tbd', 0, 0, 'home', 5, 0, 0),
       (84, '6회 말', 0, 'tbd', 0, 0, 'away', 5, 0, 0),
       (85, '7회 초', 0, 'tbd', 0, 0, 'home', 5, 0, 0),
       (86, '7회 말', 0, 'tbd', 0, 0, 'away', 5, 0, 0),
       (87, '8회 초', 0, 'tbd', 0, 0, 'home', 5, 0, 0),
       (88, '8회 말', 0, 'tbd', 0, 0, 'away', 5, 0, 0),
       (89, '9회 초', 0, 'tbd', 0, 0, 'home', 5, 0, 0),
       (90, '9회 말', 0, 'tbd', 0, 0, 'away', 5, 0, 0);

INSERT INTO record
(hitter_name, hitter_number, strike_count, ball_count, out_count, hit_count, average, plate_appearance, available,
 hitter_id, team_id, total_out_count, total_hit_count)
VALUES ('박건우', 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0),
       ('오재원', 2, 0, 0, 0, 0, 0, 0, 1, 2, 1, 0, 0),
       ('페르난데스', 3, 0, 0, 0, 0, 0, 0, 1, 3, 1, 0, 0),
       ('김재환', 4, 0, 0, 0, 0, 0, 0, 1, 4, 1, 0, 0),
       ('김인태', 5, 0, 0, 0, 0, 0, 0, 1, 5, 1, 0, 0),
       ('김재호', 6, 0, 0, 0, 0, 0, 0, 1, 6, 1, 0, 0),
       ('정수빈', 7, 0, 0, 0, 0, 0, 0, 1, 7, 1, 0, 0),
       ('박세혁', 8, 0, 0, 0, 0, 0, 0, 1, 8, 1, 0, 0),
       ('허경민', 9, 0, 0, 0, 0, 0, 0, 1, 9, 1, 0, 0),
       ('김태균', 1, 0, 0, 0, 0, 0, 0, 1, 10, 2, 0, 0),
       ('이동훈', 2, 0, 0, 0, 0, 0, 0, 1, 11, 2, 0, 0),
       ('최재훈', 3, 0, 0, 0, 0, 0, 0, 1, 12, 2, 0, 0),
       ('호잉', 4, 0, 0, 0, 0, 0, 0, 1, 13, 2, 0, 0),
       ('정근우', 5, 0, 0, 0, 0, 0, 0, 1, 14, 2, 0, 0),
       ('송광민', 6, 0, 0, 0, 0, 0, 0, 1, 15, 2, 0, 0),
       ('하주석', 7, 0, 0, 0, 0, 0, 0, 1, 16, 2, 0, 0),
       ('정은원', 8, 0, 0, 0, 0, 0, 0, 1, 17, 2, 0, 0),
       ('이성열', 9, 0, 0, 0, 0, 0, 0, 1, 18, 2, 0, 0),
       ('안치홍', 1, 0, 0, 0, 0, 0, 0, 1, 19, 3, 0, 0),
       ('터커', 2, 0, 0, 0, 0, 0, 0, 1, 20, 3, 0, 0),
       ('황윤호', 3, 0, 0, 0, 0, 0, 0, 1, 21, 3, 0, 0),
       ('최형우', 4, 0, 0, 0, 0, 0, 0, 1, 22, 3, 0, 0),
       ('한준수', 5, 0, 0, 0, 0, 0, 0, 1, 23, 3, 0, 0),
       ('김주찬', 6, 0, 0, 0, 0, 0, 0, 1, 24, 3, 0, 0),
       ('김선빈', 7, 0, 0, 0, 0, 0, 0, 1, 25, 3, 0, 0),
       ('유민상', 8, 0, 0, 0, 0, 0, 0, 1, 26, 3, 0, 0),
       ('이정훈', 9, 0, 0, 0, 0, 0, 0, 1, 27, 3, 0, 0),
       ('이정후', 1, 0, 0, 0, 0, 0, 0, 1, 28, 4, 0, 0),
       ('샌즈', 2, 0, 0, 0, 0, 0, 0, 1, 29, 4, 0, 0),
       ('서건창', 3, 0, 0, 0, 0, 0, 0, 1, 30, 4, 0, 0),
       ('박동원', 4, 0, 0, 0, 0, 0, 0, 1, 31, 4, 0, 0),
       ('이지영', 5, 0, 0, 0, 0, 0, 0, 1, 32, 4, 0, 0),
       ('박병호', 6, 0, 0, 0, 0, 0, 0, 1, 33, 4, 0, 0),
       ('김혜성', 7, 0, 0, 0, 0, 0, 0, 1, 34, 4, 0, 0),
       ('김웅빈', 8, 0, 0, 0, 0, 0, 0, 1, 35, 4, 0, 0),
       ('김하성', 9, 0, 0, 0, 0, 0, 0, 1, 36, 4, 0, 0),
       ('강백호', 1, 0, 0, 0, 0, 0, 0, 1, 37, 5, 0, 0),
       ('로하스', 2, 0, 0, 0, 0, 0, 0, 1, 38, 5, 0, 0),
       ('유한준', 3, 0, 0, 0, 0, 0, 0, 1, 39, 5, 0, 0),
       ('송민섭', 4, 0, 0, 0, 0, 0, 0, 1, 40, 5, 0, 0),
       ('조용호', 0, 0, 0, 0, 0, 0, 1, 1, 41, 5, 0, 0),
       ('황재균', 0, 0, 0, 0, 0, 0, 1, 1, 42, 5, 0, 0),
       ('김민혁', 0, 0, 0, 0, 0, 0, 1, 1, 43, 5, 0, 0),
       ('심우준', 0, 0, 0, 0, 0, 0, 1, 1, 44, 5, 0, 0),
       ('강민국', 0, 0, 0, 0, 0, 0, 1, 1, 45, 5, 0, 0),
       ('채은성', 0, 0, 0, 0, 0, 0, 1, 1, 46, 6, 0, 0),
       ('이천웅', 2, 0, 0, 0, 0, 0, 1, 1, 47, 6, 0, 0),
       ('김현수', 3, 0, 0, 0, 0, 0, 1, 1, 48, 6, 0, 0),
       ('페게로', 4, 0, 0, 0, 0, 0, 1, 1, 49, 6, 0, 0),
       ('이형종', 5, 0, 0, 0, 0, 0, 1, 1, 50, 6, 0, 0),
       ('박용택', 6, 0, 0, 0, 0, 0, 1, 1, 51, 6, 0, 0),
       ('조셉', 7, 0, 0, 0, 0, 0, 1, 1, 52, 6, 0, 0),
       ('유강남', 8, 0, 0, 0, 0, 0, 1, 1, 53, 6, 0, 0),
       ('김민성', 9, 0, 0, 0, 0, 0, 1, 1, 54, 6, 0, 0),
       ('민병헌', 1, 0, 0, 0, 0, 0, 1, 1, 55, 7, 0, 0),
       ('전준우', 2, 0, 0, 0, 0, 0, 1, 1, 56, 7, 0, 0),
       ('손아섭', 3, 0, 0, 0, 0, 0, 1, 1, 57, 7, 0, 0),
       ('이대호', 4, 0, 0, 0, 0, 0, 1, 1, 58, 7, 0, 0),
       ('김동한', 5, 0, 0, 0, 0, 0, 1, 1, 59, 7, 0, 0),
       ('정준혁', 6, 0, 0, 0, 0, 0, 1, 1, 60, 7, 0, 0),
       ('허일', 7, 0, 0, 0, 0, 0, 1, 1, 61, 7, 0, 0),
       ('신본기', 8, 0, 0, 0, 0, 0, 1, 1, 62, 7, 0, 0),
       ('고승민', 9, 0, 0, 0, 0, 0, 1, 1, 63, 7, 0, 0),
       ('최승민', 1, 0, 0, 0, 0, 0, 1, 1, 64, 8, 0, 0),
       ('나성범', 2, 0, 0, 0, 0, 0, 1, 1, 65, 8, 0, 0),
       ('양의지', 3, 0, 0, 0, 0, 0, 1, 1, 66, 8, 0, 0),
       ('박민우', 4, 0, 0, 0, 0, 0, 1, 1, 67, 8, 0, 0),
       ('모창민', 5, 0, 0, 0, 0, 0, 1, 1, 68, 8, 0, 0),
       ('이명기', 6, 0, 0, 0, 0, 0, 1, 1, 69, 8, 0, 0),
       ('이상호', 7, 0, 0, 0, 0, 0, 1, 1, 70, 8, 0, 0),
       ('김찬형', 8, 0, 0, 0, 0, 0, 1, 1, 71, 8, 0, 0),
       ('김태진', 9, 0, 0, 0, 0, 0, 1, 1, 72, 8, 0, 0),
       ('김헌곤', 1, 0, 0, 0, 0, 0, 1, 1, 73, 9, 0, 0),
       ('박찬도', 2, 0, 0, 0, 0, 0, 1, 1, 74, 9, 0, 0),
       ('러프', 3, 0, 0, 0, 0, 0, 1, 1, 75, 9, 0, 0),
       ('윌리엄슨', 4, 0, 0, 0, 0, 0, 1, 1, 76, 9, 0, 0),
       ('김상수', 5, 0, 0, 0, 0, 0, 1, 1, 77, 9, 0, 0),
       ('구자욱', 6, 0, 0, 0, 0, 0, 1, 1, 78, 9, 0, 0),
       ('이학주', 7, 0, 0, 0, 0, 0, 1, 1, 79, 9, 0, 0),
       ('박한이', 8, 0, 0, 0, 0, 0, 1, 1, 80, 9, 0, 0),
       ('박계범', 9, 0, 0, 0, 0, 0, 1, 1, 81, 9, 0, 0),
       ('고종욱', 1, 0, 0, 0, 0, 0, 1, 1, 82, 10, 0, 0),
       ('최정', 2, 0, 0, 0, 0, 0, 1, 1, 83, 10, 0, 0),
       ('김재현', 3, 0, 0, 0, 0, 0, 1, 1, 84, 10, 0, 0),
       ('정의윤', 4, 0, 0, 0, 0, 0, 1, 1, 85, 10, 0, 0),
       ('김성현', 5, 0, 0, 0, 0, 0, 1, 1, 86, 10, 0, 0),
       ('이재원', 6, 0, 0, 0, 0, 0, 1, 1, 87, 10, 0, 0),
       ('로맥', 7, 0, 0, 0, 0, 0, 1, 1, 88, 10, 0, 0),
       ('한동민', 8, 0, 0, 0, 0, 0, 1, 1, 89, 10, 0, 0),
       ('노수광', 9, 0, 0, 0, 0, 0, 1, 1, 90, 10, 0, 0);
