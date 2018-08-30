use `cicamica$db_transit`;

alter database `cicamica$db_transit` character set utf8 collate utf8_unicode_ci;

drop table if exists `trips`;
drop table if exists `stop_times`;


create table if not exists `trips`
(
     `route_id`       varchar(100) not null primary key
    ,`service_id`     varchar(100)
    ,`block_id`       int(6)
    ,`trip_id`        varchar(100)
    ,`trip_sequence`  int(6)
    ,`trip_type`      int(6)
    ,`trip_headsign`  varchar(100)
    ,`direction_id`   int(6)
    ,`pattern_id`     int(6)
    ,`shape_id`       varchar(100)
    ,`pattern_count`  int(6)
    ,`direction_code` int(6)
    ,`pattern_code`   int(6)
    ,`pattern_rank`   int(6)
    ,`hierarchy`      int(6)
);


create table if not exists `stop_times`
(
     `trip_id`        varchar(100) not null primary key
    ,`arrival_time`   varchar(100)
    ,`departure_time` varchar(100)
    ,`stop_id`        int(6)
    ,`stop_sequence`  int(6)
    ,`pickup_type`    int(6)
    ,`drop_off_type`  int(6)
    ,`timepoint`      int(6)
);



--drop            index `idx_title_primary_ascii`      on `tb_movie`;
--create fulltext index `idx_title_primary_ascii`      on `tb_movie`(`title_primary_ascii`);
--drop            index `idx_title_secondary_ascii`    on `tb_movie`;
--create fulltext index `idx_title_secondary_ascii`    on `tb_movie`(`title_secondary_ascii`);









SELECT T.table_name, CCSA.character_set_name
FROM   information_schema.`TABLES` T,
       information_schema.`COLLATION_CHARACTER_SET_APPLICABILITY` CCSA
WHERE CCSA.collation_name = T.table_collation
  AND T.table_schema = 'cicamica$db_transit'
--  AND T.table_name = 'trips'
;


SELECT table_name, column_name, character_set_name, collation_name
FROM information_schema.`COLUMNS`
WHERE table_schema = 'cicamica$db_transit'
--  AND table_name = "tablename"
--  AND column_name = "columnname"
;
