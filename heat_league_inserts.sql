--Initial Data
INSERT INTO heat_league.app_config (key, value) VALUES
('SCHEDULER_INTERVAL_SECONDS', '60');

INSERT INTO heat_league.season (name, start_date, end_date) VALUES
('Temporada 1', '2024-11-01', '2024-11-30'),
('Temporada 2', '2024-01-01', '2024-12-31'),
('Temporada 3', '2025-02-01', '2025-02-28'),
('Temporada 4', '2025-03-01', '2025-03-31'),
('Temporada 5', '2025-05-01', '2025-05-31');

INSERT INTO heat_league.division (name, level) VALUES
('1º División', 1),
('2º División', 2),
('3º División', 3),
('4º División', 4),
('5º División', 5),
('Rookie Cup', 6);

INSERT INTO heat_league.circuit (name) VALUES
('USA'),
('Francia'),
('Italia'),
('Reino Unido'),
('Japón'),
('México'),
('España'),
('Paises Bajos');

INSERT INTO heat_league.player (idtelegram, idbga, nickbga, name, notify) VALUES
(17840970, 95883653, 'aboigor', 'aboigor', TRUE),
(759526550, 86624394, 'alruhi', 'Alruhi7', TRUE),
(475850361, 86149888, 'JBCat', 'JBCaturla', TRUE),
(NULL, 92120598, 'Rafajam86', NULL, TRUE),
(NULL, 90037617, 'Paskualet', NULL, TRUE),
(3674535, 92657032, 'Ulite4', 'Ulises90', TRUE),
(144894726, 92739903, 'DavidMaster', 'DavidMaster13', TRUE),
(NULL, 13361021, 'Stoicakovic', NULL, TRUE),
(5498078758, 86611480, 'ljlc75', 'ljlc75', TRUE),
(NULL, 89062277, 'metalonso', NULL, TRUE),
(203999613, 29171260, 'ryoga121', 'Ryoga121', TRUE),
(1478045392, 85390097, 'Pablo Ludens', 'Delpi_gc', TRUE),
(NULL, 11688493, 'SaLaS', NULL, TRUE),
(14156082, 84520964, 'Blaxjoma', 'Blax77', TRUE),
(1320018203, 91142590, 'Paibal', 'Paibal', TRUE),
(NULL, 94830104, 'TheTrojanHorseman', NULL, TRUE),
(3739500, 88738337, 'frikilero', 'frikilero', TRUE),
(9540726, 96300515, 'laleman', 'lalem4n', TRUE),
(NULL, 86571362, 'DimDimPowa', NULL, TRUE),
(3996514, 42709523, 'gabi8', 'gabi8es', TRUE),
(15206099, 94329194, 'Raoh78', 'Raoh26', TRUE),
(233885463, 86819544, 'Gautxori', 'GAUTX0RI', TRUE),
(319124432, 2809933, 'Lochi', 'LochiMadrid', TRUE),
(734816364, 84142611, 'diegotevez', 'Diegotevez', TRUE),
(5284228437, 88487912, 'ScorpionLP', 'ScorpionLP7', TRUE),
(658979731, 88712281, 'Trituru', 'Trituru', TRUE),
(NULL, 85090835, 'FjRandy', NULL, TRUE),
(1456392148, 85324535, 'javi_onetti', 'javi_onetti', TRUE),
(37649807, 92543202, 'Bunbusan', 'jllatasa', TRUE),
(89514703, 84451799, 'Holstark', 'Holstark', TRUE),
(12216031, 85258922, 'Cristian Alarcón', 'keidash', TRUE),
(716151023, 84054753, 'Zanbar Bone', 'Zanbar8', TRUE),
(NULL, NULL, 'goosey972', NULL, FALSE),
(NULL, NULL, 'peruconexion', NULL, FALSE),
(NULL, NULL, 'Raijin-92', NULL, FALSE),
(NULL, NULL, 'Jerum', NULL, FALSE),
(NULL, NULL, 'DaddyKool79', NULL, FALSE),
(NULL, NULL, 'Jaime_2386', NULL, FALSE),
(NULL, NULL, 'Miraleix75', NULL, FALSE),
(NULL, NULL, 'Juanitoher85', NULL, FALSE),
(NULL, NULL, 'EnricF', NULL, FALSE);

INSERT INTO heat_league.chat_group (name, idchat, idtopic) VALUES 
('Chat de 1º División', -1002485778853, 2612),
('Chat de 2º División', -1002485778853, 2614),
('Chat de 3º División', -1002485778853, 2616),
('Chat de 4º División', -1002485778853, 4331);

