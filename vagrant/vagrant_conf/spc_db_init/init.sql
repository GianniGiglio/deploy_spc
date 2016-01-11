
-- -----------------------------------------------------
-- Table control_type
-- -----------------------------------------------------
CREATE TABLE spc_settings.control_type (
  name VARCHAR(45) NOT NULL,
  PRIMARY KEY (name));


-- -----------------------------------------------------
-- Table weco_rule
-- -----------------------------------------------------
CREATE TABLE spc_settings.weco_rule (
  name VARCHAR(45) NOT NULL,
  PRIMARY KEY (name));


-- -----------------------------------------------------
-- Table control
-- -----------------------------------------------------
CREATE SEQUENCE spc_settings.control_seq;
CREATE TABLE spc_settings.control (
  id integer PRIMARY KEY default nextval('spc_settings.control_seq'),
  name VARCHAR(45) NOT NULL,
  predicate VARCHAR(45) NOT NULL,
  control_param VARCHAR(45) NOT NULL,
  calc_lcl DOUBLE PRECISION NULL,
  calc_target DOUBLE PRECISION NULL,
  calc_ucl DOUBLE PRECISION NULL,
  manual_lcl DOUBLE PRECISION NULL,
  manual_target DOUBLE PRECISION NULL,
  manual_ucl DOUBLE PRECISION NULL,
  use_manual boolean NOT NULL,
  trigram VARCHAR(45) NOT NULL,
  comment VARCHAR(250) NULL,
  active boolean NOT NULL,
  timestamp DATE NULL,
  original_id int NULL,
  enabled boolean NOT NULL,
  fk_control_type VARCHAR(45) NOT NULL references spc_settings.control_type(name),
  fk_weco_rule VARCHAR(45) NOT NULL references spc_settings.weco_rule(name));


-- -----------------------------------------------------
-- Table action_type
-- -----------------------------------------------------
CREATE TABLE spc_settings.action_type (
  name VARCHAR(45) NOT NULL,
  PRIMARY KEY (name)  );


-- -----------------------------------------------------
-- Table block_action_type
-- -----------------------------------------------------
CREATE TABLE spc_settings.block_action_type (
  name VARCHAR(45) NOT NULL,
  PRIMARY KEY (name)  );

-- -----------------------------------------------------
-- Table mail_action
-- -----------------------------------------------------
CREATE SEQUENCE spc_settings.mail_action_seq;
CREATE TABLE spc_settings.mail_action (
  id integer PRIMARY KEY default nextval('spc_settings.mail_action_seq'),
  comment VARCHAR(250) NULL,
  content VARCHAR(45) NOT NULL,
  fk_action_type VARCHAR(45) NOT NULL references spc_settings.action_type(name),
  fk_control INT NOT NULL references spc_settings.control(id)ON DELETE CASCADE);

-- -----------------------------------------------------
-- Table block_action
-- -----------------------------------------------------
CREATE SEQUENCE spc_settings.block_action_seq;
CREATE TABLE spc_settings.block_action (
  id integer PRIMARY KEY default nextval('spc_settings.block_action_seq'),
  comment VARCHAR(250) NULL,
  fk_action_type VARCHAR(45) NOT NULL references spc_settings.action_type(name),
  fk_block_action_type VARCHAR(45) NOT NULL references spc_settings.block_action_type(name),
  fk_control INT NOT NULL references spc_settings.control(id) ON DELETE CASCADE);