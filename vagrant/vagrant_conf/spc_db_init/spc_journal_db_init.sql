CREATE SCHEMA spc_journal;
GRANT ALL PRIVILEGES ON SCHEMA spc_journal TO spc4mlx2;

-- -----------------------------------------------------
-- Table journal
-- -----------------------------------------------------
CREATE SEQUENCE spc_journal.journal_seq;
CREATE TABLE spc_journal.journal (
  id integer PRIMARY KEY default nextval('spc_journal.journal_seq'),
  lot_id VARCHAR(45) NOT NULL,
  wafer_id INT NOT NULL,
  spc_setting_id INT NOT NULL,
  product VARCHAR(45) NOT NULL,
  step VARCHAR(45) NOT NULL,
  result boolean NOT NULL,
  value DOUBLE PRECISION NOT NULL,
  erp_checked boolean NOT NULL,
  op_seq VARCHAR(45) NOT NULL,
  op_code VARCHAR(45) NOT NULL,
  setup_time TIMESTAMP NOT NULL,
  created_time TIMESTAMP NOT NULL,
  updated_time TIMESTAMP NOT NULL
);

GRANT ALL PRIVILEGES ON TABLE spc_journal.journal TO spc4mlx2;
GRANT USAGE, SELECT ON SEQUENCE spc_journal.journal_seq TO spc4mlx2;