INSERT INTO heat_league.competition (competition_type, name, start_date, end_date, season_id, division_id) VALUES
('league', 'Liga 1º División Temporada 1', '2024-11-01', '2024-11-30', 1, 1),
('league', 'Liga 2º División Temporada 1', '2024-11-01', '2024-11-30', 1, 2),
('league', 'Liga 3º División Temporada 1', '2024-11-01', '2024-11-30', 1, 3),
('cup', 'Copa Temporada 1', '2024-11-01', '2024-11-30', 1, NULL),
('league', 'Liga 1º División Temporada 2', '2024-12-01', '2024-12-31', 2, 1),
('league', 'Liga 2º División Temporada 2', '2024-12-01', '2024-12-31', 2, 2),
('league', 'Liga 3º División Temporada 2', '2024-12-01', '2024-12-31', 2, 3),
('league', 'Liga 4º División Temporada 2', '2024-12-01', '2024-12-31', 2, 4),
('cup', 'Copa Temporada 2', '2024-12-01', '2024-12-31', 2, NULL),
('league', 'Liga 1º División Temporada 3', '2025-02-01', '2025-02-28', 3, 1),
('league', 'Liga 2º División Temporada 3', '2025-02-01', '2025-02-28', 3, 2),
('league', 'Liga 3º División Temporada 3', '2025-02-01', '2025-02-28', 3, 3),
('league', 'Liga 4º División Temporada 3', '2025-02-01', '2025-02-28', 3, 4),
('league', 'Liga 5º División Temporada 3', '2025-02-01', '2025-02-28', 3, 5),
('cup', 'Copa Temporada 3', '2025-02-01', '2025-02-28', 3, NULL),
('league', 'Liga 1º División Temporada 4', '2025-03-01', '2025-03-31', 4, 1),
('league', 'Liga 2º División Temporada 4', '2025-03-01', '2025-03-31', 4, 2),
('league', 'Liga 3º División Temporada 4', '2025-03-01', '2025-03-31', 4, 3),
('league', 'Liga 4º División Temporada 4', '2025-03-01', '2025-03-31', 4, 4),
('league', 'Liga 5º División Temporada 4', '2025-03-01', '2025-03-31', 4, 5),
('cup', 'Copa Temporada 4', '2025-03-01', '2025-03-31', 4, NULL),
('league', 'Liga 1º División Temporada 5', '2025-05-01', '2025-05-31', 5, 1),
('league', 'Liga 2º División Temporada 5', '2025-05-01', '2025-05-31', 5, 2),
('league', 'Liga 3º División Temporada 5', '2025-05-01', '2025-05-31', 5, 3),
('league', 'Liga 4º División Temporada 5', '2025-05-01', '2025-05-31', 5, 4),
('league', 'Liga 5º División Temporada 5', '2025-05-01', '2025-05-31', 5, 5),
('league', 'Rookie cup Temporada 5', '2025-05-01', '2025-05-31', 5, 6),
('cup', 'Copa Temporada 5', '2025-05-01', NULL, 5, NULL);

-- race
-- liga temporada 1
INSERT INTO heat_league.race (competition_id, circuit_id, race_order, start_date, end_date, notify, link_id) VALUES 
(1, 6, 1, '2025-05-01', '2025-05-02', FALSE, NULL),  
(1, 5, 2, '2025-05-03', '2025-05-04', FALSE, NULL),  
(1, 2, 3, '2025-05-05', '2025-05-06', FALSE, NULL),  
(1, 3, 4, '2025-05-07', '2025-05-08', FALSE, NULL);

INSERT INTO heat_league.race (competition_id, circuit_id, race_order, start_date, end_date, notify, link_id) VALUES 
(2, 4, 1, '2025-05-01', '2025-05-02', FALSE, NULL),  
(2, 3, 2, '2025-05-03', '2025-05-04', FALSE, NULL),  
(2, 5, 3, '2025-05-05', '2025-05-06', FALSE, NULL),
(2, 6, 4, '2025-05-07', '2025-05-08', FALSE, NULL);

INSERT INTO heat_league.race (competition_id, circuit_id, race_order, start_date, end_date, notify, link_id) VALUES 
(3, 6, 1, '2025-05-01', '2025-05-02', FALSE, NULL),  
(3, 1, 2, '2025-05-03', '2025-05-04', FALSE, NULL),  
(3, 3, 3, '2025-05-05', '2025-05-06', FALSE, NULL),  
(3, 2, 4, '2025-05-07', '2025-05-08', FALSE, NULL);

--liga temporada 2
INSERT INTO heat_league.race (competition_id, circuit_id, race_order, start_date, end_date, notify, link_id) VALUES 
(5, 3, 1, '2025-05-01', '2025-05-02', FALSE, NULL),  
(5, 1, 2, '2025-05-03', '2025-05-04', FALSE, NULL),  
(5, 5, 3, '2025-05-05', '2025-05-06', FALSE, NULL),  
(5, 2, 4, '2025-05-07', '2025-05-08', FALSE, NULL);

INSERT INTO heat_league.race (competition_id, circuit_id, race_order, start_date, end_date, notify, link_id) VALUES 
(6, 1, 1, '2025-05-01', '2025-05-02', FALSE, NULL),  
(6, 2, 2, '2025-05-03', '2025-05-04', FALSE, NULL),  
(6, 5, 3, '2025-05-05', '2025-05-06', FALSE, NULL),
(6, 6, 4, '2025-05-07', '2025-05-08', FALSE, NULL);

