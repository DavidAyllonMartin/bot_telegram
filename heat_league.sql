CREATE TABLE heat_league.app_config (
    key VARCHAR(100) PRIMARY KEY,
    value VARCHAR(255),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE heat_league.season (
    idseason BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    start_date DATE,
    end_date DATE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE heat_league.division (
    iddivision BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    level INTEGER NOT NULL CHECK (level > 0),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE heat_league.player (
    idplayer BIGSERIAL PRIMARY KEY,
    idtelegram BIGINT UNIQUE,
    idbga BIGINT UNIQUE,
    nickbga VARCHAR(255) UNIQUE,
    name VARCHAR(255),
    notify BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE heat_league.chat_group (
    idgroup BIGSERIAL PRIMARY KEY,
	name VARCHAR(255),
    idchat BIGINT NOT NULL,
    idthread BIGINT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE heat_league.link (
    idlink BIGSERIAL PRIMARY KEY,
    url VARCHAR(255) NOT NULL UNIQUE,
    group_id BIGINT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    FOREIGN KEY (group_id) REFERENCES heat_league.chat_group(idgroup) ON DELETE CASCADE
);

CREATE TYPE heat_league.competition_type_enum AS ENUM ('league', 'cup');

CREATE TABLE heat_league.competition (
    idcompetition BIGSERIAL PRIMARY KEY,
	competition_type heat_league.competition_type_enum NOT NULL,
    name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    season_id BIGINT NOT NULL,
    division_id BIGINT,
    UNIQUE (name, season_id),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    FOREIGN KEY (season_id) REFERENCES heat_league.season(idseason) ON DELETE CASCADE,
    FOREIGN KEY (division_id) REFERENCES heat_league.division(iddivision) ON DELETE CASCADE
);

CREATE TABLE heat_league.player_competition (
    player_id BIGINT NOT NULL,
    competition_id BIGINT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    PRIMARY KEY (player_id, competition_id),
    FOREIGN KEY (player_id) REFERENCES heat_league.player(idplayer) ON DELETE CASCADE,
    FOREIGN KEY (competition_id) REFERENCES heat_league.competition(idcompetition) ON DELETE CASCADE
);

CREATE TABLE heat_league.circuit (
    idcircuit BIGSERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE heat_league.race (
    idrace BIGSERIAL PRIMARY KEY,
    competition_id BIGINT NOT NULL,
	circuit_id BIGINT NOT NULL,
	race_order INTEGER NOT NULL CHECK (race_order > 0),
    start_date DATE,
    end_date DATE,
    notify BOOLEAN DEFAULT TRUE,
    link_id BIGINT,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    FOREIGN KEY (competition_id) REFERENCES heat_league.competition(idcompetition) ON DELETE CASCADE,
	FOREIGN KEY (circuit_id) REFERENCES heat_league.circuit(idcircuit) ON DELETE SET NULL,
    FOREIGN KEY (link_id) REFERENCES heat_league.link(idlink) ON DELETE SET NULL
);

CREATE TABLE heat_league.race_player (
    player_id BIGINT NOT NULL,
    race_id BIGINT NOT NULL,
    player_color VARCHAR(255),
    position INTEGER CHECK (position > 0),
    points INTEGER CHECK (points >= 0),
    last_player BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    PRIMARY KEY (player_id, race_id),
    FOREIGN KEY (player_id) REFERENCES heat_league.player(idplayer) ON DELETE CASCADE,
    FOREIGN KEY (race_id) REFERENCES heat_league.race(idrace) ON DELETE CASCADE
);

CREATE TABLE heat_league.sent_message (
    idsentmessage BIGSERIAL PRIMARY KEY,
	idtelegram BIGINT NOT NULL,
    group_id BIGINT NOT NULL,
    race_id BIGINT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    FOREIGN KEY (group_id) REFERENCES heat_league.chat_group(idgroup) ON DELETE CASCADE,
    FOREIGN KEY (race_id) REFERENCES heat_league.race(idrace) ON DELETE SET NULL
);

-- Player
CREATE INDEX idx_player_idtelegram ON heat_league.player(idtelegram);
CREATE INDEX idx_player_idbga ON heat_league.player(idbga);
CREATE INDEX idx_player_nickbga ON heat_league.player(nickbga);

-- chat_group
CREATE INDEX idx_chat_group_idchat ON heat_league.chat_group(idchat);
CREATE INDEX idx_chat_group_idtopic ON heat_league.chat_group(idtopic);
CREATE INDEX idx_chat_group_idchat_idtopic ON heat_league.chat_group(idchat, idtopic);

-- Competition
CREATE INDEX idx_competition_season_id ON heat_league.competition(season_id);
CREATE INDEX idx_competition_division_id ON heat_league.competition(division_id);
CREATE INDEX idx_competition_season_id_division_id ON heat_league.competition(season_id, division_id);

-- Link
CREATE INDEX idx_link_group_id ON heat_league.link(group_id);

-- Race
CREATE INDEX idx_race_competition_id ON heat_league.race(competition_id);
CREATE INDEX idx_race_circuit_id ON heat_league.race(circuit_id);
CREATE INDEX idx_race_start_date ON heat_league.race(start_date);
CREATE INDEX idx_race_end_date ON heat_league.race(end_date);

-- Race_player
CREATE INDEX idx_race_player_race_id ON heat_league.race_player(race_id);
CREATE INDEX idx_race_player_position ON heat_league.race_player(position);

-- Player_competition
CREATE INDEX idx_player_competition_player_id ON heat_league.player_competition(player_id);
CREATE INDEX idx_player_competition_competition_id ON heat_league.player_competition(competition_id);

-- Sent_message
CREATE INDEX idx_sent_message_race_id ON heat_league.sent_message(race_id);

CREATE OR REPLACE FUNCTION heat_league.update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW IS DISTINCT FROM OLD THEN
        NEW.updated_at = NOW();
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- app_config
CREATE TRIGGER trg_app_config_updated
BEFORE UPDATE ON heat_league.app_config
FOR EACH ROW EXECUTE FUNCTION heat_league.update_updated_at_column();

-- season
CREATE TRIGGER trg_season_updated
BEFORE UPDATE ON heat_league.season
FOR EACH ROW EXECUTE FUNCTION heat_league.update_updated_at_column();

-- division
CREATE TRIGGER trg_division_updated
BEFORE UPDATE ON heat_league.division
FOR EACH ROW EXECUTE FUNCTION heat_league.update_updated_at_column();

-- player
CREATE TRIGGER trg_player_updated
BEFORE UPDATE ON heat_league.player
FOR EACH ROW EXECUTE FUNCTION heat_league.update_updated_at_column();

-- chat_group
CREATE TRIGGER trg_chat_group_updated
BEFORE UPDATE ON heat_league.chat_group
FOR EACH ROW EXECUTE FUNCTION heat_league.update_updated_at_column();

-- link
CREATE TRIGGER trg_link_updated
BEFORE UPDATE ON heat_league.link
FOR EACH ROW EXECUTE FUNCTION heat_league.update_updated_at_column();

-- competition
CREATE TRIGGER trg_competition_updated
BEFORE UPDATE ON heat_league.competition
FOR EACH ROW EXECUTE FUNCTION heat_league.update_updated_at_column();

-- player_competition
CREATE TRIGGER trg_player_competition_updated
BEFORE UPDATE ON heat_league.player_competition
FOR EACH ROW EXECUTE FUNCTION heat_league.update_updated_at_column();

-- circuit
CREATE TRIGGER trg_circuit_updated
BEFORE UPDATE ON heat_league.circuit
FOR EACH ROW EXECUTE FUNCTION heat_league.update_updated_at_column();

-- race
CREATE TRIGGER trg_race_updated
BEFORE UPDATE ON heat_league.race
FOR EACH ROW EXECUTE FUNCTION heat_league.update_updated_at_column();

-- race_player
CREATE TRIGGER trg_race_player_updated
BEFORE UPDATE ON heat_league.race_player
FOR EACH ROW EXECUTE FUNCTION heat_league.update_updated_at_column();

-- sent_message
CREATE TRIGGER trg_sent_message_updated
BEFORE UPDATE ON heat_league.sent_message
FOR EACH ROW EXECUTE FUNCTION heat_league.update_updated_at_column();