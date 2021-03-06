﻿DROP SCHEMA dp CASCADE;
CREATE SCHEMA dp;

CREATE SEQUENCE dp.xp_id_gen MINVALUE 0 MAXVALUE 2000000000;

CREATE TABLE dp.experiment (   
   xp_id                INT8,
   collection_name      VARCHAR(255),
   process_name         VARCHAR(255),
   hyper_report_pickle  TEXT,
   start_time           TIMESTAMP DEFAULT now(),
   PRIMARY KEY (xp_id)
);
CREATE INDEX experiment_collection_name ON dp.experiment(collection_name);

CREATE TABLE dp.report (
   xp_id            INT8,
   report_epoch     INT4,
   report_pickle    TEXT,
   report_time      TIMESTAMP DEFAULT now(),
   PRIMARY KEY(xp_id, report_epoch)
);

CREATE TABLE dp.done(
   xp_id             INT8,
   end_time          TIMESTAMP DEFAULT now(),
   PRIMARY KEY (xp_id)
);

CREATE TABLE dp.savetofile(
   xp_id             INT8,
   hostname          VARCHAR(255),
   filename          VARCHAR(255),
   PRIMARY KEY (xp_id)
);

CREATE TABLE dp.earlystopper(
   xp_id             INT8, 
   maximize          BOOLEAN, 
   channel_name      VARCHAR(1000),
   PRIMARY KEY (xp_id)
);

CREATE TABLE dp.minima(
   xp_id             INT8,
   minima_epoch      INT8,
   minima_error      FLOAT8,
   PRIMARY KEY (xp_id, minima_epoch)
);