INSERT INTO heat_league.race (competition_id, circuit_id, race_order, start_date, end_date, notify, link_id) VALUES 
(7, 5, 1, '2025-05-01', '2025-05-02', FALSE, NULL),  
(7, 1, 2, '2025-05-03', '2025-05-04', FALSE, NULL),  
(7, 6, 3, '2025-05-05', '2025-05-06', FALSE, NULL),  
(7, 3, 4, '2025-05-07', '2025-05-08', FALSE, NULL);

INSERT INTO heat_league.race (competition_id, circuit_id, race_order, start_date, end_date, notify, link_id) VALUES 
(8, 5, 1, '2025-05-01', '2025-05-02', FALSE, NULL),  
(8, 4, 2, '2025-05-03', '2025-05-04', FALSE, NULL),  
(8, 2, 3, '2025-05-05', '2025-05-06', FALSE, NULL),  
(8, 6, 4, '2025-05-07', '2025-05-08', FALSE, NULL);

--liga temporada 3
INSERT INTO heat_league.race (competition_id, circuit_id, race_order, start_date, end_date, notify, link_id) VALUES 
(10, 6, 1, '2025-05-01', '2025-05-02', FALSE, NULL),  
(10, 3, 2, '2025-05-03', '2025-05-04', FALSE, NULL),  
(10, 4, 3, '2025-05-05', '2025-05-06', FALSE, NULL),  
(10, 2, 4, '2025-05-07', '2025-05-08', FALSE, NULL);

INSERT INTO heat_league.race (competition_id, circuit_id, race_order, start_date, end_date, notify, link_id) VALUES 
(11, 2, 1, '2025-05-01', '2025-05-02', FALSE, NULL),  
(11, 4, 2, '2025-05-03', '2025-05-04', FALSE, NULL),  
(11, 1, 3, '2025-05-05', '2025-05-06', FALSE, NULL),
(11, 3, 4, '2025-05-07', '2025-05-08', FALSE, NULL);

INSERT INTO heat_league.race (competition_id, circuit_id, race_order, start_date, end_date, notify, link_id) VALUES 
(12, 1, 1, '2025-05-01', '2025-05-02', FALSE, NULL),  
(12, 2, 2, '2025-05-03', '2025-05-04', FALSE, NULL),  
(12, 4, 3, '2025-05-05', '2025-05-06', FALSE, NULL),  
(12, 6, 4, '2025-05-07', '2025-05-08', FALSE, NULL);

INSERT INTO heat_league.race (competition_id, circuit_id, race_order, start_date, end_date, notify, link_id) VALUES 
(13, 1, 1, '2025-05-01', '2025-05-02', FALSE, NULL),  
(13, 2, 2, '2025-05-03', '2025-05-04', FALSE, NULL),  
(13, 4, 3, '2025-05-05', '2025-05-06', FALSE, NULL),  
(13, 5, 4, '2025-05-07', '2025-05-08', FALSE, NULL);

INSERT INTO heat_league.race (competition_id, circuit_id, race_order, start_date, end_date, notify, link_id) VALUES 
(14, 6, 1, '2025-05-01', '2025-05-02', FALSE, NULL),  
(14, 1, 2, '2025-05-03', '2025-05-04', FALSE, NULL),  
(14, 4, 3, '2025-05-05', '2025-05-06', FALSE, NULL),  
(14, 5, 4, '2025-05-07', '2025-05-08', FALSE, NULL);

--liga temporada 4
INSERT INTO heat_league.race (competition_id, circuit_id, race_order, start_date, end_date, notify, link_id) VALUES 
(16, 5, 1, '2025-05-01', '2025-05-02', FALSE, NULL),  
(16, 3, 2, '2025-05-03', '2025-05-04', FALSE, NULL),  
(16, 2, 3, '2025-05-05', '2025-05-06', FALSE, NULL),  
(16, 1, 4, '2025-05-07', '2025-05-08', FALSE, NULL);

INSERT INTO heat_league.race (competition_id, circuit_id, race_order, start_date, end_date, notify, link_id) VALUES 
(17, 2, 1, '2025-05-01', '2025-05-02', FALSE, NULL),  
(17, 1, 2, '2025-05-03', '2025-05-04', FALSE, NULL),  
(17, 5, 3, '2025-05-05', '2025-05-06', FALSE, NULL),
(17, 4, 4, '2025-05-07', '2025-05-08', FALSE, NULL);

INSERT INTO heat_league.race (competition_id, circuit_id, race_order, start_date, end_date, notify, link_id) VALUES 
(18, 1, 1, '2025-05-01', '2025-05-02', FALSE, NULL),  
(18, 3, 2, '2025-05-03', '2025-05-04', FALSE, NULL),  
(18, 4, 3, '2025-05-05', '2025-05-06', FALSE, NULL),  
(18, 2, 4, '2025-05-07', '2025-05-08', FALSE, NULL);

INSERT INTO heat_league.race (competition_id, circuit_id, race_order, start_date, end_date, notify, link_id) VALUES 
(19, 3, 1, '2025-05-01', '2025-05-02', FALSE, NULL),  
(19, 5, 2, '2025-05-03', '2025-05-04', FALSE, NULL),  
(19, 1, 3, '2025-05-05', '2025-05-06', FALSE, NULL),  
(19, 6, 4, '2025-05-07', '2025-05-08', FALSE, NULL);

INSERT INTO heat_league.race (competition_id, circuit_id, race_order, start_date, end_date, notify, link_id) VALUES 
(20, 4, 1, '2025-05-01', '2025-05-02', FALSE, NULL),  
(20, 5, 2, '2025-05-03', '2025-05-04', FALSE, NULL),  
(20, 2, 3, '2025-05-05', '2025-05-06', FALSE, NULL),  
(20, 1, 4, '2025-05-07', '2025-05-08', FALSE, NULL);

--liga temporada 5
INSERT INTO heat_league.race (competition_id, circuit_id, race_order, start_date, end_date, notify, link_id) VALUES 
(22, 2, 1, '2025-05-01', '2025-05-02', FALSE, NULL),  
(22, 6, 2, '2025-05-03', '2025-05-04', FALSE, NULL),  
(22, 3, 3, '2025-05-05', '2025-05-06', FALSE, NULL),  
(22, 4, 4, '2025-05-07', '2025-05-08', FALSE, NULL);

INSERT INTO heat_league.race (competition_id, circuit_id, race_order, start_date, end_date, notify, link_id) VALUES 
(23, 2, 1, '2025-05-01', '2025-05-02', FALSE, NULL),  
(23, 4, 2, '2025-05-03', '2025-05-04', FALSE, NULL),  
(23, 3, 3, '2025-05-05', '2025-05-06', FALSE, NULL),
(23, 1, 4, '2025-05-07', '2025-05-08', FALSE, NULL);

INSERT INTO heat_league.race (competition_id, circuit_id, race_order, start_date, end_date, notify, link_id) VALUES 
(24, 2, 1, '2025-05-01', '2025-05-02', FALSE, NULL),  
(24, 3, 2, '2025-05-03', '2025-05-04', FALSE, NULL),  
(24, 4, 3, '2025-05-05', '2025-05-06', FALSE, NULL),  
(24, 6, 4, '2025-05-07', '2025-05-08', FALSE, NULL);

INSERT INTO heat_league.race (competition_id, circuit_id, race_order, start_date, end_date, notify, link_id) VALUES 
(25, 4, 1, '2025-05-01', '2025-05-02', FALSE, NULL),  
(25, 1, 2, '2025-05-03', '2025-05-04', FALSE, NULL),  
(25, 2, 3, '2025-05-05', '2025-05-06', FALSE, NULL),  
(25, 5, 4, '2025-05-07', '2025-05-08', FALSE, NULL);

INSERT INTO heat_league.race (competition_id, circuit_id, race_order, start_date, end_date, notify, link_id) VALUES 
(26, 1, 1, '2025-05-01', '2025-05-02', FALSE, NULL),  
(26, 2, 2, '2025-05-03', '2025-05-04', FALSE, NULL),  
(26, 3, 3, '2025-05-05', '2025-05-06', FALSE, NULL),  
(26, 4, 4, '2025-05-07', '2025-05-08', FALSE, NULL);

INSERT INTO heat_league.race (competition_id, circuit_id, race_order, start_date, end_date, notify, link_id) VALUES 
(27, 5, 1, '2025-05-01', '2025-05-02', FALSE, NULL),  
(27, 3, 2, '2025-05-03', '2025-05-04', FALSE, NULL),  
(27, 4, 3, '2025-05-05', '2025-05-06', FALSE, NULL),  
(27, 2, 4, '2025-05-07', '2025-05-08', FALSE, NULL);

-- race_player

-- Temporada 1 división 1
INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Holstark'), 1, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Holstark'), 2, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Holstark'), 3, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Holstark'), 4, 9, 1);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Zanbar Bone'), 1, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Zanbar Bone'), 2, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Zanbar Bone'), 3, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Zanbar Bone'), 4, 2, 5);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Cristian Alarcón'), 1, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Cristian Alarcón'), 2, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Cristian Alarcón'), 3, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Cristian Alarcón'), 4, 6, 2);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'SaLaS'), 1, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'SaLaS'), 2, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'SaLaS'), 3, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'SaLaS'), 4, 1, 6);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Bunbusan'), 1, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Bunbusan'), 2, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Bunbusan'), 3, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Bunbusan'), 4, 3, 4);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'javi_onetti'), 1, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'javi_onetti'), 2, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'javi_onetti'), 3, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'javi_onetti'), 4, 4, 3);

-- temporada 1 división 2
INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'peruconexion'), 5, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'peruconexion'), 6, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'peruconexion'), 7, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'peruconexion'), 8, 7, 2);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Stoicakovic'), 5, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Stoicakovic'), 6, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Stoicakovic'), 7, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Stoicakovic'), 8, 10, 1);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raijin-92'), 5, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raijin-92'), 6, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raijin-92'), 7, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raijin-92'), 8, 3, 4);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Jerum'), 5, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Jerum'), 6, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Jerum'), 7, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Jerum'), 8, 2, 5);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'aboigor'), 5, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'aboigor'), 6, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'aboigor'), 7, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'aboigor'), 8, 1, 6);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'JBCat'), 5, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'JBCat'), 6, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'JBCat'), 7, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'JBCat'), 8, 5, 3);

-- temporada 1 división 3
INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'frikilero'), 9, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'frikilero'), 10, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'frikilero'), 11, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'frikilero'), 12, 9, 1);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raoh78'), 9, 7, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raoh78'), 10, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raoh78'), 11, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raoh78'), 12, 2, 5);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Pablo Ludens'), 9, 10, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Pablo Ludens'), 10, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Pablo Ludens'), 11, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Pablo Ludens'), 12, 4, 3);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'FjRandy'), 9, 5, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'FjRandy'), 10, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'FjRandy'), 11, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'FjRandy'), 12, 1, 6);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'metalonso'), 9, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'metalonso'), 10, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'metalonso'), 11, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'metalonso'), 12, 6, 2);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ljlc75'), 9, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ljlc75'), 10, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ljlc75'), 11, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ljlc75'), 12, 3, 4);

-- temporada 2 división 1
INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Zanbar Bone'), 13, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Zanbar Bone'), 14, 0, 7),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Zanbar Bone'), 15, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Zanbar Bone'), 16, 9, 1);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Stoicakovic'), 13, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Stoicakovic'), 14, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Stoicakovic'), 15, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Stoicakovic'), 16, 4, 3);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'SaLaS'), 13, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'SaLaS'), 14, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'SaLaS'), 15, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'SaLaS'), 16, 3, 4);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'peruconexion'), 13, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'peruconexion'), 14, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'peruconexion'), 15, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'peruconexion'), 16, 1, 6);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Cristian Alarcón'), 13, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Cristian Alarcón'), 14, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Cristian Alarcón'), 15, 0, 7),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Cristian Alarcón'), 16, 2, 5);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Holstark'), 13, 0, 7),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Holstark'), 14, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Holstark'), 15, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Holstark'), 16, 6, 2);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ryoga121'), 13, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ryoga121'), 14, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ryoga121'), 15, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ryoga121'), 16, 0, 7);

-- temporada 2 división 2
INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raijin-92'), 17, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raijin-92'), 18, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raijin-92'), 19, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raijin-92'), 20, 9, 1);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raoh78'), 17, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raoh78'), 18, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raoh78'), 19, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raoh78'), 20, 6, 2);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'javi_onetti'), 17, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'javi_onetti'), 18, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'javi_onetti'), 19, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'javi_onetti'), 20, 3, 4);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Pablo Ludens'), 17, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Pablo Ludens'), 18, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Pablo Ludens'), 19, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Pablo Ludens'), 20, 2, 5);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Bunbusan'), 17, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Bunbusan'), 18, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Bunbusan'), 19, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Bunbusan'), 20, 4, 3);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Jerum'), 17, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Jerum'), 18, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Jerum'), 19, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Jerum'), 20, 0, 7);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'frikilero'), 17, 0, 7),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'frikilero'), 18, 0, 7),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'frikilero'), 19, 0, 7),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'frikilero'), 20, 1, 6);

-- temporada 2 división 3
INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'metalonso'), 21, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'metalonso'), 22, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'metalonso'), 23, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'metalonso'), 24, 9, 1);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'aboigor'), 21, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'aboigor'), 22, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'aboigor'), 23, 11, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'aboigor'), 24, 4, 3);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'FjRandy'), 21, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'FjRandy'), 22, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'FjRandy'), 23, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'FjRandy'), 24, 6, 2);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Gautxori'), 21, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Gautxori'), 22, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Gautxori'), 23, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Gautxori'), 24, 1, 6);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'JBCat'), 21, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'JBCat'), 22, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'JBCat'), 23, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'JBCat'), 24, 3, 4);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ljlc75'), 21, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ljlc75'), 22, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ljlc75'), 23, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ljlc75'), 24, 2, 5);

-- temporada 2 división 4
INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Blaxjoma'), 25, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Blaxjoma'), 26, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Blaxjoma'), 27, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Blaxjoma'), 28, 3, 4);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Lochi'), 25, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Lochi'), 26, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Lochi'), 27, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Lochi'), 28, 9, 1);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Ulite4'), 25, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Ulite4'), 26, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Ulite4'), 27, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Ulite4'), 28, 4, 3);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Paskualet'), 25, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Paskualet'), 26, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Paskualet'), 27, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Paskualet'), 28, 6, 2);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'goosey972'), 25, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'goosey972'), 26, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'goosey972'), 27, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'goosey972'), 28, 1, 6);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'alruhi'), 25, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'alruhi'), 26, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'alruhi'), 27, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'alruhi'), 28, 2, 5);

-- temporada 3 división 1
INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Stoicakovic'), 29, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Stoicakovic'), 30, 0, 7),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Stoicakovic'), 31, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Stoicakovic'), 32, 5, 3);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Zanbar Bone'), 29, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Zanbar Bone'), 30, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Zanbar Bone'), 31, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Zanbar Bone'), 32, 10, 1);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raijin-92'), 29, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raijin-92'), 30, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raijin-92'), 31, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raijin-92'), 32, 2, 5);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'peruconexion'), 29, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'peruconexion'), 30, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'peruconexion'), 31, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'peruconexion'), 32, 7, 2);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'SaLaS'), 29, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'SaLaS'), 30, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'SaLaS'), 31, 0, 7),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'SaLaS'), 32, 1, 6);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Cristian Alarcón'), 29, 0, 7),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Cristian Alarcón'), 30, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Cristian Alarcón'), 31, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Cristian Alarcón'), 32, 3, 4);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raoh78'), 29, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raoh78'), 30, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raoh78'), 31, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raoh78'), 32, 0, 7);

-- temporada 3 división 2
INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Bunbusan'), 33, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Bunbusan'), 34, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Bunbusan'), 35, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Bunbusan'), 36, 4, 3);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Holstark'), 33, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Holstark'), 34, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Holstark'), 35, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Holstark'), 36, 6, 1);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ryoga121'), 33, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ryoga121'), 34, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ryoga121'), 35, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ryoga121'), 36, 9, 1);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'javi_onetti'), 33, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'javi_onetti'), 34, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'javi_onetti'), 35, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'javi_onetti'), 36, 2, 5);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'aboigor'), 33, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'aboigor'), 34, 0, 7),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'aboigor'), 35, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'aboigor'), 36, 3, 4);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'metalonso'), 33, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'metalonso'), 34, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'metalonso'), 35, 0, 7),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'metalonso'), 36, 1, 6);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Pablo Ludens'), 33, 0, 7),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Pablo Ludens'), 34, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Pablo Ludens'), 35, 0, 7),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Pablo Ludens'), 36, 0, 7);

-- Temporada 3 - División 3
INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Blaxjoma'), 37, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Gautxori'), 37, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'frikilero'), 37, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Lochi'), 37, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Jerum'), 37, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'FjRandy'), 37, 1, 6);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'FjRandy'), 38, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Gautxori'), 38, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Jerum'), 38, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Lochi'), 38, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Blaxjoma'), 38, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'frikilero'), 38, 1, 6);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Jerum'), 39, 11, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'FjRandy'), 39, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Blaxjoma'), 39, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Lochi'), 39, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Gautxori'), 39, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'frikilero'), 39, 1, 6);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Gautxori'), 40, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'FjRandy'), 40, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Lochi'), 40, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Blaxjoma'), 40, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Jerum'), 40, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'frikilero'), 40, 1, 6);

-- Temporada 3 - División 4
INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ljlc75'), 41, 10, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'alruhi'), 41, 7, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Ulite4'), 41, 5, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Paskualet'), 41, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Rafajam86'), 41, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'JBCat'), 41, 1, 6);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Paskualet'), 42, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'alruhi'), 42, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'JBCat'), 42, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ljlc75'), 42, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Ulite4'), 42, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Rafajam86'), 42, 1, 6);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'alruhi'), 43, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'JBCat'), 43, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Ulite4'), 43, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Paskualet'), 43, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Rafajam86'), 43, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ljlc75'), 43, 1, 6);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'JBCat'), 44, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'alruhi'), 44, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ljlc75'), 44, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Ulite4'), 44, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Rafajam86'), 44, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Paskualet'), 44, 1, 6);

-- Temporada 3 - División 5
INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ScorpionLP'), 45, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Paibal'), 45, 4, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Trituru'), 45, 3, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'TheTrojanHorseman'), 45, 6, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'gabi8'), 45, 0, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'DimDimPowa'), 45, 0, 5);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'gabi8'), 46, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Trituru'), 46, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'DimDimPowa'), 46, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Paibal'), 46, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ScorpionLP'), 46, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'TheTrojanHorseman'), 46, 1, 6);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'gabi8'), 47, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'TheTrojanHorseman'), 47, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ScorpionLP'), 47, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'DimDimPowa'), 47, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Paibal'), 47, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Trituru'), 47, 1, 6);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'gabi8'), 48, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Trituru'), 48, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'TheTrojanHorseman'), 48, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ScorpionLP'), 48, 2, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Paibal'), 48, 3, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'DimDimPowa'), 48, 1, 6);

-- Temporada 4 - División 1
INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Holstark'), 49, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'SaLaS'), 49, 4, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Zanbar Bone'), 49, 6, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Bunbusan'), 49, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Stoicakovic'), 49, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'peruconexion'), 49, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raijin-92'), 49, 0, 7);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Bunbusan'), 50, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Stoicakovic'), 50, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Zanbar Bone'), 50, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'SaLaS'), 50, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Holstark'), 50, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'peruconexion'), 50, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raijin-92'), 50, 0, 7);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Zanbar Bone'), 51, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Holstark'), 51, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raijin-92'), 51, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Bunbusan'), 51, 2, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'peruconexion'), 51, 3, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Stoicakovic'), 51, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'SaLaS'), 51, 0, 7);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raijin-92'), 52, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'peruconexion'), 52, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'SaLaS'), 52, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Bunbusan'), 52, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Zanbar Bone'), 52, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Stoicakovic'), 52, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Holstark'), 52, 0, 7);


-- Temporada 4 - División 2
INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ryoga121'), 53, 10, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Gautxori'), 53, 7, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Cristian Alarcón'), 53, 5, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raoh78'), 53, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'aboigor'), 53, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'javi_onetti'), 53, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'FjRandy'), 53, 0, 7);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'javi_onetti'), 54, 11, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'FjRandy'), 54, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Cristian Alarcón'), 54, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Gautxori'), 54, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'aboigor'), 54, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raoh78'), 54, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ryoga121'), 54, 0, 7);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'FjRandy'), 55, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'javi_onetti'), 55, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Gautxori'), 55, 3, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Cristian Alarcón'), 55, 2, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raoh78'), 55, 4, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'aboigor'), 55, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ryoga121'), 55, 0, 7);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'aboigor'), 56, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'FjRandy'), 56, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Cristian Alarcón'), 56, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ryoga121'), 56, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raoh78'), 56, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'javi_onetti'), 56, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Gautxori'), 56, 0, 7);

-- Temporada 4 - División 3
INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ljlc75'), 57, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Blaxjoma'), 57, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'metalonso'), 57, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Jerum'), 57, 2, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'JBCat'), 57, 3, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'alruhi'), 57, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Pablo Ludens'), 57, 0, 7);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Pablo Ludens'), 58, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'alruhi'), 58, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Jerum'), 58, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Blaxjoma'), 58, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ljlc75'), 58, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'metalonso'), 58, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'JBCat'), 58, 0, 7);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'metalonso'), 59, 10, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Jerum'), 59, 7, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'alruhi'), 59, 5, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Blaxjoma'), 59, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ljlc75'), 59, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Pablo Ludens'), 59, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'JBCat'), 59, 0, 7);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Pablo Ludens'), 60, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ljlc75'), 60, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'metalonso'), 60, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Blaxjoma'), 60, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'JBCat'), 60, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Jerum'), 60, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'alruhi'), 60, 0, 7);

-- Temporada 4 - División 4
INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Trituru'), 61, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'gabi8'), 61, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ScorpionLP'), 61, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Paskualet'), 61, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Lochi'), 61, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'TheTrojanHorseman'), 61, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'frikilero'), 61, 0, 7);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'gabi8'), 62, 10, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'TheTrojanHorseman'), 62, 7, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Trituru'), 62, 5, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ScorpionLP'), 62, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Lochi'), 62, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Paskualet'), 62, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'frikilero'), 62, 0, 7);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Trituru'), 63, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Lochi'), 63, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ScorpionLP'), 63, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'frikilero'), 63, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Paskualet'), 63, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'TheTrojanHorseman'), 63, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'gabi8'), 63, 0, 7);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Lochi'), 64, 11, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ScorpionLP'), 64, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Trituru'), 64, 3, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Paskualet'), 64, 4, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'gabi8'), 64, 1, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'frikilero'), 64, 2, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'TheTrojanHorseman'), 64, 0, 7);

-- Temporada 4 - División 5
INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'DavidMaster'), 65, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Rafajam86'), 65, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Paibal'), 65, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Ulite4'), 65, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'laleman'), 65, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'DimDimPowa'), 65, 1, 6);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'DavidMaster'), 66, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Ulite4'), 66, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Rafajam86'), 66, 3, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'laleman'), 66, 4, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Paibal'), 66, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'DimDimPowa'), 66, 1, 6);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'DimDimPowa'), 67, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'DavidMaster'), 67, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Rafajam86'), 67, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Ulite4'), 67, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'laleman'), 67, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Paibal'), 67, 1, 6);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'DavidMaster'), 68, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Ulite4'), 68, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'DimDimPowa'), 68, 3, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'laleman'), 68, 4, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Rafajam86'), 68, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Paibal'), 68, 1, 6);

-- Temporada 5 - División 1
INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Bunbusan'), 69, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Holstark'), 69, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'FjRandy'), 69, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'javi_onetti'), 69, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Cristian Alarcón'), 69, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Zanbar Bone'), 69, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'aboigor'), 69, 0, 7);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'aboigor'), 70, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Bunbusan'), 70, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Holstark'), 70, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Cristian Alarcón'), 70, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'FjRandy'), 70, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'javi_onetti'), 70, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Zanbar Bone'), 70, 0, 7);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'aboigor'), 71, 0, 7),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Bunbusan'), 71, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Holstark'), 71, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Cristian Alarcón'), 71, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'FjRandy'), 71, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'javi_onetti'), 71, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Zanbar Bone'), 71, 4, 3);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'aboigor'), 72, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Bunbusan'), 72, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Holstark'), 72, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Cristian Alarcón'), 72, 0, 7),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'FjRandy'), 72, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'javi_onetti'), 72, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Zanbar Bone'), 72, 9, 1);

-- Temporada 5 - División 2
INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ryoga121'), 73, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'SaLaS'), 73, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Pablo Ludens'), 73, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ljlc75'), 73, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'metalonso'), 73, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Stoicakovic'), 73, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Blaxjoma'), 73, 0, 7);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ryoga121'), 74, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'SaLaS'), 74, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Pablo Ludens'), 74, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ljlc75'), 74, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'metalonso'), 74, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Stoicakovic'), 74, 0, 7),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Blaxjoma'), 74, 6, 2);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ryoga121'), 75, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'SaLaS'), 75, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Pablo Ludens'), 75, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ljlc75'), 75, 0, 7),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'metalonso'), 75, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Stoicakovic'), 75, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Blaxjoma'), 75, 9, 1);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ryoga121'), 76, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'SaLaS'), 76, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Pablo Ludens'), 76, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ljlc75'), 76, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'metalonso'), 76, 0, 7),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Stoicakovic'), 76, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Blaxjoma'), 76, 9, 1);

-- Temporada 5 - División 3
INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'diegotevez'), 77, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ScorpionLP'), 77, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Lochi'), 77, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Gautxori'), 77, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raoh78'), 77, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'gabi8'), 77, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Trituru'), 77, 0, 7);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raoh78'), 78, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ScorpionLP'), 78, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Lochi'), 78, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Gautxori'), 78, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'gabi8'), 78, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'diegotevez'), 78, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Trituru'), 78, 0, 7);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'diegotevez'), 79, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raoh78'), 79, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ScorpionLP'), 79, 2, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'gabi8'), 79, 4, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Gautxori'), 79, 3, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Lochi'), 79, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Trituru'), 79, 0, 7);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'diegotevez'), 80, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Raoh78'), 80, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'ScorpionLP'), 80, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Gautxori'), 80, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Lochi'), 80, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'gabi8'), 80, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Trituru'), 80, 0, 7);

-- Temporada 5 - División 4
INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Paskualet'), 81, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Ulite4'), 81, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'DavidMaster'), 81, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'JBCat'), 81, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Rafajam86'), 81, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'alruhi'), 81, 1, 6);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Paskualet'), 82, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'DavidMaster'), 82, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'alruhi'), 82, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'JBCat'), 82, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Ulite4'), 82, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Rafajam86'), 82, 1, 6);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'alruhi'), 83, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'DavidMaster'), 83, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Paskualet'), 83, 3, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Ulite4'), 83, 4, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Rafajam86'), 83, 2, 5),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'JBCat'), 83, 1, 6);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Paskualet'), 84, 1, 6),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'DavidMaster'), 84, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'alruhi'), 84, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Ulite4'), 84, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'JBCat'), 84, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Rafajam86'), 84, 2, 5);

-- Temporada 5 - División 5
INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'laleman'), 85, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'TheTrojanHorseman'), 85, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'DimDimPowa'), 85, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Paibal'), 85, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'frikilero'), 85, 2, 5);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'laleman'), 86, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'TheTrojanHorseman'), 86, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'DimDimPowa'), 86, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'frikilero'), 86, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Paibal'), 86, 2, 5);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'TheTrojanHorseman'), 87, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'laleman'), 87, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Paibal'), 87, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'DimDimPowa'), 87, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'frikilero'), 87, 2, 5);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'laleman'), 88, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'TheTrojanHorseman'), 88, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'DimDimPowa'), 88, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'frikilero'), 88, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Paibal'), 88, 2, 5);

-- Temporada 5 - Rookies Cup
INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Jaime_2386'), 89, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'DaddyKool79'), 89, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Miraleix75'), 89, 3, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Juanitoher85'), 89, 4, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'EnricF'), 89, 2, 5);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Miraleix75'), 90, 11, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'DaddyKool79'), 90, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Jaime_2386'), 90, 3, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Juanitoher85'), 90, 4, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'EnricF'), 90, 2, 5);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Jaime_2386'), 91, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'EnricF'), 91, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'DaddyKool79'), 91, 3, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Miraleix75'), 91, 4, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Juanitoher85'), 91, 2, 5);

INSERT INTO heat_league.race_player (player_id, race_id, points, position) VALUES 
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'DaddyKool79'), 92, 9, 1),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Jaime_2386'), 92, 6, 2),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Miraleix75'), 92, 4, 3),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'Juanitoher85'), 92, 3, 4),
((SELECT idplayer FROM heat_league.player WHERE nickbga = 'EnricF'), 92, 2, 5);