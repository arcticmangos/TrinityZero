/*
MySQL Data Transfer
Source Host: localhost
Source Database: trinity_c_world
Target Host: localhost
Target Database: trinity_c_world
Date: 2009-05-27 15:16:15
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for access_requirement
-- ----------------------------
CREATE TABLE `access_requirement` (
  `id` bigint(20) unsigned NOT NULL COMMENT 'Identifier',
  `level_min` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `level_max` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `heroic_key` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `heroic_key2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest_done` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest_failed_text` text,
  `heroic_quest_done` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `heroic_quest_failed_text` text,
  `comment` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Access Requirements';

-- ----------------------------
-- Table structure for areatrigger_involvedrelation
-- ----------------------------
CREATE TABLE `areatrigger_involvedrelation` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Trigger System';

-- ----------------------------
-- Table structure for areatrigger_scripts
-- ----------------------------
CREATE TABLE `areatrigger_scripts` (
  `entry` mediumint(8) NOT NULL,
  `ScriptName` char(64) NOT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for areatrigger_tavern
-- ----------------------------
CREATE TABLE `areatrigger_tavern` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `name` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Trigger System';

-- ----------------------------
-- Table structure for areatrigger_teleport
-- ----------------------------
CREATE TABLE `areatrigger_teleport` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `name` text,
  `access_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `target_map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `target_position_x` float NOT NULL DEFAULT '0',
  `target_position_y` float NOT NULL DEFAULT '0',
  `target_position_z` float NOT NULL DEFAULT '0',
  `target_orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Trigger System';

-- ----------------------------
-- Table structure for battleground_template
-- ----------------------------
CREATE TABLE `battleground_template` (
  `id` mediumint(8) unsigned NOT NULL,
  `MinPlayersPerTeam` smallint(5) unsigned NOT NULL DEFAULT '0',
  `MaxPlayersPerTeam` smallint(5) unsigned NOT NULL DEFAULT '0',
  `MinLvl` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MaxLvl` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AllianceStartLoc` mediumint(8) unsigned NOT NULL,
  `AllianceStartO` float NOT NULL,
  `HordeStartLoc` mediumint(8) unsigned NOT NULL,
  `HordeStartO` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for battlemaster_entry
-- ----------------------------
CREATE TABLE `battlemaster_entry` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Entry of a creature',
  `bg_template` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Battleground template id',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for command
-- ----------------------------
CREATE TABLE `command` (
  `name` varchar(50) NOT NULL DEFAULT '',
  `security` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `help` longtext,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Chat System';

-- ----------------------------
-- Table structure for creature
-- ----------------------------
CREATE TABLE `creature` (
  `guid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Global Unique Identifier',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Creature Identifier',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `spawnMask` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `modelid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `equipment_id` mediumint(9) NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `spawntimesecs` int(10) unsigned NOT NULL DEFAULT '120',
  `spawndist` float NOT NULL DEFAULT '5',
  `currentwaypoint` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `curhealth` int(10) unsigned NOT NULL DEFAULT '1',
  `curmana` int(10) unsigned NOT NULL DEFAULT '0',
  `DeathState` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MovementType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`),
  KEY `idx_map` (`map`),
  KEY `idx_id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature System';

-- ----------------------------
-- Table structure for creature_addon
-- ----------------------------
CREATE TABLE `creature_addon` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `path_id` int(11) unsigned NOT NULL DEFAULT '0',
  `mount` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bytes0` int(10) unsigned NOT NULL DEFAULT '0',
  `bytes1` int(10) unsigned NOT NULL DEFAULT '0',
  `bytes2` int(10) unsigned NOT NULL DEFAULT '0',
  `emote` int(10) unsigned NOT NULL DEFAULT '0',
  `moveflags` int(10) unsigned NOT NULL DEFAULT '0',
  `auras` text,
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for creature_equip_template
-- ----------------------------
CREATE TABLE `creature_equip_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Unique entry',
  `equipmodel1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `equipmodel2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `equipmodel3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `equipinfo1` int(10) unsigned NOT NULL DEFAULT '0',
  `equipinfo2` int(10) unsigned NOT NULL DEFAULT '0',
  `equipinfo3` int(10) unsigned NOT NULL DEFAULT '0',
  `equipslot1` int(11) NOT NULL DEFAULT '0',
  `equipslot2` int(11) NOT NULL DEFAULT '0',
  `equipslot3` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Creature System (Equipment)';

-- ----------------------------
-- Table structure for creature_formations
-- ----------------------------
CREATE TABLE `creature_formations` (
  `leaderGUID` int(11) unsigned NOT NULL,
  `memberGUID` int(11) unsigned NOT NULL,
  `dist` float unsigned NOT NULL,
  `angle` float unsigned NOT NULL,
  `groupAI` int(11) unsigned NOT NULL,
  PRIMARY KEY (`memberGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for creature_involvedrelation
-- ----------------------------
CREATE TABLE `creature_involvedrelation` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature System';

-- ----------------------------
-- Table structure for creature_loot_template
-- ----------------------------
CREATE TABLE `creature_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lootcondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `condition_value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Loot System';

-- ----------------------------
-- Table structure for creature_model_info
-- ----------------------------
CREATE TABLE `creature_model_info` (
  `modelid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bounding_radius` float NOT NULL DEFAULT '0',
  `combat_reach` float NOT NULL DEFAULT '0',
  `gender` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `modelid_other_gender` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`modelid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Creature System (Model related info)';

-- ----------------------------
-- Table structure for creature_onkill_reputation
-- ----------------------------
CREATE TABLE `creature_onkill_reputation` (
  `creature_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Creature Identifier',
  `RewOnKillRepFaction1` smallint(6) NOT NULL DEFAULT '0',
  `RewOnKillRepFaction2` smallint(6) NOT NULL DEFAULT '0',
  `MaxStanding1` tinyint(4) NOT NULL DEFAULT '0',
  `IsTeamAward1` tinyint(4) NOT NULL DEFAULT '0',
  `RewOnKillRepValue1` mediumint(9) NOT NULL DEFAULT '0',
  `MaxStanding2` tinyint(4) NOT NULL DEFAULT '0',
  `IsTeamAward2` tinyint(4) NOT NULL DEFAULT '0',
  `RewOnKillRepValue2` mediumint(9) NOT NULL DEFAULT '0',
  `TeamDependent` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`creature_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Creature OnKill Reputation gain';

-- ----------------------------
-- Table structure for creature_questrelation
-- ----------------------------
CREATE TABLE `creature_questrelation` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature System';

-- ----------------------------
-- Table structure for creature_respawn
-- ----------------------------
CREATE TABLE `creature_respawn` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `respawntime` bigint(20) NOT NULL DEFAULT '0',
  `instance` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Grid Loading System';

-- ----------------------------
-- Table structure for creature_template
-- ----------------------------
CREATE TABLE `creature_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `heroic_entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `modelid_A` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `modelid_A2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `modelid_H` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `modelid_H2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` char(100) NOT NULL DEFAULT '0',
  `subname` char(100) DEFAULT NULL,
  `IconName` char(100) DEFAULT NULL,
  `minlevel` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `maxlevel` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `minhealth` int(10) unsigned NOT NULL DEFAULT '0',
  `maxhealth` int(10) unsigned NOT NULL DEFAULT '0',
  `minmana` int(10) unsigned NOT NULL DEFAULT '0',
  `maxmana` int(10) unsigned NOT NULL DEFAULT '0',
  `armor` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `faction_A` smallint(5) unsigned NOT NULL DEFAULT '0',
  `faction_H` smallint(5) unsigned NOT NULL DEFAULT '0',
  `npcflag` int(10) unsigned NOT NULL DEFAULT '0',
  `speed` float DEFAULT '1',
  `scale` float NOT NULL DEFAULT '1',
  `rank` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mindmg` float NOT NULL DEFAULT '0',
  `maxdmg` float NOT NULL DEFAULT '0',
  `dmgschool` tinyint(4) NOT NULL DEFAULT '0',
  `attackpower` int(10) unsigned NOT NULL DEFAULT '0',
  `baseattacktime` int(10) unsigned NOT NULL DEFAULT '0',
  `rangeattacktime` int(10) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  `dynamicflags` int(10) unsigned NOT NULL DEFAULT '0',
  `family` tinyint(4) NOT NULL DEFAULT '0',
  `trainer_type` tinyint(4) NOT NULL DEFAULT '0',
  `trainer_spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `minrangedmg` float NOT NULL DEFAULT '0',
  `maxrangedmg` float NOT NULL DEFAULT '0',
  `rangedattackpower` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `flag1` int(10) unsigned NOT NULL DEFAULT '0',
  `lootid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pickpocketloot` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `skinloot` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `resistance1` smallint(5) NOT NULL DEFAULT '0',
  `resistance2` smallint(5) NOT NULL DEFAULT '0',
  `resistance3` smallint(5) NOT NULL DEFAULT '0',
  `resistance4` smallint(5) NOT NULL DEFAULT '0',
  `resistance5` smallint(5) NOT NULL DEFAULT '0',
  `resistance6` smallint(5) NOT NULL DEFAULT '0',
  `spell1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `PetSpellDataId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mingold` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `maxgold` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `AIName` char(64) NOT NULL DEFAULT '',
  `MovementType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `InhabitType` tinyint(3) unsigned NOT NULL DEFAULT '3',
  `RacialLeader` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RegenHealth` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `equipment_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mechanic_immune_mask` int(10) unsigned NOT NULL DEFAULT '0',
  `flags_extra` int(10) unsigned NOT NULL DEFAULT '0',
  `ScriptName` char(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`entry`),
  KEY `idx_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature System';

-- ----------------------------
-- Table structure for creature_template_addon
-- ----------------------------
CREATE TABLE `creature_template_addon` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `path_id` int(11) unsigned NOT NULL DEFAULT '0',
  `mount` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `bytes0` int(10) unsigned NOT NULL DEFAULT '0',
  `bytes1` int(10) unsigned NOT NULL DEFAULT '0',
  `bytes2` int(10) unsigned NOT NULL DEFAULT '0',
  `emote` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `moveflags` int(10) unsigned NOT NULL DEFAULT '0',
  `auras` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for custom_texts
-- ----------------------------
CREATE TABLE `custom_texts` (
  `entry` mediumint(8) NOT NULL,
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  `sound` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `language` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `emote` smallint(5) unsigned NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Custom Texts';

-- ----------------------------
-- Table structure for disenchant_loot_template
-- ----------------------------
CREATE TABLE `disenchant_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Recommended id selection: item_level*100 + item_quality',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lootcondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `condition_value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

-- ----------------------------
-- Table structure for event_scripts
-- ----------------------------
CREATE TABLE `event_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `datatext` text NOT NULL,
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for eventai_localized_texts
-- ----------------------------
CREATE TABLE `eventai_localized_texts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `locale_1` varchar(255) NOT NULL DEFAULT '',
  `locale_2` varchar(255) NOT NULL DEFAULT '',
  `locale_3` varchar(255) NOT NULL DEFAULT '',
  `locale_4` varchar(255) NOT NULL DEFAULT '',
  `locale_5` varchar(255) NOT NULL DEFAULT '',
  `locale_6` varchar(255) NOT NULL DEFAULT '',
  `locale_7` varchar(255) NOT NULL DEFAULT '',
  `locale_8` varchar(255) NOT NULL DEFAULT '',
  `comment` varchar(255) NOT NULL DEFAULT '' COMMENT 'Text Comment',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='EventAI Localized Text';

-- ----------------------------
-- Table structure for eventai_scripts
-- ----------------------------
CREATE TABLE `eventai_scripts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `creature_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Creature Template Identifier',
  `event_type` tinyint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Event Type',
  `event_inverse_phase_mask` int(11) NOT NULL DEFAULT '0' COMMENT 'Mask which phases this event will not trigger in',
  `event_chance` int(3) unsigned NOT NULL DEFAULT '100',
  `event_flags` int(3) unsigned NOT NULL DEFAULT '0',
  `event_param1` int(11) NOT NULL DEFAULT '0',
  `event_param2` int(11) NOT NULL DEFAULT '0',
  `event_param3` int(11) NOT NULL DEFAULT '0',
  `event_param4` int(11) NOT NULL DEFAULT '0',
  `action1_type` tinyint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Action Type',
  `action1_param1` int(11) NOT NULL DEFAULT '0',
  `action1_param2` int(11) NOT NULL DEFAULT '0',
  `action1_param3` int(11) NOT NULL DEFAULT '0',
  `action2_type` tinyint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Action Type',
  `action2_param1` int(11) NOT NULL DEFAULT '0',
  `action2_param2` int(11) NOT NULL DEFAULT '0',
  `action2_param3` int(11) NOT NULL DEFAULT '0',
  `action3_type` tinyint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Action Type',
  `action3_param1` int(11) NOT NULL DEFAULT '0',
  `action3_param2` int(11) NOT NULL DEFAULT '0',
  `action3_param3` int(11) NOT NULL DEFAULT '0',
  `comment` varchar(255) NOT NULL DEFAULT '' COMMENT 'Event Comment',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='EventAI Scripts';

-- ----------------------------
-- Table structure for eventai_summons
-- ----------------------------
CREATE TABLE `eventai_summons` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Location Identifier',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `spawntimesecs` int(11) unsigned NOT NULL DEFAULT '120',
  `comment` varchar(255) NOT NULL DEFAULT '' COMMENT 'Summon Comment',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='EventAI Summoning Locations';

-- ----------------------------
-- Table structure for eventai_texts
-- ----------------------------
CREATE TABLE `eventai_texts` (
  `entry` mediumint(8) NOT NULL,
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  `sound` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `language` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Script Texts';

-- ----------------------------
-- Table structure for exploration_basexp
-- ----------------------------
CREATE TABLE `exploration_basexp` (
  `level` tinyint(4) NOT NULL DEFAULT '0',
  `basexp` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Exploration System';

-- ----------------------------
-- Table structure for fishing_loot_template
-- ----------------------------
CREATE TABLE `fishing_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lootcondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `condition_value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Loot System';

-- ----------------------------
-- Table structure for game_event
-- ----------------------------
CREATE TABLE `game_event` (
  `entry` mediumint(8) unsigned NOT NULL COMMENT 'Entry of the game event',
  `start_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Absolute start date, the event will never start before',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Absolute end date, the event will never start afler',
  `occurence` bigint(20) unsigned NOT NULL DEFAULT '5184000' COMMENT 'Delay in minutes between occurences of the event',
  `length` bigint(20) unsigned NOT NULL DEFAULT '2592000' COMMENT 'Length in minutes of the event',
  `description` varchar(255) DEFAULT NULL COMMENT 'Description of the event displayed in console',
  `world_event` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0 if normal event, 1 if world event',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for game_event_battleground_holiday
-- ----------------------------
CREATE TABLE `game_event_battleground_holiday` (
  `event` int(10) unsigned NOT NULL,
  `bgflag` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`event`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for game_event_condition
-- ----------------------------
CREATE TABLE `game_event_condition` (
  `event_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `req_num` float DEFAULT '0',
  `max_world_state_field` smallint(5) unsigned NOT NULL DEFAULT '0',
  `done_world_state_field` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`event_id`,`condition_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for game_event_creature
-- ----------------------------
CREATE TABLE `game_event_creature` (
  `guid` int(10) unsigned NOT NULL,
  `event` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Put negatives values to remove during event',
  PRIMARY KEY (`guid`,`event`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for game_event_creature_quest
-- ----------------------------
CREATE TABLE `game_event_creature_quest` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `event` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`quest`,`event`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for game_event_gameobject
-- ----------------------------
CREATE TABLE `game_event_gameobject` (
  `guid` int(10) unsigned NOT NULL,
  `event` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Put negatives values to remove during event',
  PRIMARY KEY (`guid`,`event`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for game_event_gameobject_quest
-- ----------------------------
CREATE TABLE `game_event_gameobject_quest` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `event` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`quest`,`event`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for game_event_model_equip
-- ----------------------------
CREATE TABLE `game_event_model_equip` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `equipment_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `event` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for game_event_npc_gossip
-- ----------------------------
CREATE TABLE `game_event_npc_gossip` (
  `guid` int(10) unsigned NOT NULL,
  `event_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `textid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for game_event_npc_vendor
-- ----------------------------
CREATE TABLE `game_event_npc_vendor` (
  `event` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `guid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `maxcount` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `incrtime` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ExtendedCost` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for game_event_npcflag
-- ----------------------------
CREATE TABLE `game_event_npcflag` (
  `guid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `event_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `npcflag` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`event_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for game_event_prerequisite
-- ----------------------------
CREATE TABLE `game_event_prerequisite` (
  `event_id` mediumint(8) unsigned NOT NULL,
  `prerequisite_event` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`event_id`,`prerequisite_event`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for game_event_quest_condition
-- ----------------------------
CREATE TABLE `game_event_quest_condition` (
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `event_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num` float DEFAULT '0',
  PRIMARY KEY (`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for game_graveyard_zone
-- ----------------------------
CREATE TABLE `game_graveyard_zone` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ghost_zone` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `faction` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`ghost_zone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Trigger System';

-- ----------------------------
-- Table structure for game_tele
-- ----------------------------
CREATE TABLE `game_tele` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tele Command';

-- ----------------------------
-- Table structure for game_weather
-- ----------------------------
CREATE TABLE `game_weather` (
  `zone` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spring_rain_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `spring_snow_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `spring_storm_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `summer_rain_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `summer_snow_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `summer_storm_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `fall_rain_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `fall_snow_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `fall_storm_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `winter_rain_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `winter_snow_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  `winter_storm_chance` tinyint(3) unsigned NOT NULL DEFAULT '25',
  PRIMARY KEY (`zone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Weather System';

-- ----------------------------
-- Table structure for gameobject
-- ----------------------------
CREATE TABLE `gameobject` (
  `guid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Global Unique Identifier',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Gameobject Identifier',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `spawnMask` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `orientation` float NOT NULL DEFAULT '0',
  `rotation0` float NOT NULL DEFAULT '0',
  `rotation1` float NOT NULL DEFAULT '0',
  `rotation2` float NOT NULL DEFAULT '0',
  `rotation3` float NOT NULL DEFAULT '0',
  `spawntimesecs` int(11) NOT NULL DEFAULT '0',
  `animprogress` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Gameobject System';

-- ----------------------------
-- Table structure for gameobject_involvedrelation
-- ----------------------------
CREATE TABLE `gameobject_involvedrelation` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gameobject_loot_template
-- ----------------------------
CREATE TABLE `gameobject_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lootcondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `condition_value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Loot System';

-- ----------------------------
-- Table structure for gameobject_questrelation
-- ----------------------------
CREATE TABLE `gameobject_questrelation` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `quest` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest Identifier',
  PRIMARY KEY (`id`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gameobject_respawn
-- ----------------------------
CREATE TABLE `gameobject_respawn` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `respawntime` bigint(20) NOT NULL DEFAULT '0',
  `instance` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`,`instance`),
  KEY `instance` (`instance`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Grid Loading System';

-- ----------------------------
-- Table structure for gameobject_scripts
-- ----------------------------
CREATE TABLE `gameobject_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `datatext` text NOT NULL,
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gameobject_template
-- ----------------------------
CREATE TABLE `gameobject_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `displayId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `castBarCaption` varchar(100) NOT NULL DEFAULT '',
  `faction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `flags` int(10) unsigned NOT NULL DEFAULT '0',
  `size` float NOT NULL DEFAULT '1',
  `data0` int(10) unsigned NOT NULL DEFAULT '0',
  `data1` int(10) unsigned NOT NULL DEFAULT '0',
  `data2` int(10) unsigned NOT NULL DEFAULT '0',
  `data3` int(10) unsigned NOT NULL DEFAULT '0',
  `data4` int(10) unsigned NOT NULL DEFAULT '0',
  `data5` int(10) unsigned NOT NULL DEFAULT '0',
  `data6` int(10) unsigned NOT NULL DEFAULT '0',
  `data7` int(10) unsigned NOT NULL DEFAULT '0',
  `data8` int(10) unsigned NOT NULL DEFAULT '0',
  `data9` int(10) unsigned NOT NULL DEFAULT '0',
  `data10` int(10) unsigned NOT NULL DEFAULT '0',
  `data11` int(10) unsigned NOT NULL DEFAULT '0',
  `data12` int(10) unsigned NOT NULL DEFAULT '0',
  `data13` int(10) unsigned NOT NULL DEFAULT '0',
  `data14` int(10) unsigned NOT NULL DEFAULT '0',
  `data15` int(10) unsigned NOT NULL DEFAULT '0',
  `data16` int(10) unsigned NOT NULL DEFAULT '0',
  `data17` int(10) unsigned NOT NULL DEFAULT '0',
  `data18` int(10) unsigned NOT NULL DEFAULT '0',
  `data19` int(10) unsigned NOT NULL DEFAULT '0',
  `data20` int(10) unsigned NOT NULL DEFAULT '0',
  `data21` int(10) unsigned NOT NULL DEFAULT '0',
  `data22` int(10) unsigned NOT NULL DEFAULT '0',
  `data23` int(10) unsigned NOT NULL DEFAULT '0',
  `ScriptName` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`entry`),
  KEY `idx_name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Gameobject System';

-- ----------------------------
-- Table structure for instance_template
-- ----------------------------
CREATE TABLE `instance_template` (
  `map` smallint(5) unsigned NOT NULL,
  `parent` int(10) unsigned NOT NULL,
  `maxPlayers` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `reset_delay` int(10) unsigned NOT NULL DEFAULT '0',
  `access_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `startLocX` float DEFAULT NULL,
  `startLocY` float DEFAULT NULL,
  `startLocZ` float DEFAULT NULL,
  `startLocO` float DEFAULT NULL,
  `script` varchar(128) NOT NULL DEFAULT '',
  PRIMARY KEY (`map`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for item_enchantment_template
-- ----------------------------
CREATE TABLE `item_enchantment_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ench` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `chance` float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`ench`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item Random Enchantment System';

-- ----------------------------
-- Table structure for item_loot_template
-- ----------------------------
CREATE TABLE `item_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` smallint(5) unsigned NOT NULL DEFAULT '1',
  `lootcondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `condition_value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

-- ----------------------------
-- Table structure for item_template
-- ----------------------------
CREATE TABLE `item_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `subclass` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `unk0` int(11) NOT NULL DEFAULT '-1',
  `name` varchar(255) NOT NULL DEFAULT '',
  `displayid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Quality` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Flags` int(10) unsigned NOT NULL DEFAULT '0',
  `BuyCount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `BuyPrice` int(10) unsigned NOT NULL DEFAULT '0',
  `SellPrice` int(10) unsigned NOT NULL DEFAULT '0',
  `InventoryType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `AllowableClass` mediumint(9) NOT NULL DEFAULT '-1',
  `AllowableRace` mediumint(9) NOT NULL DEFAULT '-1',
  `ItemLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RequiredLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RequiredSkill` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSkillRank` smallint(5) unsigned NOT NULL DEFAULT '0',
  `requiredspell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `requiredhonorrank` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredCityRank` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RequiredReputationFaction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredReputationRank` smallint(5) unsigned NOT NULL DEFAULT '0',
  `maxcount` smallint(5) unsigned NOT NULL DEFAULT '0',
  `stackable` smallint(5) unsigned NOT NULL DEFAULT '1',
  `ContainerSlots` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_type1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value1` smallint(6) NOT NULL DEFAULT '0',
  `stat_type2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value2` smallint(6) NOT NULL DEFAULT '0',
  `stat_type3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value3` smallint(6) NOT NULL DEFAULT '0',
  `stat_type4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value4` smallint(6) NOT NULL DEFAULT '0',
  `stat_type5` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value5` smallint(6) NOT NULL DEFAULT '0',
  `stat_type6` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value6` smallint(6) NOT NULL DEFAULT '0',
  `stat_type7` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value7` smallint(6) NOT NULL DEFAULT '0',
  `stat_type8` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value8` smallint(6) NOT NULL DEFAULT '0',
  `stat_type9` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value9` smallint(6) NOT NULL DEFAULT '0',
  `stat_type10` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `stat_value10` smallint(6) NOT NULL DEFAULT '0',
  `dmg_min1` float NOT NULL DEFAULT '0',
  `dmg_max1` float NOT NULL DEFAULT '0',
  `dmg_type1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dmg_min2` float NOT NULL DEFAULT '0',
  `dmg_max2` float NOT NULL DEFAULT '0',
  `dmg_type2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dmg_min3` float NOT NULL DEFAULT '0',
  `dmg_max3` float NOT NULL DEFAULT '0',
  `dmg_type3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dmg_min4` float NOT NULL DEFAULT '0',
  `dmg_max4` float NOT NULL DEFAULT '0',
  `dmg_type4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dmg_min5` float NOT NULL DEFAULT '0',
  `dmg_max5` float NOT NULL DEFAULT '0',
  `dmg_type5` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `armor` smallint(5) unsigned NOT NULL DEFAULT '0',
  `holy_res` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fire_res` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `nature_res` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `frost_res` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `shadow_res` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `arcane_res` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `delay` smallint(5) unsigned NOT NULL DEFAULT '1000',
  `ammo_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RangedModRange` float NOT NULL DEFAULT '0',
  `spellid_1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spelltrigger_1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_1` tinyint(4) NOT NULL DEFAULT '0',
  `spellppmRate_1` float NOT NULL DEFAULT '0',
  `spellcooldown_1` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_1` int(11) NOT NULL DEFAULT '-1',
  `spellid_2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spelltrigger_2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_2` tinyint(4) NOT NULL DEFAULT '0',
  `spellppmRate_2` float NOT NULL DEFAULT '0',
  `spellcooldown_2` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_2` int(11) NOT NULL DEFAULT '-1',
  `spellid_3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spelltrigger_3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_3` tinyint(4) NOT NULL DEFAULT '0',
  `spellppmRate_3` float NOT NULL DEFAULT '0',
  `spellcooldown_3` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_3` int(11) NOT NULL DEFAULT '-1',
  `spellid_4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spelltrigger_4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_4` tinyint(4) NOT NULL DEFAULT '0',
  `spellppmRate_4` float NOT NULL DEFAULT '0',
  `spellcooldown_4` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_4` int(11) NOT NULL DEFAULT '-1',
  `spellid_5` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spelltrigger_5` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `spellcharges_5` tinyint(4) NOT NULL DEFAULT '0',
  `spellppmRate_5` float NOT NULL DEFAULT '0',
  `spellcooldown_5` int(11) NOT NULL DEFAULT '-1',
  `spellcategory_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spellcategorycooldown_5` int(11) NOT NULL DEFAULT '-1',
  `bonding` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `PageText` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `LanguageID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `PageMaterial` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `startquest` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lockid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Material` tinyint(4) NOT NULL DEFAULT '0',
  `sheath` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `RandomProperty` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RandomSuffix` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `block` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `itemset` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `MaxDurability` smallint(5) unsigned NOT NULL DEFAULT '0',
  `area` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Map` smallint(6) NOT NULL DEFAULT '0',
  `BagFamily` mediumint(9) NOT NULL DEFAULT '0',
  `TotemCategory` tinyint(4) NOT NULL DEFAULT '0',
  `socketColor_1` tinyint(4) NOT NULL DEFAULT '0',
  `socketContent_1` mediumint(9) NOT NULL DEFAULT '0',
  `socketColor_2` tinyint(4) NOT NULL DEFAULT '0',
  `socketContent_2` mediumint(9) NOT NULL DEFAULT '0',
  `socketColor_3` tinyint(4) NOT NULL DEFAULT '0',
  `socketContent_3` mediumint(9) NOT NULL DEFAULT '0',
  `socketBonus` mediumint(9) NOT NULL DEFAULT '0',
  `GemProperties` mediumint(9) NOT NULL DEFAULT '0',
  `RequiredDisenchantSkill` smallint(6) NOT NULL DEFAULT '-1',
  `ArmorDamageModifier` float NOT NULL DEFAULT '0',
  `ScriptName` varchar(64) NOT NULL DEFAULT '',
  `DisenchantID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `FoodType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `minMoneyLoot` int(10) unsigned NOT NULL DEFAULT '0',
  `maxMoneyLoot` int(10) unsigned NOT NULL DEFAULT '0',
  `Duration` int(11) NOT NULL DEFAULT '0' COMMENT 'Duration in seconds. Negative value means realtime, postive value ingame time',
  PRIMARY KEY (`entry`),
  KEY `idx_name` (`name`),
  KEY `items_index` (`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item System';

-- ----------------------------
-- Table structure for locales_creature
-- ----------------------------
CREATE TABLE `locales_creature` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name_loc1` varchar(100) NOT NULL DEFAULT '',
  `name_loc2` varchar(100) NOT NULL DEFAULT '',
  `name_loc3` varchar(100) NOT NULL DEFAULT '',
  `name_loc4` varchar(100) NOT NULL DEFAULT '',
  `name_loc5` varchar(100) NOT NULL DEFAULT '',
  `name_loc6` varchar(100) NOT NULL DEFAULT '',
  `name_loc7` varchar(100) NOT NULL DEFAULT '',
  `name_loc8` varchar(100) NOT NULL DEFAULT '',
  `subname_loc1` varchar(100) DEFAULT NULL,
  `subname_loc2` varchar(100) DEFAULT NULL,
  `subname_loc3` varchar(100) DEFAULT NULL,
  `subname_loc4` varchar(100) DEFAULT NULL,
  `subname_loc5` varchar(100) DEFAULT NULL,
  `subname_loc6` varchar(100) DEFAULT NULL,
  `subname_loc7` varchar(100) DEFAULT NULL,
  `subname_loc8` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for locales_gameobject
-- ----------------------------
CREATE TABLE `locales_gameobject` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name_loc1` varchar(100) NOT NULL DEFAULT '',
  `name_loc2` varchar(100) NOT NULL DEFAULT '',
  `name_loc3` varchar(100) NOT NULL DEFAULT '',
  `name_loc4` varchar(100) NOT NULL DEFAULT '',
  `name_loc5` varchar(100) NOT NULL DEFAULT '',
  `name_loc6` varchar(100) NOT NULL DEFAULT '',
  `name_loc7` varchar(100) NOT NULL DEFAULT '',
  `name_loc8` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc1` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc2` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc3` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc4` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc5` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc6` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc7` varchar(100) NOT NULL DEFAULT '',
  `castbarcaption_loc8` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for locales_item
-- ----------------------------
CREATE TABLE `locales_item` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name_loc1` varchar(100) NOT NULL DEFAULT '',
  `name_loc2` varchar(100) NOT NULL DEFAULT '',
  `name_loc3` varchar(100) NOT NULL DEFAULT '',
  `name_loc4` varchar(100) NOT NULL DEFAULT '',
  `name_loc5` varchar(100) NOT NULL DEFAULT '',
  `name_loc6` varchar(100) NOT NULL DEFAULT '',
  `name_loc7` varchar(100) NOT NULL DEFAULT '',
  `name_loc8` varchar(100) NOT NULL DEFAULT '',
  `description_loc1` varchar(255) DEFAULT NULL,
  `description_loc2` varchar(255) DEFAULT NULL,
  `description_loc3` varchar(255) DEFAULT NULL,
  `description_loc4` varchar(255) DEFAULT NULL,
  `description_loc5` varchar(255) DEFAULT NULL,
  `description_loc6` varchar(255) DEFAULT NULL,
  `description_loc7` varchar(255) DEFAULT NULL,
  `description_loc8` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for locales_npc_option
-- ----------------------------
CREATE TABLE `locales_npc_option` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `option_text_loc1` text,
  `option_text_loc2` text,
  `option_text_loc3` text,
  `option_text_loc4` text,
  `option_text_loc5` text,
  `option_text_loc6` text,
  `option_text_loc7` text,
  `option_text_loc8` text,
  `box_text_loc1` text,
  `box_text_loc2` text,
  `box_text_loc3` text,
  `box_text_loc4` text,
  `box_text_loc5` text,
  `box_text_loc6` text,
  `box_text_loc7` text,
  `box_text_loc8` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for locales_npc_text
-- ----------------------------
CREATE TABLE `locales_npc_text` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Text0_0_loc1` longtext,
  `Text0_0_loc2` longtext,
  `Text0_0_loc3` longtext,
  `Text0_0_loc4` longtext,
  `Text0_0_loc5` longtext,
  `Text0_0_loc6` longtext,
  `Text0_0_loc7` longtext,
  `Text0_0_loc8` longtext,
  `Text0_1_loc1` longtext,
  `Text0_1_loc2` longtext,
  `Text0_1_loc3` longtext,
  `Text0_1_loc4` longtext,
  `Text0_1_loc5` longtext,
  `Text0_1_loc6` longtext,
  `Text0_1_loc7` longtext,
  `Text0_1_loc8` longtext,
  `Text1_0_loc1` longtext,
  `Text1_0_loc2` longtext,
  `Text1_0_loc3` longtext,
  `Text1_0_loc4` longtext,
  `Text1_0_loc5` longtext,
  `Text1_0_loc6` longtext,
  `Text1_0_loc7` longtext,
  `Text1_0_loc8` longtext,
  `Text1_1_loc1` longtext,
  `Text1_1_loc2` longtext,
  `Text1_1_loc3` longtext,
  `Text1_1_loc4` longtext,
  `Text1_1_loc5` longtext,
  `Text1_1_loc6` longtext,
  `Text1_1_loc7` longtext,
  `Text1_1_loc8` longtext,
  `Text2_0_loc1` longtext,
  `Text2_0_loc2` longtext,
  `Text2_0_loc3` longtext,
  `Text2_0_loc4` longtext,
  `Text2_0_loc5` longtext,
  `Text2_0_loc6` longtext,
  `Text2_0_loc7` longtext,
  `Text2_0_loc8` longtext,
  `Text2_1_loc1` longtext,
  `Text2_1_loc2` longtext,
  `Text2_1_loc3` longtext,
  `Text2_1_loc4` longtext,
  `Text2_1_loc5` longtext,
  `Text2_1_loc6` longtext,
  `Text2_1_loc7` longtext,
  `Text2_1_loc8` longtext,
  `Text3_0_loc1` longtext,
  `Text3_0_loc2` longtext,
  `Text3_0_loc3` longtext,
  `Text3_0_loc4` longtext,
  `Text3_0_loc5` longtext,
  `Text3_0_loc6` longtext,
  `Text3_0_loc7` longtext,
  `Text3_0_loc8` longtext,
  `Text3_1_loc1` longtext,
  `Text3_1_loc2` longtext,
  `Text3_1_loc3` longtext,
  `Text3_1_loc4` longtext,
  `Text3_1_loc5` longtext,
  `Text3_1_loc6` longtext,
  `Text3_1_loc7` longtext,
  `Text3_1_loc8` longtext,
  `Text4_0_loc1` longtext,
  `Text4_0_loc2` longtext,
  `Text4_0_loc3` longtext,
  `Text4_0_loc4` longtext,
  `Text4_0_loc5` longtext,
  `Text4_0_loc6` longtext,
  `Text4_0_loc7` longtext,
  `Text4_0_loc8` longtext,
  `Text4_1_loc1` longtext,
  `Text4_1_loc2` longtext,
  `Text4_1_loc3` longtext,
  `Text4_1_loc4` longtext,
  `Text4_1_loc5` longtext,
  `Text4_1_loc6` longtext,
  `Text4_1_loc7` longtext,
  `Text4_1_loc8` longtext,
  `Text5_0_loc1` longtext,
  `Text5_0_loc2` longtext,
  `Text5_0_loc3` longtext,
  `Text5_0_loc4` longtext,
  `Text5_0_loc5` longtext,
  `Text5_0_loc6` longtext,
  `Text5_0_loc7` longtext,
  `Text5_0_loc8` longtext,
  `Text5_1_loc1` longtext,
  `Text5_1_loc2` longtext,
  `Text5_1_loc3` longtext,
  `Text5_1_loc4` longtext,
  `Text5_1_loc5` longtext,
  `Text5_1_loc6` longtext,
  `Text5_1_loc7` longtext,
  `Text5_1_loc8` longtext,
  `Text6_0_loc1` longtext,
  `Text6_0_loc2` longtext,
  `Text6_0_loc3` longtext,
  `Text6_0_loc4` longtext,
  `Text6_0_loc5` longtext,
  `Text6_0_loc6` longtext,
  `Text6_0_loc7` longtext,
  `Text6_0_loc8` longtext,
  `Text6_1_loc1` longtext,
  `Text6_1_loc2` longtext,
  `Text6_1_loc3` longtext,
  `Text6_1_loc4` longtext,
  `Text6_1_loc5` longtext,
  `Text6_1_loc6` longtext,
  `Text6_1_loc7` longtext,
  `Text6_1_loc8` longtext,
  `Text7_0_loc1` longtext,
  `Text7_0_loc2` longtext,
  `Text7_0_loc3` longtext,
  `Text7_0_loc4` longtext,
  `Text7_0_loc5` longtext,
  `Text7_0_loc6` longtext,
  `Text7_0_loc7` longtext,
  `Text7_0_loc8` longtext,
  `Text7_1_loc1` longtext,
  `Text7_1_loc2` longtext,
  `Text7_1_loc3` longtext,
  `Text7_1_loc4` longtext,
  `Text7_1_loc5` longtext,
  `Text7_1_loc6` longtext,
  `Text7_1_loc7` longtext,
  `Text7_1_loc8` longtext,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for locales_page_text
-- ----------------------------
CREATE TABLE `locales_page_text` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Text_loc1` longtext,
  `Text_loc2` longtext,
  `Text_loc3` longtext,
  `Text_loc4` longtext,
  `Text_loc5` longtext,
  `Text_loc6` longtext,
  `Text_loc7` longtext,
  `Text_loc8` longtext,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for locales_quest
-- ----------------------------
CREATE TABLE `locales_quest` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Title_loc1` text,
  `Title_loc2` text,
  `Title_loc3` text,
  `Title_loc4` text,
  `Title_loc5` text,
  `Title_loc6` text,
  `Title_loc7` text,
  `Title_loc8` text,
  `Details_loc1` text,
  `Details_loc2` text,
  `Details_loc3` text,
  `Details_loc4` text,
  `Details_loc5` text,
  `Details_loc6` text,
  `Details_loc7` text,
  `Details_loc8` text,
  `Objectives_loc1` text,
  `Objectives_loc2` text,
  `Objectives_loc3` text,
  `Objectives_loc4` text,
  `Objectives_loc5` text,
  `Objectives_loc6` text,
  `Objectives_loc7` text,
  `Objectives_loc8` text,
  `OfferRewardText_loc1` text,
  `OfferRewardText_loc2` text,
  `OfferRewardText_loc3` text,
  `OfferRewardText_loc4` text,
  `OfferRewardText_loc5` text,
  `OfferRewardText_loc6` text,
  `OfferRewardText_loc7` text,
  `OfferRewardText_loc8` text,
  `RequestItemsText_loc1` text,
  `RequestItemsText_loc2` text,
  `RequestItemsText_loc3` text,
  `RequestItemsText_loc4` text,
  `RequestItemsText_loc5` text,
  `RequestItemsText_loc6` text,
  `RequestItemsText_loc7` text,
  `RequestItemsText_loc8` text,
  `EndText_loc1` text,
  `EndText_loc2` text,
  `EndText_loc3` text,
  `EndText_loc4` text,
  `EndText_loc5` text,
  `EndText_loc6` text,
  `EndText_loc7` text,
  `EndText_loc8` text,
  `ObjectiveText1_loc1` text,
  `ObjectiveText1_loc2` text,
  `ObjectiveText1_loc3` text,
  `ObjectiveText1_loc4` text,
  `ObjectiveText1_loc5` text,
  `ObjectiveText1_loc6` text,
  `ObjectiveText1_loc7` text,
  `ObjectiveText1_loc8` text,
  `ObjectiveText2_loc1` text,
  `ObjectiveText2_loc2` text,
  `ObjectiveText2_loc3` text,
  `ObjectiveText2_loc4` text,
  `ObjectiveText2_loc5` text,
  `ObjectiveText2_loc6` text,
  `ObjectiveText2_loc7` text,
  `ObjectiveText2_loc8` text,
  `ObjectiveText3_loc1` text,
  `ObjectiveText3_loc2` text,
  `ObjectiveText3_loc3` text,
  `ObjectiveText3_loc4` text,
  `ObjectiveText3_loc5` text,
  `ObjectiveText3_loc6` text,
  `ObjectiveText3_loc7` text,
  `ObjectiveText3_loc8` text,
  `ObjectiveText4_loc1` text,
  `ObjectiveText4_loc2` text,
  `ObjectiveText4_loc3` text,
  `ObjectiveText4_loc4` text,
  `ObjectiveText4_loc5` text,
  `ObjectiveText4_loc6` text,
  `ObjectiveText4_loc7` text,
  `ObjectiveText4_loc8` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for npc_gossip
-- ----------------------------
CREATE TABLE `npc_gossip` (
  `npc_guid` int(10) unsigned NOT NULL DEFAULT '0',
  `textid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`npc_guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for npc_gossip_textid
-- ----------------------------
CREATE TABLE `npc_gossip_textid` (
  `zoneid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `action` smallint(5) unsigned NOT NULL DEFAULT '0',
  `textid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  KEY `zoneid` (`zoneid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for npc_option
-- ----------------------------
CREATE TABLE `npc_option` (
  `id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `gossip_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `npcflag` int(10) unsigned NOT NULL DEFAULT '0',
  `icon` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `action` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `box_money` int(10) unsigned NOT NULL DEFAULT '0',
  `coded` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `option_text` text,
  `box_text` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for npc_text
-- ----------------------------
CREATE TABLE `npc_text` (
  `ID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `text0_0` longtext,
  `text0_1` longtext,
  `lang0` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob0` float NOT NULL DEFAULT '0',
  `em0_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em0_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em0_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em0_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em0_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em0_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text1_0` longtext,
  `text1_1` longtext,
  `lang1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob1` float NOT NULL DEFAULT '0',
  `em1_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em1_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em1_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em1_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em1_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em1_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text2_0` longtext,
  `text2_1` longtext,
  `lang2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob2` float NOT NULL DEFAULT '0',
  `em2_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em2_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em2_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em2_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em2_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em2_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text3_0` longtext,
  `text3_1` longtext,
  `lang3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob3` float NOT NULL DEFAULT '0',
  `em3_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em3_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em3_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em3_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em3_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em3_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text4_0` longtext,
  `text4_1` longtext,
  `lang4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob4` float NOT NULL DEFAULT '0',
  `em4_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em4_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em4_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em4_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em4_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em4_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text5_0` longtext,
  `text5_1` longtext,
  `lang5` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob5` float NOT NULL DEFAULT '0',
  `em5_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em5_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em5_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em5_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em5_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em5_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text6_0` longtext,
  `text6_1` longtext,
  `lang6` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob6` float NOT NULL DEFAULT '0',
  `em6_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em6_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em6_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em6_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em6_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em6_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `text7_0` longtext,
  `text7_1` longtext,
  `lang7` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `prob7` float NOT NULL DEFAULT '0',
  `em7_0` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em7_1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em7_2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em7_3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em7_4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `em7_5` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for npc_trainer
-- ----------------------------
CREATE TABLE `npc_trainer` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `spellcost` int(10) unsigned NOT NULL DEFAULT '0',
  `reqskill` smallint(5) unsigned NOT NULL DEFAULT '0',
  `reqskillvalue` smallint(5) unsigned NOT NULL DEFAULT '0',
  `reqlevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for npc_vendor
-- ----------------------------
CREATE TABLE `npc_vendor` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `incrtime` int(10) unsigned NOT NULL DEFAULT '0',
  `ExtendedCost` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Npc System';

-- ----------------------------
-- Table structure for page_text
-- ----------------------------
CREATE TABLE `page_text` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `text` longtext NOT NULL,
  `next_page` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Item System';

-- ----------------------------
-- Table structure for pet_levelstats
-- ----------------------------
CREATE TABLE `pet_levelstats` (
  `creature_entry` mediumint(8) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `hp` smallint(5) unsigned NOT NULL,
  `mana` smallint(5) unsigned NOT NULL,
  `armor` int(10) unsigned NOT NULL DEFAULT '0',
  `str` smallint(5) unsigned NOT NULL,
  `agi` smallint(5) unsigned NOT NULL,
  `sta` smallint(5) unsigned NOT NULL,
  `inte` smallint(5) unsigned NOT NULL,
  `spi` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`creature_entry`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='Stores pet levels stats.';

-- ----------------------------
-- Table structure for pet_name_generation
-- ----------------------------
CREATE TABLE `pet_name_generation` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `word` tinytext NOT NULL,
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `half` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for petcreateinfo_spell
-- ----------------------------
CREATE TABLE `petcreateinfo_spell` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Spell1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Spell2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Spell3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Spell4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Pet Create Spells';

-- ----------------------------
-- Table structure for pickpocketing_loot_template
-- ----------------------------
CREATE TABLE `pickpocketing_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lootcondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `condition_value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

-- ----------------------------
-- Table structure for player_classlevelstats
-- ----------------------------
CREATE TABLE `player_classlevelstats` (
  `class` tinyint(3) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `basehp` smallint(5) unsigned NOT NULL,
  `basemana` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`class`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='Stores levels stats.';

-- ----------------------------
-- Table structure for player_levelstats
-- ----------------------------
CREATE TABLE `player_levelstats` (
  `race` tinyint(3) unsigned NOT NULL,
  `class` tinyint(3) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL,
  `str` tinyint(3) unsigned NOT NULL,
  `agi` tinyint(3) unsigned NOT NULL,
  `sta` tinyint(3) unsigned NOT NULL,
  `inte` tinyint(3) unsigned NOT NULL,
  `spi` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`race`,`class`,`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='Stores levels stats.';

-- ----------------------------
-- Table structure for playercreateinfo
-- ----------------------------
CREATE TABLE `playercreateinfo` (
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `zone` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`race`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for playercreateinfo_action
-- ----------------------------
CREATE TABLE `playercreateinfo_action` (
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `button` smallint(5) unsigned NOT NULL DEFAULT '0',
  `action` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `misc` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `playercreateinfo_race_class_index` (`race`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for playercreateinfo_item
-- ----------------------------
CREATE TABLE `playercreateinfo_item` (
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `itemid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `amount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  KEY `playercreateinfo_race_class_index` (`race`,`class`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for playercreateinfo_spell
-- ----------------------------
CREATE TABLE `playercreateinfo_spell` (
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Note` varchar(255) DEFAULT NULL,
  `Active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`race`,`class`,`Spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for playercreateinfo_spell_custom
-- ----------------------------
CREATE TABLE `playercreateinfo_spell_custom` (
  `race` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `class` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Spell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Note` varchar(255) DEFAULT NULL,
  `Active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`race`,`class`,`Spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for prospecting_loot_template
-- ----------------------------
CREATE TABLE `prospecting_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lootcondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `condition_value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

-- ----------------------------
-- Table structure for quest_end_scripts
-- ----------------------------
CREATE TABLE `quest_end_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `datatext` text NOT NULL,
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for quest_mail_loot_template
-- ----------------------------
CREATE TABLE `quest_mail_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lootcondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `condition_value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

-- ----------------------------
-- Table structure for quest_start_scripts
-- ----------------------------
CREATE TABLE `quest_start_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `datatext` text NOT NULL,
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for quest_template
-- ----------------------------
CREATE TABLE `quest_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Method` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `ZoneOrSort` smallint(6) NOT NULL DEFAULT '0',
  `SkillOrClass` smallint(6) NOT NULL DEFAULT '0',
  `MinLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `QuestLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Type` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredRaces` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredSkillValue` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RepObjectiveFaction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RepObjectiveValue` mediumint(9) NOT NULL DEFAULT '0',
  `RequiredMinRepFaction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredMinRepValue` mediumint(9) NOT NULL DEFAULT '0',
  `RequiredMaxRepFaction` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RequiredMaxRepValue` mediumint(9) NOT NULL DEFAULT '0',
  `SuggestedPlayers` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `LimitTime` int(10) unsigned NOT NULL DEFAULT '0',
  `QuestFlags` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SpecialFlags` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `CharTitleId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `PrevQuestId` mediumint(9) NOT NULL DEFAULT '0',
  `NextQuestId` mediumint(9) NOT NULL DEFAULT '0',
  `ExclusiveGroup` mediumint(9) NOT NULL DEFAULT '0',
  `NextQuestInChain` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `SrcItemId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `SrcItemCount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SrcSpell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `Title` text,
  `Details` text,
  `Objectives` text,
  `OfferRewardText` text,
  `RequestItemsText` text,
  `EndText` text,
  `ObjectiveText1` text,
  `ObjectiveText2` text,
  `ObjectiveText3` text,
  `ObjectiveText4` text,
  `ReqItemId1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqItemId2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqItemId3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqItemId4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqItemCount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqItemCount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqItemCount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqItemCount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqSourceId1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqSourceId2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqSourceId3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqSourceId4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqSourceCount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqSourceCount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqSourceCount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqSourceCount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqSourceRef1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ReqSourceRef2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ReqSourceRef3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ReqSourceRef4` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ReqCreatureOrGOId1` mediumint(9) NOT NULL DEFAULT '0',
  `ReqCreatureOrGOId2` mediumint(9) NOT NULL DEFAULT '0',
  `ReqCreatureOrGOId3` mediumint(9) NOT NULL DEFAULT '0',
  `ReqCreatureOrGOId4` mediumint(9) NOT NULL DEFAULT '0',
  `ReqCreatureOrGOCount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqCreatureOrGOCount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqCreatureOrGOCount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqCreatureOrGOCount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ReqSpellCast1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqSpellCast2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqSpellCast3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ReqSpellCast4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId5` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemId6` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount5` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewChoiceItemCount6` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewItemId1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewItemId2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewItemId3` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewItemId4` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewItemCount1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewItemCount2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewItemCount3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewItemCount4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `RewRepFaction1` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction2` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction3` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction4` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepFaction5` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'faction id from Faction.dbc in this case',
  `RewRepValue1` mediumint(9) NOT NULL DEFAULT '0',
  `RewRepValue2` mediumint(9) NOT NULL DEFAULT '0',
  `RewRepValue3` mediumint(9) NOT NULL DEFAULT '0',
  `RewRepValue4` mediumint(9) NOT NULL DEFAULT '0',
  `RewRepValue5` mediumint(9) NOT NULL DEFAULT '0',
  `RewHonorableKills` mediumint(9) unsigned NOT NULL DEFAULT '0',
  `RewOrReqMoney` int(11) NOT NULL DEFAULT '0',
  `RewMoneyMaxLevel` int(10) unsigned NOT NULL DEFAULT '0',
  `RewSpell` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewSpellCast` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewMailTemplateId` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `RewMailDelaySecs` int(11) unsigned NOT NULL DEFAULT '0',
  `PointMapId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `PointX` float NOT NULL DEFAULT '0',
  `PointY` float NOT NULL DEFAULT '0',
  `PointOpt` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `DetailsEmote1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DetailsEmote2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DetailsEmote3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `DetailsEmote4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `IncompleteEmote` smallint(5) unsigned NOT NULL DEFAULT '0',
  `CompleteEmote` smallint(5) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `OfferRewardEmote4` smallint(5) unsigned NOT NULL DEFAULT '0',
  `StartScript` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `CompleteScript` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Quest System';

-- ----------------------------
-- Table structure for reference_loot_template
-- ----------------------------
CREATE TABLE `reference_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lootcondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `condition_value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

-- ----------------------------
-- Table structure for reserved_name
-- ----------------------------
CREATE TABLE `reserved_name` (
  `name` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player Reserved Names';

-- ----------------------------
-- Table structure for script_texts
-- ----------------------------
CREATE TABLE `script_texts` (
  `entry` mediumint(8) NOT NULL,
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  `sound` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `language` smallint(5) unsigned NOT NULL DEFAULT '0',
  `emote` smallint(5) unsigned NOT NULL DEFAULT '0',
  `comment` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Script Texts';

-- ----------------------------
-- Table structure for skill_discovery_template
-- ----------------------------
CREATE TABLE `skill_discovery_template` (
  `spellId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of the discoverable spell',
  `reqSpell` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'spell requirement',
  `chance` float NOT NULL DEFAULT '0' COMMENT 'chance to discover',
  PRIMARY KEY (`spellId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Skill Discovery System';

-- ----------------------------
-- Table structure for skill_extra_item_template
-- ----------------------------
CREATE TABLE `skill_extra_item_template` (
  `spellId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of the item creation spell',
  `requiredSpecialization` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Specialization spell id',
  `additionalCreateChance` float NOT NULL DEFAULT '0' COMMENT 'chance to create add',
  `additionalMaxNum` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'max num of adds',
  PRIMARY KEY (`spellId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Skill Specialization System';

-- ----------------------------
-- Table structure for skill_fishing_base_level
-- ----------------------------
CREATE TABLE `skill_fishing_base_level` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Area identifier',
  `skill` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Base skill level requirement',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Fishing system';

-- ----------------------------
-- Table structure for skinning_loot_template
-- ----------------------------
CREATE TABLE `skinning_loot_template` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `item` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ChanceOrQuestChance` float NOT NULL DEFAULT '100',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `mincountOrRef` mediumint(9) NOT NULL DEFAULT '1',
  `maxcount` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `lootcondition` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `condition_value1` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `condition_value2` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`item`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Loot System';

-- ----------------------------
-- Table structure for spell_affect
-- ----------------------------
CREATE TABLE `spell_affect` (
  `entry` smallint(5) unsigned NOT NULL DEFAULT '0',
  `effectId` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`effectId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for spell_disabled
-- ----------------------------
CREATE TABLE `spell_disabled` (
  `entry` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell entry',
  `disable_mask` int(8) unsigned NOT NULL DEFAULT '0',
  `comment` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Disabled Spell System';

-- ----------------------------
-- Table structure for spell_elixir
-- ----------------------------
CREATE TABLE `spell_elixir` (
  `entry` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'SpellId of potion',
  `mask` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Mask 0x1 battle 0x2 guardian 0x3 flask 0x7 unstable flasks 0xB shattrath flasks',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Spell System';

-- ----------------------------
-- Table structure for spell_learn_spell
-- ----------------------------
CREATE TABLE `spell_learn_spell` (
  `entry` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SpellID` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`,`SpellID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item System';

-- ----------------------------
-- Table structure for spell_pet_auras
-- ----------------------------
CREATE TABLE `spell_pet_auras` (
  `spell` mediumint(8) unsigned NOT NULL COMMENT 'dummy spell id',
  `pet` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'pet id; 0 = all',
  `aura` mediumint(8) unsigned NOT NULL COMMENT 'pet aura id',
  PRIMARY KEY (`spell`,`pet`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for spell_proc_event
-- ----------------------------
CREATE TABLE `spell_proc_event` (
  `entry` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SchoolMask` tinyint(4) NOT NULL DEFAULT '0',
  `Category` smallint(6) NOT NULL DEFAULT '0',
  `SkillID` smallint(6) NOT NULL DEFAULT '0',
  `SpellFamilyName` smallint(5) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyMask` bigint(20) unsigned NOT NULL DEFAULT '0',
  `procFlags` int(10) unsigned NOT NULL DEFAULT '0',
  `ppmRate` float NOT NULL DEFAULT '0',
  `cooldown` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for spell_required
-- ----------------------------
CREATE TABLE `spell_required` (
  `spell_id` mediumint(9) NOT NULL DEFAULT '0',
  `prev_spell` mediumint(9) NOT NULL DEFAULT '0',
  `req_spell` mediumint(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`spell_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Spell Additinal Data';

-- ----------------------------
-- Table structure for spell_script_target
-- ----------------------------
CREATE TABLE `spell_script_target` (
  `entry` mediumint(8) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `targetEntry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `entry_type_target` (`entry`,`type`,`targetEntry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Spell System';

-- ----------------------------
-- Table structure for spell_scripts
-- ----------------------------
CREATE TABLE `spell_scripts` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `command` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(10) unsigned NOT NULL DEFAULT '0',
  `datatext` text CHARACTER SET latin1 NOT NULL,
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for spell_target_position
-- ----------------------------
CREATE TABLE `spell_target_position` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Identifier',
  `target_map` smallint(5) unsigned NOT NULL DEFAULT '0',
  `target_position_x` float NOT NULL DEFAULT '0',
  `target_position_y` float NOT NULL DEFAULT '0',
  `target_position_z` float NOT NULL DEFAULT '0',
  `target_orientation` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Spell System';

-- ----------------------------
-- Table structure for spell_threat
-- ----------------------------
CREATE TABLE `spell_threat` (
  `entry` mediumint(8) unsigned NOT NULL,
  `Threat` smallint(6) NOT NULL,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

-- ----------------------------
-- Table structure for transport_events
-- ----------------------------
CREATE TABLE `transport_events` (
  `entry` int(11) unsigned NOT NULL DEFAULT '0',
  `waypoint_id` int(11) unsigned NOT NULL DEFAULT '0',
  `event_id` int(11) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for transports
-- ----------------------------
CREATE TABLE `transports` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` text,
  `period` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Transports';

-- ----------------------------
-- Table structure for trinity_string
-- ----------------------------
CREATE TABLE `trinity_string` (
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `content_default` text NOT NULL,
  `content_loc1` text,
  `content_loc2` text,
  `content_loc3` text,
  `content_loc4` text,
  `content_loc5` text,
  `content_loc6` text,
  `content_loc7` text,
  `content_loc8` text,
  PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for uptime
-- ----------------------------
CREATE TABLE `uptime` (
  `starttime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `startstring` varchar(64) NOT NULL DEFAULT '',
  `uptime` bigint(20) unsigned NOT NULL DEFAULT '0',
  `maxplayers` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`starttime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Uptime system';

-- ----------------------------
-- Table structure for version
-- ----------------------------
CREATE TABLE `version` (
  `core_version` varchar(120) DEFAULT NULL COMMENT 'Core revision dumped at startup.',
  `core_revision` bigint(20) unsigned DEFAULT '0',
  `db_version` varchar(120) DEFAULT NULL COMMENT 'Version of world DB.',
  `script_version` varchar(120) DEFAULT NULL COMMENT 'Version of scripts DB.'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Version Notes';

-- ----------------------------
-- Table structure for waypoint_data
-- ----------------------------
CREATE TABLE `waypoint_data` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Creature GUID',
  `point` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `position_x` float NOT NULL DEFAULT '0',
  `position_y` float NOT NULL DEFAULT '0',
  `position_z` float NOT NULL DEFAULT '0',
  `delay` int(10) unsigned NOT NULL DEFAULT '0',
  `move_flag` tinyint(1) NOT NULL DEFAULT '0',
  `action` int(11) NOT NULL DEFAULT '0',
  `action_chance` smallint(3) NOT NULL DEFAULT '100',
  `wpguid` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for waypoint_scripts
-- ----------------------------
CREATE TABLE `waypoint_scripts` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `delay` int(11) unsigned NOT NULL DEFAULT '0',
  `command` int(11) unsigned NOT NULL DEFAULT '0',
  `datalong` int(11) unsigned NOT NULL DEFAULT '0',
  `datalong2` int(11) unsigned NOT NULL DEFAULT '0',
  `dataint` int(11) unsigned NOT NULL DEFAULT '0',
  `x` float NOT NULL DEFAULT '0',
  `y` float NOT NULL DEFAULT '0',
  `z` float NOT NULL DEFAULT '0',
  `o` float NOT NULL DEFAULT '0',
  `guid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `player_classlevelstats` VALUES ('1', '1', '20', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '2', '29', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '3', '38', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '4', '47', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '5', '56', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '6', '65', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '7', '74', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '8', '83', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '9', '92', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '10', '101', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '11', '100', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '12', '109', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '13', '118', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '14', '128', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '15', '139', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '16', '151', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '17', '154', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '18', '168', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '19', '183', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '20', '199', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '21', '206', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '22', '224', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '23', '243', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '24', '253', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '25', '274', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '26', '296', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '27', '309', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '28', '333', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '29', '348', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '30', '374', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '31', '401', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '32', '419', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '33', '448', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '34', '468', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '35', '499', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '36', '521', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '37', '545', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '38', '581', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '39', '609', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '40', '649', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '41', '681', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '42', '715', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '43', '761', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '44', '799', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '45', '839', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '46', '881', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '47', '935', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '48', '981', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '49', '1029', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '50', '1079', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '51', '1131', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '52', '1185', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '53', '1241', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '54', '1299', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '55', '1359', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '56', '1421', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '57', '1485', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '58', '1551', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '59', '1619', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '60', '1689', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '61', '1902', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '62', '2129', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '63', '2357', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '64', '2612', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '65', '2883', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '66', '3169', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '67', '3455', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '68', '3774', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '69', '4109', '0');
INSERT INTO `player_classlevelstats` VALUES ('1', '70', '4444', '0');
INSERT INTO `player_classlevelstats` VALUES ('2', '1', '28', '60');
INSERT INTO `player_classlevelstats` VALUES ('2', '2', '36', '78');
INSERT INTO `player_classlevelstats` VALUES ('2', '3', '44', '98');
INSERT INTO `player_classlevelstats` VALUES ('2', '4', '52', '104');
INSERT INTO `player_classlevelstats` VALUES ('2', '5', '60', '111');
INSERT INTO `player_classlevelstats` VALUES ('2', '6', '68', '134');
INSERT INTO `player_classlevelstats` VALUES ('2', '7', '76', '143');
INSERT INTO `player_classlevelstats` VALUES ('2', '8', '84', '153');
INSERT INTO `player_classlevelstats` VALUES ('2', '9', '92', '179');
INSERT INTO `player_classlevelstats` VALUES ('2', '10', '100', '192');
INSERT INTO `player_classlevelstats` VALUES ('2', '11', '108', '205');
INSERT INTO `player_classlevelstats` VALUES ('2', '12', '116', '219');
INSERT INTO `player_classlevelstats` VALUES ('2', '13', '124', '249');
INSERT INTO `player_classlevelstats` VALUES ('2', '14', '132', '265');
INSERT INTO `player_classlevelstats` VALUES ('2', '15', '131', '282');
INSERT INTO `player_classlevelstats` VALUES ('2', '16', '141', '315');
INSERT INTO `player_classlevelstats` VALUES ('2', '17', '152', '334');
INSERT INTO `player_classlevelstats` VALUES ('2', '18', '164', '354');
INSERT INTO `player_classlevelstats` VALUES ('2', '19', '177', '390');
INSERT INTO `player_classlevelstats` VALUES ('2', '20', '191', '412');
INSERT INTO `player_classlevelstats` VALUES ('2', '21', '206', '435');
INSERT INTO `player_classlevelstats` VALUES ('2', '22', '222', '459');
INSERT INTO `player_classlevelstats` VALUES ('2', '23', '239', '499');
INSERT INTO `player_classlevelstats` VALUES ('2', '24', '247', '525');
INSERT INTO `player_classlevelstats` VALUES ('2', '25', '266', '552');
INSERT INTO `player_classlevelstats` VALUES ('2', '26', '286', '579');
INSERT INTO `player_classlevelstats` VALUES ('2', '27', '307', '621');
INSERT INTO `player_classlevelstats` VALUES ('2', '28', '329', '648');
INSERT INTO `player_classlevelstats` VALUES ('2', '29', '342', '675');
INSERT INTO `player_classlevelstats` VALUES ('2', '30', '366', '702');
INSERT INTO `player_classlevelstats` VALUES ('2', '31', '391', '729');
INSERT INTO `player_classlevelstats` VALUES ('2', '32', '407', '756');
INSERT INTO `player_classlevelstats` VALUES ('2', '33', '434', '798');
INSERT INTO `player_classlevelstats` VALUES ('2', '34', '462', '825');
INSERT INTO `player_classlevelstats` VALUES ('2', '35', '481', '852');
INSERT INTO `player_classlevelstats` VALUES ('2', '36', '511', '879');
INSERT INTO `player_classlevelstats` VALUES ('2', '37', '542', '906');
INSERT INTO `player_classlevelstats` VALUES ('2', '38', '564', '933');
INSERT INTO `player_classlevelstats` VALUES ('2', '39', '597', '960');
INSERT INTO `player_classlevelstats` VALUES ('2', '40', '621', '987');
INSERT INTO `player_classlevelstats` VALUES ('2', '41', '656', '1014');
INSERT INTO `player_classlevelstats` VALUES ('2', '42', '682', '1041');
INSERT INTO `player_classlevelstats` VALUES ('2', '43', '719', '1068');
INSERT INTO `player_classlevelstats` VALUES ('2', '44', '747', '1110');
INSERT INTO `player_classlevelstats` VALUES ('2', '45', '786', '1137');
INSERT INTO `player_classlevelstats` VALUES ('2', '46', '816', '1164');
INSERT INTO `player_classlevelstats` VALUES ('2', '47', '857', '1176');
INSERT INTO `player_classlevelstats` VALUES ('2', '48', '889', '1203');
INSERT INTO `player_classlevelstats` VALUES ('2', '49', '922', '1230');
INSERT INTO `player_classlevelstats` VALUES ('2', '50', '966', '1257');
INSERT INTO `player_classlevelstats` VALUES ('2', '51', '1001', '1284');
INSERT INTO `player_classlevelstats` VALUES ('2', '52', '1037', '1311');
INSERT INTO `player_classlevelstats` VALUES ('2', '53', '1084', '1338');
INSERT INTO `player_classlevelstats` VALUES ('2', '54', '1122', '1365');
INSERT INTO `player_classlevelstats` VALUES ('2', '55', '1161', '1392');
INSERT INTO `player_classlevelstats` VALUES ('2', '56', '1201', '1419');
INSERT INTO `player_classlevelstats` VALUES ('2', '57', '1252', '1446');
INSERT INTO `player_classlevelstats` VALUES ('2', '58', '1294', '1458');
INSERT INTO `player_classlevelstats` VALUES ('2', '59', '1337', '1485');
INSERT INTO `player_classlevelstats` VALUES ('2', '60', '1381', '1512');
INSERT INTO `player_classlevelstats` VALUES ('2', '61', '1540', '1656');
INSERT INTO `player_classlevelstats` VALUES ('2', '62', '1708', '1800');
INSERT INTO `player_classlevelstats` VALUES ('2', '63', '1884', '1944');
INSERT INTO `player_classlevelstats` VALUES ('2', '64', '2068', '2088');
INSERT INTO `player_classlevelstats` VALUES ('2', '65', '2262', '2232');
INSERT INTO `player_classlevelstats` VALUES ('2', '66', '2466', '2377');
INSERT INTO `player_classlevelstats` VALUES ('2', '67', '2679', '2521');
INSERT INTO `player_classlevelstats` VALUES ('2', '68', '2901', '2665');
INSERT INTO `player_classlevelstats` VALUES ('2', '69', '3134', '2809');
INSERT INTO `player_classlevelstats` VALUES ('2', '70', '3377', '2953');
INSERT INTO `player_classlevelstats` VALUES ('3', '1', '46', '65');
INSERT INTO `player_classlevelstats` VALUES ('3', '2', '53', '70');
INSERT INTO `player_classlevelstats` VALUES ('3', '3', '60', '76');
INSERT INTO `player_classlevelstats` VALUES ('3', '4', '67', '98');
INSERT INTO `player_classlevelstats` VALUES ('3', '5', '74', '106');
INSERT INTO `player_classlevelstats` VALUES ('3', '6', '81', '130');
INSERT INTO `player_classlevelstats` VALUES ('3', '7', '88', '140');
INSERT INTO `player_classlevelstats` VALUES ('3', '8', '95', '166');
INSERT INTO `player_classlevelstats` VALUES ('3', '9', '102', '193');
INSERT INTO `player_classlevelstats` VALUES ('3', '10', '109', '206');
INSERT INTO `player_classlevelstats` VALUES ('3', '11', '116', '235');
INSERT INTO `player_classlevelstats` VALUES ('3', '12', '123', '250');
INSERT INTO `player_classlevelstats` VALUES ('3', '13', '130', '266');
INSERT INTO `player_classlevelstats` VALUES ('3', '14', '138', '298');
INSERT INTO `player_classlevelstats` VALUES ('3', '15', '147', '316');
INSERT INTO `player_classlevelstats` VALUES ('3', '16', '157', '350');
INSERT INTO `player_classlevelstats` VALUES ('3', '17', '168', '370');
INSERT INTO `player_classlevelstats` VALUES ('3', '18', '180', '391');
INSERT INTO `player_classlevelstats` VALUES ('3', '19', '193', '428');
INSERT INTO `player_classlevelstats` VALUES ('3', '20', '207', '451');
INSERT INTO `player_classlevelstats` VALUES ('3', '21', '222', '475');
INSERT INTO `player_classlevelstats` VALUES ('3', '22', '238', '515');
INSERT INTO `player_classlevelstats` VALUES ('3', '23', '255', '541');
INSERT INTO `player_classlevelstats` VALUES ('3', '24', '273', '568');
INSERT INTO `player_classlevelstats` VALUES ('3', '25', '292', '611');
INSERT INTO `player_classlevelstats` VALUES ('3', '26', '312', '640');
INSERT INTO `player_classlevelstats` VALUES ('3', '27', '333', '670');
INSERT INTO `player_classlevelstats` VALUES ('3', '28', '355', '715');
INSERT INTO `player_classlevelstats` VALUES ('3', '29', '378', '745');
INSERT INTO `player_classlevelstats` VALUES ('3', '30', '402', '775');
INSERT INTO `player_classlevelstats` VALUES ('3', '31', '417', '805');
INSERT INTO `player_classlevelstats` VALUES ('3', '32', '443', '850');
INSERT INTO `player_classlevelstats` VALUES ('3', '33', '470', '880');
INSERT INTO `player_classlevelstats` VALUES ('3', '34', '498', '910');
INSERT INTO `player_classlevelstats` VALUES ('3', '35', '527', '940');
INSERT INTO `player_classlevelstats` VALUES ('3', '36', '547', '970');
INSERT INTO `player_classlevelstats` VALUES ('3', '37', '578', '1015');
INSERT INTO `player_classlevelstats` VALUES ('3', '38', '610', '1045');
INSERT INTO `player_classlevelstats` VALUES ('3', '39', '643', '1075');
INSERT INTO `player_classlevelstats` VALUES ('3', '40', '667', '1105');
INSERT INTO `player_classlevelstats` VALUES ('3', '41', '702', '1135');
INSERT INTO `player_classlevelstats` VALUES ('3', '42', '738', '1180');
INSERT INTO `player_classlevelstats` VALUES ('3', '43', '775', '1210');
INSERT INTO `player_classlevelstats` VALUES ('3', '44', '803', '1240');
INSERT INTO `player_classlevelstats` VALUES ('3', '45', '842', '1270');
INSERT INTO `player_classlevelstats` VALUES ('3', '46', '872', '1300');
INSERT INTO `player_classlevelstats` VALUES ('3', '47', '913', '1330');
INSERT INTO `player_classlevelstats` VALUES ('3', '48', '955', '1360');
INSERT INTO `player_classlevelstats` VALUES ('3', '49', '994', '1390');
INSERT INTO `player_classlevelstats` VALUES ('3', '50', '1047', '1420');
INSERT INTO `player_classlevelstats` VALUES ('3', '51', '1067', '1450');
INSERT INTO `player_classlevelstats` VALUES ('3', '52', '1113', '1480');
INSERT INTO `player_classlevelstats` VALUES ('3', '53', '1150', '1510');
INSERT INTO `player_classlevelstats` VALUES ('3', '54', '1198', '1540');
INSERT INTO `player_classlevelstats` VALUES ('3', '55', '1237', '1570');
INSERT INTO `player_classlevelstats` VALUES ('3', '56', '1287', '1600');
INSERT INTO `player_classlevelstats` VALUES ('3', '57', '1328', '1630');
INSERT INTO `player_classlevelstats` VALUES ('3', '58', '1370', '1660');
INSERT INTO `player_classlevelstats` VALUES ('3', '59', '1423', '1690');
INSERT INTO `player_classlevelstats` VALUES ('3', '60', '1467', '1720');
INSERT INTO `player_classlevelstats` VALUES ('3', '61', '1633', '1886');
INSERT INTO `player_classlevelstats` VALUES ('3', '62', '1819', '2053');
INSERT INTO `player_classlevelstats` VALUES ('3', '63', '2003', '2219');
INSERT INTO `player_classlevelstats` VALUES ('3', '64', '2195', '2385');
INSERT INTO `player_classlevelstats` VALUES ('3', '65', '2397', '2552');
INSERT INTO `player_classlevelstats` VALUES ('3', '66', '2623', '2718');
INSERT INTO `player_classlevelstats` VALUES ('3', '67', '2844', '2884');
INSERT INTO `player_classlevelstats` VALUES ('3', '68', '3075', '3050');
INSERT INTO `player_classlevelstats` VALUES ('3', '69', '3316', '3217');
INSERT INTO `player_classlevelstats` VALUES ('3', '70', '3568', '3383');
INSERT INTO `player_classlevelstats` VALUES ('4', '1', '25', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '2', '32', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '3', '49', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '4', '56', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '5', '63', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '6', '70', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '7', '87', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '8', '94', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '9', '101', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '10', '118', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '11', '125', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '12', '142', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '13', '149', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '14', '156', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '15', '173', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '16', '181', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '17', '190', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '18', '200', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '19', '221', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '20', '233', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '21', '246', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '22', '260', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '23', '275', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '24', '301', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '25', '318', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '26', '336', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '27', '355', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '28', '375', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '29', '396', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '30', '428', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '31', '451', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '32', '475', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '33', '500', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '34', '526', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '35', '553', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '36', '581', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '37', '610', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '38', '640', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '39', '671', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '40', '703', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '41', '736', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '42', '770', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '43', '805', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '44', '841', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '45', '878', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '46', '916', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '47', '955', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '48', '995', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '49', '1026', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '50', '1068', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '51', '1111', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '52', '1155', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '53', '1200', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '54', '1246', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '55', '1283', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '56', '1331', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '57', '1380', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '58', '1430', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '59', '1471', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '60', '1523', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '61', '1702', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '62', '1879', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '63', '2077', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '64', '2285', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '65', '2489', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '66', '2717', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '67', '2941', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '68', '3190', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '69', '3450', '0');
INSERT INTO `player_classlevelstats` VALUES ('4', '70', '3704', '0');
INSERT INTO `player_classlevelstats` VALUES ('5', '1', '52', '73');
INSERT INTO `player_classlevelstats` VALUES ('5', '2', '57', '76');
INSERT INTO `player_classlevelstats` VALUES ('5', '3', '72', '95');
INSERT INTO `player_classlevelstats` VALUES ('5', '4', '77', '114');
INSERT INTO `player_classlevelstats` VALUES ('5', '5', '92', '133');
INSERT INTO `player_classlevelstats` VALUES ('5', '6', '97', '152');
INSERT INTO `player_classlevelstats` VALUES ('5', '7', '112', '171');
INSERT INTO `player_classlevelstats` VALUES ('5', '8', '117', '190');
INSERT INTO `player_classlevelstats` VALUES ('5', '9', '132', '209');
INSERT INTO `player_classlevelstats` VALUES ('5', '10', '137', '212');
INSERT INTO `player_classlevelstats` VALUES ('5', '11', '142', '215');
INSERT INTO `player_classlevelstats` VALUES ('5', '12', '157', '234');
INSERT INTO `player_classlevelstats` VALUES ('5', '13', '172', '254');
INSERT INTO `player_classlevelstats` VALUES ('5', '14', '177', '260');
INSERT INTO `player_classlevelstats` VALUES ('5', '15', '192', '282');
INSERT INTO `player_classlevelstats` VALUES ('5', '16', '197', '305');
INSERT INTO `player_classlevelstats` VALUES ('5', '17', '212', '329');
INSERT INTO `player_classlevelstats` VALUES ('5', '18', '227', '339');
INSERT INTO `player_classlevelstats` VALUES ('5', '19', '232', '365');
INSERT INTO `player_classlevelstats` VALUES ('5', '20', '247', '377');
INSERT INTO `player_classlevelstats` VALUES ('5', '21', '252', '405');
INSERT INTO `player_classlevelstats` VALUES ('5', '22', '268', '434');
INSERT INTO `player_classlevelstats` VALUES ('5', '23', '275', '449');
INSERT INTO `player_classlevelstats` VALUES ('5', '24', '293', '480');
INSERT INTO `player_classlevelstats` VALUES ('5', '25', '302', '497');
INSERT INTO `player_classlevelstats` VALUES ('5', '26', '322', '530');
INSERT INTO `player_classlevelstats` VALUES ('5', '27', '343', '549');
INSERT INTO `player_classlevelstats` VALUES ('5', '28', '355', '584');
INSERT INTO `player_classlevelstats` VALUES ('5', '29', '378', '605');
INSERT INTO `player_classlevelstats` VALUES ('5', '30', '392', '627');
INSERT INTO `player_classlevelstats` VALUES ('5', '31', '417', '665');
INSERT INTO `player_classlevelstats` VALUES ('5', '32', '433', '689');
INSERT INTO `player_classlevelstats` VALUES ('5', '33', '460', '728');
INSERT INTO `player_classlevelstats` VALUES ('5', '34', '478', '752');
INSERT INTO `player_classlevelstats` VALUES ('5', '35', '507', '776');
INSERT INTO `player_classlevelstats` VALUES ('5', '36', '527', '800');
INSERT INTO `player_classlevelstats` VALUES ('5', '37', '548', '839');
INSERT INTO `player_classlevelstats` VALUES ('5', '38', '580', '863');
INSERT INTO `player_classlevelstats` VALUES ('5', '39', '603', '887');
INSERT INTO `player_classlevelstats` VALUES ('5', '40', '637', '911');
INSERT INTO `player_classlevelstats` VALUES ('5', '41', '662', '950');
INSERT INTO `player_classlevelstats` VALUES ('5', '42', '698', '974');
INSERT INTO `player_classlevelstats` VALUES ('5', '43', '725', '998');
INSERT INTO `player_classlevelstats` VALUES ('5', '44', '763', '1022');
INSERT INTO `player_classlevelstats` VALUES ('5', '45', '792', '1046');
INSERT INTO `player_classlevelstats` VALUES ('5', '46', '822', '1070');
INSERT INTO `player_classlevelstats` VALUES ('5', '47', '863', '1094');
INSERT INTO `player_classlevelstats` VALUES ('5', '48', '895', '1118');
INSERT INTO `player_classlevelstats` VALUES ('5', '49', '928', '1142');
INSERT INTO `player_classlevelstats` VALUES ('5', '50', '972', '1166');
INSERT INTO `player_classlevelstats` VALUES ('5', '51', '1007', '1190');
INSERT INTO `player_classlevelstats` VALUES ('5', '52', '1053', '1214');
INSERT INTO `player_classlevelstats` VALUES ('5', '53', '1090', '1238');
INSERT INTO `player_classlevelstats` VALUES ('5', '54', '1128', '1262');
INSERT INTO `player_classlevelstats` VALUES ('5', '55', '1177', '1271');
INSERT INTO `player_classlevelstats` VALUES ('5', '56', '1217', '1295');
INSERT INTO `player_classlevelstats` VALUES ('5', '57', '1258', '1319');
INSERT INTO `player_classlevelstats` VALUES ('5', '58', '1300', '1343');
INSERT INTO `player_classlevelstats` VALUES ('5', '59', '1353', '1352');
INSERT INTO `player_classlevelstats` VALUES ('5', '60', '1397', '1376');
INSERT INTO `player_classlevelstats` VALUES ('5', '61', '1557', '1500');
INSERT INTO `player_classlevelstats` VALUES ('5', '62', '1738', '1625');
INSERT INTO `player_classlevelstats` VALUES ('5', '63', '1916', '1749');
INSERT INTO `player_classlevelstats` VALUES ('5', '64', '2101', '1873');
INSERT INTO `player_classlevelstats` VALUES ('5', '65', '2295', '1998');
INSERT INTO `player_classlevelstats` VALUES ('5', '66', '2495', '2122');
INSERT INTO `player_classlevelstats` VALUES ('5', '67', '2719', '2247');
INSERT INTO `player_classlevelstats` VALUES ('5', '68', '2936', '2371');
INSERT INTO `player_classlevelstats` VALUES ('5', '69', '3160', '2495');
INSERT INTO `player_classlevelstats` VALUES ('5', '70', '3391', '2620');
INSERT INTO `player_classlevelstats` VALUES ('7', '1', '37', '85');
INSERT INTO `player_classlevelstats` VALUES ('7', '2', '44', '91');
INSERT INTO `player_classlevelstats` VALUES ('7', '3', '51', '98');
INSERT INTO `player_classlevelstats` VALUES ('7', '4', '58', '106');
INSERT INTO `player_classlevelstats` VALUES ('7', '5', '65', '115');
INSERT INTO `player_classlevelstats` VALUES ('7', '6', '72', '125');
INSERT INTO `player_classlevelstats` VALUES ('7', '7', '79', '136');
INSERT INTO `player_classlevelstats` VALUES ('7', '8', '86', '148');
INSERT INTO `player_classlevelstats` VALUES ('7', '9', '93', '161');
INSERT INTO `player_classlevelstats` VALUES ('7', '10', '100', '175');
INSERT INTO `player_classlevelstats` VALUES ('7', '11', '107', '190');
INSERT INTO `player_classlevelstats` VALUES ('7', '12', '114', '206');
INSERT INTO `player_classlevelstats` VALUES ('7', '13', '121', '223');
INSERT INTO `player_classlevelstats` VALUES ('7', '14', '128', '241');
INSERT INTO `player_classlevelstats` VALUES ('7', '15', '135', '260');
INSERT INTO `player_classlevelstats` VALUES ('7', '16', '142', '280');
INSERT INTO `player_classlevelstats` VALUES ('7', '17', '150', '301');
INSERT INTO `player_classlevelstats` VALUES ('7', '18', '159', '323');
INSERT INTO `player_classlevelstats` VALUES ('7', '19', '169', '346');
INSERT INTO `player_classlevelstats` VALUES ('7', '20', '180', '370');
INSERT INTO `player_classlevelstats` VALUES ('7', '21', '192', '395');
INSERT INTO `player_classlevelstats` VALUES ('7', '22', '205', '421');
INSERT INTO `player_classlevelstats` VALUES ('7', '23', '219', '448');
INSERT INTO `player_classlevelstats` VALUES ('7', '24', '234', '476');
INSERT INTO `player_classlevelstats` VALUES ('7', '25', '240', '505');
INSERT INTO `player_classlevelstats` VALUES ('7', '26', '257', '535');
INSERT INTO `player_classlevelstats` VALUES ('7', '27', '275', '566');
INSERT INTO `player_classlevelstats` VALUES ('7', '28', '294', '598');
INSERT INTO `player_classlevelstats` VALUES ('7', '29', '314', '631');
INSERT INTO `player_classlevelstats` VALUES ('7', '30', '335', '665');
INSERT INTO `player_classlevelstats` VALUES ('7', '31', '347', '699');
INSERT INTO `player_classlevelstats` VALUES ('7', '32', '370', '733');
INSERT INTO `player_classlevelstats` VALUES ('7', '33', '394', '767');
INSERT INTO `player_classlevelstats` VALUES ('7', '34', '419', '786');
INSERT INTO `player_classlevelstats` VALUES ('7', '35', '435', '820');
INSERT INTO `player_classlevelstats` VALUES ('7', '36', '462', '854');
INSERT INTO `player_classlevelstats` VALUES ('7', '37', '490', '888');
INSERT INTO `player_classlevelstats` VALUES ('7', '38', '509', '922');
INSERT INTO `player_classlevelstats` VALUES ('7', '39', '539', '941');
INSERT INTO `player_classlevelstats` VALUES ('7', '40', '570', '975');
INSERT INTO `player_classlevelstats` VALUES ('7', '41', '592', '1009');
INSERT INTO `player_classlevelstats` VALUES ('7', '42', '625', '1028');
INSERT INTO `player_classlevelstats` VALUES ('7', '43', '649', '1062');
INSERT INTO `player_classlevelstats` VALUES ('7', '44', '684', '1096');
INSERT INTO `player_classlevelstats` VALUES ('7', '45', '710', '1115');
INSERT INTO `player_classlevelstats` VALUES ('7', '46', '747', '1149');
INSERT INTO `player_classlevelstats` VALUES ('7', '47', '775', '1183');
INSERT INTO `player_classlevelstats` VALUES ('7', '48', '814', '1202');
INSERT INTO `player_classlevelstats` VALUES ('7', '49', '844', '1236');
INSERT INTO `player_classlevelstats` VALUES ('7', '50', '885', '1255');
INSERT INTO `player_classlevelstats` VALUES ('7', '51', '917', '1289');
INSERT INTO `player_classlevelstats` VALUES ('7', '52', '960', '1323');
INSERT INTO `player_classlevelstats` VALUES ('7', '53', '994', '1342');
INSERT INTO `player_classlevelstats` VALUES ('7', '54', '1029', '1376');
INSERT INTO `player_classlevelstats` VALUES ('7', '55', '1075', '1395');
INSERT INTO `player_classlevelstats` VALUES ('7', '56', '1112', '1414');
INSERT INTO `player_classlevelstats` VALUES ('7', '57', '1150', '1448');
INSERT INTO `player_classlevelstats` VALUES ('7', '58', '1199', '1467');
INSERT INTO `player_classlevelstats` VALUES ('7', '59', '1239', '1501');
INSERT INTO `player_classlevelstats` VALUES ('7', '60', '1330', '1520');
INSERT INTO `player_classlevelstats` VALUES ('7', '61', '1428', '1664');
INSERT INTO `player_classlevelstats` VALUES ('7', '62', '1583', '1808');
INSERT INTO `player_classlevelstats` VALUES ('7', '63', '1760', '1951');
INSERT INTO `player_classlevelstats` VALUES ('7', '64', '1932', '2095');
INSERT INTO `player_classlevelstats` VALUES ('7', '65', '2114', '2239');
INSERT INTO `player_classlevelstats` VALUES ('7', '66', '2304', '2383');
INSERT INTO `player_classlevelstats` VALUES ('7', '67', '2504', '2527');
INSERT INTO `player_classlevelstats` VALUES ('7', '68', '2713', '2670');
INSERT INTO `player_classlevelstats` VALUES ('7', '69', '2931', '2814');
INSERT INTO `player_classlevelstats` VALUES ('7', '70', '3159', '2958');
INSERT INTO `player_classlevelstats` VALUES ('8', '1', '32', '100');
INSERT INTO `player_classlevelstats` VALUES ('8', '2', '47', '110');
INSERT INTO `player_classlevelstats` VALUES ('8', '3', '52', '106');
INSERT INTO `player_classlevelstats` VALUES ('8', '4', '67', '118');
INSERT INTO `player_classlevelstats` VALUES ('8', '5', '82', '131');
INSERT INTO `player_classlevelstats` VALUES ('8', '6', '97', '130');
INSERT INTO `player_classlevelstats` VALUES ('8', '7', '102', '145');
INSERT INTO `player_classlevelstats` VALUES ('8', '8', '117', '146');
INSERT INTO `player_classlevelstats` VALUES ('8', '9', '132', '163');
INSERT INTO `player_classlevelstats` VALUES ('8', '10', '137', '196');
INSERT INTO `player_classlevelstats` VALUES ('8', '11', '152', '215');
INSERT INTO `player_classlevelstats` VALUES ('8', '12', '167', '220');
INSERT INTO `player_classlevelstats` VALUES ('8', '13', '172', '241');
INSERT INTO `player_classlevelstats` VALUES ('8', '14', '187', '263');
INSERT INTO `player_classlevelstats` VALUES ('8', '15', '202', '271');
INSERT INTO `player_classlevelstats` VALUES ('8', '16', '207', '295');
INSERT INTO `player_classlevelstats` VALUES ('8', '17', '222', '305');
INSERT INTO `player_classlevelstats` VALUES ('8', '18', '237', '331');
INSERT INTO `player_classlevelstats` VALUES ('8', '19', '242', '343');
INSERT INTO `player_classlevelstats` VALUES ('8', '20', '257', '371');
INSERT INTO `player_classlevelstats` VALUES ('8', '21', '272', '385');
INSERT INTO `player_classlevelstats` VALUES ('8', '22', '277', '415');
INSERT INTO `player_classlevelstats` VALUES ('8', '23', '292', '431');
INSERT INTO `player_classlevelstats` VALUES ('8', '24', '298', '463');
INSERT INTO `player_classlevelstats` VALUES ('8', '25', '315', '481');
INSERT INTO `player_classlevelstats` VALUES ('8', '26', '333', '515');
INSERT INTO `player_classlevelstats` VALUES ('8', '27', '342', '535');
INSERT INTO `player_classlevelstats` VALUES ('8', '28', '362', '556');
INSERT INTO `player_classlevelstats` VALUES ('8', '29', '373', '592');
INSERT INTO `player_classlevelstats` VALUES ('8', '30', '395', '613');
INSERT INTO `player_classlevelstats` VALUES ('8', '31', '418', '634');
INSERT INTO `player_classlevelstats` VALUES ('8', '32', '432', '670');
INSERT INTO `player_classlevelstats` VALUES ('8', '33', '457', '691');
INSERT INTO `player_classlevelstats` VALUES ('8', '34', '473', '712');
INSERT INTO `player_classlevelstats` VALUES ('8', '35', '500', '733');
INSERT INTO `player_classlevelstats` VALUES ('8', '36', '518', '754');
INSERT INTO `player_classlevelstats` VALUES ('8', '37', '547', '790');
INSERT INTO `player_classlevelstats` VALUES ('8', '38', '577', '811');
INSERT INTO `player_classlevelstats` VALUES ('8', '39', '598', '832');
INSERT INTO `player_classlevelstats` VALUES ('8', '40', '630', '853');
INSERT INTO `player_classlevelstats` VALUES ('8', '41', '653', '874');
INSERT INTO `player_classlevelstats` VALUES ('8', '42', '687', '895');
INSERT INTO `player_classlevelstats` VALUES ('8', '43', '712', '916');
INSERT INTO `player_classlevelstats` VALUES ('8', '44', '748', '937');
INSERT INTO `player_classlevelstats` VALUES ('8', '45', '775', '958');
INSERT INTO `player_classlevelstats` VALUES ('8', '46', '813', '979');
INSERT INTO `player_classlevelstats` VALUES ('8', '47', '842', '1000');
INSERT INTO `player_classlevelstats` VALUES ('8', '48', '882', '1021');
INSERT INTO `player_classlevelstats` VALUES ('8', '49', '913', '1042');
INSERT INTO `player_classlevelstats` VALUES ('8', '50', '955', '1048');
INSERT INTO `player_classlevelstats` VALUES ('8', '51', '988', '1069');
INSERT INTO `player_classlevelstats` VALUES ('8', '52', '1032', '1090');
INSERT INTO `player_classlevelstats` VALUES ('8', '53', '1067', '1111');
INSERT INTO `player_classlevelstats` VALUES ('8', '54', '1103', '1117');
INSERT INTO `player_classlevelstats` VALUES ('8', '55', '1150', '1138');
INSERT INTO `player_classlevelstats` VALUES ('8', '56', '1188', '1159');
INSERT INTO `player_classlevelstats` VALUES ('8', '57', '1237', '1165');
INSERT INTO `player_classlevelstats` VALUES ('8', '58', '1277', '1186');
INSERT INTO `player_classlevelstats` VALUES ('8', '59', '1328', '1192');
INSERT INTO `player_classlevelstats` VALUES ('8', '60', '1370', '1213');
INSERT INTO `player_classlevelstats` VALUES ('8', '61', '1526', '1316');
INSERT INTO `player_classlevelstats` VALUES ('8', '62', '1702', '1419');
INSERT INTO `player_classlevelstats` VALUES ('8', '63', '1875', '1521');
INSERT INTO `player_classlevelstats` VALUES ('8', '64', '2070', '1624');
INSERT INTO `player_classlevelstats` VALUES ('8', '65', '2261', '1727');
INSERT INTO `player_classlevelstats` VALUES ('8', '66', '2461', '1830');
INSERT INTO `player_classlevelstats` VALUES ('8', '67', '2686', '1932');
INSERT INTO `player_classlevelstats` VALUES ('8', '68', '2906', '2035');
INSERT INTO `player_classlevelstats` VALUES ('8', '69', '3136', '2138');
INSERT INTO `player_classlevelstats` VALUES ('8', '70', '3393', '2241');
INSERT INTO `player_classlevelstats` VALUES ('9', '1', '23', '90');
INSERT INTO `player_classlevelstats` VALUES ('9', '2', '28', '98');
INSERT INTO `player_classlevelstats` VALUES ('9', '3', '43', '107');
INSERT INTO `player_classlevelstats` VALUES ('9', '4', '48', '102');
INSERT INTO `player_classlevelstats` VALUES ('9', '5', '63', '113');
INSERT INTO `player_classlevelstats` VALUES ('9', '6', '68', '126');
INSERT INTO `player_classlevelstats` VALUES ('9', '7', '83', '144');
INSERT INTO `player_classlevelstats` VALUES ('9', '8', '88', '162');
INSERT INTO `player_classlevelstats` VALUES ('9', '9', '93', '180');
INSERT INTO `player_classlevelstats` VALUES ('9', '10', '108', '198');
INSERT INTO `player_classlevelstats` VALUES ('9', '11', '123', '200');
INSERT INTO `player_classlevelstats` VALUES ('9', '12', '128', '218');
INSERT INTO `player_classlevelstats` VALUES ('9', '13', '143', '237');
INSERT INTO `player_classlevelstats` VALUES ('9', '14', '148', '257');
INSERT INTO `player_classlevelstats` VALUES ('9', '15', '153', '278');
INSERT INTO `player_classlevelstats` VALUES ('9', '16', '168', '300');
INSERT INTO `player_classlevelstats` VALUES ('9', '17', '173', '308');
INSERT INTO `player_classlevelstats` VALUES ('9', '18', '189', '332');
INSERT INTO `player_classlevelstats` VALUES ('9', '19', '196', '357');
INSERT INTO `player_classlevelstats` VALUES ('9', '20', '204', '383');
INSERT INTO `player_classlevelstats` VALUES ('9', '21', '223', '395');
INSERT INTO `player_classlevelstats` VALUES ('9', '22', '233', '423');
INSERT INTO `player_classlevelstats` VALUES ('9', '23', '244', '452');
INSERT INTO `player_classlevelstats` VALUES ('9', '24', '266', '467');
INSERT INTO `player_classlevelstats` VALUES ('9', '25', '279', '498');
INSERT INTO `player_classlevelstats` VALUES ('9', '26', '293', '530');
INSERT INTO `player_classlevelstats` VALUES ('9', '27', '318', '548');
INSERT INTO `player_classlevelstats` VALUES ('9', '28', '334', '582');
INSERT INTO `player_classlevelstats` VALUES ('9', '29', '351', '602');
INSERT INTO `player_classlevelstats` VALUES ('9', '30', '379', '638');
INSERT INTO `player_classlevelstats` VALUES ('9', '31', '398', '674');
INSERT INTO `player_classlevelstats` VALUES ('9', '32', '418', '695');
INSERT INTO `player_classlevelstats` VALUES ('9', '33', '439', '731');
INSERT INTO `player_classlevelstats` VALUES ('9', '34', '471', '752');
INSERT INTO `player_classlevelstats` VALUES ('9', '35', '494', '788');
INSERT INTO `player_classlevelstats` VALUES ('9', '36', '518', '809');
INSERT INTO `player_classlevelstats` VALUES ('9', '37', '543', '830');
INSERT INTO `player_classlevelstats` VALUES ('9', '38', '569', '866');
INSERT INTO `player_classlevelstats` VALUES ('9', '39', '606', '887');
INSERT INTO `player_classlevelstats` VALUES ('9', '40', '634', '923');
INSERT INTO `player_classlevelstats` VALUES ('9', '41', '663', '944');
INSERT INTO `player_classlevelstats` VALUES ('9', '42', '693', '965');
INSERT INTO `player_classlevelstats` VALUES ('9', '43', '724', '1001');
INSERT INTO `player_classlevelstats` VALUES ('9', '44', '756', '1022');
INSERT INTO `player_classlevelstats` VALUES ('9', '45', '799', '1043');
INSERT INTO `player_classlevelstats` VALUES ('9', '46', '832', '1064');
INSERT INTO `player_classlevelstats` VALUES ('9', '47', '868', '1100');
INSERT INTO `player_classlevelstats` VALUES ('9', '48', '904', '1121');
INSERT INTO `player_classlevelstats` VALUES ('9', '49', '941', '1142');
INSERT INTO `player_classlevelstats` VALUES ('9', '50', '979', '1163');
INSERT INTO `player_classlevelstats` VALUES ('9', '51', '1018', '1184');
INSERT INTO `player_classlevelstats` VALUES ('9', '52', '1058', '1205');
INSERT INTO `player_classlevelstats` VALUES ('9', '53', '1099', '1226');
INSERT INTO `player_classlevelstats` VALUES ('9', '54', '1141', '1247');
INSERT INTO `player_classlevelstats` VALUES ('9', '55', '1184', '1268');
INSERT INTO `player_classlevelstats` VALUES ('9', '56', '1228', '1289');
INSERT INTO `player_classlevelstats` VALUES ('9', '57', '1273', '1310');
INSERT INTO `player_classlevelstats` VALUES ('9', '58', '1319', '1331');
INSERT INTO `player_classlevelstats` VALUES ('9', '59', '1366', '1352');
INSERT INTO `player_classlevelstats` VALUES ('9', '60', '1414', '1373');
INSERT INTO `player_classlevelstats` VALUES ('9', '61', '1580', '1497');
INSERT INTO `player_classlevelstats` VALUES ('9', '62', '1755', '1621');
INSERT INTO `player_classlevelstats` VALUES ('9', '63', '1939', '1745');
INSERT INTO `player_classlevelstats` VALUES ('9', '64', '2133', '1870');
INSERT INTO `player_classlevelstats` VALUES ('9', '65', '2323', '1994');
INSERT INTO `player_classlevelstats` VALUES ('9', '66', '2535', '2118');
INSERT INTO `player_classlevelstats` VALUES ('9', '67', '2758', '2242');
INSERT INTO `player_classlevelstats` VALUES ('9', '68', '2991', '2366');
INSERT INTO `player_classlevelstats` VALUES ('9', '69', '3235', '2490');
INSERT INTO `player_classlevelstats` VALUES ('9', '70', '3490', '2615');
INSERT INTO `player_classlevelstats` VALUES ('11', '1', '44', '60');
INSERT INTO `player_classlevelstats` VALUES ('11', '2', '51', '66');
INSERT INTO `player_classlevelstats` VALUES ('11', '3', '58', '73');
INSERT INTO `player_classlevelstats` VALUES ('11', '4', '75', '81');
INSERT INTO `player_classlevelstats` VALUES ('11', '5', '82', '90');
INSERT INTO `player_classlevelstats` VALUES ('11', '6', '89', '100');
INSERT INTO `player_classlevelstats` VALUES ('11', '7', '106', '111');
INSERT INTO `player_classlevelstats` VALUES ('11', '8', '113', '123');
INSERT INTO `player_classlevelstats` VALUES ('11', '9', '120', '136');
INSERT INTO `player_classlevelstats` VALUES ('11', '10', '137', '150');
INSERT INTO `player_classlevelstats` VALUES ('11', '11', '144', '165');
INSERT INTO `player_classlevelstats` VALUES ('11', '12', '151', '182');
INSERT INTO `player_classlevelstats` VALUES ('11', '13', '168', '200');
INSERT INTO `player_classlevelstats` VALUES ('11', '14', '175', '219');
INSERT INTO `player_classlevelstats` VALUES ('11', '15', '182', '239');
INSERT INTO `player_classlevelstats` VALUES ('11', '16', '199', '260');
INSERT INTO `player_classlevelstats` VALUES ('11', '17', '206', '282');
INSERT INTO `player_classlevelstats` VALUES ('11', '18', '214', '305');
INSERT INTO `player_classlevelstats` VALUES ('11', '19', '233', '329');
INSERT INTO `player_classlevelstats` VALUES ('11', '20', '243', '354');
INSERT INTO `player_classlevelstats` VALUES ('11', '21', '254', '380');
INSERT INTO `player_classlevelstats` VALUES ('11', '22', '266', '392');
INSERT INTO `player_classlevelstats` VALUES ('11', '23', '289', '420');
INSERT INTO `player_classlevelstats` VALUES ('11', '24', '303', '449');
INSERT INTO `player_classlevelstats` VALUES ('11', '25', '318', '479');
INSERT INTO `player_classlevelstats` VALUES ('11', '26', '334', '509');
INSERT INTO `player_classlevelstats` VALUES ('11', '27', '361', '524');
INSERT INTO `player_classlevelstats` VALUES ('11', '28', '379', '554');
INSERT INTO `player_classlevelstats` VALUES ('11', '29', '398', '584');
INSERT INTO `player_classlevelstats` VALUES ('11', '30', '418', '614');
INSERT INTO `player_classlevelstats` VALUES ('11', '31', '439', '629');
INSERT INTO `player_classlevelstats` VALUES ('11', '32', '461', '659');
INSERT INTO `player_classlevelstats` VALUES ('11', '33', '494', '689');
INSERT INTO `player_classlevelstats` VALUES ('11', '34', '518', '704');
INSERT INTO `player_classlevelstats` VALUES ('11', '35', '543', '734');
INSERT INTO `player_classlevelstats` VALUES ('11', '36', '569', '749');
INSERT INTO `player_classlevelstats` VALUES ('11', '37', '596', '779');
INSERT INTO `player_classlevelstats` VALUES ('11', '38', '624', '809');
INSERT INTO `player_classlevelstats` VALUES ('11', '39', '653', '824');
INSERT INTO `player_classlevelstats` VALUES ('11', '40', '683', '854');
INSERT INTO `player_classlevelstats` VALUES ('11', '41', '714', '869');
INSERT INTO `player_classlevelstats` VALUES ('11', '42', '746', '899');
INSERT INTO `player_classlevelstats` VALUES ('11', '43', '779', '914');
INSERT INTO `player_classlevelstats` VALUES ('11', '44', '823', '944');
INSERT INTO `player_classlevelstats` VALUES ('11', '45', '858', '959');
INSERT INTO `player_classlevelstats` VALUES ('11', '46', '894', '989');
INSERT INTO `player_classlevelstats` VALUES ('11', '47', '921', '1004');
INSERT INTO `player_classlevelstats` VALUES ('11', '48', '959', '1019');
INSERT INTO `player_classlevelstats` VALUES ('11', '49', '998', '1049');
INSERT INTO `player_classlevelstats` VALUES ('11', '50', '1038', '1064');
INSERT INTO `player_classlevelstats` VALUES ('11', '51', '1079', '1079');
INSERT INTO `player_classlevelstats` VALUES ('11', '52', '1121', '1109');
INSERT INTO `player_classlevelstats` VALUES ('11', '53', '1164', '1124');
INSERT INTO `player_classlevelstats` VALUES ('11', '54', '1208', '1139');
INSERT INTO `player_classlevelstats` VALUES ('11', '55', '1253', '1154');
INSERT INTO `player_classlevelstats` VALUES ('11', '56', '1299', '1169');
INSERT INTO `player_classlevelstats` VALUES ('11', '57', '1346', '1199');
INSERT INTO `player_classlevelstats` VALUES ('11', '58', '1384', '1214');
INSERT INTO `player_classlevelstats` VALUES ('11', '59', '1433', '1229');
INSERT INTO `player_classlevelstats` VALUES ('11', '60', '1483', '1244');
INSERT INTO `player_classlevelstats` VALUES ('11', '61', '1657', '1357');
INSERT INTO `player_classlevelstats` VALUES ('11', '62', '1840', '1469');
INSERT INTO `player_classlevelstats` VALUES ('11', '63', '2020', '1582');
INSERT INTO `player_classlevelstats` VALUES ('11', '64', '2222', '1694');
INSERT INTO `player_classlevelstats` VALUES ('11', '65', '2433', '1807');
INSERT INTO `player_classlevelstats` VALUES ('11', '66', '2640', '1919');
INSERT INTO `player_classlevelstats` VALUES ('11', '67', '2872', '2032');
INSERT INTO `player_classlevelstats` VALUES ('11', '68', '3114', '2145');
INSERT INTO `player_classlevelstats` VALUES ('11', '69', '3351', '2257');
INSERT INTO `player_classlevelstats` VALUES ('11', '70', '3614', '2370');
INSERT INTO `player_levelstats` VALUES ('1', '1', '1', '23', '20', '22', '20', '20');
INSERT INTO `player_levelstats` VALUES ('1', '1', '2', '24', '21', '23', '20', '20');
INSERT INTO `player_levelstats` VALUES ('1', '1', '3', '26', '22', '24', '20', '21');
INSERT INTO `player_levelstats` VALUES ('1', '1', '4', '27', '22', '26', '20', '21');
INSERT INTO `player_levelstats` VALUES ('1', '1', '5', '28', '23', '27', '20', '21');
INSERT INTO `player_levelstats` VALUES ('1', '1', '6', '30', '24', '28', '20', '21');
INSERT INTO `player_levelstats` VALUES ('1', '1', '7', '31', '25', '29', '21', '22');
INSERT INTO `player_levelstats` VALUES ('1', '1', '8', '32', '26', '30', '21', '22');
INSERT INTO `player_levelstats` VALUES ('1', '1', '9', '34', '26', '32', '21', '22');
INSERT INTO `player_levelstats` VALUES ('1', '1', '10', '35', '27', '33', '21', '23');
INSERT INTO `player_levelstats` VALUES ('1', '1', '11', '36', '28', '34', '21', '23');
INSERT INTO `player_levelstats` VALUES ('1', '1', '12', '38', '29', '35', '21', '23');
INSERT INTO `player_levelstats` VALUES ('1', '1', '13', '39', '30', '37', '21', '24');
INSERT INTO `player_levelstats` VALUES ('1', '1', '14', '41', '31', '38', '21', '24');
INSERT INTO `player_levelstats` VALUES ('1', '1', '15', '42', '32', '39', '21', '24');
INSERT INTO `player_levelstats` VALUES ('1', '1', '16', '44', '33', '41', '21', '25');
INSERT INTO `player_levelstats` VALUES ('1', '1', '17', '45', '34', '42', '22', '25');
INSERT INTO `player_levelstats` VALUES ('1', '1', '18', '47', '34', '43', '22', '25');
INSERT INTO `player_levelstats` VALUES ('1', '1', '19', '48', '35', '45', '22', '26');
INSERT INTO `player_levelstats` VALUES ('1', '1', '20', '50', '36', '46', '22', '26');
INSERT INTO `player_levelstats` VALUES ('1', '1', '21', '51', '37', '48', '22', '26');
INSERT INTO `player_levelstats` VALUES ('1', '1', '22', '53', '38', '49', '22', '27');
INSERT INTO `player_levelstats` VALUES ('1', '1', '23', '54', '39', '51', '22', '27');
INSERT INTO `player_levelstats` VALUES ('1', '1', '24', '56', '40', '52', '23', '28');
INSERT INTO `player_levelstats` VALUES ('1', '1', '25', '58', '41', '53', '23', '28');
INSERT INTO `player_levelstats` VALUES ('1', '1', '26', '59', '42', '55', '23', '28');
INSERT INTO `player_levelstats` VALUES ('1', '1', '27', '61', '43', '56', '23', '29');
INSERT INTO `player_levelstats` VALUES ('1', '1', '28', '63', '44', '58', '23', '29');
INSERT INTO `player_levelstats` VALUES ('1', '1', '29', '64', '45', '59', '23', '30');
INSERT INTO `player_levelstats` VALUES ('1', '1', '30', '66', '46', '61', '24', '30');
INSERT INTO `player_levelstats` VALUES ('1', '1', '31', '68', '47', '62', '24', '30');
INSERT INTO `player_levelstats` VALUES ('1', '1', '32', '69', '48', '64', '24', '31');
INSERT INTO `player_levelstats` VALUES ('1', '1', '33', '71', '50', '66', '24', '31');
INSERT INTO `player_levelstats` VALUES ('1', '1', '34', '73', '51', '67', '24', '32');
INSERT INTO `player_levelstats` VALUES ('1', '1', '35', '74', '52', '69', '24', '32');
INSERT INTO `player_levelstats` VALUES ('1', '1', '36', '76', '53', '70', '25', '33');
INSERT INTO `player_levelstats` VALUES ('1', '1', '37', '78', '54', '72', '25', '33');
INSERT INTO `player_levelstats` VALUES ('1', '1', '38', '80', '55', '74', '25', '34');
INSERT INTO `player_levelstats` VALUES ('1', '1', '39', '82', '56', '75', '25', '34');
INSERT INTO `player_levelstats` VALUES ('1', '1', '40', '83', '57', '77', '25', '35');
INSERT INTO `player_levelstats` VALUES ('1', '1', '41', '85', '58', '79', '26', '35');
INSERT INTO `player_levelstats` VALUES ('1', '1', '42', '87', '60', '80', '26', '35');
INSERT INTO `player_levelstats` VALUES ('1', '1', '43', '89', '61', '82', '26', '36');
INSERT INTO `player_levelstats` VALUES ('1', '1', '44', '91', '62', '84', '26', '36');
INSERT INTO `player_levelstats` VALUES ('1', '1', '45', '93', '63', '85', '26', '37');
INSERT INTO `player_levelstats` VALUES ('1', '1', '46', '95', '64', '87', '27', '37');
INSERT INTO `player_levelstats` VALUES ('1', '1', '47', '97', '66', '89', '27', '38');
INSERT INTO `player_levelstats` VALUES ('1', '1', '48', '99', '67', '91', '27', '38');
INSERT INTO `player_levelstats` VALUES ('1', '1', '49', '101', '68', '93', '27', '39');
INSERT INTO `player_levelstats` VALUES ('1', '1', '50', '103', '69', '94', '28', '40');
INSERT INTO `player_levelstats` VALUES ('1', '1', '51', '105', '71', '96', '28', '40');
INSERT INTO `player_levelstats` VALUES ('1', '1', '52', '107', '72', '98', '28', '41');
INSERT INTO `player_levelstats` VALUES ('1', '1', '53', '109', '73', '100', '28', '41');
INSERT INTO `player_levelstats` VALUES ('1', '1', '54', '111', '74', '102', '29', '42');
INSERT INTO `player_levelstats` VALUES ('1', '1', '55', '113', '76', '103', '29', '42');
INSERT INTO `player_levelstats` VALUES ('1', '1', '56', '115', '77', '105', '29', '43');
INSERT INTO `player_levelstats` VALUES ('1', '1', '57', '117', '78', '107', '29', '43');
INSERT INTO `player_levelstats` VALUES ('1', '1', '58', '119', '79', '109', '30', '44');
INSERT INTO `player_levelstats` VALUES ('1', '1', '59', '121', '81', '111', '30', '44');
INSERT INTO `player_levelstats` VALUES ('1', '1', '60', '123', '82', '113', '30', '45');
INSERT INTO `player_levelstats` VALUES ('1', '1', '61', '125', '83', '115', '30', '46');
INSERT INTO `player_levelstats` VALUES ('1', '1', '62', '127', '85', '117', '31', '46');
INSERT INTO `player_levelstats` VALUES ('1', '1', '63', '129', '86', '119', '31', '47');
INSERT INTO `player_levelstats` VALUES ('1', '1', '64', '132', '88', '121', '31', '47');
INSERT INTO `player_levelstats` VALUES ('1', '1', '65', '134', '89', '123', '32', '48');
INSERT INTO `player_levelstats` VALUES ('1', '1', '66', '136', '90', '125', '32', '49');
INSERT INTO `player_levelstats` VALUES ('1', '1', '67', '138', '92', '127', '32', '49');
INSERT INTO `player_levelstats` VALUES ('1', '1', '68', '140', '93', '129', '32', '50');
INSERT INTO `player_levelstats` VALUES ('1', '1', '69', '143', '95', '131', '33', '50');
INSERT INTO `player_levelstats` VALUES ('1', '1', '70', '145', '96', '133', '33', '51');
INSERT INTO `player_levelstats` VALUES ('1', '2', '1', '22', '20', '22', '20', '21');
INSERT INTO `player_levelstats` VALUES ('1', '2', '2', '23', '21', '23', '21', '22');
INSERT INTO `player_levelstats` VALUES ('1', '2', '3', '24', '21', '24', '21', '22');
INSERT INTO `player_levelstats` VALUES ('1', '2', '4', '25', '22', '25', '22', '23');
INSERT INTO `player_levelstats` VALUES ('1', '2', '5', '26', '22', '26', '23', '24');
INSERT INTO `player_levelstats` VALUES ('1', '2', '6', '28', '23', '27', '23', '25');
INSERT INTO `player_levelstats` VALUES ('1', '2', '7', '29', '24', '28', '24', '25');
INSERT INTO `player_levelstats` VALUES ('1', '2', '8', '30', '24', '29', '25', '26');
INSERT INTO `player_levelstats` VALUES ('1', '2', '9', '31', '25', '30', '25', '27');
INSERT INTO `player_levelstats` VALUES ('1', '2', '10', '32', '25', '32', '26', '27');
INSERT INTO `player_levelstats` VALUES ('1', '2', '11', '33', '26', '33', '27', '28');
INSERT INTO `player_levelstats` VALUES ('1', '2', '12', '35', '27', '34', '27', '29');
INSERT INTO `player_levelstats` VALUES ('1', '2', '13', '36', '27', '35', '28', '30');
INSERT INTO `player_levelstats` VALUES ('1', '2', '14', '37', '28', '36', '29', '31');
INSERT INTO `player_levelstats` VALUES ('1', '2', '15', '38', '29', '37', '30', '31');
INSERT INTO `player_levelstats` VALUES ('1', '2', '16', '40', '29', '38', '30', '32');
INSERT INTO `player_levelstats` VALUES ('1', '2', '17', '41', '30', '40', '31', '33');
INSERT INTO `player_levelstats` VALUES ('1', '2', '18', '42', '31', '41', '32', '34');
INSERT INTO `player_levelstats` VALUES ('1', '2', '19', '43', '31', '42', '33', '35');
INSERT INTO `player_levelstats` VALUES ('1', '2', '20', '45', '32', '43', '33', '35');
INSERT INTO `player_levelstats` VALUES ('1', '2', '21', '46', '33', '45', '34', '36');
INSERT INTO `player_levelstats` VALUES ('1', '2', '22', '47', '33', '46', '35', '37');
INSERT INTO `player_levelstats` VALUES ('1', '2', '23', '49', '34', '47', '36', '38');
INSERT INTO `player_levelstats` VALUES ('1', '2', '24', '50', '35', '48', '37', '39');
INSERT INTO `player_levelstats` VALUES ('1', '2', '25', '51', '36', '50', '37', '40');
INSERT INTO `player_levelstats` VALUES ('1', '2', '26', '53', '36', '51', '38', '41');
INSERT INTO `player_levelstats` VALUES ('1', '2', '27', '54', '37', '52', '39', '42');
INSERT INTO `player_levelstats` VALUES ('1', '2', '28', '56', '38', '54', '40', '43');
INSERT INTO `player_levelstats` VALUES ('1', '2', '29', '57', '39', '55', '41', '43');
INSERT INTO `player_levelstats` VALUES ('1', '2', '30', '58', '39', '56', '42', '44');
INSERT INTO `player_levelstats` VALUES ('1', '2', '31', '60', '40', '58', '43', '45');
INSERT INTO `player_levelstats` VALUES ('1', '2', '32', '61', '41', '59', '43', '46');
INSERT INTO `player_levelstats` VALUES ('1', '2', '33', '63', '42', '60', '44', '47');
INSERT INTO `player_levelstats` VALUES ('1', '2', '34', '64', '43', '62', '45', '48');
INSERT INTO `player_levelstats` VALUES ('1', '2', '35', '66', '44', '63', '46', '49');
INSERT INTO `player_levelstats` VALUES ('1', '2', '36', '67', '44', '65', '47', '50');
INSERT INTO `player_levelstats` VALUES ('1', '2', '37', '69', '45', '66', '48', '51');
INSERT INTO `player_levelstats` VALUES ('1', '2', '38', '70', '46', '67', '49', '52');
INSERT INTO `player_levelstats` VALUES ('1', '2', '39', '72', '47', '69', '50', '53');
INSERT INTO `player_levelstats` VALUES ('1', '2', '40', '73', '48', '70', '51', '54');
INSERT INTO `player_levelstats` VALUES ('1', '2', '41', '75', '49', '72', '52', '55');
INSERT INTO `player_levelstats` VALUES ('1', '2', '42', '77', '49', '73', '53', '56');
INSERT INTO `player_levelstats` VALUES ('1', '2', '43', '78', '50', '75', '54', '57');
INSERT INTO `player_levelstats` VALUES ('1', '2', '44', '80', '51', '76', '55', '58');
INSERT INTO `player_levelstats` VALUES ('1', '2', '45', '81', '52', '78', '56', '59');
INSERT INTO `player_levelstats` VALUES ('1', '2', '46', '83', '53', '79', '57', '61');
INSERT INTO `player_levelstats` VALUES ('1', '2', '47', '85', '54', '81', '58', '62');
INSERT INTO `player_levelstats` VALUES ('1', '2', '48', '86', '55', '83', '59', '63');
INSERT INTO `player_levelstats` VALUES ('1', '2', '49', '88', '56', '84', '60', '64');
INSERT INTO `player_levelstats` VALUES ('1', '2', '50', '90', '57', '86', '61', '65');
INSERT INTO `player_levelstats` VALUES ('1', '2', '51', '91', '58', '87', '62', '66');
INSERT INTO `player_levelstats` VALUES ('1', '2', '52', '93', '59', '89', '63', '67');
INSERT INTO `player_levelstats` VALUES ('1', '2', '53', '95', '60', '91', '64', '68');
INSERT INTO `player_levelstats` VALUES ('1', '2', '54', '97', '61', '92', '65', '69');
INSERT INTO `player_levelstats` VALUES ('1', '2', '55', '98', '61', '94', '66', '71');
INSERT INTO `player_levelstats` VALUES ('1', '2', '56', '100', '62', '95', '67', '72');
INSERT INTO `player_levelstats` VALUES ('1', '2', '57', '102', '63', '97', '68', '73');
INSERT INTO `player_levelstats` VALUES ('1', '2', '58', '104', '64', '99', '69', '74');
INSERT INTO `player_levelstats` VALUES ('1', '2', '59', '105', '65', '101', '70', '75');
INSERT INTO `player_levelstats` VALUES ('1', '2', '60', '107', '66', '102', '71', '77');
INSERT INTO `player_levelstats` VALUES ('1', '2', '61', '109', '67', '104', '73', '78');
INSERT INTO `player_levelstats` VALUES ('1', '2', '62', '111', '69', '106', '74', '79');
INSERT INTO `player_levelstats` VALUES ('1', '2', '63', '113', '70', '107', '75', '80');
INSERT INTO `player_levelstats` VALUES ('1', '2', '64', '115', '71', '109', '76', '81');
INSERT INTO `player_levelstats` VALUES ('1', '2', '65', '116', '72', '111', '77', '83');
INSERT INTO `player_levelstats` VALUES ('1', '2', '66', '118', '73', '113', '78', '84');
INSERT INTO `player_levelstats` VALUES ('1', '2', '67', '120', '74', '115', '79', '85');
INSERT INTO `player_levelstats` VALUES ('1', '2', '68', '122', '75', '116', '81', '86');
INSERT INTO `player_levelstats` VALUES ('1', '2', '69', '124', '76', '118', '82', '88');
INSERT INTO `player_levelstats` VALUES ('1', '2', '70', '126', '77', '120', '83', '89');
INSERT INTO `player_levelstats` VALUES ('1', '4', '1', '21', '23', '21', '20', '20');
INSERT INTO `player_levelstats` VALUES ('1', '4', '2', '22', '24', '22', '20', '20');
INSERT INTO `player_levelstats` VALUES ('1', '4', '3', '23', '26', '22', '20', '21');
INSERT INTO `player_levelstats` VALUES ('1', '4', '4', '23', '27', '23', '20', '21');
INSERT INTO `player_levelstats` VALUES ('1', '4', '5', '24', '29', '24', '21', '21');
INSERT INTO `player_levelstats` VALUES ('1', '4', '6', '25', '30', '25', '21', '22');
INSERT INTO `player_levelstats` VALUES ('1', '4', '7', '26', '32', '25', '21', '22');
INSERT INTO `player_levelstats` VALUES ('1', '4', '8', '26', '33', '26', '21', '23');
INSERT INTO `player_levelstats` VALUES ('1', '4', '9', '27', '35', '27', '21', '23');
INSERT INTO `player_levelstats` VALUES ('1', '4', '10', '28', '36', '27', '21', '23');
INSERT INTO `player_levelstats` VALUES ('1', '4', '11', '29', '38', '28', '22', '24');
INSERT INTO `player_levelstats` VALUES ('1', '4', '12', '30', '39', '29', '22', '24');
INSERT INTO `player_levelstats` VALUES ('1', '4', '13', '31', '41', '30', '22', '25');
INSERT INTO `player_levelstats` VALUES ('1', '4', '14', '31', '43', '31', '22', '25');
INSERT INTO `player_levelstats` VALUES ('1', '4', '15', '32', '44', '31', '22', '25');
INSERT INTO `player_levelstats` VALUES ('1', '4', '16', '33', '46', '32', '23', '26');
INSERT INTO `player_levelstats` VALUES ('1', '4', '17', '34', '48', '33', '23', '26');
INSERT INTO `player_levelstats` VALUES ('1', '4', '18', '35', '49', '34', '23', '27');
INSERT INTO `player_levelstats` VALUES ('1', '4', '19', '36', '51', '35', '23', '27');
INSERT INTO `player_levelstats` VALUES ('1', '4', '20', '37', '53', '35', '23', '28');
INSERT INTO `player_levelstats` VALUES ('1', '4', '21', '38', '54', '36', '24', '28');
INSERT INTO `player_levelstats` VALUES ('1', '4', '22', '39', '56', '37', '24', '29');
INSERT INTO `player_levelstats` VALUES ('1', '4', '23', '40', '58', '38', '24', '29');
INSERT INTO `player_levelstats` VALUES ('1', '4', '24', '41', '60', '39', '24', '30');
INSERT INTO `player_levelstats` VALUES ('1', '4', '25', '42', '61', '40', '25', '30');
INSERT INTO `player_levelstats` VALUES ('1', '4', '26', '43', '63', '41', '25', '31');
INSERT INTO `player_levelstats` VALUES ('1', '4', '27', '44', '65', '42', '25', '31');
INSERT INTO `player_levelstats` VALUES ('1', '4', '28', '45', '67', '43', '25', '32');
INSERT INTO `player_levelstats` VALUES ('1', '4', '29', '46', '69', '43', '25', '32');
INSERT INTO `player_levelstats` VALUES ('1', '4', '30', '47', '71', '44', '26', '33');
INSERT INTO `player_levelstats` VALUES ('1', '4', '31', '48', '72', '45', '26', '33');
INSERT INTO `player_levelstats` VALUES ('1', '4', '32', '49', '74', '46', '26', '34');
INSERT INTO `player_levelstats` VALUES ('1', '4', '33', '50', '76', '47', '27', '34');
INSERT INTO `player_levelstats` VALUES ('1', '4', '34', '51', '78', '48', '27', '35');
INSERT INTO `player_levelstats` VALUES ('1', '4', '35', '52', '80', '49', '27', '35');
INSERT INTO `player_levelstats` VALUES ('1', '4', '36', '53', '82', '50', '27', '36');
INSERT INTO `player_levelstats` VALUES ('1', '4', '37', '54', '84', '51', '28', '36');
INSERT INTO `player_levelstats` VALUES ('1', '4', '38', '55', '86', '52', '28', '37');
INSERT INTO `player_levelstats` VALUES ('1', '4', '39', '56', '88', '53', '28', '38');
INSERT INTO `player_levelstats` VALUES ('1', '4', '40', '57', '90', '54', '28', '38');
INSERT INTO `player_levelstats` VALUES ('1', '4', '41', '58', '92', '55', '29', '39');
INSERT INTO `player_levelstats` VALUES ('1', '4', '42', '60', '94', '56', '29', '39');
INSERT INTO `player_levelstats` VALUES ('1', '4', '43', '61', '96', '57', '29', '40');
INSERT INTO `player_levelstats` VALUES ('1', '4', '44', '62', '98', '58', '30', '40');
INSERT INTO `player_levelstats` VALUES ('1', '4', '45', '63', '100', '59', '30', '41');
INSERT INTO `player_levelstats` VALUES ('1', '4', '46', '64', '103', '61', '30', '42');
INSERT INTO `player_levelstats` VALUES ('1', '4', '47', '65', '105', '62', '31', '42');
INSERT INTO `player_levelstats` VALUES ('1', '4', '48', '66', '107', '63', '31', '43');
INSERT INTO `player_levelstats` VALUES ('1', '4', '49', '68', '109', '64', '31', '44');
INSERT INTO `player_levelstats` VALUES ('1', '4', '50', '69', '111', '65', '32', '44');
INSERT INTO `player_levelstats` VALUES ('1', '4', '51', '70', '113', '66', '32', '45');
INSERT INTO `player_levelstats` VALUES ('1', '4', '52', '71', '116', '67', '32', '45');
INSERT INTO `player_levelstats` VALUES ('1', '4', '53', '73', '118', '68', '33', '46');
INSERT INTO `player_levelstats` VALUES ('1', '4', '54', '74', '120', '69', '33', '47');
INSERT INTO `player_levelstats` VALUES ('1', '4', '55', '75', '122', '71', '33', '47');
INSERT INTO `player_levelstats` VALUES ('1', '4', '56', '76', '125', '72', '34', '48');
INSERT INTO `player_levelstats` VALUES ('1', '4', '57', '78', '127', '73', '34', '49');
INSERT INTO `player_levelstats` VALUES ('1', '4', '58', '79', '129', '74', '34', '49');
INSERT INTO `player_levelstats` VALUES ('1', '4', '59', '80', '131', '75', '35', '50');
INSERT INTO `player_levelstats` VALUES ('1', '4', '60', '81', '134', '77', '35', '51');
INSERT INTO `player_levelstats` VALUES ('1', '4', '61', '83', '136', '78', '35', '51');
INSERT INTO `player_levelstats` VALUES ('1', '4', '62', '84', '138', '79', '36', '52');
INSERT INTO `player_levelstats` VALUES ('1', '4', '63', '85', '141', '80', '36', '53');
INSERT INTO `player_levelstats` VALUES ('1', '4', '64', '87', '143', '81', '37', '54');
INSERT INTO `player_levelstats` VALUES ('1', '4', '65', '88', '146', '83', '37', '54');
INSERT INTO `player_levelstats` VALUES ('1', '4', '66', '89', '148', '84', '37', '55');
INSERT INTO `player_levelstats` VALUES ('1', '4', '67', '91', '151', '85', '38', '56');
INSERT INTO `player_levelstats` VALUES ('1', '4', '68', '92', '153', '86', '38', '57');
INSERT INTO `player_levelstats` VALUES ('1', '4', '69', '94', '156', '88', '39', '57');
INSERT INTO `player_levelstats` VALUES ('1', '4', '70', '95', '158', '89', '39', '58');
INSERT INTO `player_levelstats` VALUES ('1', '5', '1', '20', '20', '20', '22', '23');
INSERT INTO `player_levelstats` VALUES ('1', '5', '2', '20', '20', '20', '23', '24');
INSERT INTO `player_levelstats` VALUES ('1', '5', '3', '20', '20', '21', '25', '26');
INSERT INTO `player_levelstats` VALUES ('1', '5', '4', '20', '21', '21', '26', '27');
INSERT INTO `player_levelstats` VALUES ('1', '5', '5', '21', '21', '21', '27', '28');
INSERT INTO `player_levelstats` VALUES ('1', '5', '6', '21', '21', '22', '29', '30');
INSERT INTO `player_levelstats` VALUES ('1', '5', '7', '21', '21', '22', '30', '31');
INSERT INTO `player_levelstats` VALUES ('1', '5', '8', '21', '22', '23', '31', '33');
INSERT INTO `player_levelstats` VALUES ('1', '5', '9', '21', '22', '23', '33', '34');
INSERT INTO `player_levelstats` VALUES ('1', '5', '10', '21', '22', '23', '34', '36');
INSERT INTO `player_levelstats` VALUES ('1', '5', '11', '22', '22', '24', '36', '37');
INSERT INTO `player_levelstats` VALUES ('1', '5', '12', '22', '23', '24', '37', '39');
INSERT INTO `player_levelstats` VALUES ('1', '5', '13', '22', '23', '25', '38', '40');
INSERT INTO `player_levelstats` VALUES ('1', '5', '14', '22', '23', '25', '40', '42');
INSERT INTO `player_levelstats` VALUES ('1', '5', '15', '22', '23', '25', '41', '43');
INSERT INTO `player_levelstats` VALUES ('1', '5', '16', '23', '24', '26', '43', '45');
INSERT INTO `player_levelstats` VALUES ('1', '5', '17', '23', '24', '26', '44', '46');
INSERT INTO `player_levelstats` VALUES ('1', '5', '18', '23', '24', '27', '46', '48');
INSERT INTO `player_levelstats` VALUES ('1', '5', '19', '23', '24', '27', '47', '49');
INSERT INTO `player_levelstats` VALUES ('1', '5', '20', '23', '25', '28', '49', '51');
INSERT INTO `player_levelstats` VALUES ('1', '5', '21', '24', '25', '28', '51', '53');
INSERT INTO `player_levelstats` VALUES ('1', '5', '22', '24', '25', '29', '52', '54');
INSERT INTO `player_levelstats` VALUES ('1', '5', '23', '24', '26', '29', '54', '56');
INSERT INTO `player_levelstats` VALUES ('1', '5', '24', '24', '26', '30', '55', '58');
INSERT INTO `player_levelstats` VALUES ('1', '5', '25', '25', '26', '30', '57', '59');
INSERT INTO `player_levelstats` VALUES ('1', '5', '26', '25', '27', '31', '59', '61');
INSERT INTO `player_levelstats` VALUES ('1', '5', '27', '25', '27', '31', '60', '63');
INSERT INTO `player_levelstats` VALUES ('1', '5', '28', '25', '27', '32', '62', '65');
INSERT INTO `player_levelstats` VALUES ('1', '5', '29', '25', '28', '32', '64', '66');
INSERT INTO `player_levelstats` VALUES ('1', '5', '30', '26', '28', '33', '65', '68');
INSERT INTO `player_levelstats` VALUES ('1', '5', '31', '26', '28', '33', '67', '70');
INSERT INTO `player_levelstats` VALUES ('1', '5', '32', '26', '29', '34', '69', '72');
INSERT INTO `player_levelstats` VALUES ('1', '5', '33', '27', '29', '34', '70', '73');
INSERT INTO `player_levelstats` VALUES ('1', '5', '34', '27', '29', '35', '72', '75');
INSERT INTO `player_levelstats` VALUES ('1', '5', '35', '27', '30', '35', '74', '77');
INSERT INTO `player_levelstats` VALUES ('1', '5', '36', '27', '30', '36', '76', '79');
INSERT INTO `player_levelstats` VALUES ('1', '5', '37', '28', '30', '36', '78', '81');
INSERT INTO `player_levelstats` VALUES ('1', '5', '38', '28', '31', '37', '79', '83');
INSERT INTO `player_levelstats` VALUES ('1', '5', '39', '28', '31', '38', '81', '85');
INSERT INTO `player_levelstats` VALUES ('1', '5', '40', '28', '31', '38', '83', '87');
INSERT INTO `player_levelstats` VALUES ('1', '5', '41', '29', '32', '39', '85', '88');
INSERT INTO `player_levelstats` VALUES ('1', '5', '42', '29', '32', '39', '87', '90');
INSERT INTO `player_levelstats` VALUES ('1', '5', '43', '29', '33', '40', '89', '92');
INSERT INTO `player_levelstats` VALUES ('1', '5', '44', '30', '33', '40', '91', '94');
INSERT INTO `player_levelstats` VALUES ('1', '5', '45', '30', '33', '41', '92', '96');
INSERT INTO `player_levelstats` VALUES ('1', '5', '46', '30', '34', '42', '94', '98');
INSERT INTO `player_levelstats` VALUES ('1', '5', '47', '31', '34', '42', '96', '100');
INSERT INTO `player_levelstats` VALUES ('1', '5', '48', '31', '35', '43', '98', '102');
INSERT INTO `player_levelstats` VALUES ('1', '5', '49', '31', '35', '44', '100', '104');
INSERT INTO `player_levelstats` VALUES ('1', '5', '50', '32', '36', '44', '102', '106');
INSERT INTO `player_levelstats` VALUES ('1', '5', '51', '32', '36', '45', '104', '109');
INSERT INTO `player_levelstats` VALUES ('1', '5', '52', '32', '36', '45', '106', '111');
INSERT INTO `player_levelstats` VALUES ('1', '5', '53', '33', '37', '46', '108', '113');
INSERT INTO `player_levelstats` VALUES ('1', '5', '54', '33', '37', '47', '110', '115');
INSERT INTO `player_levelstats` VALUES ('1', '5', '55', '33', '38', '47', '112', '117');
INSERT INTO `player_levelstats` VALUES ('1', '5', '56', '34', '38', '48', '114', '119');
INSERT INTO `player_levelstats` VALUES ('1', '5', '57', '34', '39', '49', '117', '121');
INSERT INTO `player_levelstats` VALUES ('1', '5', '58', '34', '39', '49', '119', '124');
INSERT INTO `player_levelstats` VALUES ('1', '5', '59', '35', '40', '50', '121', '126');
INSERT INTO `player_levelstats` VALUES ('1', '5', '60', '35', '40', '51', '123', '128');
INSERT INTO `player_levelstats` VALUES ('1', '5', '61', '35', '41', '51', '125', '130');
INSERT INTO `player_levelstats` VALUES ('1', '5', '62', '36', '41', '52', '127', '132');
INSERT INTO `player_levelstats` VALUES ('1', '5', '63', '36', '41', '53', '129', '135');
INSERT INTO `player_levelstats` VALUES ('1', '5', '64', '37', '42', '54', '132', '137');
INSERT INTO `player_levelstats` VALUES ('1', '5', '65', '37', '42', '54', '134', '139');
INSERT INTO `player_levelstats` VALUES ('1', '5', '66', '37', '43', '55', '136', '142');
INSERT INTO `player_levelstats` VALUES ('1', '5', '67', '38', '43', '56', '138', '144');
INSERT INTO `player_levelstats` VALUES ('1', '5', '68', '38', '44', '57', '140', '146');
INSERT INTO `player_levelstats` VALUES ('1', '5', '69', '39', '44', '57', '143', '149');
INSERT INTO `player_levelstats` VALUES ('1', '5', '70', '39', '45', '58', '145', '151');
INSERT INTO `player_levelstats` VALUES ('1', '8', '1', '20', '20', '20', '23', '22');
INSERT INTO `player_levelstats` VALUES ('1', '8', '2', '20', '20', '20', '24', '23');
INSERT INTO `player_levelstats` VALUES ('1', '8', '3', '20', '20', '21', '26', '25');
INSERT INTO `player_levelstats` VALUES ('1', '8', '4', '20', '20', '21', '27', '26');
INSERT INTO `player_levelstats` VALUES ('1', '8', '5', '20', '21', '21', '28', '27');
INSERT INTO `player_levelstats` VALUES ('1', '8', '6', '20', '21', '21', '30', '29');
INSERT INTO `player_levelstats` VALUES ('1', '8', '7', '21', '21', '22', '31', '30');
INSERT INTO `player_levelstats` VALUES ('1', '8', '8', '21', '21', '22', '33', '31');
INSERT INTO `player_levelstats` VALUES ('1', '8', '9', '21', '21', '22', '34', '33');
INSERT INTO `player_levelstats` VALUES ('1', '8', '10', '21', '21', '23', '36', '34');
INSERT INTO `player_levelstats` VALUES ('1', '8', '11', '21', '22', '23', '37', '36');
INSERT INTO `player_levelstats` VALUES ('1', '8', '12', '21', '22', '23', '39', '37');
INSERT INTO `player_levelstats` VALUES ('1', '8', '13', '21', '22', '24', '40', '38');
INSERT INTO `player_levelstats` VALUES ('1', '8', '14', '21', '22', '24', '42', '40');
INSERT INTO `player_levelstats` VALUES ('1', '8', '15', '21', '22', '24', '43', '41');
INSERT INTO `player_levelstats` VALUES ('1', '8', '16', '21', '23', '25', '45', '43');
INSERT INTO `player_levelstats` VALUES ('1', '8', '17', '22', '23', '25', '46', '44');
INSERT INTO `player_levelstats` VALUES ('1', '8', '18', '22', '23', '25', '48', '46');
INSERT INTO `player_levelstats` VALUES ('1', '8', '19', '22', '23', '26', '49', '47');
INSERT INTO `player_levelstats` VALUES ('1', '8', '20', '22', '23', '26', '51', '49');
INSERT INTO `player_levelstats` VALUES ('1', '8', '21', '22', '24', '26', '53', '51');
INSERT INTO `player_levelstats` VALUES ('1', '8', '22', '22', '24', '27', '54', '52');
INSERT INTO `player_levelstats` VALUES ('1', '8', '23', '22', '24', '27', '56', '54');
INSERT INTO `player_levelstats` VALUES ('1', '8', '24', '23', '24', '28', '58', '55');
INSERT INTO `player_levelstats` VALUES ('1', '8', '25', '23', '25', '28', '59', '57');
INSERT INTO `player_levelstats` VALUES ('1', '8', '26', '23', '25', '28', '61', '59');
INSERT INTO `player_levelstats` VALUES ('1', '8', '27', '23', '25', '29', '63', '60');
INSERT INTO `player_levelstats` VALUES ('1', '8', '28', '23', '25', '29', '65', '62');
INSERT INTO `player_levelstats` VALUES ('1', '8', '29', '23', '25', '30', '66', '64');
INSERT INTO `player_levelstats` VALUES ('1', '8', '30', '24', '26', '30', '68', '65');
INSERT INTO `player_levelstats` VALUES ('1', '8', '31', '24', '26', '30', '70', '67');
INSERT INTO `player_levelstats` VALUES ('1', '8', '32', '24', '26', '31', '72', '69');
INSERT INTO `player_levelstats` VALUES ('1', '8', '33', '24', '27', '31', '73', '70');
INSERT INTO `player_levelstats` VALUES ('1', '8', '34', '24', '27', '32', '75', '72');
INSERT INTO `player_levelstats` VALUES ('1', '8', '35', '24', '27', '32', '77', '74');
INSERT INTO `player_levelstats` VALUES ('1', '8', '36', '25', '27', '33', '79', '76');
INSERT INTO `player_levelstats` VALUES ('1', '8', '37', '25', '28', '33', '81', '78');
INSERT INTO `player_levelstats` VALUES ('1', '8', '38', '25', '28', '34', '83', '79');
INSERT INTO `player_levelstats` VALUES ('1', '8', '39', '25', '28', '34', '85', '81');
INSERT INTO `player_levelstats` VALUES ('1', '8', '40', '25', '28', '35', '87', '83');
INSERT INTO `player_levelstats` VALUES ('1', '8', '41', '26', '29', '35', '88', '85');
INSERT INTO `player_levelstats` VALUES ('1', '8', '42', '26', '29', '35', '90', '87');
INSERT INTO `player_levelstats` VALUES ('1', '8', '43', '26', '29', '36', '92', '89');
INSERT INTO `player_levelstats` VALUES ('1', '8', '44', '26', '30', '36', '94', '91');
INSERT INTO `player_levelstats` VALUES ('1', '8', '45', '26', '30', '37', '96', '92');
INSERT INTO `player_levelstats` VALUES ('1', '8', '46', '27', '30', '37', '98', '94');
INSERT INTO `player_levelstats` VALUES ('1', '8', '47', '27', '31', '38', '100', '96');
INSERT INTO `player_levelstats` VALUES ('1', '8', '48', '27', '31', '38', '102', '98');
INSERT INTO `player_levelstats` VALUES ('1', '8', '49', '27', '31', '39', '104', '100');
INSERT INTO `player_levelstats` VALUES ('1', '8', '50', '28', '32', '40', '106', '102');
INSERT INTO `player_levelstats` VALUES ('1', '8', '51', '28', '32', '40', '109', '104');
INSERT INTO `player_levelstats` VALUES ('1', '8', '52', '28', '32', '41', '111', '106');
INSERT INTO `player_levelstats` VALUES ('1', '8', '53', '28', '33', '41', '113', '108');
INSERT INTO `player_levelstats` VALUES ('1', '8', '54', '29', '33', '42', '115', '110');
INSERT INTO `player_levelstats` VALUES ('1', '8', '55', '29', '33', '42', '117', '112');
INSERT INTO `player_levelstats` VALUES ('1', '8', '56', '29', '34', '43', '119', '114');
INSERT INTO `player_levelstats` VALUES ('1', '8', '57', '29', '34', '43', '121', '117');
INSERT INTO `player_levelstats` VALUES ('1', '8', '58', '30', '34', '44', '124', '119');
INSERT INTO `player_levelstats` VALUES ('1', '8', '59', '30', '35', '44', '126', '121');
INSERT INTO `player_levelstats` VALUES ('1', '8', '60', '30', '35', '45', '128', '123');
INSERT INTO `player_levelstats` VALUES ('1', '8', '61', '30', '35', '46', '130', '125');
INSERT INTO `player_levelstats` VALUES ('1', '8', '62', '31', '36', '46', '132', '127');
INSERT INTO `player_levelstats` VALUES ('1', '8', '63', '31', '36', '47', '135', '129');
INSERT INTO `player_levelstats` VALUES ('1', '8', '64', '31', '37', '47', '137', '132');
INSERT INTO `player_levelstats` VALUES ('1', '8', '65', '32', '37', '48', '139', '134');
INSERT INTO `player_levelstats` VALUES ('1', '8', '66', '32', '37', '49', '142', '136');
INSERT INTO `player_levelstats` VALUES ('1', '8', '67', '32', '38', '49', '144', '138');
INSERT INTO `player_levelstats` VALUES ('1', '8', '68', '32', '38', '50', '146', '140');
INSERT INTO `player_levelstats` VALUES ('1', '8', '69', '33', '39', '50', '149', '143');
INSERT INTO `player_levelstats` VALUES ('1', '8', '70', '33', '39', '51', '151', '145');
INSERT INTO `player_levelstats` VALUES ('1', '9', '1', '20', '20', '21', '22', '22');
INSERT INTO `player_levelstats` VALUES ('1', '9', '2', '20', '20', '22', '23', '23');
INSERT INTO `player_levelstats` VALUES ('1', '9', '3', '21', '21', '22', '24', '24');
INSERT INTO `player_levelstats` VALUES ('1', '9', '4', '21', '21', '23', '26', '25');
INSERT INTO `player_levelstats` VALUES ('1', '9', '5', '21', '21', '23', '27', '27');
INSERT INTO `player_levelstats` VALUES ('1', '9', '6', '21', '22', '24', '28', '28');
INSERT INTO `player_levelstats` VALUES ('1', '9', '7', '22', '22', '24', '29', '29');
INSERT INTO `player_levelstats` VALUES ('1', '9', '8', '22', '23', '25', '30', '30');
INSERT INTO `player_levelstats` VALUES ('1', '9', '9', '22', '23', '26', '32', '31');
INSERT INTO `player_levelstats` VALUES ('1', '9', '10', '23', '23', '26', '33', '33');
INSERT INTO `player_levelstats` VALUES ('1', '9', '11', '23', '24', '27', '34', '34');
INSERT INTO `player_levelstats` VALUES ('1', '9', '12', '23', '24', '27', '35', '35');
INSERT INTO `player_levelstats` VALUES ('1', '9', '13', '24', '25', '28', '37', '36');
INSERT INTO `player_levelstats` VALUES ('1', '9', '14', '24', '25', '29', '38', '38');
INSERT INTO `player_levelstats` VALUES ('1', '9', '15', '24', '25', '29', '39', '39');
INSERT INTO `player_levelstats` VALUES ('1', '9', '16', '25', '26', '30', '41', '40');
INSERT INTO `player_levelstats` VALUES ('1', '9', '17', '25', '26', '31', '42', '42');
INSERT INTO `player_levelstats` VALUES ('1', '9', '18', '25', '27', '31', '43', '43');
INSERT INTO `player_levelstats` VALUES ('1', '9', '19', '26', '27', '32', '45', '44');
INSERT INTO `player_levelstats` VALUES ('1', '9', '20', '26', '28', '33', '46', '46');
INSERT INTO `player_levelstats` VALUES ('1', '9', '21', '26', '28', '33', '48', '47');
INSERT INTO `player_levelstats` VALUES ('1', '9', '22', '27', '29', '34', '49', '49');
INSERT INTO `player_levelstats` VALUES ('1', '9', '23', '27', '29', '35', '51', '50');
INSERT INTO `player_levelstats` VALUES ('1', '9', '24', '28', '30', '35', '52', '51');
INSERT INTO `player_levelstats` VALUES ('1', '9', '25', '28', '30', '36', '53', '53');
INSERT INTO `player_levelstats` VALUES ('1', '9', '26', '28', '31', '37', '55', '54');
INSERT INTO `player_levelstats` VALUES ('1', '9', '27', '29', '31', '37', '56', '56');
INSERT INTO `player_levelstats` VALUES ('1', '9', '28', '29', '32', '38', '58', '57');
INSERT INTO `player_levelstats` VALUES ('1', '9', '29', '30', '32', '39', '59', '59');
INSERT INTO `player_levelstats` VALUES ('1', '9', '30', '30', '33', '40', '61', '60');
INSERT INTO `player_levelstats` VALUES ('1', '9', '31', '30', '33', '40', '62', '62');
INSERT INTO `player_levelstats` VALUES ('1', '9', '32', '31', '34', '41', '64', '63');
INSERT INTO `player_levelstats` VALUES ('1', '9', '33', '31', '34', '42', '66', '65');
INSERT INTO `player_levelstats` VALUES ('1', '9', '34', '32', '35', '43', '67', '66');
INSERT INTO `player_levelstats` VALUES ('1', '9', '35', '32', '35', '44', '69', '68');
INSERT INTO `player_levelstats` VALUES ('1', '9', '36', '33', '36', '44', '70', '69');
INSERT INTO `player_levelstats` VALUES ('1', '9', '37', '33', '36', '45', '72', '71');
INSERT INTO `player_levelstats` VALUES ('1', '9', '38', '34', '37', '46', '74', '73');
INSERT INTO `player_levelstats` VALUES ('1', '9', '39', '34', '38', '47', '75', '74');
INSERT INTO `player_levelstats` VALUES ('1', '9', '40', '35', '38', '48', '77', '76');
INSERT INTO `player_levelstats` VALUES ('1', '9', '41', '35', '39', '48', '79', '78');
INSERT INTO `player_levelstats` VALUES ('1', '9', '42', '35', '39', '49', '80', '79');
INSERT INTO `player_levelstats` VALUES ('1', '9', '43', '36', '40', '50', '82', '81');
INSERT INTO `player_levelstats` VALUES ('1', '9', '44', '36', '40', '51', '84', '83');
INSERT INTO `player_levelstats` VALUES ('1', '9', '45', '37', '41', '52', '85', '84');
INSERT INTO `player_levelstats` VALUES ('1', '9', '46', '37', '42', '53', '87', '86');
INSERT INTO `player_levelstats` VALUES ('1', '9', '47', '38', '42', '54', '89', '88');
INSERT INTO `player_levelstats` VALUES ('1', '9', '48', '38', '43', '55', '91', '89');
INSERT INTO `player_levelstats` VALUES ('1', '9', '49', '39', '44', '55', '93', '91');
INSERT INTO `player_levelstats` VALUES ('1', '9', '50', '40', '44', '56', '94', '93');
INSERT INTO `player_levelstats` VALUES ('1', '9', '51', '40', '45', '57', '96', '95');
INSERT INTO `player_levelstats` VALUES ('1', '9', '52', '41', '45', '58', '98', '97');
INSERT INTO `player_levelstats` VALUES ('1', '9', '53', '41', '46', '59', '100', '98');
INSERT INTO `player_levelstats` VALUES ('1', '9', '54', '42', '47', '60', '102', '100');
INSERT INTO `player_levelstats` VALUES ('1', '9', '55', '42', '47', '61', '103', '102');
INSERT INTO `player_levelstats` VALUES ('1', '9', '56', '43', '48', '62', '105', '104');
INSERT INTO `player_levelstats` VALUES ('1', '9', '57', '43', '49', '63', '107', '106');
INSERT INTO `player_levelstats` VALUES ('1', '9', '58', '44', '49', '64', '109', '108');
INSERT INTO `player_levelstats` VALUES ('1', '9', '59', '44', '50', '65', '111', '109');
INSERT INTO `player_levelstats` VALUES ('1', '9', '60', '45', '51', '66', '113', '111');
INSERT INTO `player_levelstats` VALUES ('1', '9', '61', '46', '51', '67', '115', '113');
INSERT INTO `player_levelstats` VALUES ('1', '9', '62', '46', '52', '68', '117', '115');
INSERT INTO `player_levelstats` VALUES ('1', '9', '63', '47', '53', '69', '119', '117');
INSERT INTO `player_levelstats` VALUES ('1', '9', '64', '47', '54', '70', '121', '119');
INSERT INTO `player_levelstats` VALUES ('1', '9', '65', '48', '54', '71', '123', '121');
INSERT INTO `player_levelstats` VALUES ('1', '9', '66', '49', '55', '72', '125', '123');
INSERT INTO `player_levelstats` VALUES ('1', '9', '67', '49', '56', '73', '127', '125');
INSERT INTO `player_levelstats` VALUES ('1', '9', '68', '50', '57', '74', '129', '127');
INSERT INTO `player_levelstats` VALUES ('1', '9', '69', '50', '57', '75', '131', '129');
INSERT INTO `player_levelstats` VALUES ('1', '9', '70', '51', '58', '76', '133', '131');
INSERT INTO `player_levelstats` VALUES ('2', '1', '1', '26', '17', '24', '17', '23');
INSERT INTO `player_levelstats` VALUES ('2', '1', '2', '27', '18', '25', '17', '23');
INSERT INTO `player_levelstats` VALUES ('2', '1', '3', '29', '19', '26', '17', '24');
INSERT INTO `player_levelstats` VALUES ('2', '1', '4', '30', '19', '27', '17', '24');
INSERT INTO `player_levelstats` VALUES ('2', '1', '5', '31', '20', '29', '17', '24');
INSERT INTO `player_levelstats` VALUES ('2', '1', '6', '32', '21', '30', '17', '24');
INSERT INTO `player_levelstats` VALUES ('2', '1', '7', '34', '22', '31', '18', '25');
INSERT INTO `player_levelstats` VALUES ('2', '1', '8', '35', '23', '32', '18', '25');
INSERT INTO `player_levelstats` VALUES ('2', '1', '9', '37', '24', '34', '18', '25');
INSERT INTO `player_levelstats` VALUES ('2', '1', '10', '38', '24', '35', '18', '26');
INSERT INTO `player_levelstats` VALUES ('2', '1', '11', '39', '25', '36', '18', '26');
INSERT INTO `player_levelstats` VALUES ('2', '1', '12', '41', '26', '37', '18', '26');
INSERT INTO `player_levelstats` VALUES ('2', '1', '13', '42', '27', '39', '18', '27');
INSERT INTO `player_levelstats` VALUES ('2', '1', '14', '44', '28', '40', '18', '27');
INSERT INTO `player_levelstats` VALUES ('2', '1', '15', '45', '29', '41', '18', '27');
INSERT INTO `player_levelstats` VALUES ('2', '1', '16', '47', '30', '43', '19', '28');
INSERT INTO `player_levelstats` VALUES ('2', '1', '17', '48', '31', '44', '19', '28');
INSERT INTO `player_levelstats` VALUES ('2', '1', '18', '50', '32', '45', '19', '28');
INSERT INTO `player_levelstats` VALUES ('2', '1', '19', '51', '33', '47', '19', '29');
INSERT INTO `player_levelstats` VALUES ('2', '1', '20', '53', '34', '48', '19', '29');
INSERT INTO `player_levelstats` VALUES ('2', '1', '21', '54', '34', '50', '19', '29');
INSERT INTO `player_levelstats` VALUES ('2', '1', '22', '56', '35', '51', '19', '30');
INSERT INTO `player_levelstats` VALUES ('2', '1', '23', '57', '36', '52', '20', '30');
INSERT INTO `player_levelstats` VALUES ('2', '1', '24', '59', '37', '54', '20', '30');
INSERT INTO `player_levelstats` VALUES ('2', '1', '25', '60', '38', '55', '20', '31');
INSERT INTO `player_levelstats` VALUES ('2', '1', '26', '62', '39', '57', '20', '31');
INSERT INTO `player_levelstats` VALUES ('2', '1', '27', '64', '40', '58', '20', '32');
INSERT INTO `player_levelstats` VALUES ('2', '1', '28', '65', '41', '60', '20', '32');
INSERT INTO `player_levelstats` VALUES ('2', '1', '29', '67', '43', '61', '21', '32');
INSERT INTO `player_levelstats` VALUES ('2', '1', '30', '69', '44', '63', '21', '33');
INSERT INTO `player_levelstats` VALUES ('2', '1', '31', '70', '45', '64', '21', '33');
INSERT INTO `player_levelstats` VALUES ('2', '1', '32', '72', '46', '66', '21', '34');
INSERT INTO `player_levelstats` VALUES ('2', '1', '33', '74', '47', '67', '21', '34');
INSERT INTO `player_levelstats` VALUES ('2', '1', '34', '76', '48', '69', '21', '35');
INSERT INTO `player_levelstats` VALUES ('2', '1', '35', '77', '49', '71', '22', '35');
INSERT INTO `player_levelstats` VALUES ('2', '1', '36', '79', '50', '72', '22', '36');
INSERT INTO `player_levelstats` VALUES ('2', '1', '37', '81', '51', '74', '22', '36');
INSERT INTO `player_levelstats` VALUES ('2', '1', '38', '83', '52', '76', '22', '36');
INSERT INTO `player_levelstats` VALUES ('2', '1', '39', '84', '53', '77', '22', '37');
INSERT INTO `player_levelstats` VALUES ('2', '1', '40', '86', '55', '79', '23', '37');
INSERT INTO `player_levelstats` VALUES ('2', '1', '41', '88', '56', '81', '23', '38');
INSERT INTO `player_levelstats` VALUES ('2', '1', '42', '90', '57', '82', '23', '38');
INSERT INTO `player_levelstats` VALUES ('2', '1', '43', '92', '58', '84', '23', '39');
INSERT INTO `player_levelstats` VALUES ('2', '1', '44', '94', '59', '86', '23', '39');
INSERT INTO `player_levelstats` VALUES ('2', '1', '45', '96', '60', '87', '24', '40');
INSERT INTO `player_levelstats` VALUES ('2', '1', '46', '98', '62', '89', '24', '40');
INSERT INTO `player_levelstats` VALUES ('2', '1', '47', '100', '63', '91', '24', '41');
INSERT INTO `player_levelstats` VALUES ('2', '1', '48', '101', '64', '93', '24', '41');
INSERT INTO `player_levelstats` VALUES ('2', '1', '49', '103', '65', '94', '25', '42');
INSERT INTO `player_levelstats` VALUES ('2', '1', '50', '105', '66', '96', '25', '42');
INSERT INTO `player_levelstats` VALUES ('2', '1', '51', '107', '68', '98', '25', '43');
INSERT INTO `player_levelstats` VALUES ('2', '1', '52', '109', '69', '100', '25', '43');
INSERT INTO `player_levelstats` VALUES ('2', '1', '53', '111', '70', '102', '25', '44');
INSERT INTO `player_levelstats` VALUES ('2', '1', '54', '113', '71', '104', '26', '45');
INSERT INTO `player_levelstats` VALUES ('2', '1', '55', '115', '73', '105', '26', '45');
INSERT INTO `player_levelstats` VALUES ('2', '1', '56', '118', '74', '107', '26', '46');
INSERT INTO `player_levelstats` VALUES ('2', '1', '57', '120', '75', '109', '26', '46');
INSERT INTO `player_levelstats` VALUES ('2', '1', '58', '122', '77', '111', '27', '47');
INSERT INTO `player_levelstats` VALUES ('2', '1', '59', '124', '78', '113', '27', '47');
INSERT INTO `player_levelstats` VALUES ('2', '1', '60', '126', '79', '115', '27', '48');
INSERT INTO `player_levelstats` VALUES ('2', '1', '61', '128', '81', '117', '27', '48');
INSERT INTO `player_levelstats` VALUES ('2', '1', '62', '130', '82', '119', '28', '49');
INSERT INTO `player_levelstats` VALUES ('2', '1', '63', '132', '83', '121', '28', '50');
INSERT INTO `player_levelstats` VALUES ('2', '1', '64', '135', '85', '123', '28', '50');
INSERT INTO `player_levelstats` VALUES ('2', '1', '65', '137', '86', '125', '29', '51');
INSERT INTO `player_levelstats` VALUES ('2', '1', '66', '139', '87', '127', '29', '52');
INSERT INTO `player_levelstats` VALUES ('2', '1', '67', '141', '89', '129', '29', '52');
INSERT INTO `player_levelstats` VALUES ('2', '1', '68', '143', '90', '131', '29', '53');
INSERT INTO `player_levelstats` VALUES ('2', '1', '69', '146', '92', '133', '30', '53');
INSERT INTO `player_levelstats` VALUES ('2', '1', '70', '148', '93', '135', '30', '54');
INSERT INTO `player_levelstats` VALUES ('2', '3', '1', '23', '20', '23', '17', '24');
INSERT INTO `player_levelstats` VALUES ('2', '3', '2', '23', '21', '24', '18', '25');
INSERT INTO `player_levelstats` VALUES ('2', '3', '3', '24', '23', '25', '18', '25');
INSERT INTO `player_levelstats` VALUES ('2', '3', '4', '24', '24', '26', '19', '26');
INSERT INTO `player_levelstats` VALUES ('2', '3', '5', '25', '25', '27', '19', '26');
INSERT INTO `player_levelstats` VALUES ('2', '3', '6', '25', '27', '28', '20', '27');
INSERT INTO `player_levelstats` VALUES ('2', '3', '7', '26', '28', '28', '21', '28');
INSERT INTO `player_levelstats` VALUES ('2', '3', '8', '26', '30', '29', '21', '28');
INSERT INTO `player_levelstats` VALUES ('2', '3', '9', '26', '31', '30', '22', '29');
INSERT INTO `player_levelstats` VALUES ('2', '3', '10', '27', '33', '31', '22', '30');
INSERT INTO `player_levelstats` VALUES ('2', '3', '11', '27', '34', '32', '23', '30');
INSERT INTO `player_levelstats` VALUES ('2', '3', '12', '28', '36', '33', '24', '31');
INSERT INTO `player_levelstats` VALUES ('2', '3', '13', '28', '37', '34', '24', '32');
INSERT INTO `player_levelstats` VALUES ('2', '3', '14', '29', '39', '35', '25', '33');
INSERT INTO `player_levelstats` VALUES ('2', '3', '15', '29', '40', '36', '26', '33');
INSERT INTO `player_levelstats` VALUES ('2', '3', '16', '30', '42', '37', '26', '34');
INSERT INTO `player_levelstats` VALUES ('2', '3', '17', '30', '43', '39', '27', '35');
INSERT INTO `player_levelstats` VALUES ('2', '3', '18', '31', '45', '40', '28', '35');
INSERT INTO `player_levelstats` VALUES ('2', '3', '19', '31', '47', '41', '28', '36');
INSERT INTO `player_levelstats` VALUES ('2', '3', '20', '32', '48', '42', '29', '37');
INSERT INTO `player_levelstats` VALUES ('2', '3', '21', '32', '50', '43', '30', '38');
INSERT INTO `player_levelstats` VALUES ('2', '3', '22', '33', '51', '44', '31', '39');
INSERT INTO `player_levelstats` VALUES ('2', '3', '23', '34', '53', '45', '31', '39');
INSERT INTO `player_levelstats` VALUES ('2', '3', '24', '34', '55', '46', '32', '40');
INSERT INTO `player_levelstats` VALUES ('2', '3', '25', '35', '57', '47', '33', '41');
INSERT INTO `player_levelstats` VALUES ('2', '3', '26', '35', '58', '48', '34', '42');
INSERT INTO `player_levelstats` VALUES ('2', '3', '27', '36', '60', '50', '34', '43');
INSERT INTO `player_levelstats` VALUES ('2', '3', '28', '36', '62', '51', '35', '43');
INSERT INTO `player_levelstats` VALUES ('2', '3', '29', '37', '63', '52', '36', '44');
INSERT INTO `player_levelstats` VALUES ('2', '3', '30', '38', '65', '53', '37', '45');
INSERT INTO `player_levelstats` VALUES ('2', '3', '31', '38', '67', '54', '37', '46');
INSERT INTO `player_levelstats` VALUES ('2', '3', '32', '39', '69', '56', '38', '47');
INSERT INTO `player_levelstats` VALUES ('2', '3', '33', '39', '71', '57', '39', '48');
INSERT INTO `player_levelstats` VALUES ('2', '3', '34', '40', '72', '58', '40', '49');
INSERT INTO `player_levelstats` VALUES ('2', '3', '35', '41', '74', '59', '41', '49');
INSERT INTO `player_levelstats` VALUES ('2', '3', '36', '41', '76', '61', '42', '50');
INSERT INTO `player_levelstats` VALUES ('2', '3', '37', '42', '78', '62', '42', '51');
INSERT INTO `player_levelstats` VALUES ('2', '3', '38', '43', '80', '63', '43', '52');
INSERT INTO `player_levelstats` VALUES ('2', '3', '39', '43', '82', '64', '44', '53');
INSERT INTO `player_levelstats` VALUES ('2', '3', '40', '44', '84', '66', '45', '54');
INSERT INTO `player_levelstats` VALUES ('2', '3', '41', '45', '86', '67', '46', '55');
INSERT INTO `player_levelstats` VALUES ('2', '3', '42', '45', '88', '68', '47', '56');
INSERT INTO `player_levelstats` VALUES ('2', '3', '43', '46', '90', '70', '47', '57');
INSERT INTO `player_levelstats` VALUES ('2', '3', '44', '47', '91', '71', '48', '58');
INSERT INTO `player_levelstats` VALUES ('2', '3', '45', '47', '93', '72', '49', '59');
INSERT INTO `player_levelstats` VALUES ('2', '3', '46', '48', '95', '74', '50', '60');
INSERT INTO `player_levelstats` VALUES ('2', '3', '47', '49', '98', '75', '51', '61');
INSERT INTO `player_levelstats` VALUES ('2', '3', '48', '50', '100', '77', '52', '62');
INSERT INTO `player_levelstats` VALUES ('2', '3', '49', '50', '102', '78', '53', '63');
INSERT INTO `player_levelstats` VALUES ('2', '3', '50', '51', '104', '79', '54', '64');
INSERT INTO `player_levelstats` VALUES ('2', '3', '51', '52', '106', '81', '55', '65');
INSERT INTO `player_levelstats` VALUES ('2', '3', '52', '52', '108', '82', '56', '66');
INSERT INTO `player_levelstats` VALUES ('2', '3', '53', '53', '110', '84', '57', '67');
INSERT INTO `player_levelstats` VALUES ('2', '3', '54', '54', '112', '85', '58', '68');
INSERT INTO `player_levelstats` VALUES ('2', '3', '55', '55', '114', '87', '59', '69');
INSERT INTO `player_levelstats` VALUES ('2', '3', '56', '55', '116', '88', '60', '70');
INSERT INTO `player_levelstats` VALUES ('2', '3', '57', '56', '118', '90', '61', '71');
INSERT INTO `player_levelstats` VALUES ('2', '3', '58', '57', '121', '91', '62', '72');
INSERT INTO `player_levelstats` VALUES ('2', '3', '59', '58', '123', '93', '63', '73');
INSERT INTO `player_levelstats` VALUES ('2', '3', '60', '59', '125', '94', '64', '74');
INSERT INTO `player_levelstats` VALUES ('2', '3', '61', '59', '127', '96', '65', '76');
INSERT INTO `player_levelstats` VALUES ('2', '3', '62', '60', '130', '97', '66', '77');
INSERT INTO `player_levelstats` VALUES ('2', '3', '63', '61', '132', '99', '67', '78');
INSERT INTO `player_levelstats` VALUES ('2', '3', '64', '62', '134', '100', '68', '79');
INSERT INTO `player_levelstats` VALUES ('2', '3', '65', '63', '136', '102', '69', '80');
INSERT INTO `player_levelstats` VALUES ('2', '3', '66', '64', '139', '104', '70', '81');
INSERT INTO `player_levelstats` VALUES ('2', '3', '67', '64', '141', '105', '71', '82');
INSERT INTO `player_levelstats` VALUES ('2', '3', '68', '65', '143', '107', '72', '84');
INSERT INTO `player_levelstats` VALUES ('2', '3', '69', '66', '146', '108', '73', '85');
INSERT INTO `player_levelstats` VALUES ('2', '3', '70', '67', '148', '110', '74', '86');
INSERT INTO `player_levelstats` VALUES ('2', '4', '1', '24', '20', '23', '17', '23');
INSERT INTO `player_levelstats` VALUES ('2', '4', '2', '25', '21', '24', '17', '23');
INSERT INTO `player_levelstats` VALUES ('2', '4', '3', '25', '23', '24', '17', '24');
INSERT INTO `player_levelstats` VALUES ('2', '4', '4', '26', '24', '25', '17', '24');
INSERT INTO `player_levelstats` VALUES ('2', '4', '5', '27', '26', '26', '18', '24');
INSERT INTO `player_levelstats` VALUES ('2', '4', '6', '28', '27', '26', '18', '25');
INSERT INTO `player_levelstats` VALUES ('2', '4', '7', '29', '29', '27', '18', '25');
INSERT INTO `player_levelstats` VALUES ('2', '4', '8', '29', '30', '28', '18', '26');
INSERT INTO `player_levelstats` VALUES ('2', '4', '9', '30', '32', '29', '18', '26');
INSERT INTO `player_levelstats` VALUES ('2', '4', '10', '31', '33', '29', '19', '26');
INSERT INTO `player_levelstats` VALUES ('2', '4', '11', '32', '35', '30', '19', '27');
INSERT INTO `player_levelstats` VALUES ('2', '4', '12', '33', '37', '31', '19', '27');
INSERT INTO `player_levelstats` VALUES ('2', '4', '13', '34', '38', '32', '19', '28');
INSERT INTO `player_levelstats` VALUES ('2', '4', '14', '34', '40', '32', '19', '28');
INSERT INTO `player_levelstats` VALUES ('2', '4', '15', '35', '41', '33', '19', '28');
INSERT INTO `player_levelstats` VALUES ('2', '4', '16', '36', '43', '34', '20', '29');
INSERT INTO `player_levelstats` VALUES ('2', '4', '17', '37', '45', '35', '20', '29');
INSERT INTO `player_levelstats` VALUES ('2', '4', '18', '38', '46', '36', '20', '30');
INSERT INTO `player_levelstats` VALUES ('2', '4', '19', '39', '48', '37', '20', '30');
INSERT INTO `player_levelstats` VALUES ('2', '4', '20', '40', '50', '37', '21', '31');
INSERT INTO `player_levelstats` VALUES ('2', '4', '21', '41', '52', '38', '21', '31');
INSERT INTO `player_levelstats` VALUES ('2', '4', '22', '42', '53', '39', '21', '31');
INSERT INTO `player_levelstats` VALUES ('2', '4', '23', '43', '55', '40', '21', '32');
INSERT INTO `player_levelstats` VALUES ('2', '4', '24', '43', '57', '41', '21', '32');
INSERT INTO `player_levelstats` VALUES ('2', '4', '25', '44', '59', '42', '22', '33');
INSERT INTO `player_levelstats` VALUES ('2', '4', '26', '45', '60', '43', '22', '33');
INSERT INTO `player_levelstats` VALUES ('2', '4', '27', '46', '62', '44', '22', '34');
INSERT INTO `player_levelstats` VALUES ('2', '4', '28', '47', '64', '44', '22', '34');
INSERT INTO `player_levelstats` VALUES ('2', '4', '29', '48', '66', '45', '23', '35');
INSERT INTO `player_levelstats` VALUES ('2', '4', '30', '49', '68', '46', '23', '35');
INSERT INTO `player_levelstats` VALUES ('2', '4', '31', '50', '70', '47', '23', '36');
INSERT INTO `player_levelstats` VALUES ('2', '4', '32', '51', '72', '48', '23', '36');
INSERT INTO `player_levelstats` VALUES ('2', '4', '33', '53', '73', '49', '24', '37');
INSERT INTO `player_levelstats` VALUES ('2', '4', '34', '54', '75', '50', '24', '38');
INSERT INTO `player_levelstats` VALUES ('2', '4', '35', '55', '77', '51', '24', '38');
INSERT INTO `player_levelstats` VALUES ('2', '4', '36', '56', '79', '52', '24', '39');
INSERT INTO `player_levelstats` VALUES ('2', '4', '37', '57', '81', '53', '25', '39');
INSERT INTO `player_levelstats` VALUES ('2', '4', '38', '58', '83', '54', '25', '40');
INSERT INTO `player_levelstats` VALUES ('2', '4', '39', '59', '85', '55', '25', '40');
INSERT INTO `player_levelstats` VALUES ('2', '4', '40', '60', '87', '56', '26', '41');
INSERT INTO `player_levelstats` VALUES ('2', '4', '41', '61', '89', '57', '26', '41');
INSERT INTO `player_levelstats` VALUES ('2', '4', '42', '62', '91', '58', '26', '42');
INSERT INTO `player_levelstats` VALUES ('2', '4', '43', '63', '93', '59', '27', '43');
INSERT INTO `player_levelstats` VALUES ('2', '4', '44', '65', '95', '60', '27', '43');
INSERT INTO `player_levelstats` VALUES ('2', '4', '45', '66', '98', '61', '27', '44');
INSERT INTO `player_levelstats` VALUES ('2', '4', '46', '67', '100', '62', '27', '44');
INSERT INTO `player_levelstats` VALUES ('2', '4', '47', '68', '102', '64', '28', '45');
INSERT INTO `player_levelstats` VALUES ('2', '4', '48', '69', '104', '65', '28', '46');
INSERT INTO `player_levelstats` VALUES ('2', '4', '49', '71', '106', '66', '28', '46');
INSERT INTO `player_levelstats` VALUES ('2', '4', '50', '72', '108', '67', '29', '47');
INSERT INTO `player_levelstats` VALUES ('2', '4', '51', '73', '110', '68', '29', '48');
INSERT INTO `player_levelstats` VALUES ('2', '4', '52', '74', '113', '69', '29', '48');
INSERT INTO `player_levelstats` VALUES ('2', '4', '53', '75', '115', '70', '30', '49');
INSERT INTO `player_levelstats` VALUES ('2', '4', '54', '77', '117', '71', '30', '50');
INSERT INTO `player_levelstats` VALUES ('2', '4', '55', '78', '119', '73', '30', '50');
INSERT INTO `player_levelstats` VALUES ('2', '4', '56', '79', '122', '74', '31', '51');
INSERT INTO `player_levelstats` VALUES ('2', '4', '57', '80', '124', '75', '31', '52');
INSERT INTO `player_levelstats` VALUES ('2', '4', '58', '82', '126', '76', '31', '52');
INSERT INTO `player_levelstats` VALUES ('2', '4', '59', '83', '129', '77', '32', '53');
INSERT INTO `player_levelstats` VALUES ('2', '4', '60', '84', '131', '78', '32', '54');
INSERT INTO `player_levelstats` VALUES ('2', '4', '61', '86', '133', '80', '33', '54');
INSERT INTO `player_levelstats` VALUES ('2', '4', '62', '87', '136', '81', '33', '55');
INSERT INTO `player_levelstats` VALUES ('2', '4', '63', '88', '138', '82', '33', '56');
INSERT INTO `player_levelstats` VALUES ('2', '4', '64', '90', '140', '83', '34', '57');
INSERT INTO `player_levelstats` VALUES ('2', '4', '65', '91', '143', '85', '34', '57');
INSERT INTO `player_levelstats` VALUES ('2', '4', '66', '92', '145', '86', '34', '58');
INSERT INTO `player_levelstats` VALUES ('2', '4', '67', '94', '148', '87', '35', '59');
INSERT INTO `player_levelstats` VALUES ('2', '4', '68', '95', '150', '88', '35', '59');
INSERT INTO `player_levelstats` VALUES ('2', '4', '69', '97', '153', '90', '36', '60');
INSERT INTO `player_levelstats` VALUES ('2', '4', '70', '98', '155', '91', '36', '61');
INSERT INTO `player_levelstats` VALUES ('2', '7', '1', '24', '17', '23', '18', '25');
INSERT INTO `player_levelstats` VALUES ('2', '7', '2', '25', '17', '24', '19', '26');
INSERT INTO `player_levelstats` VALUES ('2', '7', '3', '26', '18', '25', '20', '27');
INSERT INTO `player_levelstats` VALUES ('2', '7', '4', '26', '18', '26', '21', '28');
INSERT INTO `player_levelstats` VALUES ('2', '7', '5', '27', '19', '27', '22', '29');
INSERT INTO `player_levelstats` VALUES ('2', '7', '6', '28', '19', '28', '23', '30');
INSERT INTO `player_levelstats` VALUES ('2', '7', '7', '29', '20', '29', '24', '31');
INSERT INTO `player_levelstats` VALUES ('2', '7', '8', '30', '20', '30', '25', '32');
INSERT INTO `player_levelstats` VALUES ('2', '7', '9', '31', '21', '31', '26', '33');
INSERT INTO `player_levelstats` VALUES ('2', '7', '10', '32', '21', '32', '27', '34');
INSERT INTO `player_levelstats` VALUES ('2', '7', '11', '33', '22', '33', '28', '36');
INSERT INTO `player_levelstats` VALUES ('2', '7', '12', '34', '22', '34', '29', '37');
INSERT INTO `player_levelstats` VALUES ('2', '7', '13', '34', '23', '35', '30', '38');
INSERT INTO `player_levelstats` VALUES ('2', '7', '14', '35', '23', '36', '31', '39');
INSERT INTO `player_levelstats` VALUES ('2', '7', '15', '36', '24', '37', '32', '40');
INSERT INTO `player_levelstats` VALUES ('2', '7', '16', '37', '24', '39', '33', '41');
INSERT INTO `player_levelstats` VALUES ('2', '7', '17', '38', '25', '40', '34', '43');
INSERT INTO `player_levelstats` VALUES ('2', '7', '18', '39', '25', '41', '35', '44');
INSERT INTO `player_levelstats` VALUES ('2', '7', '19', '40', '26', '42', '36', '45');
INSERT INTO `player_levelstats` VALUES ('2', '7', '20', '41', '26', '43', '37', '46');
INSERT INTO `player_levelstats` VALUES ('2', '7', '21', '42', '27', '44', '38', '47');
INSERT INTO `player_levelstats` VALUES ('2', '7', '22', '43', '27', '45', '39', '49');
INSERT INTO `player_levelstats` VALUES ('2', '7', '23', '44', '28', '47', '40', '50');
INSERT INTO `player_levelstats` VALUES ('2', '7', '24', '45', '28', '48', '41', '51');
INSERT INTO `player_levelstats` VALUES ('2', '7', '25', '47', '29', '49', '43', '52');
INSERT INTO `player_levelstats` VALUES ('2', '7', '26', '48', '30', '50', '44', '54');
INSERT INTO `player_levelstats` VALUES ('2', '7', '27', '49', '30', '52', '45', '55');
INSERT INTO `player_levelstats` VALUES ('2', '7', '28', '50', '31', '53', '46', '56');
INSERT INTO `player_levelstats` VALUES ('2', '7', '29', '51', '31', '54', '47', '58');
INSERT INTO `player_levelstats` VALUES ('2', '7', '30', '52', '32', '55', '48', '59');
INSERT INTO `player_levelstats` VALUES ('2', '7', '31', '53', '33', '57', '50', '60');
INSERT INTO `player_levelstats` VALUES ('2', '7', '32', '54', '33', '58', '51', '62');
INSERT INTO `player_levelstats` VALUES ('2', '7', '33', '55', '34', '59', '52', '63');
INSERT INTO `player_levelstats` VALUES ('2', '7', '34', '57', '34', '61', '53', '65');
INSERT INTO `player_levelstats` VALUES ('2', '7', '35', '58', '35', '62', '55', '66');
INSERT INTO `player_levelstats` VALUES ('2', '7', '36', '59', '36', '63', '56', '67');
INSERT INTO `player_levelstats` VALUES ('2', '7', '37', '60', '36', '65', '57', '69');
INSERT INTO `player_levelstats` VALUES ('2', '7', '38', '61', '37', '66', '58', '70');
INSERT INTO `player_levelstats` VALUES ('2', '7', '39', '62', '38', '67', '60', '72');
INSERT INTO `player_levelstats` VALUES ('2', '7', '40', '64', '38', '69', '61', '73');
INSERT INTO `player_levelstats` VALUES ('2', '7', '41', '65', '39', '70', '62', '75');
INSERT INTO `player_levelstats` VALUES ('2', '7', '42', '66', '40', '72', '64', '76');
INSERT INTO `player_levelstats` VALUES ('2', '7', '43', '67', '40', '73', '65', '78');
INSERT INTO `player_levelstats` VALUES ('2', '7', '44', '69', '41', '74', '66', '79');
INSERT INTO `player_levelstats` VALUES ('2', '7', '45', '70', '42', '76', '68', '81');
INSERT INTO `player_levelstats` VALUES ('2', '7', '46', '71', '42', '77', '69', '82');
INSERT INTO `player_levelstats` VALUES ('2', '7', '47', '72', '43', '79', '70', '84');
INSERT INTO `player_levelstats` VALUES ('2', '7', '48', '74', '44', '80', '72', '85');
INSERT INTO `player_levelstats` VALUES ('2', '7', '49', '75', '45', '82', '73', '87');
INSERT INTO `player_levelstats` VALUES ('2', '7', '50', '76', '45', '83', '75', '89');
INSERT INTO `player_levelstats` VALUES ('2', '7', '51', '78', '46', '85', '76', '90');
INSERT INTO `player_levelstats` VALUES ('2', '7', '52', '79', '47', '86', '77', '92');
INSERT INTO `player_levelstats` VALUES ('2', '7', '53', '80', '47', '88', '79', '93');
INSERT INTO `player_levelstats` VALUES ('2', '7', '54', '82', '48', '90', '80', '95');
INSERT INTO `player_levelstats` VALUES ('2', '7', '55', '83', '49', '91', '82', '97');
INSERT INTO `player_levelstats` VALUES ('2', '7', '56', '85', '50', '93', '83', '98');
INSERT INTO `player_levelstats` VALUES ('2', '7', '57', '86', '50', '94', '85', '100');
INSERT INTO `player_levelstats` VALUES ('2', '7', '58', '87', '51', '96', '86', '102');
INSERT INTO `player_levelstats` VALUES ('2', '7', '59', '89', '52', '97', '88', '103');
INSERT INTO `player_levelstats` VALUES ('2', '7', '60', '90', '53', '99', '89', '105');
INSERT INTO `player_levelstats` VALUES ('2', '7', '61', '92', '54', '101', '91', '107');
INSERT INTO `player_levelstats` VALUES ('2', '7', '62', '93', '54', '102', '92', '109');
INSERT INTO `player_levelstats` VALUES ('2', '7', '63', '95', '55', '104', '94', '110');
INSERT INTO `player_levelstats` VALUES ('2', '7', '64', '96', '56', '106', '95', '112');
INSERT INTO `player_levelstats` VALUES ('2', '7', '65', '97', '57', '107', '97', '114');
INSERT INTO `player_levelstats` VALUES ('2', '7', '66', '99', '58', '109', '99', '116');
INSERT INTO `player_levelstats` VALUES ('2', '7', '67', '100', '58', '111', '100', '118');
INSERT INTO `player_levelstats` VALUES ('2', '7', '68', '102', '59', '113', '102', '119');
INSERT INTO `player_levelstats` VALUES ('2', '7', '69', '103', '60', '114', '103', '121');
INSERT INTO `player_levelstats` VALUES ('2', '7', '70', '105', '61', '116', '105', '123');
INSERT INTO `player_levelstats` VALUES ('2', '9', '1', '23', '17', '23', '19', '25');
INSERT INTO `player_levelstats` VALUES ('2', '9', '2', '23', '17', '24', '20', '26');
INSERT INTO `player_levelstats` VALUES ('2', '9', '3', '24', '18', '24', '21', '27');
INSERT INTO `player_levelstats` VALUES ('2', '9', '4', '24', '18', '25', '23', '28');
INSERT INTO `player_levelstats` VALUES ('2', '9', '5', '24', '18', '25', '24', '30');
INSERT INTO `player_levelstats` VALUES ('2', '9', '6', '24', '19', '26', '25', '31');
INSERT INTO `player_levelstats` VALUES ('2', '9', '7', '25', '19', '26', '26', '32');
INSERT INTO `player_levelstats` VALUES ('2', '9', '8', '25', '20', '27', '27', '33');
INSERT INTO `player_levelstats` VALUES ('2', '9', '9', '25', '20', '27', '29', '34');
INSERT INTO `player_levelstats` VALUES ('2', '9', '10', '26', '20', '28', '30', '36');
INSERT INTO `player_levelstats` VALUES ('2', '9', '11', '26', '21', '29', '31', '37');
INSERT INTO `player_levelstats` VALUES ('2', '9', '12', '26', '21', '29', '33', '38');
INSERT INTO `player_levelstats` VALUES ('2', '9', '13', '27', '22', '30', '34', '39');
INSERT INTO `player_levelstats` VALUES ('2', '9', '14', '27', '22', '31', '35', '41');
INSERT INTO `player_levelstats` VALUES ('2', '9', '15', '27', '23', '31', '37', '42');
INSERT INTO `player_levelstats` VALUES ('2', '9', '16', '28', '23', '32', '38', '43');
INSERT INTO `player_levelstats` VALUES ('2', '9', '17', '28', '23', '32', '39', '45');
INSERT INTO `player_levelstats` VALUES ('2', '9', '18', '28', '24', '33', '41', '46');
INSERT INTO `player_levelstats` VALUES ('2', '9', '19', '29', '24', '34', '42', '47');
INSERT INTO `player_levelstats` VALUES ('2', '9', '20', '29', '25', '34', '43', '49');
INSERT INTO `player_levelstats` VALUES ('2', '9', '21', '29', '25', '35', '45', '50');
INSERT INTO `player_levelstats` VALUES ('2', '9', '22', '30', '26', '36', '46', '51');
INSERT INTO `player_levelstats` VALUES ('2', '9', '23', '30', '26', '37', '48', '53');
INSERT INTO `player_levelstats` VALUES ('2', '9', '24', '30', '27', '37', '49', '54');
INSERT INTO `player_levelstats` VALUES ('2', '9', '25', '31', '27', '38', '51', '56');
INSERT INTO `player_levelstats` VALUES ('2', '9', '26', '31', '28', '39', '52', '57');
INSERT INTO `player_levelstats` VALUES ('2', '9', '27', '32', '28', '39', '54', '59');
INSERT INTO `player_levelstats` VALUES ('2', '9', '28', '32', '29', '40', '55', '60');
INSERT INTO `player_levelstats` VALUES ('2', '9', '29', '32', '29', '41', '57', '62');
INSERT INTO `player_levelstats` VALUES ('2', '9', '30', '33', '30', '42', '58', '63');
INSERT INTO `player_levelstats` VALUES ('2', '9', '31', '33', '30', '42', '60', '65');
INSERT INTO `player_levelstats` VALUES ('2', '9', '32', '34', '31', '43', '61', '66');
INSERT INTO `player_levelstats` VALUES ('2', '9', '33', '34', '31', '44', '63', '68');
INSERT INTO `player_levelstats` VALUES ('2', '9', '34', '35', '32', '45', '64', '69');
INSERT INTO `player_levelstats` VALUES ('2', '9', '35', '35', '32', '45', '66', '71');
INSERT INTO `player_levelstats` VALUES ('2', '9', '36', '36', '33', '46', '68', '72');
INSERT INTO `player_levelstats` VALUES ('2', '9', '37', '36', '34', '47', '69', '74');
INSERT INTO `player_levelstats` VALUES ('2', '9', '38', '36', '34', '48', '71', '76');
INSERT INTO `player_levelstats` VALUES ('2', '9', '39', '37', '35', '49', '72', '77');
INSERT INTO `player_levelstats` VALUES ('2', '9', '40', '37', '35', '50', '74', '79');
INSERT INTO `player_levelstats` VALUES ('2', '9', '41', '38', '36', '50', '76', '80');
INSERT INTO `player_levelstats` VALUES ('2', '9', '42', '38', '36', '51', '77', '82');
INSERT INTO `player_levelstats` VALUES ('2', '9', '43', '39', '37', '52', '79', '84');
INSERT INTO `player_levelstats` VALUES ('2', '9', '44', '39', '38', '53', '81', '85');
INSERT INTO `player_levelstats` VALUES ('2', '9', '45', '40', '38', '54', '83', '87');
INSERT INTO `player_levelstats` VALUES ('2', '9', '46', '40', '39', '55', '84', '89');
INSERT INTO `player_levelstats` VALUES ('2', '9', '47', '41', '39', '56', '86', '91');
INSERT INTO `player_levelstats` VALUES ('2', '9', '48', '41', '40', '56', '88', '92');
INSERT INTO `player_levelstats` VALUES ('2', '9', '49', '42', '41', '57', '90', '94');
INSERT INTO `player_levelstats` VALUES ('2', '9', '50', '42', '41', '58', '91', '96');
INSERT INTO `player_levelstats` VALUES ('2', '9', '51', '43', '42', '59', '93', '98');
INSERT INTO `player_levelstats` VALUES ('2', '9', '52', '43', '43', '60', '95', '99');
INSERT INTO `player_levelstats` VALUES ('2', '9', '53', '44', '43', '61', '97', '101');
INSERT INTO `player_levelstats` VALUES ('2', '9', '54', '45', '44', '62', '99', '103');
INSERT INTO `player_levelstats` VALUES ('2', '9', '55', '45', '45', '63', '101', '105');
INSERT INTO `player_levelstats` VALUES ('2', '9', '56', '46', '45', '64', '102', '107');
INSERT INTO `player_levelstats` VALUES ('2', '9', '57', '46', '46', '65', '104', '109');
INSERT INTO `player_levelstats` VALUES ('2', '9', '58', '47', '47', '66', '106', '110');
INSERT INTO `player_levelstats` VALUES ('2', '9', '59', '47', '47', '67', '108', '112');
INSERT INTO `player_levelstats` VALUES ('2', '9', '60', '48', '48', '68', '110', '114');
INSERT INTO `player_levelstats` VALUES ('2', '9', '61', '48', '49', '69', '112', '116');
INSERT INTO `player_levelstats` VALUES ('2', '9', '62', '49', '49', '70', '114', '118');
INSERT INTO `player_levelstats` VALUES ('2', '9', '63', '50', '50', '71', '116', '120');
INSERT INTO `player_levelstats` VALUES ('2', '9', '64', '50', '51', '72', '118', '122');
INSERT INTO `player_levelstats` VALUES ('2', '9', '65', '51', '51', '73', '120', '124');
INSERT INTO `player_levelstats` VALUES ('2', '9', '66', '52', '52', '74', '122', '126');
INSERT INTO `player_levelstats` VALUES ('2', '9', '67', '52', '53', '75', '124', '128');
INSERT INTO `player_levelstats` VALUES ('2', '9', '68', '53', '54', '76', '126', '130');
INSERT INTO `player_levelstats` VALUES ('2', '9', '69', '53', '54', '77', '128', '132');
INSERT INTO `player_levelstats` VALUES ('2', '9', '70', '54', '55', '78', '130', '134');
INSERT INTO `player_levelstats` VALUES ('3', '1', '1', '25', '16', '25', '19', '19');
INSERT INTO `player_levelstats` VALUES ('3', '1', '2', '26', '17', '26', '19', '19');
INSERT INTO `player_levelstats` VALUES ('3', '1', '3', '28', '18', '27', '19', '20');
INSERT INTO `player_levelstats` VALUES ('3', '1', '4', '29', '18', '28', '19', '20');
INSERT INTO `player_levelstats` VALUES ('3', '1', '5', '30', '19', '30', '19', '20');
INSERT INTO `player_levelstats` VALUES ('3', '1', '6', '31', '20', '31', '19', '20');
INSERT INTO `player_levelstats` VALUES ('3', '1', '7', '33', '21', '32', '20', '21');
INSERT INTO `player_levelstats` VALUES ('3', '1', '8', '34', '22', '33', '20', '21');
INSERT INTO `player_levelstats` VALUES ('3', '1', '9', '36', '23', '35', '20', '21');
INSERT INTO `player_levelstats` VALUES ('3', '1', '10', '37', '23', '36', '20', '22');
INSERT INTO `player_levelstats` VALUES ('3', '1', '11', '38', '24', '37', '20', '22');
INSERT INTO `player_levelstats` VALUES ('3', '1', '12', '40', '25', '38', '20', '22');
INSERT INTO `player_levelstats` VALUES ('3', '1', '13', '41', '26', '40', '20', '23');
INSERT INTO `player_levelstats` VALUES ('3', '1', '14', '43', '27', '41', '20', '23');
INSERT INTO `player_levelstats` VALUES ('3', '1', '15', '44', '28', '42', '20', '23');
INSERT INTO `player_levelstats` VALUES ('3', '1', '16', '46', '29', '44', '21', '24');
INSERT INTO `player_levelstats` VALUES ('3', '1', '17', '47', '30', '45', '21', '24');
INSERT INTO `player_levelstats` VALUES ('3', '1', '18', '49', '31', '46', '21', '24');
INSERT INTO `player_levelstats` VALUES ('3', '1', '19', '50', '32', '48', '21', '25');
INSERT INTO `player_levelstats` VALUES ('3', '1', '20', '52', '33', '49', '21', '25');
INSERT INTO `player_levelstats` VALUES ('3', '1', '21', '53', '34', '51', '21', '26');
INSERT INTO `player_levelstats` VALUES ('3', '1', '22', '55', '34', '52', '21', '26');
INSERT INTO `player_levelstats` VALUES ('3', '1', '23', '56', '35', '53', '21', '26');
INSERT INTO `player_levelstats` VALUES ('3', '1', '24', '58', '36', '55', '22', '27');
INSERT INTO `player_levelstats` VALUES ('3', '1', '25', '59', '37', '56', '22', '27');
INSERT INTO `player_levelstats` VALUES ('3', '1', '26', '61', '38', '58', '22', '27');
INSERT INTO `player_levelstats` VALUES ('3', '1', '27', '63', '39', '59', '22', '28');
INSERT INTO `player_levelstats` VALUES ('3', '1', '28', '64', '41', '61', '22', '28');
INSERT INTO `player_levelstats` VALUES ('3', '1', '29', '66', '42', '62', '22', '29');
INSERT INTO `player_levelstats` VALUES ('3', '1', '30', '68', '43', '64', '23', '29');
INSERT INTO `player_levelstats` VALUES ('3', '1', '31', '69', '44', '65', '23', '30');
INSERT INTO `player_levelstats` VALUES ('3', '1', '32', '71', '45', '67', '23', '30');
INSERT INTO `player_levelstats` VALUES ('3', '1', '33', '73', '46', '68', '23', '30');
INSERT INTO `player_levelstats` VALUES ('3', '1', '34', '75', '47', '70', '23', '31');
INSERT INTO `player_levelstats` VALUES ('3', '1', '35', '76', '48', '72', '24', '31');
INSERT INTO `player_levelstats` VALUES ('3', '1', '36', '78', '49', '73', '24', '32');
INSERT INTO `player_levelstats` VALUES ('3', '1', '37', '80', '50', '75', '24', '32');
INSERT INTO `player_levelstats` VALUES ('3', '1', '38', '82', '51', '76', '24', '33');
INSERT INTO `player_levelstats` VALUES ('3', '1', '39', '84', '52', '78', '24', '33');
INSERT INTO `player_levelstats` VALUES ('3', '1', '40', '85', '54', '80', '24', '34');
INSERT INTO `player_levelstats` VALUES ('3', '1', '41', '87', '55', '81', '25', '34');
INSERT INTO `player_levelstats` VALUES ('3', '1', '42', '89', '56', '83', '25', '35');
INSERT INTO `player_levelstats` VALUES ('3', '1', '43', '91', '57', '85', '25', '35');
INSERT INTO `player_levelstats` VALUES ('3', '1', '44', '93', '58', '87', '25', '36');
INSERT INTO `player_levelstats` VALUES ('3', '1', '45', '95', '59', '88', '26', '36');
INSERT INTO `player_levelstats` VALUES ('3', '1', '46', '97', '61', '90', '26', '37');
INSERT INTO `player_levelstats` VALUES ('3', '1', '47', '99', '62', '92', '26', '37');
INSERT INTO `player_levelstats` VALUES ('3', '1', '48', '101', '63', '94', '26', '38');
INSERT INTO `player_levelstats` VALUES ('3', '1', '49', '102', '64', '95', '26', '38');
INSERT INTO `player_levelstats` VALUES ('3', '1', '50', '104', '65', '97', '27', '39');
INSERT INTO `player_levelstats` VALUES ('3', '1', '51', '106', '67', '99', '27', '39');
INSERT INTO `player_levelstats` VALUES ('3', '1', '52', '108', '68', '101', '27', '40');
INSERT INTO `player_levelstats` VALUES ('3', '1', '53', '110', '69', '103', '27', '40');
INSERT INTO `player_levelstats` VALUES ('3', '1', '54', '112', '70', '104', '28', '41');
INSERT INTO `player_levelstats` VALUES ('3', '1', '55', '115', '72', '106', '28', '41');
INSERT INTO `player_levelstats` VALUES ('3', '1', '56', '117', '73', '108', '28', '42');
INSERT INTO `player_levelstats` VALUES ('3', '1', '57', '119', '74', '110', '28', '42');
INSERT INTO `player_levelstats` VALUES ('3', '1', '58', '121', '76', '112', '29', '43');
INSERT INTO `player_levelstats` VALUES ('3', '1', '59', '123', '77', '114', '29', '43');
INSERT INTO `player_levelstats` VALUES ('3', '1', '60', '125', '78', '116', '29', '44');
INSERT INTO `player_levelstats` VALUES ('3', '1', '61', '127', '80', '118', '29', '45');
INSERT INTO `player_levelstats` VALUES ('3', '1', '62', '129', '81', '120', '30', '45');
INSERT INTO `player_levelstats` VALUES ('3', '1', '63', '131', '82', '122', '30', '46');
INSERT INTO `player_levelstats` VALUES ('3', '1', '64', '134', '84', '124', '30', '46');
INSERT INTO `player_levelstats` VALUES ('3', '1', '65', '136', '85', '126', '31', '47');
INSERT INTO `player_levelstats` VALUES ('3', '1', '66', '138', '86', '128', '31', '48');
INSERT INTO `player_levelstats` VALUES ('3', '1', '67', '140', '88', '130', '31', '48');
INSERT INTO `player_levelstats` VALUES ('3', '1', '68', '142', '89', '132', '31', '49');
INSERT INTO `player_levelstats` VALUES ('3', '1', '69', '145', '91', '134', '32', '49');
INSERT INTO `player_levelstats` VALUES ('3', '1', '70', '147', '92', '136', '32', '50');
INSERT INTO `player_levelstats` VALUES ('3', '2', '1', '24', '16', '25', '19', '20');
INSERT INTO `player_levelstats` VALUES ('3', '2', '2', '25', '17', '26', '20', '21');
INSERT INTO `player_levelstats` VALUES ('3', '2', '3', '26', '17', '27', '20', '21');
INSERT INTO `player_levelstats` VALUES ('3', '2', '4', '27', '18', '28', '21', '22');
INSERT INTO `player_levelstats` VALUES ('3', '2', '5', '28', '18', '29', '22', '23');
INSERT INTO `player_levelstats` VALUES ('3', '2', '6', '29', '19', '30', '22', '24');
INSERT INTO `player_levelstats` VALUES ('3', '2', '7', '31', '20', '31', '23', '24');
INSERT INTO `player_levelstats` VALUES ('3', '2', '8', '32', '20', '32', '24', '25');
INSERT INTO `player_levelstats` VALUES ('3', '2', '9', '33', '21', '33', '24', '26');
INSERT INTO `player_levelstats` VALUES ('3', '2', '10', '34', '21', '34', '25', '26');
INSERT INTO `player_levelstats` VALUES ('3', '2', '11', '35', '22', '36', '26', '27');
INSERT INTO `player_levelstats` VALUES ('3', '2', '12', '36', '23', '37', '26', '28');
INSERT INTO `player_levelstats` VALUES ('3', '2', '13', '38', '23', '38', '27', '29');
INSERT INTO `player_levelstats` VALUES ('3', '2', '14', '39', '24', '39', '28', '30');
INSERT INTO `player_levelstats` VALUES ('3', '2', '15', '40', '25', '40', '29', '30');
INSERT INTO `player_levelstats` VALUES ('3', '2', '16', '41', '25', '41', '29', '31');
INSERT INTO `player_levelstats` VALUES ('3', '2', '17', '43', '26', '43', '30', '32');
INSERT INTO `player_levelstats` VALUES ('3', '2', '18', '44', '27', '44', '31', '33');
INSERT INTO `player_levelstats` VALUES ('3', '2', '19', '45', '28', '45', '32', '34');
INSERT INTO `player_levelstats` VALUES ('3', '2', '20', '47', '28', '46', '32', '35');
INSERT INTO `player_levelstats` VALUES ('3', '2', '21', '48', '29', '47', '33', '35');
INSERT INTO `player_levelstats` VALUES ('3', '2', '22', '49', '30', '49', '34', '36');
INSERT INTO `player_levelstats` VALUES ('3', '2', '23', '51', '30', '50', '35', '37');
INSERT INTO `player_levelstats` VALUES ('3', '2', '24', '52', '31', '51', '36', '38');
INSERT INTO `player_levelstats` VALUES ('3', '2', '25', '53', '32', '52', '36', '39');
INSERT INTO `player_levelstats` VALUES ('3', '2', '26', '55', '33', '54', '37', '40');
INSERT INTO `player_levelstats` VALUES ('3', '2', '27', '56', '33', '55', '38', '41');
INSERT INTO `player_levelstats` VALUES ('3', '2', '28', '57', '34', '56', '39', '42');
INSERT INTO `player_levelstats` VALUES ('3', '2', '29', '59', '35', '58', '40', '43');
INSERT INTO `player_levelstats` VALUES ('3', '2', '30', '60', '36', '59', '41', '43');
INSERT INTO `player_levelstats` VALUES ('3', '2', '31', '62', '37', '60', '42', '44');
INSERT INTO `player_levelstats` VALUES ('3', '2', '32', '63', '37', '62', '42', '45');
INSERT INTO `player_levelstats` VALUES ('3', '2', '33', '65', '38', '63', '43', '46');
INSERT INTO `player_levelstats` VALUES ('3', '2', '34', '66', '39', '65', '44', '47');
INSERT INTO `player_levelstats` VALUES ('3', '2', '35', '68', '40', '66', '45', '48');
INSERT INTO `player_levelstats` VALUES ('3', '2', '36', '69', '41', '67', '46', '49');
INSERT INTO `player_levelstats` VALUES ('3', '2', '37', '71', '41', '69', '47', '50');
INSERT INTO `player_levelstats` VALUES ('3', '2', '38', '72', '42', '70', '48', '51');
INSERT INTO `player_levelstats` VALUES ('3', '2', '39', '74', '43', '72', '49', '52');
INSERT INTO `player_levelstats` VALUES ('3', '2', '40', '75', '44', '73', '50', '53');
INSERT INTO `player_levelstats` VALUES ('3', '2', '41', '77', '45', '75', '51', '54');
INSERT INTO `player_levelstats` VALUES ('3', '2', '42', '78', '46', '76', '52', '55');
INSERT INTO `player_levelstats` VALUES ('3', '2', '43', '80', '47', '78', '53', '56');
INSERT INTO `player_levelstats` VALUES ('3', '2', '44', '82', '47', '79', '54', '57');
INSERT INTO `player_levelstats` VALUES ('3', '2', '45', '83', '48', '81', '55', '59');
INSERT INTO `player_levelstats` VALUES ('3', '2', '46', '85', '49', '82', '56', '60');
INSERT INTO `player_levelstats` VALUES ('3', '2', '47', '87', '50', '84', '57', '61');
INSERT INTO `player_levelstats` VALUES ('3', '2', '48', '88', '51', '85', '58', '62');
INSERT INTO `player_levelstats` VALUES ('3', '2', '49', '90', '52', '87', '59', '63');
INSERT INTO `player_levelstats` VALUES ('3', '2', '50', '92', '53', '89', '60', '64');
INSERT INTO `player_levelstats` VALUES ('3', '2', '51', '93', '54', '90', '61', '65');
INSERT INTO `player_levelstats` VALUES ('3', '2', '52', '95', '55', '92', '62', '66');
INSERT INTO `player_levelstats` VALUES ('3', '2', '53', '97', '56', '93', '63', '67');
INSERT INTO `player_levelstats` VALUES ('3', '2', '54', '98', '57', '95', '64', '69');
INSERT INTO `player_levelstats` VALUES ('3', '2', '55', '100', '58', '97', '65', '70');
INSERT INTO `player_levelstats` VALUES ('3', '2', '56', '102', '59', '98', '66', '71');
INSERT INTO `player_levelstats` VALUES ('3', '2', '57', '104', '60', '100', '67', '72');
INSERT INTO `player_levelstats` VALUES ('3', '2', '58', '106', '61', '102', '68', '73');
INSERT INTO `player_levelstats` VALUES ('3', '2', '59', '107', '62', '103', '69', '74');
INSERT INTO `player_levelstats` VALUES ('3', '2', '60', '109', '63', '105', '70', '76');
INSERT INTO `player_levelstats` VALUES ('3', '2', '61', '111', '64', '107', '72', '77');
INSERT INTO `player_levelstats` VALUES ('3', '2', '62', '113', '65', '109', '73', '78');
INSERT INTO `player_levelstats` VALUES ('3', '2', '63', '115', '66', '110', '74', '79');
INSERT INTO `player_levelstats` VALUES ('3', '2', '64', '117', '67', '112', '75', '80');
INSERT INTO `player_levelstats` VALUES ('3', '2', '65', '118', '68', '114', '76', '82');
INSERT INTO `player_levelstats` VALUES ('3', '2', '66', '120', '69', '116', '77', '83');
INSERT INTO `player_levelstats` VALUES ('3', '2', '67', '122', '70', '118', '78', '84');
INSERT INTO `player_levelstats` VALUES ('3', '2', '68', '124', '71', '119', '80', '85');
INSERT INTO `player_levelstats` VALUES ('3', '2', '69', '126', '72', '121', '81', '87');
INSERT INTO `player_levelstats` VALUES ('3', '2', '70', '128', '73', '123', '82', '88');
INSERT INTO `player_levelstats` VALUES ('3', '3', '1', '22', '19', '24', '19', '20');
INSERT INTO `player_levelstats` VALUES ('3', '3', '2', '22', '20', '25', '20', '21');
INSERT INTO `player_levelstats` VALUES ('3', '3', '3', '23', '22', '26', '20', '21');
INSERT INTO `player_levelstats` VALUES ('3', '3', '4', '23', '23', '27', '21', '22');
INSERT INTO `player_levelstats` VALUES ('3', '3', '5', '24', '25', '28', '21', '23');
INSERT INTO `player_levelstats` VALUES ('3', '3', '6', '24', '26', '29', '22', '23');
INSERT INTO `player_levelstats` VALUES ('3', '3', '7', '25', '27', '29', '23', '24');
INSERT INTO `player_levelstats` VALUES ('3', '3', '8', '25', '29', '30', '23', '25');
INSERT INTO `player_levelstats` VALUES ('3', '3', '9', '25', '30', '31', '24', '25');
INSERT INTO `player_levelstats` VALUES ('3', '3', '10', '26', '32', '32', '24', '26');
INSERT INTO `player_levelstats` VALUES ('3', '3', '11', '26', '33', '33', '25', '27');
INSERT INTO `player_levelstats` VALUES ('3', '3', '12', '27', '35', '34', '26', '27');
INSERT INTO `player_levelstats` VALUES ('3', '3', '13', '27', '36', '35', '26', '28');
INSERT INTO `player_levelstats` VALUES ('3', '3', '14', '28', '38', '36', '27', '29');
INSERT INTO `player_levelstats` VALUES ('3', '3', '15', '28', '39', '37', '28', '29');
INSERT INTO `player_levelstats` VALUES ('3', '3', '16', '29', '41', '38', '28', '30');
INSERT INTO `player_levelstats` VALUES ('3', '3', '17', '29', '42', '39', '29', '31');
INSERT INTO `player_levelstats` VALUES ('3', '3', '18', '30', '44', '41', '30', '32');
INSERT INTO `player_levelstats` VALUES ('3', '3', '19', '30', '46', '42', '30', '32');
INSERT INTO `player_levelstats` VALUES ('3', '3', '20', '31', '47', '43', '31', '33');
INSERT INTO `player_levelstats` VALUES ('3', '3', '21', '32', '49', '44', '32', '34');
INSERT INTO `player_levelstats` VALUES ('3', '3', '22', '32', '51', '45', '33', '35');
INSERT INTO `player_levelstats` VALUES ('3', '3', '23', '33', '52', '46', '33', '36');
INSERT INTO `player_levelstats` VALUES ('3', '3', '24', '33', '54', '47', '34', '36');
INSERT INTO `player_levelstats` VALUES ('3', '3', '25', '34', '56', '48', '35', '37');
INSERT INTO `player_levelstats` VALUES ('3', '3', '26', '34', '57', '49', '35', '38');
INSERT INTO `player_levelstats` VALUES ('3', '3', '27', '35', '59', '51', '36', '39');
INSERT INTO `player_levelstats` VALUES ('3', '3', '28', '35', '61', '52', '37', '40');
INSERT INTO `player_levelstats` VALUES ('3', '3', '29', '36', '63', '53', '38', '40');
INSERT INTO `player_levelstats` VALUES ('3', '3', '30', '37', '64', '54', '39', '41');
INSERT INTO `player_levelstats` VALUES ('3', '3', '31', '37', '66', '55', '39', '42');
INSERT INTO `player_levelstats` VALUES ('3', '3', '32', '38', '68', '57', '40', '43');
INSERT INTO `player_levelstats` VALUES ('3', '3', '33', '38', '70', '58', '41', '44');
INSERT INTO `player_levelstats` VALUES ('3', '3', '34', '39', '71', '59', '42', '45');
INSERT INTO `player_levelstats` VALUES ('3', '3', '35', '40', '73', '60', '43', '46');
INSERT INTO `player_levelstats` VALUES ('3', '3', '36', '40', '75', '62', '43', '47');
INSERT INTO `player_levelstats` VALUES ('3', '3', '37', '41', '77', '63', '44', '47');
INSERT INTO `player_levelstats` VALUES ('3', '3', '38', '42', '79', '64', '45', '48');
INSERT INTO `player_levelstats` VALUES ('3', '3', '39', '42', '81', '65', '46', '49');
INSERT INTO `player_levelstats` VALUES ('3', '3', '40', '43', '83', '67', '47', '50');
INSERT INTO `player_levelstats` VALUES ('3', '3', '41', '44', '85', '68', '48', '51');
INSERT INTO `player_levelstats` VALUES ('3', '3', '42', '44', '87', '69', '49', '52');
INSERT INTO `player_levelstats` VALUES ('3', '3', '43', '45', '89', '71', '49', '53');
INSERT INTO `player_levelstats` VALUES ('3', '3', '44', '46', '91', '72', '50', '54');
INSERT INTO `player_levelstats` VALUES ('3', '3', '45', '46', '93', '73', '51', '55');
INSERT INTO `player_levelstats` VALUES ('3', '3', '46', '47', '95', '75', '52', '56');
INSERT INTO `player_levelstats` VALUES ('3', '3', '47', '48', '97', '76', '53', '57');
INSERT INTO `player_levelstats` VALUES ('3', '3', '48', '49', '99', '78', '54', '58');
INSERT INTO `player_levelstats` VALUES ('3', '3', '49', '49', '101', '79', '55', '59');
INSERT INTO `player_levelstats` VALUES ('3', '3', '50', '50', '103', '80', '56', '60');
INSERT INTO `player_levelstats` VALUES ('3', '3', '51', '51', '105', '82', '57', '61');
INSERT INTO `player_levelstats` VALUES ('3', '3', '52', '51', '107', '83', '58', '62');
INSERT INTO `player_levelstats` VALUES ('3', '3', '53', '52', '109', '85', '59', '63');
INSERT INTO `player_levelstats` VALUES ('3', '3', '54', '53', '111', '86', '60', '64');
INSERT INTO `player_levelstats` VALUES ('3', '3', '55', '54', '113', '88', '61', '65');
INSERT INTO `player_levelstats` VALUES ('3', '3', '56', '55', '115', '89', '62', '66');
INSERT INTO `player_levelstats` VALUES ('3', '3', '57', '55', '118', '91', '62', '67');
INSERT INTO `player_levelstats` VALUES ('3', '3', '58', '56', '120', '92', '63', '68');
INSERT INTO `player_levelstats` VALUES ('3', '3', '59', '57', '122', '94', '64', '70');
INSERT INTO `player_levelstats` VALUES ('3', '3', '60', '58', '124', '95', '65', '71');
INSERT INTO `player_levelstats` VALUES ('3', '3', '61', '58', '126', '97', '67', '72');
INSERT INTO `player_levelstats` VALUES ('3', '3', '62', '59', '129', '98', '68', '73');
INSERT INTO `player_levelstats` VALUES ('3', '3', '63', '60', '131', '100', '69', '74');
INSERT INTO `player_levelstats` VALUES ('3', '3', '64', '61', '133', '101', '70', '75');
INSERT INTO `player_levelstats` VALUES ('3', '3', '65', '62', '135', '103', '71', '76');
INSERT INTO `player_levelstats` VALUES ('3', '3', '66', '63', '138', '105', '72', '77');
INSERT INTO `player_levelstats` VALUES ('3', '3', '67', '63', '140', '106', '73', '78');
INSERT INTO `player_levelstats` VALUES ('3', '3', '68', '64', '142', '108', '74', '80');
INSERT INTO `player_levelstats` VALUES ('3', '3', '69', '65', '145', '109', '75', '81');
INSERT INTO `player_levelstats` VALUES ('3', '3', '70', '66', '147', '111', '76', '82');
INSERT INTO `player_levelstats` VALUES ('3', '4', '1', '23', '19', '24', '19', '19');
INSERT INTO `player_levelstats` VALUES ('3', '4', '2', '24', '20', '25', '19', '19');
INSERT INTO `player_levelstats` VALUES ('3', '4', '3', '24', '22', '25', '19', '20');
INSERT INTO `player_levelstats` VALUES ('3', '4', '4', '25', '23', '26', '19', '20');
INSERT INTO `player_levelstats` VALUES ('3', '4', '5', '26', '25', '27', '20', '20');
INSERT INTO `player_levelstats` VALUES ('3', '4', '6', '27', '26', '27', '20', '21');
INSERT INTO `player_levelstats` VALUES ('3', '4', '7', '28', '28', '28', '20', '21');
INSERT INTO `player_levelstats` VALUES ('3', '4', '8', '28', '29', '29', '20', '22');
INSERT INTO `player_levelstats` VALUES ('3', '4', '9', '29', '31', '30', '20', '22');
INSERT INTO `player_levelstats` VALUES ('3', '4', '10', '30', '32', '30', '20', '22');
INSERT INTO `player_levelstats` VALUES ('3', '4', '11', '31', '34', '31', '21', '23');
INSERT INTO `player_levelstats` VALUES ('3', '4', '12', '32', '36', '32', '21', '23');
INSERT INTO `player_levelstats` VALUES ('3', '4', '13', '33', '37', '33', '21', '24');
INSERT INTO `player_levelstats` VALUES ('3', '4', '14', '33', '39', '33', '21', '24');
INSERT INTO `player_levelstats` VALUES ('3', '4', '15', '34', '40', '34', '21', '25');
INSERT INTO `player_levelstats` VALUES ('3', '4', '16', '35', '42', '35', '22', '25');
INSERT INTO `player_levelstats` VALUES ('3', '4', '17', '36', '44', '36', '22', '25');
INSERT INTO `player_levelstats` VALUES ('3', '4', '18', '37', '45', '37', '22', '26');
INSERT INTO `player_levelstats` VALUES ('3', '4', '19', '38', '47', '38', '22', '26');
INSERT INTO `player_levelstats` VALUES ('3', '4', '20', '39', '49', '38', '22', '27');
INSERT INTO `player_levelstats` VALUES ('3', '4', '21', '40', '51', '39', '23', '27');
INSERT INTO `player_levelstats` VALUES ('3', '4', '22', '41', '52', '40', '23', '28');
INSERT INTO `player_levelstats` VALUES ('3', '4', '23', '42', '54', '41', '23', '28');
INSERT INTO `player_levelstats` VALUES ('3', '4', '24', '43', '56', '42', '23', '29');
INSERT INTO `player_levelstats` VALUES ('3', '4', '25', '44', '58', '43', '24', '29');
INSERT INTO `player_levelstats` VALUES ('3', '4', '26', '44', '59', '44', '24', '30');
INSERT INTO `player_levelstats` VALUES ('3', '4', '27', '45', '61', '44', '24', '30');
INSERT INTO `player_levelstats` VALUES ('3', '4', '28', '46', '63', '45', '24', '31');
INSERT INTO `player_levelstats` VALUES ('3', '4', '29', '47', '65', '46', '25', '31');
INSERT INTO `player_levelstats` VALUES ('3', '4', '30', '48', '67', '47', '25', '32');
INSERT INTO `player_levelstats` VALUES ('3', '4', '31', '49', '69', '48', '25', '32');
INSERT INTO `player_levelstats` VALUES ('3', '4', '32', '51', '71', '49', '25', '33');
INSERT INTO `player_levelstats` VALUES ('3', '4', '33', '52', '72', '50', '26', '33');
INSERT INTO `player_levelstats` VALUES ('3', '4', '34', '53', '74', '51', '26', '34');
INSERT INTO `player_levelstats` VALUES ('3', '4', '35', '54', '76', '52', '26', '34');
INSERT INTO `player_levelstats` VALUES ('3', '4', '36', '55', '78', '53', '26', '35');
INSERT INTO `player_levelstats` VALUES ('3', '4', '37', '56', '80', '54', '27', '35');
INSERT INTO `player_levelstats` VALUES ('3', '4', '38', '57', '82', '55', '27', '36');
INSERT INTO `player_levelstats` VALUES ('3', '4', '39', '58', '84', '56', '27', '37');
INSERT INTO `player_levelstats` VALUES ('3', '4', '40', '59', '86', '57', '28', '37');
INSERT INTO `player_levelstats` VALUES ('3', '4', '41', '60', '88', '58', '28', '38');
INSERT INTO `player_levelstats` VALUES ('3', '4', '42', '61', '90', '59', '28', '38');
INSERT INTO `player_levelstats` VALUES ('3', '4', '43', '63', '92', '60', '28', '39');
INSERT INTO `player_levelstats` VALUES ('3', '4', '44', '64', '95', '61', '29', '39');
INSERT INTO `player_levelstats` VALUES ('3', '4', '45', '65', '97', '62', '29', '40');
INSERT INTO `player_levelstats` VALUES ('3', '4', '46', '66', '99', '63', '29', '41');
INSERT INTO `player_levelstats` VALUES ('3', '4', '47', '67', '101', '64', '30', '41');
INSERT INTO `player_levelstats` VALUES ('3', '4', '48', '68', '103', '66', '30', '42');
INSERT INTO `player_levelstats` VALUES ('3', '4', '49', '70', '105', '67', '30', '43');
INSERT INTO `player_levelstats` VALUES ('3', '4', '50', '71', '107', '68', '31', '43');
INSERT INTO `player_levelstats` VALUES ('3', '4', '51', '72', '110', '69', '31', '44');
INSERT INTO `player_levelstats` VALUES ('3', '4', '52', '73', '112', '70', '31', '44');
INSERT INTO `player_levelstats` VALUES ('3', '4', '53', '74', '114', '71', '32', '45');
INSERT INTO `player_levelstats` VALUES ('3', '4', '54', '76', '116', '72', '32', '46');
INSERT INTO `player_levelstats` VALUES ('3', '4', '55', '77', '118', '73', '32', '46');
INSERT INTO `player_levelstats` VALUES ('3', '4', '56', '78', '121', '75', '33', '47');
INSERT INTO `player_levelstats` VALUES ('3', '4', '57', '80', '123', '76', '33', '48');
INSERT INTO `player_levelstats` VALUES ('3', '4', '58', '81', '125', '77', '33', '48');
INSERT INTO `player_levelstats` VALUES ('3', '4', '59', '82', '128', '78', '34', '49');
INSERT INTO `player_levelstats` VALUES ('3', '4', '60', '83', '130', '79', '34', '50');
INSERT INTO `player_levelstats` VALUES ('3', '4', '61', '85', '132', '81', '34', '51');
INSERT INTO `player_levelstats` VALUES ('3', '4', '62', '86', '135', '82', '35', '51');
INSERT INTO `player_levelstats` VALUES ('3', '4', '63', '87', '137', '83', '35', '52');
INSERT INTO `player_levelstats` VALUES ('3', '4', '64', '89', '139', '84', '36', '53');
INSERT INTO `player_levelstats` VALUES ('3', '4', '65', '90', '142', '86', '36', '53');
INSERT INTO `player_levelstats` VALUES ('3', '4', '66', '91', '144', '87', '36', '54');
INSERT INTO `player_levelstats` VALUES ('3', '4', '67', '93', '147', '88', '37', '55');
INSERT INTO `player_levelstats` VALUES ('3', '4', '68', '94', '149', '89', '37', '56');
INSERT INTO `player_levelstats` VALUES ('3', '4', '69', '96', '152', '91', '38', '56');
INSERT INTO `player_levelstats` VALUES ('3', '4', '70', '97', '154', '92', '38', '57');
INSERT INTO `player_levelstats` VALUES ('3', '5', '1', '22', '16', '23', '21', '22');
INSERT INTO `player_levelstats` VALUES ('3', '5', '2', '22', '16', '23', '22', '23');
INSERT INTO `player_levelstats` VALUES ('3', '5', '3', '22', '16', '24', '24', '25');
INSERT INTO `player_levelstats` VALUES ('3', '5', '4', '22', '17', '24', '25', '26');
INSERT INTO `player_levelstats` VALUES ('3', '5', '5', '23', '17', '24', '26', '27');
INSERT INTO `player_levelstats` VALUES ('3', '5', '6', '23', '17', '25', '28', '29');
INSERT INTO `player_levelstats` VALUES ('3', '5', '7', '23', '17', '25', '29', '30');
INSERT INTO `player_levelstats` VALUES ('3', '5', '8', '23', '18', '26', '30', '32');
INSERT INTO `player_levelstats` VALUES ('3', '5', '9', '23', '18', '26', '32', '33');
INSERT INTO `player_levelstats` VALUES ('3', '5', '10', '23', '18', '26', '33', '35');
INSERT INTO `player_levelstats` VALUES ('3', '5', '11', '24', '18', '27', '35', '36');
INSERT INTO `player_levelstats` VALUES ('3', '5', '12', '24', '19', '27', '36', '38');
INSERT INTO `player_levelstats` VALUES ('3', '5', '13', '24', '19', '28', '37', '39');
INSERT INTO `player_levelstats` VALUES ('3', '5', '14', '24', '19', '28', '39', '41');
INSERT INTO `player_levelstats` VALUES ('3', '5', '15', '24', '19', '28', '40', '42');
INSERT INTO `player_levelstats` VALUES ('3', '5', '16', '24', '20', '29', '42', '44');
INSERT INTO `player_levelstats` VALUES ('3', '5', '17', '25', '20', '29', '43', '45');
INSERT INTO `player_levelstats` VALUES ('3', '5', '18', '25', '20', '30', '45', '47');
INSERT INTO `player_levelstats` VALUES ('3', '5', '19', '25', '21', '30', '46', '49');
INSERT INTO `player_levelstats` VALUES ('3', '5', '20', '25', '21', '31', '48', '50');
INSERT INTO `player_levelstats` VALUES ('3', '5', '21', '25', '21', '31', '50', '52');
INSERT INTO `player_levelstats` VALUES ('3', '5', '22', '26', '22', '31', '51', '53');
INSERT INTO `player_levelstats` VALUES ('3', '5', '23', '26', '22', '32', '53', '55');
INSERT INTO `player_levelstats` VALUES ('3', '5', '24', '26', '22', '32', '54', '57');
INSERT INTO `player_levelstats` VALUES ('3', '5', '25', '26', '22', '33', '56', '58');
INSERT INTO `player_levelstats` VALUES ('3', '5', '26', '27', '23', '33', '58', '60');
INSERT INTO `player_levelstats` VALUES ('3', '5', '27', '27', '23', '34', '59', '62');
INSERT INTO `player_levelstats` VALUES ('3', '5', '28', '27', '23', '34', '61', '64');
INSERT INTO `player_levelstats` VALUES ('3', '5', '29', '27', '24', '35', '63', '65');
INSERT INTO `player_levelstats` VALUES ('3', '5', '30', '28', '24', '35', '64', '67');
INSERT INTO `player_levelstats` VALUES ('3', '5', '31', '28', '24', '36', '66', '69');
INSERT INTO `player_levelstats` VALUES ('3', '5', '32', '28', '25', '36', '68', '71');
INSERT INTO `player_levelstats` VALUES ('3', '5', '33', '28', '25', '37', '70', '72');
INSERT INTO `player_levelstats` VALUES ('3', '5', '34', '29', '26', '38', '71', '74');
INSERT INTO `player_levelstats` VALUES ('3', '5', '35', '29', '26', '38', '73', '76');
INSERT INTO `player_levelstats` VALUES ('3', '5', '36', '29', '26', '39', '75', '78');
INSERT INTO `player_levelstats` VALUES ('3', '5', '37', '29', '27', '39', '77', '80');
INSERT INTO `player_levelstats` VALUES ('3', '5', '38', '30', '27', '40', '78', '82');
INSERT INTO `player_levelstats` VALUES ('3', '5', '39', '30', '27', '40', '80', '84');
INSERT INTO `player_levelstats` VALUES ('3', '5', '40', '30', '28', '41', '82', '86');
INSERT INTO `player_levelstats` VALUES ('3', '5', '41', '31', '28', '41', '84', '88');
INSERT INTO `player_levelstats` VALUES ('3', '5', '42', '31', '29', '42', '86', '89');
INSERT INTO `player_levelstats` VALUES ('3', '5', '43', '31', '29', '43', '88', '91');
INSERT INTO `player_levelstats` VALUES ('3', '5', '44', '32', '29', '43', '90', '93');
INSERT INTO `player_levelstats` VALUES ('3', '5', '45', '32', '30', '44', '92', '95');
INSERT INTO `player_levelstats` VALUES ('3', '5', '46', '32', '30', '44', '93', '97');
INSERT INTO `player_levelstats` VALUES ('3', '5', '47', '32', '30', '45', '95', '99');
INSERT INTO `player_levelstats` VALUES ('3', '5', '48', '33', '31', '46', '97', '101');
INSERT INTO `player_levelstats` VALUES ('3', '5', '49', '33', '31', '46', '99', '103');
INSERT INTO `player_levelstats` VALUES ('3', '5', '50', '33', '32', '47', '101', '106');
INSERT INTO `player_levelstats` VALUES ('3', '5', '51', '34', '32', '48', '103', '108');
INSERT INTO `player_levelstats` VALUES ('3', '5', '52', '34', '33', '48', '105', '110');
INSERT INTO `player_levelstats` VALUES ('3', '5', '53', '35', '33', '49', '107', '112');
INSERT INTO `player_levelstats` VALUES ('3', '5', '54', '35', '33', '50', '109', '114');
INSERT INTO `player_levelstats` VALUES ('3', '5', '55', '35', '34', '50', '111', '116');
INSERT INTO `player_levelstats` VALUES ('3', '5', '56', '36', '34', '51', '113', '118');
INSERT INTO `player_levelstats` VALUES ('3', '5', '57', '36', '35', '52', '116', '120');
INSERT INTO `player_levelstats` VALUES ('3', '5', '58', '36', '35', '52', '118', '123');
INSERT INTO `player_levelstats` VALUES ('3', '5', '59', '37', '36', '53', '120', '125');
INSERT INTO `player_levelstats` VALUES ('3', '5', '60', '37', '36', '54', '122', '127');
INSERT INTO `player_levelstats` VALUES ('3', '5', '61', '37', '37', '54', '124', '129');
INSERT INTO `player_levelstats` VALUES ('3', '5', '62', '38', '37', '55', '126', '131');
INSERT INTO `player_levelstats` VALUES ('3', '5', '63', '38', '38', '56', '128', '134');
INSERT INTO `player_levelstats` VALUES ('3', '5', '64', '39', '38', '57', '131', '136');
INSERT INTO `player_levelstats` VALUES ('3', '5', '65', '39', '39', '57', '133', '138');
INSERT INTO `player_levelstats` VALUES ('3', '5', '66', '39', '39', '58', '135', '141');
INSERT INTO `player_levelstats` VALUES ('3', '5', '67', '40', '40', '59', '137', '143');
INSERT INTO `player_levelstats` VALUES ('3', '5', '68', '40', '40', '59', '139', '145');
INSERT INTO `player_levelstats` VALUES ('3', '5', '69', '41', '40', '60', '142', '148');
INSERT INTO `player_levelstats` VALUES ('3', '5', '70', '41', '41', '61', '144', '150');
INSERT INTO `player_levelstats` VALUES ('4', '1', '1', '20', '25', '21', '20', '20');
INSERT INTO `player_levelstats` VALUES ('4', '1', '2', '21', '26', '22', '20', '20');
INSERT INTO `player_levelstats` VALUES ('4', '1', '3', '23', '27', '23', '20', '21');
INSERT INTO `player_levelstats` VALUES ('4', '1', '4', '24', '27', '25', '20', '21');
INSERT INTO `player_levelstats` VALUES ('4', '1', '5', '25', '28', '26', '20', '21');
INSERT INTO `player_levelstats` VALUES ('4', '1', '6', '27', '29', '27', '20', '21');
INSERT INTO `player_levelstats` VALUES ('4', '1', '7', '28', '30', '28', '21', '22');
INSERT INTO `player_levelstats` VALUES ('4', '1', '8', '29', '31', '29', '21', '22');
INSERT INTO `player_levelstats` VALUES ('4', '1', '9', '31', '31', '31', '21', '22');
INSERT INTO `player_levelstats` VALUES ('4', '1', '10', '32', '32', '32', '21', '23');
INSERT INTO `player_levelstats` VALUES ('4', '1', '11', '33', '33', '33', '21', '23');
INSERT INTO `player_levelstats` VALUES ('4', '1', '12', '35', '34', '34', '21', '23');
INSERT INTO `player_levelstats` VALUES ('4', '1', '13', '36', '35', '36', '21', '24');
INSERT INTO `player_levelstats` VALUES ('4', '1', '14', '38', '36', '37', '21', '24');
INSERT INTO `player_levelstats` VALUES ('4', '1', '15', '39', '37', '38', '21', '24');
INSERT INTO `player_levelstats` VALUES ('4', '1', '16', '41', '37', '40', '21', '25');
INSERT INTO `player_levelstats` VALUES ('4', '1', '17', '42', '38', '41', '22', '25');
INSERT INTO `player_levelstats` VALUES ('4', '1', '18', '44', '39', '43', '22', '25');
INSERT INTO `player_levelstats` VALUES ('4', '1', '19', '45', '40', '44', '22', '26');
INSERT INTO `player_levelstats` VALUES ('4', '1', '20', '47', '41', '45', '22', '26');
INSERT INTO `player_levelstats` VALUES ('4', '1', '21', '48', '42', '47', '22', '26');
INSERT INTO `player_levelstats` VALUES ('4', '1', '22', '50', '43', '48', '22', '27');
INSERT INTO `player_levelstats` VALUES ('4', '1', '23', '52', '44', '50', '22', '27');
INSERT INTO `player_levelstats` VALUES ('4', '1', '24', '53', '45', '51', '23', '28');
INSERT INTO `player_levelstats` VALUES ('4', '1', '25', '55', '46', '52', '23', '28');
INSERT INTO `player_levelstats` VALUES ('4', '1', '26', '56', '47', '54', '23', '28');
INSERT INTO `player_levelstats` VALUES ('4', '1', '27', '58', '48', '55', '23', '29');
INSERT INTO `player_levelstats` VALUES ('4', '1', '28', '60', '49', '57', '23', '29');
INSERT INTO `player_levelstats` VALUES ('4', '1', '29', '61', '50', '58', '23', '30');
INSERT INTO `player_levelstats` VALUES ('4', '1', '30', '63', '51', '60', '24', '30');
INSERT INTO `player_levelstats` VALUES ('4', '1', '31', '65', '52', '62', '24', '30');
INSERT INTO `player_levelstats` VALUES ('4', '1', '32', '66', '53', '63', '24', '31');
INSERT INTO `player_levelstats` VALUES ('4', '1', '33', '68', '54', '65', '24', '31');
INSERT INTO `player_levelstats` VALUES ('4', '1', '34', '70', '55', '66', '24', '32');
INSERT INTO `player_levelstats` VALUES ('4', '1', '35', '72', '56', '68', '24', '32');
INSERT INTO `player_levelstats` VALUES ('4', '1', '36', '73', '58', '69', '25', '33');
INSERT INTO `player_levelstats` VALUES ('4', '1', '37', '75', '59', '71', '25', '33');
INSERT INTO `player_levelstats` VALUES ('4', '1', '38', '77', '60', '73', '25', '34');
INSERT INTO `player_levelstats` VALUES ('4', '1', '39', '79', '61', '74', '25', '34');
INSERT INTO `player_levelstats` VALUES ('4', '1', '40', '81', '62', '76', '25', '35');
INSERT INTO `player_levelstats` VALUES ('4', '1', '41', '82', '63', '78', '26', '35');
INSERT INTO `player_levelstats` VALUES ('4', '1', '42', '84', '64', '79', '26', '35');
INSERT INTO `player_levelstats` VALUES ('4', '1', '43', '86', '66', '81', '26', '36');
INSERT INTO `player_levelstats` VALUES ('4', '1', '44', '88', '67', '83', '26', '36');
INSERT INTO `player_levelstats` VALUES ('4', '1', '45', '90', '68', '85', '26', '37');
INSERT INTO `player_levelstats` VALUES ('4', '1', '46', '92', '69', '86', '27', '37');
INSERT INTO `player_levelstats` VALUES ('4', '1', '47', '94', '70', '88', '27', '38');
INSERT INTO `player_levelstats` VALUES ('4', '1', '48', '96', '72', '90', '27', '38');
INSERT INTO `player_levelstats` VALUES ('4', '1', '49', '98', '73', '92', '27', '39');
INSERT INTO `player_levelstats` VALUES ('4', '1', '50', '100', '74', '93', '28', '40');
INSERT INTO `player_levelstats` VALUES ('4', '1', '51', '102', '75', '95', '28', '40');
INSERT INTO `player_levelstats` VALUES ('4', '1', '52', '104', '77', '97', '28', '41');
INSERT INTO `player_levelstats` VALUES ('4', '1', '53', '106', '78', '99', '28', '41');
INSERT INTO `player_levelstats` VALUES ('4', '1', '54', '108', '79', '101', '29', '42');
INSERT INTO `player_levelstats` VALUES ('4', '1', '55', '110', '80', '103', '29', '42');
INSERT INTO `player_levelstats` VALUES ('4', '1', '56', '112', '82', '104', '29', '43');
INSERT INTO `player_levelstats` VALUES ('4', '1', '57', '114', '83', '106', '29', '43');
INSERT INTO `player_levelstats` VALUES ('4', '1', '58', '116', '84', '108', '30', '44');
INSERT INTO `player_levelstats` VALUES ('4', '1', '59', '118', '86', '110', '30', '44');
INSERT INTO `player_levelstats` VALUES ('4', '1', '60', '120', '87', '112', '30', '45');
INSERT INTO `player_levelstats` VALUES ('4', '1', '61', '122', '88', '114', '30', '46');
INSERT INTO `player_levelstats` VALUES ('4', '1', '62', '124', '90', '116', '31', '46');
INSERT INTO `player_levelstats` VALUES ('4', '1', '63', '127', '91', '118', '31', '47');
INSERT INTO `player_levelstats` VALUES ('4', '1', '64', '129', '92', '120', '31', '47');
INSERT INTO `player_levelstats` VALUES ('4', '1', '65', '131', '94', '122', '32', '48');
INSERT INTO `player_levelstats` VALUES ('4', '1', '66', '133', '95', '124', '32', '49');
INSERT INTO `player_levelstats` VALUES ('4', '1', '67', '135', '97', '126', '32', '49');
INSERT INTO `player_levelstats` VALUES ('4', '1', '68', '138', '98', '128', '32', '50');
INSERT INTO `player_levelstats` VALUES ('4', '1', '69', '140', '100', '130', '33', '50');
INSERT INTO `player_levelstats` VALUES ('4', '1', '70', '142', '101', '132', '33', '51');
INSERT INTO `player_levelstats` VALUES ('4', '3', '1', '17', '28', '20', '20', '21');
INSERT INTO `player_levelstats` VALUES ('4', '3', '2', '17', '29', '21', '21', '22');
INSERT INTO `player_levelstats` VALUES ('4', '3', '3', '18', '31', '22', '21', '22');
INSERT INTO `player_levelstats` VALUES ('4', '3', '4', '18', '32', '23', '22', '23');
INSERT INTO `player_levelstats` VALUES ('4', '3', '5', '19', '33', '24', '22', '24');
INSERT INTO `player_levelstats` VALUES ('4', '3', '6', '19', '35', '25', '23', '24');
INSERT INTO `player_levelstats` VALUES ('4', '3', '7', '20', '36', '26', '24', '25');
INSERT INTO `player_levelstats` VALUES ('4', '3', '8', '20', '38', '27', '24', '25');
INSERT INTO `player_levelstats` VALUES ('4', '3', '9', '21', '39', '27', '25', '26');
INSERT INTO `player_levelstats` VALUES ('4', '3', '10', '21', '40', '28', '25', '27');
INSERT INTO `player_levelstats` VALUES ('4', '3', '11', '22', '42', '29', '26', '28');
INSERT INTO `player_levelstats` VALUES ('4', '3', '12', '22', '43', '30', '27', '28');
INSERT INTO `player_levelstats` VALUES ('4', '3', '13', '23', '45', '31', '27', '29');
INSERT INTO `player_levelstats` VALUES ('4', '3', '14', '23', '46', '32', '28', '30');
INSERT INTO `player_levelstats` VALUES ('4', '3', '15', '24', '48', '34', '29', '30');
INSERT INTO `player_levelstats` VALUES ('4', '3', '16', '24', '50', '35', '29', '31');
INSERT INTO `player_levelstats` VALUES ('4', '3', '17', '25', '51', '36', '30', '32');
INSERT INTO `player_levelstats` VALUES ('4', '3', '18', '25', '53', '37', '31', '33');
INSERT INTO `player_levelstats` VALUES ('4', '3', '19', '26', '54', '38', '31', '33');
INSERT INTO `player_levelstats` VALUES ('4', '3', '20', '26', '56', '39', '32', '34');
INSERT INTO `player_levelstats` VALUES ('4', '3', '21', '27', '57', '40', '33', '35');
INSERT INTO `player_levelstats` VALUES ('4', '3', '22', '27', '59', '41', '33', '36');
INSERT INTO `player_levelstats` VALUES ('4', '3', '23', '28', '61', '42', '34', '36');
INSERT INTO `player_levelstats` VALUES ('4', '3', '24', '28', '62', '43', '35', '37');
INSERT INTO `player_levelstats` VALUES ('4', '3', '25', '29', '64', '44', '36', '38');
INSERT INTO `player_levelstats` VALUES ('4', '3', '26', '30', '66', '46', '36', '39');
INSERT INTO `player_levelstats` VALUES ('4', '3', '27', '30', '68', '47', '37', '40');
INSERT INTO `player_levelstats` VALUES ('4', '3', '28', '31', '69', '48', '38', '41');
INSERT INTO `player_levelstats` VALUES ('4', '3', '29', '31', '71', '49', '39', '41');
INSERT INTO `player_levelstats` VALUES ('4', '3', '30', '32', '73', '50', '39', '42');
INSERT INTO `player_levelstats` VALUES ('4', '3', '31', '33', '75', '52', '40', '43');
INSERT INTO `player_levelstats` VALUES ('4', '3', '32', '33', '76', '53', '41', '44');
INSERT INTO `player_levelstats` VALUES ('4', '3', '33', '34', '78', '54', '42', '45');
INSERT INTO `player_levelstats` VALUES ('4', '3', '34', '34', '80', '55', '43', '46');
INSERT INTO `player_levelstats` VALUES ('4', '3', '35', '35', '82', '57', '44', '47');
INSERT INTO `player_levelstats` VALUES ('4', '3', '36', '36', '84', '58', '44', '48');
INSERT INTO `player_levelstats` VALUES ('4', '3', '37', '36', '86', '59', '45', '48');
INSERT INTO `player_levelstats` VALUES ('4', '3', '38', '37', '87', '60', '46', '49');
INSERT INTO `player_levelstats` VALUES ('4', '3', '39', '38', '89', '62', '47', '50');
INSERT INTO `player_levelstats` VALUES ('4', '3', '40', '38', '91', '63', '48', '51');
INSERT INTO `player_levelstats` VALUES ('4', '3', '41', '39', '93', '64', '49', '52');
INSERT INTO `player_levelstats` VALUES ('4', '3', '42', '40', '95', '66', '49', '53');
INSERT INTO `player_levelstats` VALUES ('4', '3', '43', '40', '97', '67', '50', '54');
INSERT INTO `player_levelstats` VALUES ('4', '3', '44', '41', '99', '68', '51', '55');
INSERT INTO `player_levelstats` VALUES ('4', '3', '45', '42', '101', '70', '52', '56');
INSERT INTO `player_levelstats` VALUES ('4', '3', '46', '42', '103', '71', '53', '57');
INSERT INTO `player_levelstats` VALUES ('4', '3', '47', '43', '105', '72', '54', '58');
INSERT INTO `player_levelstats` VALUES ('4', '3', '48', '44', '107', '74', '55', '59');
INSERT INTO `player_levelstats` VALUES ('4', '3', '49', '45', '109', '75', '56', '60');
INSERT INTO `player_levelstats` VALUES ('4', '3', '50', '45', '111', '77', '57', '61');
INSERT INTO `player_levelstats` VALUES ('4', '3', '51', '46', '113', '78', '58', '62');
INSERT INTO `player_levelstats` VALUES ('4', '3', '52', '47', '115', '79', '59', '63');
INSERT INTO `player_levelstats` VALUES ('4', '3', '53', '47', '118', '81', '60', '64');
INSERT INTO `player_levelstats` VALUES ('4', '3', '54', '48', '120', '82', '61', '65');
INSERT INTO `player_levelstats` VALUES ('4', '3', '55', '49', '122', '84', '61', '66');
INSERT INTO `player_levelstats` VALUES ('4', '3', '56', '50', '124', '85', '62', '67');
INSERT INTO `player_levelstats` VALUES ('4', '3', '57', '50', '126', '87', '63', '68');
INSERT INTO `player_levelstats` VALUES ('4', '3', '58', '51', '128', '88', '64', '69');
INSERT INTO `player_levelstats` VALUES ('4', '3', '59', '52', '131', '90', '65', '70');
INSERT INTO `player_levelstats` VALUES ('4', '3', '60', '53', '133', '91', '66', '72');
INSERT INTO `player_levelstats` VALUES ('4', '3', '61', '54', '135', '93', '67', '73');
INSERT INTO `player_levelstats` VALUES ('4', '3', '62', '54', '137', '94', '69', '74');
INSERT INTO `player_levelstats` VALUES ('4', '3', '63', '55', '140', '96', '70', '75');
INSERT INTO `player_levelstats` VALUES ('4', '3', '64', '56', '142', '97', '71', '76');
INSERT INTO `player_levelstats` VALUES ('4', '3', '65', '57', '144', '99', '72', '77');
INSERT INTO `player_levelstats` VALUES ('4', '3', '66', '58', '147', '101', '73', '78');
INSERT INTO `player_levelstats` VALUES ('4', '3', '67', '58', '149', '102', '74', '79');
INSERT INTO `player_levelstats` VALUES ('4', '3', '68', '59', '151', '104', '75', '81');
INSERT INTO `player_levelstats` VALUES ('4', '3', '69', '60', '154', '105', '76', '82');
INSERT INTO `player_levelstats` VALUES ('4', '3', '70', '61', '156', '107', '77', '83');
INSERT INTO `player_levelstats` VALUES ('4', '4', '1', '18', '28', '20', '20', '20');
INSERT INTO `player_levelstats` VALUES ('4', '4', '2', '19', '29', '21', '20', '20');
INSERT INTO `player_levelstats` VALUES ('4', '4', '3', '20', '31', '21', '20', '21');
INSERT INTO `player_levelstats` VALUES ('4', '4', '4', '20', '32', '22', '20', '21');
INSERT INTO `player_levelstats` VALUES ('4', '4', '5', '21', '34', '23', '21', '21');
INSERT INTO `player_levelstats` VALUES ('4', '4', '6', '22', '35', '24', '21', '22');
INSERT INTO `player_levelstats` VALUES ('4', '4', '7', '23', '37', '24', '21', '22');
INSERT INTO `player_levelstats` VALUES ('4', '4', '8', '24', '38', '25', '21', '23');
INSERT INTO `player_levelstats` VALUES ('4', '4', '9', '24', '40', '26', '21', '23');
INSERT INTO `player_levelstats` VALUES ('4', '4', '10', '25', '41', '26', '21', '23');
INSERT INTO `player_levelstats` VALUES ('4', '4', '11', '26', '43', '27', '22', '24');
INSERT INTO `player_levelstats` VALUES ('4', '4', '12', '27', '44', '28', '22', '24');
INSERT INTO `player_levelstats` VALUES ('4', '4', '13', '28', '46', '29', '22', '25');
INSERT INTO `player_levelstats` VALUES ('4', '4', '14', '29', '48', '30', '22', '25');
INSERT INTO `player_levelstats` VALUES ('4', '4', '15', '29', '49', '30', '22', '25');
INSERT INTO `player_levelstats` VALUES ('4', '4', '16', '30', '51', '31', '23', '26');
INSERT INTO `player_levelstats` VALUES ('4', '4', '17', '31', '52', '32', '23', '26');
INSERT INTO `player_levelstats` VALUES ('4', '4', '18', '32', '54', '33', '23', '27');
INSERT INTO `player_levelstats` VALUES ('4', '4', '19', '33', '56', '34', '23', '27');
INSERT INTO `player_levelstats` VALUES ('4', '4', '20', '34', '57', '35', '23', '28');
INSERT INTO `player_levelstats` VALUES ('4', '4', '21', '35', '59', '35', '24', '28');
INSERT INTO `player_levelstats` VALUES ('4', '4', '22', '36', '61', '36', '24', '29');
INSERT INTO `player_levelstats` VALUES ('4', '4', '23', '37', '63', '37', '24', '29');
INSERT INTO `player_levelstats` VALUES ('4', '4', '24', '38', '64', '38', '24', '30');
INSERT INTO `player_levelstats` VALUES ('4', '4', '25', '39', '66', '39', '25', '30');
INSERT INTO `player_levelstats` VALUES ('4', '4', '26', '40', '68', '40', '25', '31');
INSERT INTO `player_levelstats` VALUES ('4', '4', '27', '41', '70', '41', '25', '31');
INSERT INTO `player_levelstats` VALUES ('4', '4', '28', '42', '72', '42', '25', '32');
INSERT INTO `player_levelstats` VALUES ('4', '4', '29', '43', '73', '43', '25', '32');
INSERT INTO `player_levelstats` VALUES ('4', '4', '30', '44', '75', '43', '26', '33');
INSERT INTO `player_levelstats` VALUES ('4', '4', '31', '45', '77', '44', '26', '33');
INSERT INTO `player_levelstats` VALUES ('4', '4', '32', '46', '79', '45', '26', '34');
INSERT INTO `player_levelstats` VALUES ('4', '4', '33', '47', '81', '46', '27', '34');
INSERT INTO `player_levelstats` VALUES ('4', '4', '34', '48', '83', '47', '27', '35');
INSERT INTO `player_levelstats` VALUES ('4', '4', '35', '49', '85', '48', '27', '35');
INSERT INTO `player_levelstats` VALUES ('4', '4', '36', '50', '87', '49', '27', '36');
INSERT INTO `player_levelstats` VALUES ('4', '4', '37', '51', '89', '50', '28', '36');
INSERT INTO `player_levelstats` VALUES ('4', '4', '38', '52', '91', '51', '28', '37');
INSERT INTO `player_levelstats` VALUES ('4', '4', '39', '53', '93', '52', '28', '38');
INSERT INTO `player_levelstats` VALUES ('4', '4', '40', '54', '95', '53', '28', '38');
INSERT INTO `player_levelstats` VALUES ('4', '4', '41', '56', '97', '54', '29', '39');
INSERT INTO `player_levelstats` VALUES ('4', '4', '42', '57', '99', '55', '29', '39');
INSERT INTO `player_levelstats` VALUES ('4', '4', '43', '58', '101', '56', '29', '40');
INSERT INTO `player_levelstats` VALUES ('4', '4', '44', '59', '103', '57', '30', '40');
INSERT INTO `player_levelstats` VALUES ('4', '4', '45', '60', '105', '59', '30', '41');
INSERT INTO `player_levelstats` VALUES ('4', '4', '46', '61', '107', '60', '30', '42');
INSERT INTO `player_levelstats` VALUES ('4', '4', '47', '62', '109', '61', '31', '42');
INSERT INTO `player_levelstats` VALUES ('4', '4', '48', '64', '112', '62', '31', '43');
INSERT INTO `player_levelstats` VALUES ('4', '4', '49', '65', '114', '63', '31', '44');
INSERT INTO `player_levelstats` VALUES ('4', '4', '50', '66', '116', '64', '32', '44');
INSERT INTO `player_levelstats` VALUES ('4', '4', '51', '67', '118', '65', '32', '45');
INSERT INTO `player_levelstats` VALUES ('4', '4', '52', '68', '120', '66', '32', '45');
INSERT INTO `player_levelstats` VALUES ('4', '4', '53', '70', '123', '67', '33', '46');
INSERT INTO `player_levelstats` VALUES ('4', '4', '54', '71', '125', '69', '33', '47');
INSERT INTO `player_levelstats` VALUES ('4', '4', '55', '72', '127', '70', '33', '47');
INSERT INTO `player_levelstats` VALUES ('4', '4', '56', '73', '129', '71', '34', '48');
INSERT INTO `player_levelstats` VALUES ('4', '4', '57', '75', '132', '72', '34', '49');
INSERT INTO `player_levelstats` VALUES ('4', '4', '58', '76', '134', '73', '34', '49');
INSERT INTO `player_levelstats` VALUES ('4', '4', '59', '77', '136', '74', '35', '50');
INSERT INTO `player_levelstats` VALUES ('4', '4', '60', '79', '139', '76', '35', '51');
INSERT INTO `player_levelstats` VALUES ('4', '4', '61', '80', '141', '77', '35', '51');
INSERT INTO `player_levelstats` VALUES ('4', '4', '62', '81', '143', '78', '36', '52');
INSERT INTO `player_levelstats` VALUES ('4', '4', '63', '82', '146', '79', '36', '53');
INSERT INTO `player_levelstats` VALUES ('4', '4', '64', '84', '148', '80', '37', '54');
INSERT INTO `player_levelstats` VALUES ('4', '4', '65', '85', '151', '82', '37', '54');
INSERT INTO `player_levelstats` VALUES ('4', '4', '66', '87', '153', '83', '37', '55');
INSERT INTO `player_levelstats` VALUES ('4', '4', '67', '88', '156', '84', '38', '56');
INSERT INTO `player_levelstats` VALUES ('4', '4', '68', '89', '158', '85', '38', '57');
INSERT INTO `player_levelstats` VALUES ('4', '4', '69', '91', '160', '87', '39', '57');
INSERT INTO `player_levelstats` VALUES ('4', '4', '70', '92', '163', '88', '39', '58');
INSERT INTO `player_levelstats` VALUES ('4', '5', '1', '17', '25', '19', '22', '23');
INSERT INTO `player_levelstats` VALUES ('4', '5', '2', '17', '25', '19', '23', '24');
INSERT INTO `player_levelstats` VALUES ('4', '5', '3', '17', '25', '20', '25', '26');
INSERT INTO `player_levelstats` VALUES ('4', '5', '4', '17', '26', '20', '26', '27');
INSERT INTO `player_levelstats` VALUES ('4', '5', '5', '18', '26', '20', '27', '28');
INSERT INTO `player_levelstats` VALUES ('4', '5', '6', '18', '26', '21', '29', '30');
INSERT INTO `player_levelstats` VALUES ('4', '5', '7', '18', '26', '21', '30', '31');
INSERT INTO `player_levelstats` VALUES ('4', '5', '8', '18', '26', '22', '31', '33');
INSERT INTO `player_levelstats` VALUES ('4', '5', '9', '18', '27', '22', '33', '34');
INSERT INTO `player_levelstats` VALUES ('4', '5', '10', '19', '27', '22', '34', '36');
INSERT INTO `player_levelstats` VALUES ('4', '5', '11', '19', '27', '23', '36', '37');
INSERT INTO `player_levelstats` VALUES ('4', '5', '12', '19', '27', '23', '37', '39');
INSERT INTO `player_levelstats` VALUES ('4', '5', '13', '19', '28', '24', '38', '40');
INSERT INTO `player_levelstats` VALUES ('4', '5', '14', '19', '28', '24', '40', '42');
INSERT INTO `player_levelstats` VALUES ('4', '5', '15', '19', '28', '25', '41', '43');
INSERT INTO `player_levelstats` VALUES ('4', '5', '16', '20', '28', '25', '43', '45');
INSERT INTO `player_levelstats` VALUES ('4', '5', '17', '20', '29', '25', '44', '46');
INSERT INTO `player_levelstats` VALUES ('4', '5', '18', '20', '29', '26', '46', '48');
INSERT INTO `player_levelstats` VALUES ('4', '5', '19', '20', '29', '26', '47', '49');
INSERT INTO `player_levelstats` VALUES ('4', '5', '20', '21', '30', '27', '49', '51');
INSERT INTO `player_levelstats` VALUES ('4', '5', '21', '21', '30', '27', '51', '53');
INSERT INTO `player_levelstats` VALUES ('4', '5', '22', '21', '30', '28', '52', '54');
INSERT INTO `player_levelstats` VALUES ('4', '5', '23', '21', '30', '28', '54', '56');
INSERT INTO `player_levelstats` VALUES ('4', '5', '24', '21', '31', '29', '55', '58');
INSERT INTO `player_levelstats` VALUES ('4', '5', '25', '22', '31', '29', '57', '59');
INSERT INTO `player_levelstats` VALUES ('4', '5', '26', '22', '31', '30', '59', '61');
INSERT INTO `player_levelstats` VALUES ('4', '5', '27', '22', '32', '30', '60', '63');
INSERT INTO `player_levelstats` VALUES ('4', '5', '28', '22', '32', '31', '62', '65');
INSERT INTO `player_levelstats` VALUES ('4', '5', '29', '23', '32', '31', '64', '66');
INSERT INTO `player_levelstats` VALUES ('4', '5', '30', '23', '33', '32', '65', '68');
INSERT INTO `player_levelstats` VALUES ('4', '5', '31', '23', '33', '32', '67', '70');
INSERT INTO `player_levelstats` VALUES ('4', '5', '32', '23', '33', '33', '69', '72');
INSERT INTO `player_levelstats` VALUES ('4', '5', '33', '24', '34', '33', '70', '73');
INSERT INTO `player_levelstats` VALUES ('4', '5', '34', '24', '34', '34', '72', '75');
INSERT INTO `player_levelstats` VALUES ('4', '5', '35', '24', '34', '34', '74', '77');
INSERT INTO `player_levelstats` VALUES ('4', '5', '36', '24', '35', '35', '76', '79');
INSERT INTO `player_levelstats` VALUES ('4', '5', '37', '25', '35', '35', '78', '81');
INSERT INTO `player_levelstats` VALUES ('4', '5', '38', '25', '35', '36', '79', '83');
INSERT INTO `player_levelstats` VALUES ('4', '5', '39', '25', '36', '37', '81', '85');
INSERT INTO `player_levelstats` VALUES ('4', '5', '40', '26', '36', '37', '83', '87');
INSERT INTO `player_levelstats` VALUES ('4', '5', '41', '26', '37', '38', '85', '88');
INSERT INTO `player_levelstats` VALUES ('4', '5', '42', '26', '37', '38', '87', '90');
INSERT INTO `player_levelstats` VALUES ('4', '5', '43', '27', '37', '39', '89', '92');
INSERT INTO `player_levelstats` VALUES ('4', '5', '44', '27', '38', '39', '91', '94');
INSERT INTO `player_levelstats` VALUES ('4', '5', '45', '27', '38', '40', '92', '96');
INSERT INTO `player_levelstats` VALUES ('4', '5', '46', '27', '39', '41', '94', '98');
INSERT INTO `player_levelstats` VALUES ('4', '5', '47', '28', '39', '41', '96', '100');
INSERT INTO `player_levelstats` VALUES ('4', '5', '48', '28', '39', '42', '98', '102');
INSERT INTO `player_levelstats` VALUES ('4', '5', '49', '28', '40', '43', '100', '104');
INSERT INTO `player_levelstats` VALUES ('4', '5', '50', '29', '40', '43', '102', '106');
INSERT INTO `player_levelstats` VALUES ('4', '5', '51', '29', '41', '44', '104', '109');
INSERT INTO `player_levelstats` VALUES ('4', '5', '52', '29', '41', '44', '106', '111');
INSERT INTO `player_levelstats` VALUES ('4', '5', '53', '30', '42', '45', '108', '113');
INSERT INTO `player_levelstats` VALUES ('4', '5', '54', '30', '42', '46', '110', '115');
INSERT INTO `player_levelstats` VALUES ('4', '5', '55', '30', '43', '46', '112', '117');
INSERT INTO `player_levelstats` VALUES ('4', '5', '56', '31', '43', '47', '114', '119');
INSERT INTO `player_levelstats` VALUES ('4', '5', '57', '31', '43', '48', '117', '121');
INSERT INTO `player_levelstats` VALUES ('4', '5', '58', '31', '44', '48', '119', '124');
INSERT INTO `player_levelstats` VALUES ('4', '5', '59', '32', '44', '49', '121', '126');
INSERT INTO `player_levelstats` VALUES ('4', '5', '60', '32', '45', '50', '123', '128');
INSERT INTO `player_levelstats` VALUES ('4', '5', '61', '33', '45', '51', '125', '130');
INSERT INTO `player_levelstats` VALUES ('4', '5', '62', '33', '46', '51', '127', '132');
INSERT INTO `player_levelstats` VALUES ('4', '5', '63', '33', '46', '52', '129', '135');
INSERT INTO `player_levelstats` VALUES ('4', '5', '64', '34', '47', '53', '132', '137');
INSERT INTO `player_levelstats` VALUES ('4', '5', '65', '34', '47', '53', '134', '139');
INSERT INTO `player_levelstats` VALUES ('4', '5', '66', '34', '48', '54', '136', '142');
INSERT INTO `player_levelstats` VALUES ('4', '5', '67', '35', '48', '55', '138', '144');
INSERT INTO `player_levelstats` VALUES ('4', '5', '68', '35', '49', '56', '140', '146');
INSERT INTO `player_levelstats` VALUES ('4', '5', '69', '36', '49', '56', '143', '149');
INSERT INTO `player_levelstats` VALUES ('4', '5', '70', '36', '50', '57', '145', '151');
INSERT INTO `player_levelstats` VALUES ('4', '11', '1', '18', '25', '19', '22', '22');
INSERT INTO `player_levelstats` VALUES ('4', '11', '2', '19', '25', '20', '23', '23');
INSERT INTO `player_levelstats` VALUES ('4', '11', '3', '19', '26', '20', '24', '24');
INSERT INTO `player_levelstats` VALUES ('4', '11', '4', '20', '26', '21', '25', '26');
INSERT INTO `player_levelstats` VALUES ('4', '11', '5', '20', '27', '22', '26', '27');
INSERT INTO `player_levelstats` VALUES ('4', '11', '6', '21', '27', '22', '27', '28');
INSERT INTO `player_levelstats` VALUES ('4', '11', '7', '21', '28', '23', '28', '29');
INSERT INTO `player_levelstats` VALUES ('4', '11', '8', '22', '28', '24', '29', '30');
INSERT INTO `player_levelstats` VALUES ('4', '11', '9', '23', '29', '24', '30', '32');
INSERT INTO `player_levelstats` VALUES ('4', '11', '10', '23', '29', '25', '32', '33');
INSERT INTO `player_levelstats` VALUES ('4', '11', '11', '24', '30', '26', '33', '34');
INSERT INTO `player_levelstats` VALUES ('4', '11', '12', '24', '31', '26', '34', '35');
INSERT INTO `player_levelstats` VALUES ('4', '11', '13', '25', '31', '27', '35', '37');
INSERT INTO `player_levelstats` VALUES ('4', '11', '14', '26', '32', '28', '36', '38');
INSERT INTO `player_levelstats` VALUES ('4', '11', '15', '26', '32', '29', '37', '39');
INSERT INTO `player_levelstats` VALUES ('4', '11', '16', '27', '33', '29', '38', '41');
INSERT INTO `player_levelstats` VALUES ('4', '11', '17', '28', '33', '30', '40', '42');
INSERT INTO `player_levelstats` VALUES ('4', '11', '18', '28', '34', '31', '41', '43');
INSERT INTO `player_levelstats` VALUES ('4', '11', '19', '29', '35', '32', '42', '45');
INSERT INTO `player_levelstats` VALUES ('4', '11', '20', '30', '35', '32', '43', '46');
INSERT INTO `player_levelstats` VALUES ('4', '11', '21', '30', '36', '33', '45', '48');
INSERT INTO `player_levelstats` VALUES ('4', '11', '22', '31', '36', '34', '46', '49');
INSERT INTO `player_levelstats` VALUES ('4', '11', '23', '32', '37', '35', '47', '51');
INSERT INTO `player_levelstats` VALUES ('4', '11', '24', '32', '38', '36', '48', '52');
INSERT INTO `player_levelstats` VALUES ('4', '11', '25', '33', '38', '36', '50', '53');
INSERT INTO `player_levelstats` VALUES ('4', '11', '26', '34', '39', '37', '51', '55');
INSERT INTO `player_levelstats` VALUES ('4', '11', '27', '35', '40', '38', '52', '56');
INSERT INTO `player_levelstats` VALUES ('4', '11', '28', '35', '40', '39', '54', '58');
INSERT INTO `player_levelstats` VALUES ('4', '11', '29', '36', '41', '40', '55', '59');
INSERT INTO `player_levelstats` VALUES ('4', '11', '30', '37', '42', '41', '56', '61');
INSERT INTO `player_levelstats` VALUES ('4', '11', '31', '38', '42', '42', '58', '62');
INSERT INTO `player_levelstats` VALUES ('4', '11', '32', '38', '43', '42', '59', '64');
INSERT INTO `player_levelstats` VALUES ('4', '11', '33', '39', '44', '43', '60', '66');
INSERT INTO `player_levelstats` VALUES ('4', '11', '34', '40', '44', '44', '62', '67');
INSERT INTO `player_levelstats` VALUES ('4', '11', '35', '41', '45', '45', '63', '69');
INSERT INTO `player_levelstats` VALUES ('4', '11', '36', '42', '46', '46', '65', '70');
INSERT INTO `player_levelstats` VALUES ('4', '11', '37', '42', '47', '47', '66', '72');
INSERT INTO `player_levelstats` VALUES ('4', '11', '38', '43', '47', '48', '67', '74');
INSERT INTO `player_levelstats` VALUES ('4', '11', '39', '44', '48', '49', '69', '75');
INSERT INTO `player_levelstats` VALUES ('4', '11', '40', '45', '49', '50', '70', '77');
INSERT INTO `player_levelstats` VALUES ('4', '11', '41', '46', '50', '51', '72', '79');
INSERT INTO `player_levelstats` VALUES ('4', '11', '42', '46', '50', '52', '73', '80');
INSERT INTO `player_levelstats` VALUES ('4', '11', '43', '47', '51', '53', '75', '82');
INSERT INTO `player_levelstats` VALUES ('4', '11', '44', '48', '52', '54', '76', '84');
INSERT INTO `player_levelstats` VALUES ('4', '11', '45', '49', '53', '55', '78', '85');
INSERT INTO `player_levelstats` VALUES ('4', '11', '46', '50', '54', '56', '79', '87');
INSERT INTO `player_levelstats` VALUES ('4', '11', '47', '51', '54', '57', '81', '89');
INSERT INTO `player_levelstats` VALUES ('4', '11', '48', '52', '55', '58', '83', '91');
INSERT INTO `player_levelstats` VALUES ('4', '11', '49', '53', '56', '59', '84', '93');
INSERT INTO `player_levelstats` VALUES ('4', '11', '50', '53', '57', '60', '86', '94');
INSERT INTO `player_levelstats` VALUES ('4', '11', '51', '54', '58', '61', '87', '96');
INSERT INTO `player_levelstats` VALUES ('4', '11', '52', '55', '59', '62', '89', '98');
INSERT INTO `player_levelstats` VALUES ('4', '11', '53', '56', '59', '63', '91', '100');
INSERT INTO `player_levelstats` VALUES ('4', '11', '54', '57', '60', '64', '92', '102');
INSERT INTO `player_levelstats` VALUES ('4', '11', '55', '58', '61', '65', '94', '103');
INSERT INTO `player_levelstats` VALUES ('4', '11', '56', '59', '62', '66', '95', '105');
INSERT INTO `player_levelstats` VALUES ('4', '11', '57', '60', '63', '67', '97', '107');
INSERT INTO `player_levelstats` VALUES ('4', '11', '58', '61', '64', '68', '99', '109');
INSERT INTO `player_levelstats` VALUES ('4', '11', '59', '62', '65', '69', '101', '111');
INSERT INTO `player_levelstats` VALUES ('4', '11', '60', '63', '66', '70', '102', '113');
INSERT INTO `player_levelstats` VALUES ('4', '11', '61', '64', '66', '72', '104', '115');
INSERT INTO `player_levelstats` VALUES ('4', '11', '62', '65', '67', '73', '106', '117');
INSERT INTO `player_levelstats` VALUES ('4', '11', '63', '66', '68', '74', '107', '119');
INSERT INTO `player_levelstats` VALUES ('4', '11', '64', '67', '69', '75', '109', '121');
INSERT INTO `player_levelstats` VALUES ('4', '11', '65', '68', '70', '76', '111', '123');
INSERT INTO `player_levelstats` VALUES ('4', '11', '66', '69', '71', '77', '113', '125');
INSERT INTO `player_levelstats` VALUES ('4', '11', '67', '70', '72', '78', '115', '127');
INSERT INTO `player_levelstats` VALUES ('4', '11', '68', '71', '73', '80', '116', '129');
INSERT INTO `player_levelstats` VALUES ('4', '11', '69', '72', '74', '81', '118', '131');
INSERT INTO `player_levelstats` VALUES ('4', '11', '70', '73', '75', '82', '120', '133');
INSERT INTO `player_levelstats` VALUES ('5', '1', '1', '22', '18', '23', '18', '25');
INSERT INTO `player_levelstats` VALUES ('5', '1', '2', '23', '19', '24', '18', '25');
INSERT INTO `player_levelstats` VALUES ('5', '1', '3', '25', '20', '25', '18', '26');
INSERT INTO `player_levelstats` VALUES ('5', '1', '4', '26', '20', '26', '18', '26');
INSERT INTO `player_levelstats` VALUES ('5', '1', '5', '27', '21', '28', '18', '26');
INSERT INTO `player_levelstats` VALUES ('5', '1', '6', '29', '22', '29', '18', '26');
INSERT INTO `player_levelstats` VALUES ('5', '1', '7', '30', '23', '30', '19', '27');
INSERT INTO `player_levelstats` VALUES ('5', '1', '8', '31', '24', '31', '19', '27');
INSERT INTO `player_levelstats` VALUES ('5', '1', '9', '33', '25', '33', '19', '27');
INSERT INTO `player_levelstats` VALUES ('5', '1', '10', '34', '25', '34', '19', '28');
INSERT INTO `player_levelstats` VALUES ('5', '1', '11', '35', '26', '35', '19', '28');
INSERT INTO `player_levelstats` VALUES ('5', '1', '12', '37', '27', '36', '19', '28');
INSERT INTO `player_levelstats` VALUES ('5', '1', '13', '38', '28', '38', '19', '28');
INSERT INTO `player_levelstats` VALUES ('5', '1', '14', '40', '29', '39', '19', '29');
INSERT INTO `player_levelstats` VALUES ('5', '1', '15', '41', '30', '40', '19', '29');
INSERT INTO `player_levelstats` VALUES ('5', '1', '16', '43', '31', '42', '20', '29');
INSERT INTO `player_levelstats` VALUES ('5', '1', '17', '44', '32', '43', '20', '30');
INSERT INTO `player_levelstats` VALUES ('5', '1', '18', '46', '33', '44', '20', '30');
INSERT INTO `player_levelstats` VALUES ('5', '1', '19', '47', '34', '46', '20', '31');
INSERT INTO `player_levelstats` VALUES ('5', '1', '20', '49', '34', '47', '20', '31');
INSERT INTO `player_levelstats` VALUES ('5', '1', '21', '50', '35', '49', '20', '31');
INSERT INTO `player_levelstats` VALUES ('5', '1', '22', '52', '36', '50', '20', '32');
INSERT INTO `player_levelstats` VALUES ('5', '1', '23', '53', '37', '51', '21', '32');
INSERT INTO `player_levelstats` VALUES ('5', '1', '24', '55', '38', '53', '21', '32');
INSERT INTO `player_levelstats` VALUES ('5', '1', '25', '57', '39', '54', '21', '33');
INSERT INTO `player_levelstats` VALUES ('5', '1', '26', '58', '40', '56', '21', '33');
INSERT INTO `player_levelstats` VALUES ('5', '1', '27', '60', '41', '57', '21', '34');
INSERT INTO `player_levelstats` VALUES ('5', '1', '28', '62', '42', '59', '21', '34');
INSERT INTO `player_levelstats` VALUES ('5', '1', '29', '63', '43', '60', '21', '34');
INSERT INTO `player_levelstats` VALUES ('5', '1', '30', '65', '44', '62', '22', '35');
INSERT INTO `player_levelstats` VALUES ('5', '1', '31', '67', '46', '63', '22', '35');
INSERT INTO `player_levelstats` VALUES ('5', '1', '32', '68', '47', '65', '22', '36');
INSERT INTO `player_levelstats` VALUES ('5', '1', '33', '70', '48', '67', '22', '36');
INSERT INTO `player_levelstats` VALUES ('5', '1', '34', '72', '49', '68', '22', '36');
INSERT INTO `player_levelstats` VALUES ('5', '1', '35', '74', '50', '70', '23', '37');
INSERT INTO `player_levelstats` VALUES ('5', '1', '36', '75', '51', '71', '23', '37');
INSERT INTO `player_levelstats` VALUES ('5', '1', '37', '77', '52', '73', '23', '38');
INSERT INTO `player_levelstats` VALUES ('5', '1', '38', '79', '53', '75', '23', '38');
INSERT INTO `player_levelstats` VALUES ('5', '1', '39', '81', '54', '76', '23', '39');
INSERT INTO `player_levelstats` VALUES ('5', '1', '40', '83', '55', '78', '24', '39');
INSERT INTO `player_levelstats` VALUES ('5', '1', '41', '84', '57', '80', '24', '40');
INSERT INTO `player_levelstats` VALUES ('5', '1', '42', '86', '58', '81', '24', '40');
INSERT INTO `player_levelstats` VALUES ('5', '1', '43', '88', '59', '83', '24', '41');
INSERT INTO `player_levelstats` VALUES ('5', '1', '44', '90', '60', '85', '24', '41');
INSERT INTO `player_levelstats` VALUES ('5', '1', '45', '92', '61', '86', '25', '42');
INSERT INTO `player_levelstats` VALUES ('5', '1', '46', '94', '62', '88', '25', '42');
INSERT INTO `player_levelstats` VALUES ('5', '1', '47', '96', '64', '90', '25', '43');
INSERT INTO `player_levelstats` VALUES ('5', '1', '48', '98', '65', '92', '25', '43');
INSERT INTO `player_levelstats` VALUES ('5', '1', '49', '100', '66', '93', '25', '44');
INSERT INTO `player_levelstats` VALUES ('5', '1', '50', '102', '67', '95', '26', '44');
INSERT INTO `player_levelstats` VALUES ('5', '1', '51', '104', '69', '97', '26', '45');
INSERT INTO `player_levelstats` VALUES ('5', '1', '52', '106', '70', '99', '26', '45');
INSERT INTO `player_levelstats` VALUES ('5', '1', '53', '108', '71', '101', '26', '46');
INSERT INTO `player_levelstats` VALUES ('5', '1', '54', '110', '72', '103', '27', '46');
INSERT INTO `player_levelstats` VALUES ('5', '1', '55', '112', '74', '104', '27', '47');
INSERT INTO `player_levelstats` VALUES ('5', '1', '56', '114', '75', '106', '27', '48');
INSERT INTO `player_levelstats` VALUES ('5', '1', '57', '116', '76', '108', '27', '48');
INSERT INTO `player_levelstats` VALUES ('5', '1', '58', '118', '78', '110', '28', '49');
INSERT INTO `player_levelstats` VALUES ('5', '1', '59', '120', '79', '112', '28', '49');
INSERT INTO `player_levelstats` VALUES ('5', '1', '60', '122', '80', '114', '28', '50');
INSERT INTO `player_levelstats` VALUES ('5', '1', '61', '124', '82', '116', '28', '50');
INSERT INTO `player_levelstats` VALUES ('5', '1', '62', '126', '83', '118', '29', '51');
INSERT INTO `player_levelstats` VALUES ('5', '1', '63', '128', '84', '120', '29', '52');
INSERT INTO `player_levelstats` VALUES ('5', '1', '64', '131', '86', '122', '29', '52');
INSERT INTO `player_levelstats` VALUES ('5', '1', '65', '133', '87', '124', '30', '53');
INSERT INTO `player_levelstats` VALUES ('5', '1', '66', '135', '88', '126', '30', '53');
INSERT INTO `player_levelstats` VALUES ('5', '1', '67', '137', '90', '128', '30', '54');
INSERT INTO `player_levelstats` VALUES ('5', '1', '68', '139', '91', '130', '30', '55');
INSERT INTO `player_levelstats` VALUES ('5', '1', '69', '142', '93', '132', '31', '55');
INSERT INTO `player_levelstats` VALUES ('5', '1', '70', '144', '94', '134', '31', '56');
INSERT INTO `player_levelstats` VALUES ('5', '4', '1', '20', '21', '22', '18', '25');
INSERT INTO `player_levelstats` VALUES ('5', '4', '2', '21', '22', '23', '18', '25');
INSERT INTO `player_levelstats` VALUES ('5', '4', '3', '22', '24', '23', '18', '26');
INSERT INTO `player_levelstats` VALUES ('5', '4', '4', '22', '25', '24', '18', '26');
INSERT INTO `player_levelstats` VALUES ('5', '4', '5', '23', '27', '25', '19', '26');
INSERT INTO `player_levelstats` VALUES ('5', '4', '6', '24', '28', '25', '19', '27');
INSERT INTO `player_levelstats` VALUES ('5', '4', '7', '25', '30', '26', '19', '27');
INSERT INTO `player_levelstats` VALUES ('5', '4', '8', '25', '31', '27', '19', '27');
INSERT INTO `player_levelstats` VALUES ('5', '4', '9', '26', '33', '28', '19', '28');
INSERT INTO `player_levelstats` VALUES ('5', '4', '10', '27', '34', '28', '19', '28');
INSERT INTO `player_levelstats` VALUES ('5', '4', '11', '28', '36', '29', '20', '29');
INSERT INTO `player_levelstats` VALUES ('5', '4', '12', '29', '38', '30', '20', '29');
INSERT INTO `player_levelstats` VALUES ('5', '4', '13', '30', '39', '31', '20', '29');
INSERT INTO `player_levelstats` VALUES ('5', '4', '14', '31', '41', '32', '20', '30');
INSERT INTO `player_levelstats` VALUES ('5', '4', '15', '31', '42', '32', '20', '30');
INSERT INTO `player_levelstats` VALUES ('5', '4', '16', '32', '44', '33', '21', '31');
INSERT INTO `player_levelstats` VALUES ('5', '4', '17', '33', '46', '34', '21', '31');
INSERT INTO `player_levelstats` VALUES ('5', '4', '18', '34', '47', '35', '21', '32');
INSERT INTO `player_levelstats` VALUES ('5', '4', '19', '35', '49', '36', '21', '32');
INSERT INTO `player_levelstats` VALUES ('5', '4', '20', '36', '51', '36', '21', '32');
INSERT INTO `player_levelstats` VALUES ('5', '4', '21', '37', '52', '37', '22', '33');
INSERT INTO `player_levelstats` VALUES ('5', '4', '22', '38', '54', '38', '22', '33');
INSERT INTO `player_levelstats` VALUES ('5', '4', '23', '39', '56', '39', '22', '34');
INSERT INTO `player_levelstats` VALUES ('5', '4', '24', '40', '58', '40', '22', '34');
INSERT INTO `player_levelstats` VALUES ('5', '4', '25', '41', '60', '41', '23', '35');
INSERT INTO `player_levelstats` VALUES ('5', '4', '26', '42', '61', '42', '23', '35');
INSERT INTO `player_levelstats` VALUES ('5', '4', '27', '43', '63', '43', '23', '36');
INSERT INTO `player_levelstats` VALUES ('5', '4', '28', '44', '65', '44', '23', '36');
INSERT INTO `player_levelstats` VALUES ('5', '4', '29', '45', '67', '44', '24', '37');
INSERT INTO `player_levelstats` VALUES ('5', '4', '30', '46', '69', '45', '24', '37');
INSERT INTO `player_levelstats` VALUES ('5', '4', '31', '47', '71', '46', '24', '38');
INSERT INTO `player_levelstats` VALUES ('5', '4', '32', '48', '72', '47', '24', '38');
INSERT INTO `player_levelstats` VALUES ('5', '4', '33', '49', '74', '48', '25', '39');
INSERT INTO `player_levelstats` VALUES ('5', '4', '34', '50', '76', '49', '25', '39');
INSERT INTO `player_levelstats` VALUES ('5', '4', '35', '51', '78', '50', '25', '40');
INSERT INTO `player_levelstats` VALUES ('5', '4', '36', '52', '80', '51', '25', '41');
INSERT INTO `player_levelstats` VALUES ('5', '4', '37', '53', '82', '52', '26', '41');
INSERT INTO `player_levelstats` VALUES ('5', '4', '38', '54', '84', '53', '26', '42');
INSERT INTO `player_levelstats` VALUES ('5', '4', '39', '55', '86', '54', '26', '42');
INSERT INTO `player_levelstats` VALUES ('5', '4', '40', '56', '88', '55', '27', '43');
INSERT INTO `player_levelstats` VALUES ('5', '4', '41', '57', '90', '56', '27', '43');
INSERT INTO `player_levelstats` VALUES ('5', '4', '42', '59', '92', '57', '27', '44');
INSERT INTO `player_levelstats` VALUES ('5', '4', '43', '60', '94', '58', '27', '45');
INSERT INTO `player_levelstats` VALUES ('5', '4', '44', '61', '96', '59', '28', '45');
INSERT INTO `player_levelstats` VALUES ('5', '4', '45', '62', '99', '60', '28', '46');
INSERT INTO `player_levelstats` VALUES ('5', '4', '46', '63', '101', '61', '28', '46');
INSERT INTO `player_levelstats` VALUES ('5', '4', '47', '64', '103', '63', '29', '47');
INSERT INTO `player_levelstats` VALUES ('5', '4', '48', '66', '105', '64', '29', '48');
INSERT INTO `player_levelstats` VALUES ('5', '4', '49', '67', '107', '65', '29', '48');
INSERT INTO `player_levelstats` VALUES ('5', '4', '50', '68', '109', '66', '30', '49');
INSERT INTO `player_levelstats` VALUES ('5', '4', '51', '69', '111', '67', '30', '50');
INSERT INTO `player_levelstats` VALUES ('5', '4', '52', '70', '114', '68', '30', '50');
INSERT INTO `player_levelstats` VALUES ('5', '4', '53', '72', '116', '69', '31', '51');
INSERT INTO `player_levelstats` VALUES ('5', '4', '54', '73', '118', '70', '31', '52');
INSERT INTO `player_levelstats` VALUES ('5', '4', '55', '74', '120', '72', '31', '52');
INSERT INTO `player_levelstats` VALUES ('5', '4', '56', '75', '123', '73', '32', '53');
INSERT INTO `player_levelstats` VALUES ('5', '4', '57', '77', '125', '74', '32', '54');
INSERT INTO `player_levelstats` VALUES ('5', '4', '58', '78', '127', '75', '32', '54');
INSERT INTO `player_levelstats` VALUES ('5', '4', '59', '79', '130', '76', '33', '55');
INSERT INTO `player_levelstats` VALUES ('5', '4', '60', '81', '132', '77', '33', '56');
INSERT INTO `player_levelstats` VALUES ('5', '4', '61', '82', '134', '79', '34', '56');
INSERT INTO `player_levelstats` VALUES ('5', '4', '62', '83', '137', '80', '34', '57');
INSERT INTO `player_levelstats` VALUES ('5', '4', '63', '84', '139', '81', '34', '58');
INSERT INTO `player_levelstats` VALUES ('5', '4', '64', '86', '141', '82', '35', '59');
INSERT INTO `player_levelstats` VALUES ('5', '4', '65', '87', '144', '84', '35', '59');
INSERT INTO `player_levelstats` VALUES ('5', '4', '66', '88', '146', '85', '35', '60');
INSERT INTO `player_levelstats` VALUES ('5', '4', '67', '90', '149', '86', '36', '61');
INSERT INTO `player_levelstats` VALUES ('5', '4', '68', '91', '151', '87', '36', '61');
INSERT INTO `player_levelstats` VALUES ('5', '4', '69', '93', '154', '89', '37', '62');
INSERT INTO `player_levelstats` VALUES ('5', '4', '70', '94', '156', '90', '37', '63');
INSERT INTO `player_levelstats` VALUES ('5', '5', '1', '19', '18', '21', '20', '28');
INSERT INTO `player_levelstats` VALUES ('5', '5', '2', '19', '18', '21', '21', '29');
INSERT INTO `player_levelstats` VALUES ('5', '5', '3', '19', '18', '22', '23', '31');
INSERT INTO `player_levelstats` VALUES ('5', '5', '4', '19', '19', '22', '24', '32');
INSERT INTO `player_levelstats` VALUES ('5', '5', '5', '20', '19', '22', '25', '33');
INSERT INTO `player_levelstats` VALUES ('5', '5', '6', '20', '19', '23', '27', '35');
INSERT INTO `player_levelstats` VALUES ('5', '5', '7', '20', '19', '23', '28', '36');
INSERT INTO `player_levelstats` VALUES ('5', '5', '8', '20', '20', '24', '29', '38');
INSERT INTO `player_levelstats` VALUES ('5', '5', '9', '20', '20', '24', '31', '39');
INSERT INTO `player_levelstats` VALUES ('5', '5', '10', '20', '20', '24', '32', '40');
INSERT INTO `player_levelstats` VALUES ('5', '5', '11', '21', '20', '25', '34', '42');
INSERT INTO `player_levelstats` VALUES ('5', '5', '12', '21', '21', '25', '35', '43');
INSERT INTO `player_levelstats` VALUES ('5', '5', '13', '21', '21', '26', '37', '45');
INSERT INTO `player_levelstats` VALUES ('5', '5', '14', '21', '21', '26', '38', '46');
INSERT INTO `player_levelstats` VALUES ('5', '5', '15', '21', '21', '26', '39', '48');
INSERT INTO `player_levelstats` VALUES ('5', '5', '16', '22', '22', '27', '41', '50');
INSERT INTO `player_levelstats` VALUES ('5', '5', '17', '22', '22', '27', '42', '51');
INSERT INTO `player_levelstats` VALUES ('5', '5', '18', '22', '22', '28', '44', '53');
INSERT INTO `player_levelstats` VALUES ('5', '5', '19', '22', '23', '28', '46', '54');
INSERT INTO `player_levelstats` VALUES ('5', '5', '20', '22', '23', '29', '47', '56');
INSERT INTO `player_levelstats` VALUES ('5', '5', '21', '23', '23', '29', '49', '57');
INSERT INTO `player_levelstats` VALUES ('5', '5', '22', '23', '23', '30', '50', '59');
INSERT INTO `player_levelstats` VALUES ('5', '5', '23', '23', '24', '30', '52', '61');
INSERT INTO `player_levelstats` VALUES ('5', '5', '24', '23', '24', '31', '53', '62');
INSERT INTO `player_levelstats` VALUES ('5', '5', '25', '24', '24', '31', '55', '64');
INSERT INTO `player_levelstats` VALUES ('5', '5', '26', '24', '25', '32', '57', '66');
INSERT INTO `player_levelstats` VALUES ('5', '5', '27', '24', '25', '32', '58', '68');
INSERT INTO `player_levelstats` VALUES ('5', '5', '28', '24', '25', '33', '60', '69');
INSERT INTO `player_levelstats` VALUES ('5', '5', '29', '25', '26', '33', '62', '71');
INSERT INTO `player_levelstats` VALUES ('5', '5', '30', '25', '26', '34', '63', '73');
INSERT INTO `player_levelstats` VALUES ('5', '5', '31', '25', '26', '34', '65', '75');
INSERT INTO `player_levelstats` VALUES ('5', '5', '32', '25', '27', '35', '67', '76');
INSERT INTO `player_levelstats` VALUES ('5', '5', '33', '26', '27', '35', '69', '78');
INSERT INTO `player_levelstats` VALUES ('5', '5', '34', '26', '27', '36', '70', '80');
INSERT INTO `player_levelstats` VALUES ('5', '5', '35', '26', '28', '36', '72', '82');
INSERT INTO `player_levelstats` VALUES ('5', '5', '36', '26', '28', '37', '74', '84');
INSERT INTO `player_levelstats` VALUES ('5', '5', '37', '27', '28', '37', '76', '86');
INSERT INTO `player_levelstats` VALUES ('5', '5', '38', '27', '29', '38', '77', '87');
INSERT INTO `player_levelstats` VALUES ('5', '5', '39', '27', '29', '38', '79', '89');
INSERT INTO `player_levelstats` VALUES ('5', '5', '40', '28', '30', '39', '81', '91');
INSERT INTO `player_levelstats` VALUES ('5', '5', '41', '28', '30', '40', '83', '93');
INSERT INTO `player_levelstats` VALUES ('5', '5', '42', '28', '30', '40', '85', '95');
INSERT INTO `player_levelstats` VALUES ('5', '5', '43', '28', '31', '41', '87', '97');
INSERT INTO `player_levelstats` VALUES ('5', '5', '44', '29', '31', '41', '89', '99');
INSERT INTO `player_levelstats` VALUES ('5', '5', '45', '29', '32', '42', '91', '101');
INSERT INTO `player_levelstats` VALUES ('5', '5', '46', '29', '32', '43', '92', '103');
INSERT INTO `player_levelstats` VALUES ('5', '5', '47', '30', '32', '43', '94', '105');
INSERT INTO `player_levelstats` VALUES ('5', '5', '48', '30', '33', '44', '96', '107');
INSERT INTO `player_levelstats` VALUES ('5', '5', '49', '30', '33', '44', '98', '109');
INSERT INTO `player_levelstats` VALUES ('5', '5', '50', '31', '34', '45', '100', '111');
INSERT INTO `player_levelstats` VALUES ('5', '5', '51', '31', '34', '46', '102', '113');
INSERT INTO `player_levelstats` VALUES ('5', '5', '52', '31', '35', '46', '104', '115');
INSERT INTO `player_levelstats` VALUES ('5', '5', '53', '32', '35', '47', '106', '118');
INSERT INTO `player_levelstats` VALUES ('5', '5', '54', '32', '35', '48', '108', '120');
INSERT INTO `player_levelstats` VALUES ('5', '5', '55', '32', '36', '48', '110', '122');
INSERT INTO `player_levelstats` VALUES ('5', '5', '56', '33', '36', '49', '113', '124');
INSERT INTO `player_levelstats` VALUES ('5', '5', '57', '33', '37', '50', '115', '126');
INSERT INTO `player_levelstats` VALUES ('5', '5', '58', '33', '37', '50', '117', '128');
INSERT INTO `player_levelstats` VALUES ('5', '5', '59', '34', '38', '51', '119', '131');
INSERT INTO `player_levelstats` VALUES ('5', '5', '60', '34', '38', '52', '121', '133');
INSERT INTO `player_levelstats` VALUES ('5', '5', '61', '34', '39', '52', '123', '135');
INSERT INTO `player_levelstats` VALUES ('5', '5', '62', '35', '39', '53', '125', '137');
INSERT INTO `player_levelstats` VALUES ('5', '5', '63', '35', '40', '54', '127', '140');
INSERT INTO `player_levelstats` VALUES ('5', '5', '64', '36', '40', '55', '130', '142');
INSERT INTO `player_levelstats` VALUES ('5', '5', '65', '36', '41', '55', '132', '144');
INSERT INTO `player_levelstats` VALUES ('5', '5', '66', '36', '41', '56', '134', '147');
INSERT INTO `player_levelstats` VALUES ('5', '5', '67', '37', '41', '57', '136', '149');
INSERT INTO `player_levelstats` VALUES ('5', '5', '68', '37', '42', '58', '138', '151');
INSERT INTO `player_levelstats` VALUES ('5', '5', '69', '38', '42', '58', '141', '154');
INSERT INTO `player_levelstats` VALUES ('5', '5', '70', '38', '43', '59', '143', '156');
INSERT INTO `player_levelstats` VALUES ('5', '8', '1', '19', '18', '21', '21', '27');
INSERT INTO `player_levelstats` VALUES ('5', '8', '2', '19', '18', '21', '22', '28');
INSERT INTO `player_levelstats` VALUES ('5', '8', '3', '19', '18', '22', '24', '30');
INSERT INTO `player_levelstats` VALUES ('5', '8', '4', '19', '18', '22', '25', '31');
INSERT INTO `player_levelstats` VALUES ('5', '8', '5', '19', '19', '22', '26', '32');
INSERT INTO `player_levelstats` VALUES ('5', '8', '6', '19', '19', '22', '28', '34');
INSERT INTO `player_levelstats` VALUES ('5', '8', '7', '20', '19', '23', '29', '35');
INSERT INTO `player_levelstats` VALUES ('5', '8', '8', '20', '19', '23', '31', '36');
INSERT INTO `player_levelstats` VALUES ('5', '8', '9', '20', '19', '23', '32', '38');
INSERT INTO `player_levelstats` VALUES ('5', '8', '10', '20', '19', '24', '34', '39');
INSERT INTO `player_levelstats` VALUES ('5', '8', '11', '20', '20', '24', '35', '40');
INSERT INTO `player_levelstats` VALUES ('5', '8', '12', '20', '20', '24', '37', '42');
INSERT INTO `player_levelstats` VALUES ('5', '8', '13', '20', '20', '25', '38', '43');
INSERT INTO `player_levelstats` VALUES ('5', '8', '14', '20', '20', '25', '40', '45');
INSERT INTO `player_levelstats` VALUES ('5', '8', '15', '20', '20', '25', '41', '46');
INSERT INTO `player_levelstats` VALUES ('5', '8', '16', '21', '21', '26', '43', '48');
INSERT INTO `player_levelstats` VALUES ('5', '8', '17', '21', '21', '26', '44', '49');
INSERT INTO `player_levelstats` VALUES ('5', '8', '18', '21', '21', '26', '46', '51');
INSERT INTO `player_levelstats` VALUES ('5', '8', '19', '21', '21', '27', '48', '52');
INSERT INTO `player_levelstats` VALUES ('5', '8', '20', '21', '21', '27', '49', '54');
INSERT INTO `player_levelstats` VALUES ('5', '8', '21', '21', '22', '27', '51', '55');
INSERT INTO `player_levelstats` VALUES ('5', '8', '22', '21', '22', '28', '52', '57');
INSERT INTO `player_levelstats` VALUES ('5', '8', '23', '21', '22', '28', '54', '58');
INSERT INTO `player_levelstats` VALUES ('5', '8', '24', '22', '22', '29', '56', '60');
INSERT INTO `player_levelstats` VALUES ('5', '8', '25', '22', '23', '29', '57', '62');
INSERT INTO `player_levelstats` VALUES ('5', '8', '26', '22', '23', '29', '59', '63');
INSERT INTO `player_levelstats` VALUES ('5', '8', '27', '22', '23', '30', '61', '65');
INSERT INTO `player_levelstats` VALUES ('5', '8', '28', '22', '23', '30', '63', '67');
INSERT INTO `player_levelstats` VALUES ('5', '8', '29', '22', '24', '31', '64', '68');
INSERT INTO `player_levelstats` VALUES ('5', '8', '30', '23', '24', '31', '66', '70');
INSERT INTO `player_levelstats` VALUES ('5', '8', '31', '23', '24', '31', '68', '72');
INSERT INTO `player_levelstats` VALUES ('5', '8', '32', '23', '24', '32', '70', '73');
INSERT INTO `player_levelstats` VALUES ('5', '8', '33', '23', '25', '32', '72', '75');
INSERT INTO `player_levelstats` VALUES ('5', '8', '34', '23', '25', '33', '73', '77');
INSERT INTO `player_levelstats` VALUES ('5', '8', '35', '24', '25', '33', '75', '79');
INSERT INTO `player_levelstats` VALUES ('5', '8', '36', '24', '25', '34', '77', '80');
INSERT INTO `player_levelstats` VALUES ('5', '8', '37', '24', '26', '34', '79', '82');
INSERT INTO `player_levelstats` VALUES ('5', '8', '38', '24', '26', '35', '81', '84');
INSERT INTO `player_levelstats` VALUES ('5', '8', '39', '24', '26', '35', '83', '86');
INSERT INTO `player_levelstats` VALUES ('5', '8', '40', '24', '27', '35', '85', '88');
INSERT INTO `player_levelstats` VALUES ('5', '8', '41', '25', '27', '36', '87', '90');
INSERT INTO `player_levelstats` VALUES ('5', '8', '42', '25', '27', '36', '89', '91');
INSERT INTO `player_levelstats` VALUES ('5', '8', '43', '25', '27', '37', '90', '93');
INSERT INTO `player_levelstats` VALUES ('5', '8', '44', '25', '28', '37', '92', '95');
INSERT INTO `player_levelstats` VALUES ('5', '8', '45', '26', '28', '38', '94', '97');
INSERT INTO `player_levelstats` VALUES ('5', '8', '46', '26', '28', '38', '96', '99');
INSERT INTO `player_levelstats` VALUES ('5', '8', '47', '26', '29', '39', '98', '101');
INSERT INTO `player_levelstats` VALUES ('5', '8', '48', '26', '29', '39', '100', '103');
INSERT INTO `player_levelstats` VALUES ('5', '8', '49', '26', '29', '40', '103', '105');
INSERT INTO `player_levelstats` VALUES ('5', '8', '50', '27', '30', '40', '105', '107');
INSERT INTO `player_levelstats` VALUES ('5', '8', '51', '27', '30', '41', '107', '109');
INSERT INTO `player_levelstats` VALUES ('5', '8', '52', '27', '30', '42', '109', '111');
INSERT INTO `player_levelstats` VALUES ('5', '8', '53', '27', '31', '42', '111', '113');
INSERT INTO `player_levelstats` VALUES ('5', '8', '54', '28', '31', '43', '113', '115');
INSERT INTO `player_levelstats` VALUES ('5', '8', '55', '28', '31', '43', '115', '117');
INSERT INTO `player_levelstats` VALUES ('5', '8', '56', '28', '32', '44', '117', '119');
INSERT INTO `player_levelstats` VALUES ('5', '8', '57', '28', '32', '44', '119', '121');
INSERT INTO `player_levelstats` VALUES ('5', '8', '58', '29', '32', '45', '122', '123');
INSERT INTO `player_levelstats` VALUES ('5', '8', '59', '29', '33', '45', '124', '126');
INSERT INTO `player_levelstats` VALUES ('5', '8', '60', '29', '33', '46', '126', '128');
INSERT INTO `player_levelstats` VALUES ('5', '8', '61', '29', '34', '47', '128', '130');
INSERT INTO `player_levelstats` VALUES ('5', '8', '62', '30', '34', '47', '131', '132');
INSERT INTO `player_levelstats` VALUES ('5', '8', '63', '30', '34', '48', '133', '134');
INSERT INTO `player_levelstats` VALUES ('5', '8', '64', '30', '35', '48', '135', '136');
INSERT INTO `player_levelstats` VALUES ('5', '8', '65', '31', '35', '49', '137', '139');
INSERT INTO `player_levelstats` VALUES ('5', '8', '66', '31', '35', '50', '140', '141');
INSERT INTO `player_levelstats` VALUES ('5', '8', '67', '31', '36', '50', '142', '143');
INSERT INTO `player_levelstats` VALUES ('5', '8', '68', '31', '36', '51', '144', '145');
INSERT INTO `player_levelstats` VALUES ('5', '8', '69', '32', '37', '51', '147', '148');
INSERT INTO `player_levelstats` VALUES ('5', '8', '70', '32', '37', '52', '149', '150');
INSERT INTO `player_levelstats` VALUES ('5', '9', '1', '19', '18', '22', '20', '27');
INSERT INTO `player_levelstats` VALUES ('5', '9', '2', '19', '18', '23', '21', '28');
INSERT INTO `player_levelstats` VALUES ('5', '9', '3', '20', '19', '23', '22', '29');
INSERT INTO `player_levelstats` VALUES ('5', '9', '4', '20', '19', '24', '24', '30');
INSERT INTO `player_levelstats` VALUES ('5', '9', '5', '20', '19', '24', '25', '32');
INSERT INTO `player_levelstats` VALUES ('5', '9', '6', '20', '20', '25', '26', '33');
INSERT INTO `player_levelstats` VALUES ('5', '9', '7', '21', '20', '25', '27', '34');
INSERT INTO `player_levelstats` VALUES ('5', '9', '8', '21', '21', '26', '28', '35');
INSERT INTO `player_levelstats` VALUES ('5', '9', '9', '21', '21', '26', '30', '36');
INSERT INTO `player_levelstats` VALUES ('5', '9', '10', '22', '21', '27', '31', '38');
INSERT INTO `player_levelstats` VALUES ('5', '9', '11', '22', '22', '28', '32', '39');
INSERT INTO `player_levelstats` VALUES ('5', '9', '12', '22', '22', '28', '34', '40');
INSERT INTO `player_levelstats` VALUES ('5', '9', '13', '23', '23', '29', '35', '41');
INSERT INTO `player_levelstats` VALUES ('5', '9', '14', '23', '23', '30', '36', '43');
INSERT INTO `player_levelstats` VALUES ('5', '9', '15', '23', '24', '30', '37', '44');
INSERT INTO `player_levelstats` VALUES ('5', '9', '16', '24', '24', '31', '39', '45');
INSERT INTO `player_levelstats` VALUES ('5', '9', '17', '24', '24', '31', '40', '47');
INSERT INTO `player_levelstats` VALUES ('5', '9', '18', '24', '25', '32', '42', '48');
INSERT INTO `player_levelstats` VALUES ('5', '9', '19', '25', '25', '33', '43', '49');
INSERT INTO `player_levelstats` VALUES ('5', '9', '20', '25', '26', '33', '44', '51');
INSERT INTO `player_levelstats` VALUES ('5', '9', '21', '26', '26', '34', '46', '52');
INSERT INTO `player_levelstats` VALUES ('5', '9', '22', '26', '27', '35', '47', '53');
INSERT INTO `player_levelstats` VALUES ('5', '9', '23', '26', '27', '36', '49', '55');
INSERT INTO `player_levelstats` VALUES ('5', '9', '24', '27', '28', '36', '50', '56');
INSERT INTO `player_levelstats` VALUES ('5', '9', '25', '27', '28', '37', '52', '58');
INSERT INTO `player_levelstats` VALUES ('5', '9', '26', '27', '29', '38', '53', '59');
INSERT INTO `player_levelstats` VALUES ('5', '9', '27', '28', '29', '38', '55', '60');
INSERT INTO `player_levelstats` VALUES ('5', '9', '28', '28', '30', '39', '56', '62');
INSERT INTO `player_levelstats` VALUES ('5', '9', '29', '29', '30', '40', '58', '63');
INSERT INTO `player_levelstats` VALUES ('5', '9', '30', '29', '31', '41', '59', '65');
INSERT INTO `player_levelstats` VALUES ('5', '9', '31', '30', '31', '41', '61', '66');
INSERT INTO `player_levelstats` VALUES ('5', '9', '32', '30', '32', '42', '62', '68');
INSERT INTO `player_levelstats` VALUES ('5', '9', '33', '30', '32', '43', '64', '69');
INSERT INTO `player_levelstats` VALUES ('5', '9', '34', '31', '33', '44', '65', '71');
INSERT INTO `player_levelstats` VALUES ('5', '9', '35', '31', '33', '45', '67', '73');
INSERT INTO `player_levelstats` VALUES ('5', '9', '36', '32', '34', '45', '69', '74');
INSERT INTO `player_levelstats` VALUES ('5', '9', '37', '32', '34', '46', '70', '76');
INSERT INTO `player_levelstats` VALUES ('5', '9', '38', '33', '35', '47', '72', '77');
INSERT INTO `player_levelstats` VALUES ('5', '9', '39', '33', '36', '48', '73', '79');
INSERT INTO `player_levelstats` VALUES ('5', '9', '40', '34', '36', '49', '75', '81');
INSERT INTO `player_levelstats` VALUES ('5', '9', '41', '34', '37', '49', '77', '82');
INSERT INTO `player_levelstats` VALUES ('5', '9', '42', '35', '37', '50', '78', '84');
INSERT INTO `player_levelstats` VALUES ('5', '9', '43', '35', '38', '51', '80', '86');
INSERT INTO `player_levelstats` VALUES ('5', '9', '44', '36', '39', '52', '82', '87');
INSERT INTO `player_levelstats` VALUES ('5', '9', '45', '36', '39', '53', '84', '89');
INSERT INTO `player_levelstats` VALUES ('5', '9', '46', '37', '40', '54', '85', '91');
INSERT INTO `player_levelstats` VALUES ('5', '9', '47', '37', '40', '55', '87', '92');
INSERT INTO `player_levelstats` VALUES ('5', '9', '48', '38', '41', '55', '89', '94');
INSERT INTO `player_levelstats` VALUES ('5', '9', '49', '38', '42', '56', '91', '96');
INSERT INTO `player_levelstats` VALUES ('5', '9', '50', '39', '42', '57', '92', '98');
INSERT INTO `player_levelstats` VALUES ('5', '9', '51', '39', '43', '58', '94', '100');
INSERT INTO `player_levelstats` VALUES ('5', '9', '52', '40', '44', '59', '96', '101');
INSERT INTO `player_levelstats` VALUES ('5', '9', '53', '40', '44', '60', '98', '103');
INSERT INTO `player_levelstats` VALUES ('5', '9', '54', '41', '45', '61', '100', '105');
INSERT INTO `player_levelstats` VALUES ('5', '9', '55', '41', '45', '62', '102', '107');
INSERT INTO `player_levelstats` VALUES ('5', '9', '56', '42', '46', '63', '103', '109');
INSERT INTO `player_levelstats` VALUES ('5', '9', '57', '42', '47', '64', '105', '111');
INSERT INTO `player_levelstats` VALUES ('5', '9', '58', '43', '47', '65', '107', '112');
INSERT INTO `player_levelstats` VALUES ('5', '9', '59', '43', '48', '66', '109', '114');
INSERT INTO `player_levelstats` VALUES ('5', '9', '60', '44', '49', '67', '111', '116');
INSERT INTO `player_levelstats` VALUES ('5', '9', '61', '45', '50', '68', '113', '118');
INSERT INTO `player_levelstats` VALUES ('5', '9', '62', '45', '50', '69', '115', '120');
INSERT INTO `player_levelstats` VALUES ('5', '9', '63', '46', '51', '70', '117', '122');
INSERT INTO `player_levelstats` VALUES ('5', '9', '64', '46', '52', '71', '119', '124');
INSERT INTO `player_levelstats` VALUES ('5', '9', '65', '47', '52', '72', '121', '126');
INSERT INTO `player_levelstats` VALUES ('5', '9', '66', '48', '53', '73', '123', '128');
INSERT INTO `player_levelstats` VALUES ('5', '9', '67', '48', '54', '74', '125', '130');
INSERT INTO `player_levelstats` VALUES ('5', '9', '68', '49', '55', '75', '127', '132');
INSERT INTO `player_levelstats` VALUES ('5', '9', '69', '49', '55', '76', '129', '134');
INSERT INTO `player_levelstats` VALUES ('5', '9', '70', '50', '56', '77', '131', '136');
INSERT INTO `player_levelstats` VALUES ('6', '1', '1', '28', '15', '24', '15', '22');
INSERT INTO `player_levelstats` VALUES ('6', '1', '2', '29', '16', '25', '15', '22');
INSERT INTO `player_levelstats` VALUES ('6', '1', '3', '31', '17', '26', '15', '23');
INSERT INTO `player_levelstats` VALUES ('6', '1', '4', '32', '17', '27', '15', '23');
INSERT INTO `player_levelstats` VALUES ('6', '1', '5', '33', '18', '29', '15', '23');
INSERT INTO `player_levelstats` VALUES ('6', '1', '6', '34', '19', '30', '15', '23');
INSERT INTO `player_levelstats` VALUES ('6', '1', '7', '36', '20', '31', '16', '24');
INSERT INTO `player_levelstats` VALUES ('6', '1', '8', '37', '21', '32', '16', '24');
INSERT INTO `player_levelstats` VALUES ('6', '1', '9', '38', '22', '34', '16', '24');
INSERT INTO `player_levelstats` VALUES ('6', '1', '10', '40', '22', '35', '16', '25');
INSERT INTO `player_levelstats` VALUES ('6', '1', '11', '41', '23', '36', '16', '25');
INSERT INTO `player_levelstats` VALUES ('6', '1', '12', '43', '24', '37', '16', '25');
INSERT INTO `player_levelstats` VALUES ('6', '1', '13', '44', '25', '39', '16', '26');
INSERT INTO `player_levelstats` VALUES ('6', '1', '14', '46', '26', '40', '16', '26');
INSERT INTO `player_levelstats` VALUES ('6', '1', '15', '47', '27', '41', '17', '26');
INSERT INTO `player_levelstats` VALUES ('6', '1', '16', '48', '28', '43', '17', '27');
INSERT INTO `player_levelstats` VALUES ('6', '1', '17', '50', '29', '44', '17', '27');
INSERT INTO `player_levelstats` VALUES ('6', '1', '18', '51', '30', '45', '17', '27');
INSERT INTO `player_levelstats` VALUES ('6', '1', '19', '53', '31', '47', '17', '28');
INSERT INTO `player_levelstats` VALUES ('6', '1', '20', '54', '32', '48', '17', '28');
INSERT INTO `player_levelstats` VALUES ('6', '1', '21', '56', '33', '50', '17', '28');
INSERT INTO `player_levelstats` VALUES ('6', '1', '22', '58', '34', '51', '18', '29');
INSERT INTO `player_levelstats` VALUES ('6', '1', '23', '59', '35', '52', '18', '29');
INSERT INTO `player_levelstats` VALUES ('6', '1', '24', '61', '36', '54', '18', '30');
INSERT INTO `player_levelstats` VALUES ('6', '1', '25', '62', '37', '55', '18', '30');
INSERT INTO `player_levelstats` VALUES ('6', '1', '26', '64', '38', '57', '18', '30');
INSERT INTO `player_levelstats` VALUES ('6', '1', '27', '66', '39', '58', '18', '31');
INSERT INTO `player_levelstats` VALUES ('6', '1', '28', '67', '40', '60', '18', '31');
INSERT INTO `player_levelstats` VALUES ('6', '1', '29', '69', '41', '61', '19', '32');
INSERT INTO `player_levelstats` VALUES ('6', '1', '30', '71', '42', '63', '19', '32');
INSERT INTO `player_levelstats` VALUES ('6', '1', '31', '72', '43', '64', '19', '32');
INSERT INTO `player_levelstats` VALUES ('6', '1', '32', '74', '44', '66', '19', '33');
INSERT INTO `player_levelstats` VALUES ('6', '1', '33', '76', '45', '67', '19', '33');
INSERT INTO `player_levelstats` VALUES ('6', '1', '34', '77', '46', '69', '20', '34');
INSERT INTO `player_levelstats` VALUES ('6', '1', '35', '79', '47', '71', '20', '34');
INSERT INTO `player_levelstats` VALUES ('6', '1', '36', '81', '48', '72', '20', '35');
INSERT INTO `player_levelstats` VALUES ('6', '1', '37', '83', '49', '74', '20', '35');
INSERT INTO `player_levelstats` VALUES ('6', '1', '38', '85', '50', '76', '20', '35');
INSERT INTO `player_levelstats` VALUES ('6', '1', '39', '86', '51', '77', '21', '36');
INSERT INTO `player_levelstats` VALUES ('6', '1', '40', '88', '53', '79', '21', '36');
INSERT INTO `player_levelstats` VALUES ('6', '1', '41', '90', '54', '81', '21', '37');
INSERT INTO `player_levelstats` VALUES ('6', '1', '42', '92', '55', '82', '21', '37');
INSERT INTO `player_levelstats` VALUES ('6', '1', '43', '94', '56', '84', '21', '38');
INSERT INTO `player_levelstats` VALUES ('6', '1', '44', '96', '57', '86', '22', '38');
INSERT INTO `player_levelstats` VALUES ('6', '1', '45', '98', '58', '87', '22', '39');
INSERT INTO `player_levelstats` VALUES ('6', '1', '46', '99', '60', '89', '22', '39');
INSERT INTO `player_levelstats` VALUES ('6', '1', '47', '101', '61', '91', '22', '40');
INSERT INTO `player_levelstats` VALUES ('6', '1', '48', '103', '62', '93', '22', '40');
INSERT INTO `player_levelstats` VALUES ('6', '1', '49', '105', '63', '94', '23', '41');
INSERT INTO `player_levelstats` VALUES ('6', '1', '50', '107', '65', '96', '23', '41');
INSERT INTO `player_levelstats` VALUES ('6', '1', '51', '109', '66', '98', '23', '42');
INSERT INTO `player_levelstats` VALUES ('6', '1', '52', '111', '67', '100', '23', '42');
INSERT INTO `player_levelstats` VALUES ('6', '1', '53', '113', '68', '102', '24', '43');
INSERT INTO `player_levelstats` VALUES ('6', '1', '54', '115', '70', '104', '24', '44');
INSERT INTO `player_levelstats` VALUES ('6', '1', '55', '117', '71', '105', '24', '44');
INSERT INTO `player_levelstats` VALUES ('6', '1', '56', '119', '72', '107', '24', '45');
INSERT INTO `player_levelstats` VALUES ('6', '1', '57', '122', '73', '109', '25', '45');
INSERT INTO `player_levelstats` VALUES ('6', '1', '58', '124', '75', '111', '25', '46');
INSERT INTO `player_levelstats` VALUES ('6', '1', '59', '126', '76', '113', '25', '46');
INSERT INTO `player_levelstats` VALUES ('6', '1', '60', '128', '77', '115', '25', '47');
INSERT INTO `player_levelstats` VALUES ('6', '1', '61', '130', '79', '117', '26', '48');
INSERT INTO `player_levelstats` VALUES ('6', '1', '62', '132', '80', '119', '26', '48');
INSERT INTO `player_levelstats` VALUES ('6', '1', '63', '134', '81', '121', '26', '49');
INSERT INTO `player_levelstats` VALUES ('6', '1', '64', '137', '83', '123', '26', '49');
INSERT INTO `player_levelstats` VALUES ('6', '1', '65', '139', '84', '125', '27', '50');
INSERT INTO `player_levelstats` VALUES ('6', '1', '66', '141', '85', '127', '27', '51');
INSERT INTO `player_levelstats` VALUES ('6', '1', '67', '143', '87', '129', '27', '51');
INSERT INTO `player_levelstats` VALUES ('6', '1', '68', '145', '88', '131', '27', '52');
INSERT INTO `player_levelstats` VALUES ('6', '1', '69', '148', '90', '133', '28', '52');
INSERT INTO `player_levelstats` VALUES ('6', '1', '70', '150', '91', '135', '28', '53');
INSERT INTO `player_levelstats` VALUES ('6', '3', '1', '25', '18', '23', '15', '23');
INSERT INTO `player_levelstats` VALUES ('6', '3', '2', '25', '19', '24', '16', '24');
INSERT INTO `player_levelstats` VALUES ('6', '3', '3', '26', '21', '25', '16', '24');
INSERT INTO `player_levelstats` VALUES ('6', '3', '4', '26', '22', '26', '17', '25');
INSERT INTO `player_levelstats` VALUES ('6', '3', '5', '27', '24', '27', '17', '25');
INSERT INTO `player_levelstats` VALUES ('6', '3', '6', '27', '25', '28', '18', '26');
INSERT INTO `player_levelstats` VALUES ('6', '3', '7', '28', '26', '28', '19', '27');
INSERT INTO `player_levelstats` VALUES ('6', '3', '8', '28', '28', '29', '19', '27');
INSERT INTO `player_levelstats` VALUES ('6', '3', '9', '28', '29', '30', '20', '28');
INSERT INTO `player_levelstats` VALUES ('6', '3', '10', '29', '31', '31', '20', '29');
INSERT INTO `player_levelstats` VALUES ('6', '3', '11', '29', '32', '32', '21', '29');
INSERT INTO `player_levelstats` VALUES ('6', '3', '12', '30', '34', '33', '22', '30');
INSERT INTO `player_levelstats` VALUES ('6', '3', '13', '30', '35', '34', '22', '31');
INSERT INTO `player_levelstats` VALUES ('6', '3', '14', '31', '37', '35', '23', '32');
INSERT INTO `player_levelstats` VALUES ('6', '3', '15', '31', '38', '36', '24', '32');
INSERT INTO `player_levelstats` VALUES ('6', '3', '16', '32', '40', '37', '24', '33');
INSERT INTO `player_levelstats` VALUES ('6', '3', '17', '32', '41', '39', '25', '34');
INSERT INTO `player_levelstats` VALUES ('6', '3', '18', '33', '43', '40', '26', '35');
INSERT INTO `player_levelstats` VALUES ('6', '3', '19', '33', '45', '41', '27', '35');
INSERT INTO `player_levelstats` VALUES ('6', '3', '20', '34', '46', '42', '27', '36');
INSERT INTO `player_levelstats` VALUES ('6', '3', '21', '34', '48', '43', '28', '37');
INSERT INTO `player_levelstats` VALUES ('6', '3', '22', '35', '50', '44', '29', '38');
INSERT INTO `player_levelstats` VALUES ('6', '3', '23', '35', '51', '45', '29', '38');
INSERT INTO `player_levelstats` VALUES ('6', '3', '24', '36', '53', '46', '30', '39');
INSERT INTO `player_levelstats` VALUES ('6', '3', '25', '37', '55', '47', '31', '40');
INSERT INTO `player_levelstats` VALUES ('6', '3', '26', '37', '56', '48', '32', '41');
INSERT INTO `player_levelstats` VALUES ('6', '3', '27', '38', '58', '50', '32', '42');
INSERT INTO `player_levelstats` VALUES ('6', '3', '28', '38', '60', '51', '33', '42');
INSERT INTO `player_levelstats` VALUES ('6', '3', '29', '39', '62', '52', '34', '43');
INSERT INTO `player_levelstats` VALUES ('6', '3', '30', '39', '63', '53', '35', '44');
INSERT INTO `player_levelstats` VALUES ('6', '3', '31', '40', '65', '54', '36', '45');
INSERT INTO `player_levelstats` VALUES ('6', '3', '32', '41', '67', '56', '36', '46');
INSERT INTO `player_levelstats` VALUES ('6', '3', '33', '41', '69', '57', '37', '47');
INSERT INTO `player_levelstats` VALUES ('6', '3', '34', '42', '71', '58', '38', '48');
INSERT INTO `player_levelstats` VALUES ('6', '3', '35', '43', '72', '59', '39', '48');
INSERT INTO `player_levelstats` VALUES ('6', '3', '36', '43', '74', '61', '40', '49');
INSERT INTO `player_levelstats` VALUES ('6', '3', '37', '44', '76', '62', '40', '50');
INSERT INTO `player_levelstats` VALUES ('6', '3', '38', '45', '78', '63', '41', '51');
INSERT INTO `player_levelstats` VALUES ('6', '3', '39', '45', '80', '64', '42', '52');
INSERT INTO `player_levelstats` VALUES ('6', '3', '40', '46', '82', '66', '43', '53');
INSERT INTO `player_levelstats` VALUES ('6', '3', '41', '47', '84', '67', '44', '54');
INSERT INTO `player_levelstats` VALUES ('6', '3', '42', '47', '86', '68', '45', '55');
INSERT INTO `player_levelstats` VALUES ('6', '3', '43', '48', '88', '70', '46', '56');
INSERT INTO `player_levelstats` VALUES ('6', '3', '44', '49', '90', '71', '46', '57');
INSERT INTO `player_levelstats` VALUES ('6', '3', '45', '49', '92', '72', '47', '58');
INSERT INTO `player_levelstats` VALUES ('6', '3', '46', '50', '94', '74', '48', '59');
INSERT INTO `player_levelstats` VALUES ('6', '3', '47', '51', '96', '75', '49', '60');
INSERT INTO `player_levelstats` VALUES ('6', '3', '48', '51', '98', '77', '50', '61');
INSERT INTO `player_levelstats` VALUES ('6', '3', '49', '52', '100', '78', '51', '62');
INSERT INTO `player_levelstats` VALUES ('6', '3', '50', '53', '102', '79', '52', '63');
INSERT INTO `player_levelstats` VALUES ('6', '3', '51', '54', '104', '81', '53', '64');
INSERT INTO `player_levelstats` VALUES ('6', '3', '52', '54', '106', '82', '54', '65');
INSERT INTO `player_levelstats` VALUES ('6', '3', '53', '55', '108', '84', '55', '66');
INSERT INTO `player_levelstats` VALUES ('6', '3', '54', '56', '110', '85', '56', '67');
INSERT INTO `player_levelstats` VALUES ('6', '3', '55', '57', '112', '87', '57', '68');
INSERT INTO `player_levelstats` VALUES ('6', '3', '56', '57', '114', '88', '58', '69');
INSERT INTO `player_levelstats` VALUES ('6', '3', '57', '58', '117', '90', '59', '70');
INSERT INTO `player_levelstats` VALUES ('6', '3', '58', '59', '119', '91', '60', '71');
INSERT INTO `player_levelstats` VALUES ('6', '3', '59', '60', '121', '93', '61', '72');
INSERT INTO `player_levelstats` VALUES ('6', '3', '60', '61', '123', '94', '62', '74');
INSERT INTO `player_levelstats` VALUES ('6', '3', '61', '61', '125', '96', '63', '75');
INSERT INTO `player_levelstats` VALUES ('6', '3', '62', '62', '128', '97', '64', '76');
INSERT INTO `player_levelstats` VALUES ('6', '3', '63', '63', '130', '99', '65', '77');
INSERT INTO `player_levelstats` VALUES ('6', '3', '64', '64', '132', '100', '66', '78');
INSERT INTO `player_levelstats` VALUES ('6', '3', '65', '65', '134', '102', '67', '79');
INSERT INTO `player_levelstats` VALUES ('6', '3', '66', '66', '137', '104', '68', '80');
INSERT INTO `player_levelstats` VALUES ('6', '3', '67', '66', '139', '105', '69', '81');
INSERT INTO `player_levelstats` VALUES ('6', '3', '68', '67', '141', '107', '70', '83');
INSERT INTO `player_levelstats` VALUES ('6', '3', '69', '68', '144', '108', '71', '84');
INSERT INTO `player_levelstats` VALUES ('6', '3', '70', '69', '146', '110', '72', '85');
INSERT INTO `player_levelstats` VALUES ('6', '7', '1', '26', '15', '23', '16', '24');
INSERT INTO `player_levelstats` VALUES ('6', '7', '2', '27', '15', '24', '17', '25');
INSERT INTO `player_levelstats` VALUES ('6', '7', '3', '28', '16', '25', '18', '26');
INSERT INTO `player_levelstats` VALUES ('6', '7', '4', '28', '16', '26', '19', '27');
INSERT INTO `player_levelstats` VALUES ('6', '7', '5', '29', '17', '27', '20', '28');
INSERT INTO `player_levelstats` VALUES ('6', '7', '6', '30', '17', '28', '21', '29');
INSERT INTO `player_levelstats` VALUES ('6', '7', '7', '31', '18', '29', '22', '30');
INSERT INTO `player_levelstats` VALUES ('6', '7', '8', '32', '18', '30', '23', '31');
INSERT INTO `player_levelstats` VALUES ('6', '7', '9', '33', '19', '31', '24', '32');
INSERT INTO `player_levelstats` VALUES ('6', '7', '10', '34', '19', '32', '25', '33');
INSERT INTO `player_levelstats` VALUES ('6', '7', '11', '35', '20', '33', '26', '35');
INSERT INTO `player_levelstats` VALUES ('6', '7', '12', '35', '20', '34', '27', '36');
INSERT INTO `player_levelstats` VALUES ('6', '7', '13', '36', '21', '35', '28', '37');
INSERT INTO `player_levelstats` VALUES ('6', '7', '14', '37', '21', '36', '29', '38');
INSERT INTO `player_levelstats` VALUES ('6', '7', '15', '38', '22', '37', '30', '39');
INSERT INTO `player_levelstats` VALUES ('6', '7', '16', '39', '22', '39', '31', '40');
INSERT INTO `player_levelstats` VALUES ('6', '7', '17', '40', '23', '40', '32', '42');
INSERT INTO `player_levelstats` VALUES ('6', '7', '18', '41', '23', '41', '33', '43');
INSERT INTO `player_levelstats` VALUES ('6', '7', '19', '42', '24', '42', '34', '44');
INSERT INTO `player_levelstats` VALUES ('6', '7', '20', '43', '24', '43', '35', '45');
INSERT INTO `player_levelstats` VALUES ('6', '7', '21', '44', '25', '44', '36', '46');
INSERT INTO `player_levelstats` VALUES ('6', '7', '22', '45', '25', '45', '37', '48');
INSERT INTO `player_levelstats` VALUES ('6', '7', '23', '46', '26', '47', '38', '49');
INSERT INTO `player_levelstats` VALUES ('6', '7', '24', '47', '27', '48', '40', '50');
INSERT INTO `player_levelstats` VALUES ('6', '7', '25', '48', '27', '49', '41', '51');
INSERT INTO `player_levelstats` VALUES ('6', '7', '26', '49', '28', '50', '42', '53');
INSERT INTO `player_levelstats` VALUES ('6', '7', '27', '51', '28', '52', '43', '54');
INSERT INTO `player_levelstats` VALUES ('6', '7', '28', '52', '29', '53', '44', '55');
INSERT INTO `player_levelstats` VALUES ('6', '7', '29', '53', '29', '54', '45', '57');
INSERT INTO `player_levelstats` VALUES ('6', '7', '30', '54', '30', '55', '47', '58');
INSERT INTO `player_levelstats` VALUES ('6', '7', '31', '55', '31', '57', '48', '59');
INSERT INTO `player_levelstats` VALUES ('6', '7', '32', '56', '31', '58', '49', '61');
INSERT INTO `player_levelstats` VALUES ('6', '7', '33', '57', '32', '59', '50', '62');
INSERT INTO `player_levelstats` VALUES ('6', '7', '34', '58', '33', '61', '51', '64');
INSERT INTO `player_levelstats` VALUES ('6', '7', '35', '60', '33', '62', '53', '65');
INSERT INTO `player_levelstats` VALUES ('6', '7', '36', '61', '34', '63', '54', '66');
INSERT INTO `player_levelstats` VALUES ('6', '7', '37', '62', '34', '65', '55', '68');
INSERT INTO `player_levelstats` VALUES ('6', '7', '38', '63', '35', '66', '57', '69');
INSERT INTO `player_levelstats` VALUES ('6', '7', '39', '64', '36', '67', '58', '71');
INSERT INTO `player_levelstats` VALUES ('6', '7', '40', '66', '36', '69', '59', '72');
INSERT INTO `player_levelstats` VALUES ('6', '7', '41', '67', '37', '70', '60', '74');
INSERT INTO `player_levelstats` VALUES ('6', '7', '42', '68', '38', '72', '62', '75');
INSERT INTO `player_levelstats` VALUES ('6', '7', '43', '69', '38', '73', '63', '77');
INSERT INTO `player_levelstats` VALUES ('6', '7', '44', '70', '39', '74', '64', '78');
INSERT INTO `player_levelstats` VALUES ('6', '7', '45', '72', '40', '76', '66', '80');
INSERT INTO `player_levelstats` VALUES ('6', '7', '46', '73', '41', '77', '67', '81');
INSERT INTO `player_levelstats` VALUES ('6', '7', '47', '74', '41', '79', '69', '83');
INSERT INTO `player_levelstats` VALUES ('6', '7', '48', '76', '42', '80', '70', '84');
INSERT INTO `player_levelstats` VALUES ('6', '7', '49', '77', '43', '82', '71', '86');
INSERT INTO `player_levelstats` VALUES ('6', '7', '50', '78', '43', '83', '73', '88');
INSERT INTO `player_levelstats` VALUES ('6', '7', '51', '80', '44', '85', '74', '89');
INSERT INTO `player_levelstats` VALUES ('6', '7', '52', '81', '45', '86', '76', '91');
INSERT INTO `player_levelstats` VALUES ('6', '7', '53', '82', '46', '88', '77', '92');
INSERT INTO `player_levelstats` VALUES ('6', '7', '54', '84', '46', '90', '78', '94');
INSERT INTO `player_levelstats` VALUES ('6', '7', '55', '85', '47', '91', '80', '96');
INSERT INTO `player_levelstats` VALUES ('6', '7', '56', '86', '48', '93', '81', '97');
INSERT INTO `player_levelstats` VALUES ('6', '7', '57', '88', '49', '94', '83', '99');
INSERT INTO `player_levelstats` VALUES ('6', '7', '58', '89', '49', '96', '84', '101');
INSERT INTO `player_levelstats` VALUES ('6', '7', '59', '91', '50', '97', '86', '102');
INSERT INTO `player_levelstats` VALUES ('6', '7', '60', '92', '51', '99', '87', '104');
INSERT INTO `player_levelstats` VALUES ('6', '7', '61', '94', '52', '101', '89', '106');
INSERT INTO `player_levelstats` VALUES ('6', '7', '62', '95', '52', '102', '90', '108');
INSERT INTO `player_levelstats` VALUES ('6', '7', '63', '96', '53', '104', '92', '109');
INSERT INTO `player_levelstats` VALUES ('6', '7', '64', '98', '54', '106', '93', '111');
INSERT INTO `player_levelstats` VALUES ('6', '7', '65', '99', '55', '107', '95', '113');
INSERT INTO `player_levelstats` VALUES ('6', '7', '66', '101', '56', '109', '97', '115');
INSERT INTO `player_levelstats` VALUES ('6', '7', '67', '102', '57', '111', '98', '117');
INSERT INTO `player_levelstats` VALUES ('6', '7', '68', '104', '57', '113', '100', '118');
INSERT INTO `player_levelstats` VALUES ('6', '7', '69', '105', '58', '114', '101', '120');
INSERT INTO `player_levelstats` VALUES ('6', '7', '70', '107', '59', '116', '103', '122');
INSERT INTO `player_levelstats` VALUES ('6', '11', '1', '26', '15', '22', '17', '24');
INSERT INTO `player_levelstats` VALUES ('6', '11', '2', '27', '16', '23', '18', '25');
INSERT INTO `player_levelstats` VALUES ('6', '11', '3', '27', '16', '23', '19', '26');
INSERT INTO `player_levelstats` VALUES ('6', '11', '4', '28', '17', '24', '20', '27');
INSERT INTO `player_levelstats` VALUES ('6', '11', '5', '28', '17', '25', '21', '29');
INSERT INTO `player_levelstats` VALUES ('6', '11', '6', '29', '18', '25', '22', '30');
INSERT INTO `player_levelstats` VALUES ('6', '11', '7', '29', '18', '26', '23', '31');
INSERT INTO `player_levelstats` VALUES ('6', '11', '8', '30', '19', '27', '24', '32');
INSERT INTO `player_levelstats` VALUES ('6', '11', '9', '30', '19', '27', '26', '34');
INSERT INTO `player_levelstats` VALUES ('6', '11', '10', '31', '20', '28', '27', '35');
INSERT INTO `player_levelstats` VALUES ('6', '11', '11', '32', '20', '29', '28', '36');
INSERT INTO `player_levelstats` VALUES ('6', '11', '12', '32', '21', '29', '29', '37');
INSERT INTO `player_levelstats` VALUES ('6', '11', '13', '33', '21', '30', '30', '39');
INSERT INTO `player_levelstats` VALUES ('6', '11', '14', '33', '22', '31', '31', '40');
INSERT INTO `player_levelstats` VALUES ('6', '11', '15', '34', '23', '32', '32', '41');
INSERT INTO `player_levelstats` VALUES ('6', '11', '16', '35', '23', '32', '34', '43');
INSERT INTO `player_levelstats` VALUES ('6', '11', '17', '35', '24', '33', '35', '44');
INSERT INTO `player_levelstats` VALUES ('6', '11', '18', '36', '24', '34', '36', '45');
INSERT INTO `player_levelstats` VALUES ('6', '11', '19', '37', '25', '35', '37', '47');
INSERT INTO `player_levelstats` VALUES ('6', '11', '20', '37', '26', '35', '39', '48');
INSERT INTO `player_levelstats` VALUES ('6', '11', '21', '38', '26', '36', '40', '50');
INSERT INTO `player_levelstats` VALUES ('6', '11', '22', '39', '27', '37', '41', '51');
INSERT INTO `player_levelstats` VALUES ('6', '11', '23', '39', '28', '38', '42', '52');
INSERT INTO `player_levelstats` VALUES ('6', '11', '24', '40', '28', '39', '44', '54');
INSERT INTO `player_levelstats` VALUES ('6', '11', '25', '41', '29', '39', '45', '55');
INSERT INTO `player_levelstats` VALUES ('6', '11', '26', '41', '30', '40', '46', '57');
INSERT INTO `player_levelstats` VALUES ('6', '11', '27', '42', '30', '41', '47', '58');
INSERT INTO `player_levelstats` VALUES ('6', '11', '28', '43', '31', '42', '49', '60');
INSERT INTO `player_levelstats` VALUES ('6', '11', '29', '44', '32', '43', '50', '61');
INSERT INTO `player_levelstats` VALUES ('6', '11', '30', '44', '32', '44', '52', '63');
INSERT INTO `player_levelstats` VALUES ('6', '11', '31', '45', '33', '44', '53', '64');
INSERT INTO `player_levelstats` VALUES ('6', '11', '32', '46', '34', '45', '54', '66');
INSERT INTO `player_levelstats` VALUES ('6', '11', '33', '47', '34', '46', '56', '67');
INSERT INTO `player_levelstats` VALUES ('6', '11', '34', '47', '35', '47', '57', '69');
INSERT INTO `player_levelstats` VALUES ('6', '11', '35', '48', '36', '48', '58', '71');
INSERT INTO `player_levelstats` VALUES ('6', '11', '36', '49', '36', '49', '60', '72');
INSERT INTO `player_levelstats` VALUES ('6', '11', '37', '50', '37', '50', '61', '74');
INSERT INTO `player_levelstats` VALUES ('6', '11', '38', '51', '38', '51', '63', '76');
INSERT INTO `player_levelstats` VALUES ('6', '11', '39', '52', '39', '52', '64', '77');
INSERT INTO `player_levelstats` VALUES ('6', '11', '40', '52', '39', '53', '66', '79');
INSERT INTO `player_levelstats` VALUES ('6', '11', '41', '53', '40', '54', '67', '81');
INSERT INTO `player_levelstats` VALUES ('6', '11', '42', '54', '41', '55', '69', '82');
INSERT INTO `player_levelstats` VALUES ('6', '11', '43', '55', '42', '56', '70', '84');
INSERT INTO `player_levelstats` VALUES ('6', '11', '44', '56', '43', '57', '72', '86');
INSERT INTO `player_levelstats` VALUES ('6', '11', '45', '57', '43', '57', '73', '87');
INSERT INTO `player_levelstats` VALUES ('6', '11', '46', '57', '44', '58', '75', '89');
INSERT INTO `player_levelstats` VALUES ('6', '11', '47', '58', '45', '60', '76', '91');
INSERT INTO `player_levelstats` VALUES ('6', '11', '48', '59', '46', '61', '78', '93');
INSERT INTO `player_levelstats` VALUES ('6', '11', '49', '60', '47', '62', '79', '94');
INSERT INTO `player_levelstats` VALUES ('6', '11', '50', '61', '47', '63', '81', '96');
INSERT INTO `player_levelstats` VALUES ('6', '11', '51', '62', '48', '64', '83', '98');
INSERT INTO `player_levelstats` VALUES ('6', '11', '52', '63', '49', '65', '84', '100');
INSERT INTO `player_levelstats` VALUES ('6', '11', '53', '64', '50', '66', '86', '102');
INSERT INTO `player_levelstats` VALUES ('6', '11', '54', '65', '51', '67', '87', '104');
INSERT INTO `player_levelstats` VALUES ('6', '11', '55', '66', '51', '68', '89', '105');
INSERT INTO `player_levelstats` VALUES ('6', '11', '56', '67', '52', '69', '91', '107');
INSERT INTO `player_levelstats` VALUES ('6', '11', '57', '68', '53', '70', '92', '109');
INSERT INTO `player_levelstats` VALUES ('6', '11', '58', '69', '54', '71', '94', '111');
INSERT INTO `player_levelstats` VALUES ('6', '11', '59', '70', '55', '72', '96', '113');
INSERT INTO `player_levelstats` VALUES ('6', '11', '60', '71', '56', '73', '97', '115');
INSERT INTO `player_levelstats` VALUES ('6', '11', '61', '72', '57', '74', '99', '117');
INSERT INTO `player_levelstats` VALUES ('6', '11', '62', '73', '58', '76', '101', '119');
INSERT INTO `player_levelstats` VALUES ('6', '11', '63', '74', '59', '77', '103', '121');
INSERT INTO `player_levelstats` VALUES ('6', '11', '64', '75', '59', '78', '104', '123');
INSERT INTO `player_levelstats` VALUES ('6', '11', '65', '76', '60', '79', '106', '125');
INSERT INTO `player_levelstats` VALUES ('6', '11', '66', '77', '61', '80', '108', '127');
INSERT INTO `player_levelstats` VALUES ('6', '11', '67', '78', '62', '81', '110', '129');
INSERT INTO `player_levelstats` VALUES ('6', '11', '68', '79', '63', '83', '111', '131');
INSERT INTO `player_levelstats` VALUES ('6', '11', '69', '80', '64', '84', '113', '133');
INSERT INTO `player_levelstats` VALUES ('6', '11', '70', '81', '65', '85', '115', '135');
INSERT INTO `player_levelstats` VALUES ('7', '1', '1', '18', '23', '21', '24', '20');
INSERT INTO `player_levelstats` VALUES ('7', '1', '2', '19', '24', '22', '24', '20');
INSERT INTO `player_levelstats` VALUES ('7', '1', '3', '21', '25', '23', '24', '21');
INSERT INTO `player_levelstats` VALUES ('7', '1', '4', '22', '25', '25', '24', '21');
INSERT INTO `player_levelstats` VALUES ('7', '1', '5', '23', '26', '26', '24', '21');
INSERT INTO `player_levelstats` VALUES ('7', '1', '6', '25', '27', '27', '24', '21');
INSERT INTO `player_levelstats` VALUES ('7', '1', '7', '26', '28', '28', '24', '22');
INSERT INTO `player_levelstats` VALUES ('7', '1', '8', '27', '29', '29', '25', '22');
INSERT INTO `player_levelstats` VALUES ('7', '1', '9', '29', '29', '31', '25', '22');
INSERT INTO `player_levelstats` VALUES ('7', '1', '10', '30', '30', '32', '25', '23');
INSERT INTO `player_levelstats` VALUES ('7', '1', '11', '32', '31', '33', '25', '23');
INSERT INTO `player_levelstats` VALUES ('7', '1', '12', '33', '32', '34', '25', '23');
INSERT INTO `player_levelstats` VALUES ('7', '1', '13', '34', '33', '36', '25', '24');
INSERT INTO `player_levelstats` VALUES ('7', '1', '14', '36', '34', '37', '25', '24');
INSERT INTO `player_levelstats` VALUES ('7', '1', '15', '37', '35', '38', '25', '24');
INSERT INTO `player_levelstats` VALUES ('7', '1', '16', '39', '36', '40', '25', '25');
INSERT INTO `player_levelstats` VALUES ('7', '1', '17', '40', '36', '41', '25', '25');
INSERT INTO `player_levelstats` VALUES ('7', '1', '18', '42', '37', '43', '26', '25');
INSERT INTO `player_levelstats` VALUES ('7', '1', '19', '43', '38', '44', '26', '26');
INSERT INTO `player_levelstats` VALUES ('7', '1', '20', '45', '39', '45', '26', '26');
INSERT INTO `player_levelstats` VALUES ('7', '1', '21', '47', '40', '47', '26', '26');
INSERT INTO `player_levelstats` VALUES ('7', '1', '22', '48', '41', '48', '26', '27');
INSERT INTO `player_levelstats` VALUES ('7', '1', '23', '50', '42', '50', '26', '27');
INSERT INTO `player_levelstats` VALUES ('7', '1', '24', '51', '43', '51', '26', '28');
INSERT INTO `player_levelstats` VALUES ('7', '1', '25', '53', '44', '52', '27', '28');
INSERT INTO `player_levelstats` VALUES ('7', '1', '26', '55', '45', '54', '27', '28');
INSERT INTO `player_levelstats` VALUES ('7', '1', '27', '56', '46', '55', '27', '29');
INSERT INTO `player_levelstats` VALUES ('7', '1', '28', '58', '47', '57', '27', '29');
INSERT INTO `player_levelstats` VALUES ('7', '1', '29', '59', '48', '58', '27', '30');
INSERT INTO `player_levelstats` VALUES ('7', '1', '30', '61', '49', '60', '27', '30');
INSERT INTO `player_levelstats` VALUES ('7', '1', '31', '63', '50', '62', '27', '30');
INSERT INTO `player_levelstats` VALUES ('7', '1', '32', '65', '51', '63', '28', '31');
INSERT INTO `player_levelstats` VALUES ('7', '1', '33', '66', '52', '65', '28', '31');
INSERT INTO `player_levelstats` VALUES ('7', '1', '34', '68', '53', '66', '28', '32');
INSERT INTO `player_levelstats` VALUES ('7', '1', '35', '70', '55', '68', '28', '32');
INSERT INTO `player_levelstats` VALUES ('7', '1', '36', '72', '56', '69', '28', '33');
INSERT INTO `player_levelstats` VALUES ('7', '1', '37', '73', '57', '71', '29', '33');
INSERT INTO `player_levelstats` VALUES ('7', '1', '38', '75', '58', '73', '29', '34');
INSERT INTO `player_levelstats` VALUES ('7', '1', '39', '77', '59', '74', '29', '34');
INSERT INTO `player_levelstats` VALUES ('7', '1', '40', '79', '60', '76', '29', '35');
INSERT INTO `player_levelstats` VALUES ('7', '1', '41', '81', '61', '78', '29', '35');
INSERT INTO `player_levelstats` VALUES ('7', '1', '42', '82', '62', '79', '30', '35');
INSERT INTO `player_levelstats` VALUES ('7', '1', '43', '84', '64', '81', '30', '36');
INSERT INTO `player_levelstats` VALUES ('7', '1', '44', '86', '65', '83', '30', '36');
INSERT INTO `player_levelstats` VALUES ('7', '1', '45', '88', '66', '85', '30', '37');
INSERT INTO `player_levelstats` VALUES ('7', '1', '46', '90', '67', '86', '30', '37');
INSERT INTO `player_levelstats` VALUES ('7', '1', '47', '92', '68', '88', '31', '38');
INSERT INTO `player_levelstats` VALUES ('7', '1', '48', '94', '70', '90', '31', '38');
INSERT INTO `player_levelstats` VALUES ('7', '1', '49', '96', '71', '92', '31', '39');
INSERT INTO `player_levelstats` VALUES ('7', '1', '50', '98', '72', '93', '31', '40');
INSERT INTO `player_levelstats` VALUES ('7', '1', '51', '100', '73', '95', '32', '40');
INSERT INTO `player_levelstats` VALUES ('7', '1', '52', '102', '75', '97', '32', '41');
INSERT INTO `player_levelstats` VALUES ('7', '1', '53', '104', '76', '99', '32', '41');
INSERT INTO `player_levelstats` VALUES ('7', '1', '54', '106', '77', '101', '32', '42');
INSERT INTO `player_levelstats` VALUES ('7', '1', '55', '108', '78', '103', '33', '42');
INSERT INTO `player_levelstats` VALUES ('7', '1', '56', '110', '80', '104', '33', '43');
INSERT INTO `player_levelstats` VALUES ('7', '1', '57', '112', '81', '106', '33', '43');
INSERT INTO `player_levelstats` VALUES ('7', '1', '58', '114', '82', '108', '33', '44');
INSERT INTO `player_levelstats` VALUES ('7', '1', '59', '116', '84', '110', '34', '44');
INSERT INTO `player_levelstats` VALUES ('7', '1', '60', '118', '85', '112', '34', '45');
INSERT INTO `player_levelstats` VALUES ('7', '1', '61', '120', '86', '114', '34', '46');
INSERT INTO `player_levelstats` VALUES ('7', '1', '62', '122', '88', '116', '35', '46');
INSERT INTO `player_levelstats` VALUES ('7', '1', '63', '125', '89', '118', '35', '47');
INSERT INTO `player_levelstats` VALUES ('7', '1', '64', '127', '91', '120', '35', '47');
INSERT INTO `player_levelstats` VALUES ('7', '1', '65', '129', '92', '122', '35', '48');
INSERT INTO `player_levelstats` VALUES ('7', '1', '66', '131', '93', '124', '36', '49');
INSERT INTO `player_levelstats` VALUES ('7', '1', '67', '133', '95', '126', '36', '49');
INSERT INTO `player_levelstats` VALUES ('7', '1', '68', '136', '96', '128', '36', '50');
INSERT INTO `player_levelstats` VALUES ('7', '1', '69', '138', '98', '130', '37', '50');
INSERT INTO `player_levelstats` VALUES ('7', '1', '70', '140', '99', '132', '37', '51');
INSERT INTO `player_levelstats` VALUES ('7', '4', '1', '16', '26', '20', '24', '20');
INSERT INTO `player_levelstats` VALUES ('7', '4', '2', '17', '27', '21', '24', '20');
INSERT INTO `player_levelstats` VALUES ('7', '4', '3', '18', '29', '21', '24', '21');
INSERT INTO `player_levelstats` VALUES ('7', '4', '4', '18', '30', '22', '24', '21');
INSERT INTO `player_levelstats` VALUES ('7', '4', '5', '19', '32', '23', '25', '21');
INSERT INTO `player_levelstats` VALUES ('7', '4', '6', '20', '33', '24', '25', '22');
INSERT INTO `player_levelstats` VALUES ('7', '4', '7', '21', '35', '24', '25', '22');
INSERT INTO `player_levelstats` VALUES ('7', '4', '8', '22', '36', '25', '25', '23');
INSERT INTO `player_levelstats` VALUES ('7', '4', '9', '22', '38', '26', '25', '23');
INSERT INTO `player_levelstats` VALUES ('7', '4', '10', '23', '39', '26', '25', '23');
INSERT INTO `player_levelstats` VALUES ('7', '4', '11', '24', '41', '27', '25', '24');
INSERT INTO `player_levelstats` VALUES ('7', '4', '12', '25', '42', '28', '26', '24');
INSERT INTO `player_levelstats` VALUES ('7', '4', '13', '26', '44', '29', '26', '25');
INSERT INTO `player_levelstats` VALUES ('7', '4', '14', '27', '46', '30', '26', '25');
INSERT INTO `player_levelstats` VALUES ('7', '4', '15', '28', '47', '30', '26', '25');
INSERT INTO `player_levelstats` VALUES ('7', '4', '16', '28', '49', '31', '26', '26');
INSERT INTO `player_levelstats` VALUES ('7', '4', '17', '29', '50', '32', '27', '26');
INSERT INTO `player_levelstats` VALUES ('7', '4', '18', '30', '52', '33', '27', '27');
INSERT INTO `player_levelstats` VALUES ('7', '4', '19', '31', '54', '34', '27', '27');
INSERT INTO `player_levelstats` VALUES ('7', '4', '20', '32', '56', '35', '27', '28');
INSERT INTO `player_levelstats` VALUES ('7', '4', '21', '33', '57', '35', '27', '28');
INSERT INTO `player_levelstats` VALUES ('7', '4', '22', '34', '59', '36', '28', '29');
INSERT INTO `player_levelstats` VALUES ('7', '4', '23', '35', '61', '37', '28', '29');
INSERT INTO `player_levelstats` VALUES ('7', '4', '24', '36', '62', '38', '28', '30');
INSERT INTO `player_levelstats` VALUES ('7', '4', '25', '37', '64', '39', '28', '30');
INSERT INTO `player_levelstats` VALUES ('7', '4', '26', '38', '66', '40', '29', '31');
INSERT INTO `player_levelstats` VALUES ('7', '4', '27', '39', '68', '41', '29', '31');
INSERT INTO `player_levelstats` VALUES ('7', '4', '28', '40', '70', '42', '29', '32');
INSERT INTO `player_levelstats` VALUES ('7', '4', '29', '41', '72', '43', '29', '32');
INSERT INTO `player_levelstats` VALUES ('7', '4', '30', '42', '73', '43', '29', '33');
INSERT INTO `player_levelstats` VALUES ('7', '4', '31', '43', '75', '44', '30', '33');
INSERT INTO `player_levelstats` VALUES ('7', '4', '32', '44', '77', '45', '30', '34');
INSERT INTO `player_levelstats` VALUES ('7', '4', '33', '45', '79', '46', '30', '34');
INSERT INTO `player_levelstats` VALUES ('7', '4', '34', '46', '81', '47', '31', '35');
INSERT INTO `player_levelstats` VALUES ('7', '4', '35', '47', '83', '48', '31', '35');
INSERT INTO `player_levelstats` VALUES ('7', '4', '36', '48', '85', '49', '31', '36');
INSERT INTO `player_levelstats` VALUES ('7', '4', '37', '49', '87', '50', '31', '36');
INSERT INTO `player_levelstats` VALUES ('7', '4', '38', '50', '89', '51', '32', '37');
INSERT INTO `player_levelstats` VALUES ('7', '4', '39', '51', '91', '52', '32', '38');
INSERT INTO `player_levelstats` VALUES ('7', '4', '40', '53', '93', '53', '32', '38');
INSERT INTO `player_levelstats` VALUES ('7', '4', '41', '54', '95', '54', '33', '39');
INSERT INTO `player_levelstats` VALUES ('7', '4', '42', '55', '97', '55', '33', '39');
INSERT INTO `player_levelstats` VALUES ('7', '4', '43', '56', '99', '56', '33', '40');
INSERT INTO `player_levelstats` VALUES ('7', '4', '44', '57', '101', '57', '33', '40');
INSERT INTO `player_levelstats` VALUES ('7', '4', '45', '58', '103', '59', '34', '41');
INSERT INTO `player_levelstats` VALUES ('7', '4', '46', '59', '105', '60', '34', '42');
INSERT INTO `player_levelstats` VALUES ('7', '4', '47', '61', '107', '61', '34', '42');
INSERT INTO `player_levelstats` VALUES ('7', '4', '48', '62', '110', '62', '35', '43');
INSERT INTO `player_levelstats` VALUES ('7', '4', '49', '63', '112', '63', '35', '44');
INSERT INTO `player_levelstats` VALUES ('7', '4', '50', '64', '114', '64', '35', '44');
INSERT INTO `player_levelstats` VALUES ('7', '4', '51', '65', '116', '65', '36', '45');
INSERT INTO `player_levelstats` VALUES ('7', '4', '52', '67', '118', '66', '36', '45');
INSERT INTO `player_levelstats` VALUES ('7', '4', '53', '68', '121', '67', '36', '46');
INSERT INTO `player_levelstats` VALUES ('7', '4', '54', '69', '123', '69', '37', '47');
INSERT INTO `player_levelstats` VALUES ('7', '4', '55', '70', '125', '70', '37', '47');
INSERT INTO `player_levelstats` VALUES ('7', '4', '56', '72', '127', '71', '37', '48');
INSERT INTO `player_levelstats` VALUES ('7', '4', '57', '73', '130', '72', '38', '49');
INSERT INTO `player_levelstats` VALUES ('7', '4', '58', '74', '132', '73', '38', '49');
INSERT INTO `player_levelstats` VALUES ('7', '4', '59', '75', '134', '74', '39', '50');
INSERT INTO `player_levelstats` VALUES ('7', '4', '60', '77', '137', '76', '39', '51');
INSERT INTO `player_levelstats` VALUES ('7', '4', '61', '78', '139', '77', '39', '51');
INSERT INTO `player_levelstats` VALUES ('7', '4', '62', '79', '141', '78', '40', '52');
INSERT INTO `player_levelstats` VALUES ('7', '4', '63', '81', '144', '79', '40', '53');
INSERT INTO `player_levelstats` VALUES ('7', '4', '64', '82', '146', '80', '41', '54');
INSERT INTO `player_levelstats` VALUES ('7', '4', '65', '83', '149', '82', '41', '54');
INSERT INTO `player_levelstats` VALUES ('7', '4', '66', '85', '151', '83', '41', '55');
INSERT INTO `player_levelstats` VALUES ('7', '4', '67', '86', '154', '84', '42', '56');
INSERT INTO `player_levelstats` VALUES ('7', '4', '68', '87', '156', '85', '42', '57');
INSERT INTO `player_levelstats` VALUES ('7', '4', '69', '89', '158', '87', '43', '57');
INSERT INTO `player_levelstats` VALUES ('7', '4', '70', '90', '161', '88', '43', '58');
INSERT INTO `player_levelstats` VALUES ('7', '8', '1', '15', '23', '19', '27', '22');
INSERT INTO `player_levelstats` VALUES ('7', '8', '2', '15', '23', '19', '28', '23');
INSERT INTO `player_levelstats` VALUES ('7', '8', '3', '15', '23', '20', '30', '25');
INSERT INTO `player_levelstats` VALUES ('7', '8', '4', '15', '23', '20', '31', '26');
INSERT INTO `player_levelstats` VALUES ('7', '8', '5', '15', '24', '20', '32', '27');
INSERT INTO `player_levelstats` VALUES ('7', '8', '6', '15', '24', '20', '34', '29');
INSERT INTO `player_levelstats` VALUES ('7', '8', '7', '16', '24', '21', '35', '30');
INSERT INTO `player_levelstats` VALUES ('7', '8', '8', '16', '24', '21', '37', '31');
INSERT INTO `player_levelstats` VALUES ('7', '8', '9', '16', '24', '21', '38', '33');
INSERT INTO `player_levelstats` VALUES ('7', '8', '10', '16', '24', '22', '40', '34');
INSERT INTO `player_levelstats` VALUES ('7', '8', '11', '16', '25', '22', '41', '36');
INSERT INTO `player_levelstats` VALUES ('7', '8', '12', '16', '25', '22', '42', '37');
INSERT INTO `player_levelstats` VALUES ('7', '8', '13', '16', '25', '23', '44', '38');
INSERT INTO `player_levelstats` VALUES ('7', '8', '14', '16', '25', '23', '45', '40');
INSERT INTO `player_levelstats` VALUES ('7', '8', '15', '17', '25', '23', '47', '41');
INSERT INTO `player_levelstats` VALUES ('7', '8', '16', '17', '25', '24', '49', '43');
INSERT INTO `player_levelstats` VALUES ('7', '8', '17', '17', '26', '24', '50', '44');
INSERT INTO `player_levelstats` VALUES ('7', '8', '18', '17', '26', '24', '52', '46');
INSERT INTO `player_levelstats` VALUES ('7', '8', '19', '17', '26', '25', '53', '47');
INSERT INTO `player_levelstats` VALUES ('7', '8', '20', '17', '26', '25', '55', '49');
INSERT INTO `player_levelstats` VALUES ('7', '8', '21', '17', '26', '26', '57', '51');
INSERT INTO `player_levelstats` VALUES ('7', '8', '22', '18', '27', '26', '58', '52');
INSERT INTO `player_levelstats` VALUES ('7', '8', '23', '18', '27', '26', '60', '54');
INSERT INTO `player_levelstats` VALUES ('7', '8', '24', '18', '27', '27', '61', '55');
INSERT INTO `player_levelstats` VALUES ('7', '8', '25', '18', '27', '27', '63', '57');
INSERT INTO `player_levelstats` VALUES ('7', '8', '26', '18', '28', '27', '65', '59');
INSERT INTO `player_levelstats` VALUES ('7', '8', '27', '18', '28', '28', '67', '60');
INSERT INTO `player_levelstats` VALUES ('7', '8', '28', '18', '28', '28', '68', '62');
INSERT INTO `player_levelstats` VALUES ('7', '8', '29', '19', '28', '29', '70', '64');
INSERT INTO `player_levelstats` VALUES ('7', '8', '30', '19', '29', '29', '72', '65');
INSERT INTO `player_levelstats` VALUES ('7', '8', '31', '19', '29', '30', '74', '67');
INSERT INTO `player_levelstats` VALUES ('7', '8', '32', '19', '29', '30', '75', '69');
INSERT INTO `player_levelstats` VALUES ('7', '8', '33', '19', '29', '30', '77', '70');
INSERT INTO `player_levelstats` VALUES ('7', '8', '34', '20', '30', '31', '79', '72');
INSERT INTO `player_levelstats` VALUES ('7', '8', '35', '20', '30', '31', '81', '74');
INSERT INTO `player_levelstats` VALUES ('7', '8', '36', '20', '30', '32', '83', '76');
INSERT INTO `player_levelstats` VALUES ('7', '8', '37', '20', '30', '32', '85', '78');
INSERT INTO `player_levelstats` VALUES ('7', '8', '38', '20', '31', '33', '86', '79');
INSERT INTO `player_levelstats` VALUES ('7', '8', '39', '21', '31', '33', '88', '81');
INSERT INTO `player_levelstats` VALUES ('7', '8', '40', '21', '31', '34', '90', '83');
INSERT INTO `player_levelstats` VALUES ('7', '8', '41', '21', '32', '34', '92', '85');
INSERT INTO `player_levelstats` VALUES ('7', '8', '42', '21', '32', '35', '94', '87');
INSERT INTO `player_levelstats` VALUES ('7', '8', '43', '21', '32', '35', '96', '89');
INSERT INTO `player_levelstats` VALUES ('7', '8', '44', '22', '32', '36', '98', '91');
INSERT INTO `player_levelstats` VALUES ('7', '8', '45', '22', '33', '36', '100', '92');
INSERT INTO `player_levelstats` VALUES ('7', '8', '46', '22', '33', '37', '102', '94');
INSERT INTO `player_levelstats` VALUES ('7', '8', '47', '22', '33', '37', '104', '96');
INSERT INTO `player_levelstats` VALUES ('7', '8', '48', '22', '34', '38', '106', '98');
INSERT INTO `player_levelstats` VALUES ('7', '8', '49', '23', '34', '38', '108', '100');
INSERT INTO `player_levelstats` VALUES ('7', '8', '50', '23', '34', '39', '110', '102');
INSERT INTO `player_levelstats` VALUES ('7', '8', '51', '23', '35', '39', '112', '104');
INSERT INTO `player_levelstats` VALUES ('7', '8', '52', '23', '35', '40', '114', '106');
INSERT INTO `player_levelstats` VALUES ('7', '8', '53', '24', '35', '40', '117', '108');
INSERT INTO `player_levelstats` VALUES ('7', '8', '54', '24', '36', '41', '119', '110');
INSERT INTO `player_levelstats` VALUES ('7', '8', '55', '24', '36', '41', '121', '112');
INSERT INTO `player_levelstats` VALUES ('7', '8', '56', '24', '37', '42', '123', '114');
INSERT INTO `player_levelstats` VALUES ('7', '8', '57', '25', '37', '42', '125', '117');
INSERT INTO `player_levelstats` VALUES ('7', '8', '58', '25', '37', '43', '127', '119');
INSERT INTO `player_levelstats` VALUES ('7', '8', '59', '25', '38', '43', '130', '121');
INSERT INTO `player_levelstats` VALUES ('7', '8', '60', '25', '38', '44', '132', '123');
INSERT INTO `player_levelstats` VALUES ('7', '8', '61', '26', '38', '45', '134', '125');
INSERT INTO `player_levelstats` VALUES ('7', '8', '62', '26', '39', '45', '136', '127');
INSERT INTO `player_levelstats` VALUES ('7', '8', '63', '26', '39', '46', '139', '129');
INSERT INTO `player_levelstats` VALUES ('7', '8', '64', '26', '40', '46', '141', '132');
INSERT INTO `player_levelstats` VALUES ('7', '8', '65', '27', '40', '47', '143', '134');
INSERT INTO `player_levelstats` VALUES ('7', '8', '66', '27', '40', '48', '146', '136');
INSERT INTO `player_levelstats` VALUES ('7', '8', '67', '27', '41', '48', '148', '138');
INSERT INTO `player_levelstats` VALUES ('7', '8', '68', '27', '41', '49', '150', '140');
INSERT INTO `player_levelstats` VALUES ('7', '8', '69', '28', '42', '49', '153', '143');
INSERT INTO `player_levelstats` VALUES ('7', '8', '70', '28', '42', '50', '155', '145');
INSERT INTO `player_levelstats` VALUES ('7', '9', '1', '15', '23', '20', '26', '22');
INSERT INTO `player_levelstats` VALUES ('7', '9', '2', '15', '23', '21', '27', '23');
INSERT INTO `player_levelstats` VALUES ('7', '9', '3', '16', '24', '21', '28', '24');
INSERT INTO `player_levelstats` VALUES ('7', '9', '4', '16', '24', '22', '29', '25');
INSERT INTO `player_levelstats` VALUES ('7', '9', '5', '16', '24', '22', '31', '27');
INSERT INTO `player_levelstats` VALUES ('7', '9', '6', '17', '25', '23', '32', '28');
INSERT INTO `player_levelstats` VALUES ('7', '9', '7', '17', '25', '23', '33', '29');
INSERT INTO `player_levelstats` VALUES ('7', '9', '8', '17', '26', '24', '34', '30');
INSERT INTO `player_levelstats` VALUES ('7', '9', '9', '17', '26', '25', '36', '31');
INSERT INTO `player_levelstats` VALUES ('7', '9', '10', '18', '26', '25', '37', '33');
INSERT INTO `player_levelstats` VALUES ('7', '9', '11', '18', '27', '26', '38', '34');
INSERT INTO `player_levelstats` VALUES ('7', '9', '12', '18', '27', '26', '39', '35');
INSERT INTO `player_levelstats` VALUES ('7', '9', '13', '19', '28', '27', '41', '36');
INSERT INTO `player_levelstats` VALUES ('7', '9', '14', '19', '28', '28', '42', '38');
INSERT INTO `player_levelstats` VALUES ('7', '9', '15', '20', '28', '28', '43', '39');
INSERT INTO `player_levelstats` VALUES ('7', '9', '16', '20', '29', '29', '45', '40');
INSERT INTO `player_levelstats` VALUES ('7', '9', '17', '20', '29', '30', '46', '42');
INSERT INTO `player_levelstats` VALUES ('7', '9', '18', '21', '30', '30', '47', '43');
INSERT INTO `player_levelstats` VALUES ('7', '9', '19', '21', '30', '31', '49', '44');
INSERT INTO `player_levelstats` VALUES ('7', '9', '20', '21', '31', '32', '50', '46');
INSERT INTO `player_levelstats` VALUES ('7', '9', '21', '22', '31', '32', '51', '47');
INSERT INTO `player_levelstats` VALUES ('7', '9', '22', '22', '31', '33', '53', '49');
INSERT INTO `player_levelstats` VALUES ('7', '9', '23', '23', '32', '34', '54', '50');
INSERT INTO `player_levelstats` VALUES ('7', '9', '24', '23', '32', '34', '56', '51');
INSERT INTO `player_levelstats` VALUES ('7', '9', '25', '23', '33', '35', '57', '53');
INSERT INTO `player_levelstats` VALUES ('7', '9', '26', '24', '33', '36', '59', '54');
INSERT INTO `player_levelstats` VALUES ('7', '9', '27', '24', '34', '37', '60', '56');
INSERT INTO `player_levelstats` VALUES ('7', '9', '28', '25', '34', '37', '62', '57');
INSERT INTO `player_levelstats` VALUES ('7', '9', '29', '25', '35', '38', '63', '59');
INSERT INTO `player_levelstats` VALUES ('7', '9', '30', '25', '35', '39', '65', '60');
INSERT INTO `player_levelstats` VALUES ('7', '9', '31', '26', '36', '40', '66', '62');
INSERT INTO `player_levelstats` VALUES ('7', '9', '32', '26', '36', '40', '68', '63');
INSERT INTO `player_levelstats` VALUES ('7', '9', '33', '27', '37', '41', '69', '65');
INSERT INTO `player_levelstats` VALUES ('7', '9', '34', '27', '38', '42', '71', '66');
INSERT INTO `player_levelstats` VALUES ('7', '9', '35', '28', '38', '43', '73', '68');
INSERT INTO `player_levelstats` VALUES ('7', '9', '36', '28', '39', '43', '74', '69');
INSERT INTO `player_levelstats` VALUES ('7', '9', '37', '28', '39', '44', '76', '71');
INSERT INTO `player_levelstats` VALUES ('7', '9', '38', '29', '40', '45', '77', '73');
INSERT INTO `player_levelstats` VALUES ('7', '9', '39', '29', '40', '46', '79', '74');
INSERT INTO `player_levelstats` VALUES ('7', '9', '40', '30', '41', '47', '81', '76');
INSERT INTO `player_levelstats` VALUES ('7', '9', '41', '30', '41', '48', '82', '78');
INSERT INTO `player_levelstats` VALUES ('7', '9', '42', '31', '42', '48', '84', '79');
INSERT INTO `player_levelstats` VALUES ('7', '9', '43', '31', '43', '49', '86', '81');
INSERT INTO `player_levelstats` VALUES ('7', '9', '44', '32', '43', '50', '88', '83');
INSERT INTO `player_levelstats` VALUES ('7', '9', '45', '32', '44', '51', '89', '84');
INSERT INTO `player_levelstats` VALUES ('7', '9', '46', '33', '44', '52', '91', '86');
INSERT INTO `player_levelstats` VALUES ('7', '9', '47', '33', '45', '53', '93', '88');
INSERT INTO `player_levelstats` VALUES ('7', '9', '48', '34', '46', '54', '95', '89');
INSERT INTO `player_levelstats` VALUES ('7', '9', '49', '34', '46', '54', '96', '91');
INSERT INTO `player_levelstats` VALUES ('7', '9', '50', '35', '47', '55', '98', '93');
INSERT INTO `player_levelstats` VALUES ('7', '9', '51', '35', '48', '56', '100', '95');
INSERT INTO `player_levelstats` VALUES ('7', '9', '52', '36', '48', '57', '102', '97');
INSERT INTO `player_levelstats` VALUES ('7', '9', '53', '36', '49', '58', '104', '98');
INSERT INTO `player_levelstats` VALUES ('7', '9', '54', '37', '50', '59', '105', '100');
INSERT INTO `player_levelstats` VALUES ('7', '9', '55', '37', '50', '60', '107', '102');
INSERT INTO `player_levelstats` VALUES ('7', '9', '56', '38', '51', '61', '109', '104');
INSERT INTO `player_levelstats` VALUES ('7', '9', '57', '38', '52', '62', '111', '106');
INSERT INTO `player_levelstats` VALUES ('7', '9', '58', '39', '52', '63', '113', '108');
INSERT INTO `player_levelstats` VALUES ('7', '9', '59', '40', '53', '64', '115', '109');
INSERT INTO `player_levelstats` VALUES ('7', '9', '60', '40', '54', '65', '117', '111');
INSERT INTO `player_levelstats` VALUES ('7', '9', '61', '41', '54', '66', '119', '113');
INSERT INTO `player_levelstats` VALUES ('7', '9', '62', '41', '55', '67', '121', '115');
INSERT INTO `player_levelstats` VALUES ('7', '9', '63', '42', '56', '68', '123', '117');
INSERT INTO `player_levelstats` VALUES ('7', '9', '64', '42', '57', '69', '125', '119');
INSERT INTO `player_levelstats` VALUES ('7', '9', '65', '43', '57', '70', '127', '121');
INSERT INTO `player_levelstats` VALUES ('7', '9', '66', '44', '58', '71', '129', '123');
INSERT INTO `player_levelstats` VALUES ('7', '9', '67', '44', '59', '72', '131', '125');
INSERT INTO `player_levelstats` VALUES ('7', '9', '68', '45', '59', '73', '133', '127');
INSERT INTO `player_levelstats` VALUES ('7', '9', '69', '45', '60', '74', '135', '129');
INSERT INTO `player_levelstats` VALUES ('7', '9', '70', '46', '61', '75', '137', '131');
INSERT INTO `player_levelstats` VALUES ('8', '1', '1', '24', '22', '23', '16', '21');
INSERT INTO `player_levelstats` VALUES ('8', '1', '2', '25', '23', '24', '16', '21');
INSERT INTO `player_levelstats` VALUES ('8', '1', '3', '27', '24', '25', '16', '22');
INSERT INTO `player_levelstats` VALUES ('8', '1', '4', '28', '24', '26', '16', '22');
INSERT INTO `player_levelstats` VALUES ('8', '1', '5', '29', '25', '28', '16', '22');
INSERT INTO `player_levelstats` VALUES ('8', '1', '6', '31', '26', '29', '16', '22');
INSERT INTO `player_levelstats` VALUES ('8', '1', '7', '32', '27', '30', '17', '23');
INSERT INTO `player_levelstats` VALUES ('8', '1', '8', '33', '28', '31', '17', '23');
INSERT INTO `player_levelstats` VALUES ('8', '1', '9', '35', '28', '33', '17', '23');
INSERT INTO `player_levelstats` VALUES ('8', '1', '10', '36', '29', '34', '17', '24');
INSERT INTO `player_levelstats` VALUES ('8', '1', '11', '37', '30', '35', '17', '24');
INSERT INTO `player_levelstats` VALUES ('8', '1', '12', '39', '31', '36', '17', '24');
INSERT INTO `player_levelstats` VALUES ('8', '1', '13', '40', '32', '38', '17', '25');
INSERT INTO `player_levelstats` VALUES ('8', '1', '14', '42', '33', '39', '17', '25');
INSERT INTO `player_levelstats` VALUES ('8', '1', '15', '43', '34', '40', '18', '25');
INSERT INTO `player_levelstats` VALUES ('8', '1', '16', '45', '35', '42', '18', '26');
INSERT INTO `player_levelstats` VALUES ('8', '1', '17', '46', '35', '43', '18', '26');
INSERT INTO `player_levelstats` VALUES ('8', '1', '18', '48', '36', '44', '18', '26');
INSERT INTO `player_levelstats` VALUES ('8', '1', '19', '49', '37', '46', '18', '27');
INSERT INTO `player_levelstats` VALUES ('8', '1', '20', '51', '38', '47', '18', '27');
INSERT INTO `player_levelstats` VALUES ('8', '1', '21', '52', '39', '49', '18', '27');
INSERT INTO `player_levelstats` VALUES ('8', '1', '22', '54', '40', '50', '18', '28');
INSERT INTO `player_levelstats` VALUES ('8', '1', '23', '55', '41', '51', '19', '28');
INSERT INTO `player_levelstats` VALUES ('8', '1', '24', '57', '42', '53', '19', '29');
INSERT INTO `player_levelstats` VALUES ('8', '1', '25', '59', '43', '54', '19', '29');
INSERT INTO `player_levelstats` VALUES ('8', '1', '26', '60', '44', '56', '19', '29');
INSERT INTO `player_levelstats` VALUES ('8', '1', '27', '62', '45', '57', '19', '30');
INSERT INTO `player_levelstats` VALUES ('8', '1', '28', '63', '46', '59', '19', '30');
INSERT INTO `player_levelstats` VALUES ('8', '1', '29', '65', '47', '60', '20', '31');
INSERT INTO `player_levelstats` VALUES ('8', '1', '30', '67', '48', '62', '20', '31');
INSERT INTO `player_levelstats` VALUES ('8', '1', '31', '69', '49', '63', '20', '31');
INSERT INTO `player_levelstats` VALUES ('8', '1', '32', '70', '50', '65', '20', '32');
INSERT INTO `player_levelstats` VALUES ('8', '1', '33', '72', '51', '67', '20', '32');
INSERT INTO `player_levelstats` VALUES ('8', '1', '34', '74', '53', '68', '20', '33');
INSERT INTO `player_levelstats` VALUES ('8', '1', '35', '75', '54', '70', '21', '33');
INSERT INTO `player_levelstats` VALUES ('8', '1', '36', '77', '55', '71', '21', '34');
INSERT INTO `player_levelstats` VALUES ('8', '1', '37', '79', '56', '73', '21', '34');
INSERT INTO `player_levelstats` VALUES ('8', '1', '38', '81', '57', '75', '21', '35');
INSERT INTO `player_levelstats` VALUES ('8', '1', '39', '83', '58', '76', '21', '35');
INSERT INTO `player_levelstats` VALUES ('8', '1', '40', '84', '59', '78', '22', '35');
INSERT INTO `player_levelstats` VALUES ('8', '1', '41', '86', '60', '80', '22', '36');
INSERT INTO `player_levelstats` VALUES ('8', '1', '42', '88', '62', '81', '22', '36');
INSERT INTO `player_levelstats` VALUES ('8', '1', '43', '90', '63', '83', '22', '37');
INSERT INTO `player_levelstats` VALUES ('8', '1', '44', '92', '64', '85', '22', '37');
INSERT INTO `player_levelstats` VALUES ('8', '1', '45', '94', '65', '86', '23', '38');
INSERT INTO `player_levelstats` VALUES ('8', '1', '46', '96', '66', '88', '23', '38');
INSERT INTO `player_levelstats` VALUES ('8', '1', '47', '98', '67', '90', '23', '39');
INSERT INTO `player_levelstats` VALUES ('8', '1', '48', '100', '69', '92', '23', '39');
INSERT INTO `player_levelstats` VALUES ('8', '1', '49', '102', '70', '93', '24', '40');
INSERT INTO `player_levelstats` VALUES ('8', '1', '50', '103', '71', '95', '24', '40');
INSERT INTO `player_levelstats` VALUES ('8', '1', '51', '105', '72', '97', '24', '41');
INSERT INTO `player_levelstats` VALUES ('8', '1', '52', '107', '74', '99', '24', '42');
INSERT INTO `player_levelstats` VALUES ('8', '1', '53', '109', '75', '101', '25', '42');
INSERT INTO `player_levelstats` VALUES ('8', '1', '54', '112', '76', '103', '25', '43');
INSERT INTO `player_levelstats` VALUES ('8', '1', '55', '114', '78', '104', '25', '43');
INSERT INTO `player_levelstats` VALUES ('8', '1', '56', '116', '79', '106', '25', '44');
INSERT INTO `player_levelstats` VALUES ('8', '1', '57', '118', '80', '108', '25', '44');
INSERT INTO `player_levelstats` VALUES ('8', '1', '58', '120', '81', '110', '26', '45');
INSERT INTO `player_levelstats` VALUES ('8', '1', '59', '122', '83', '112', '26', '45');
INSERT INTO `player_levelstats` VALUES ('8', '1', '60', '124', '84', '114', '26', '46');
INSERT INTO `player_levelstats` VALUES ('8', '1', '61', '126', '85', '116', '27', '47');
INSERT INTO `player_levelstats` VALUES ('8', '1', '62', '128', '87', '118', '27', '47');
INSERT INTO `player_levelstats` VALUES ('8', '1', '63', '130', '88', '120', '27', '48');
INSERT INTO `player_levelstats` VALUES ('8', '1', '64', '133', '90', '122', '27', '48');
INSERT INTO `player_levelstats` VALUES ('8', '1', '65', '135', '91', '124', '28', '49');
INSERT INTO `player_levelstats` VALUES ('8', '1', '66', '137', '92', '126', '28', '50');
INSERT INTO `player_levelstats` VALUES ('8', '1', '67', '139', '94', '128', '28', '50');
INSERT INTO `player_levelstats` VALUES ('8', '1', '68', '141', '95', '130', '28', '51');
INSERT INTO `player_levelstats` VALUES ('8', '1', '69', '144', '97', '132', '29', '51');
INSERT INTO `player_levelstats` VALUES ('8', '1', '70', '146', '98', '134', '29', '52');
INSERT INTO `player_levelstats` VALUES ('8', '3', '1', '21', '25', '22', '16', '22');
INSERT INTO `player_levelstats` VALUES ('8', '3', '2', '21', '26', '23', '17', '23');
INSERT INTO `player_levelstats` VALUES ('8', '3', '3', '22', '28', '24', '17', '23');
INSERT INTO `player_levelstats` VALUES ('8', '3', '4', '22', '29', '25', '18', '24');
INSERT INTO `player_levelstats` VALUES ('8', '3', '5', '23', '30', '26', '18', '25');
INSERT INTO `player_levelstats` VALUES ('8', '3', '6', '23', '32', '27', '19', '25');
INSERT INTO `player_levelstats` VALUES ('8', '3', '7', '24', '33', '28', '20', '26');
INSERT INTO `player_levelstats` VALUES ('8', '3', '8', '24', '35', '28', '20', '26');
INSERT INTO `player_levelstats` VALUES ('8', '3', '9', '25', '36', '29', '21', '27');
INSERT INTO `player_levelstats` VALUES ('8', '3', '10', '25', '38', '30', '21', '28');
INSERT INTO `player_levelstats` VALUES ('8', '3', '11', '25', '39', '31', '22', '29');
INSERT INTO `player_levelstats` VALUES ('8', '3', '12', '26', '41', '32', '23', '29');
INSERT INTO `player_levelstats` VALUES ('8', '3', '13', '26', '42', '33', '23', '30');
INSERT INTO `player_levelstats` VALUES ('8', '3', '14', '27', '44', '34', '24', '31');
INSERT INTO `player_levelstats` VALUES ('8', '3', '15', '27', '45', '35', '25', '31');
INSERT INTO `player_levelstats` VALUES ('8', '3', '16', '28', '47', '36', '25', '32');
INSERT INTO `player_levelstats` VALUES ('8', '3', '17', '28', '48', '38', '26', '33');
INSERT INTO `player_levelstats` VALUES ('8', '3', '18', '29', '50', '39', '27', '34');
INSERT INTO `player_levelstats` VALUES ('8', '3', '19', '29', '51', '40', '28', '34');
INSERT INTO `player_levelstats` VALUES ('8', '3', '20', '30', '53', '41', '28', '35');
INSERT INTO `player_levelstats` VALUES ('8', '3', '21', '31', '55', '42', '29', '36');
INSERT INTO `player_levelstats` VALUES ('8', '3', '22', '31', '56', '43', '30', '37');
INSERT INTO `player_levelstats` VALUES ('8', '3', '23', '32', '58', '44', '30', '37');
INSERT INTO `player_levelstats` VALUES ('8', '3', '24', '32', '60', '45', '31', '38');
INSERT INTO `player_levelstats` VALUES ('8', '3', '25', '33', '61', '46', '32', '39');
INSERT INTO `player_levelstats` VALUES ('8', '3', '26', '33', '63', '48', '33', '40');
INSERT INTO `player_levelstats` VALUES ('8', '3', '27', '34', '65', '49', '33', '41');
INSERT INTO `player_levelstats` VALUES ('8', '3', '28', '35', '66', '50', '34', '41');
INSERT INTO `player_levelstats` VALUES ('8', '3', '29', '35', '68', '51', '35', '42');
INSERT INTO `player_levelstats` VALUES ('8', '3', '30', '36', '70', '52', '36', '43');
INSERT INTO `player_levelstats` VALUES ('8', '3', '31', '36', '72', '53', '37', '44');
INSERT INTO `player_levelstats` VALUES ('8', '3', '32', '37', '73', '55', '37', '45');
INSERT INTO `player_levelstats` VALUES ('8', '3', '33', '38', '75', '56', '38', '46');
INSERT INTO `player_levelstats` VALUES ('8', '3', '34', '38', '77', '57', '39', '47');
INSERT INTO `player_levelstats` VALUES ('8', '3', '35', '39', '79', '58', '40', '48');
INSERT INTO `player_levelstats` VALUES ('8', '3', '36', '39', '81', '60', '41', '48');
INSERT INTO `player_levelstats` VALUES ('8', '3', '37', '40', '83', '61', '41', '49');
INSERT INTO `player_levelstats` VALUES ('8', '3', '38', '41', '85', '62', '42', '50');
INSERT INTO `player_levelstats` VALUES ('8', '3', '39', '41', '86', '63', '43', '51');
INSERT INTO `player_levelstats` VALUES ('8', '3', '40', '42', '88', '65', '44', '52');
INSERT INTO `player_levelstats` VALUES ('8', '3', '41', '43', '90', '66', '45', '53');
INSERT INTO `player_levelstats` VALUES ('8', '3', '42', '43', '92', '67', '46', '54');
INSERT INTO `player_levelstats` VALUES ('8', '3', '43', '44', '94', '69', '47', '55');
INSERT INTO `player_levelstats` VALUES ('8', '3', '44', '45', '96', '70', '47', '56');
INSERT INTO `player_levelstats` VALUES ('8', '3', '45', '45', '98', '71', '48', '57');
INSERT INTO `player_levelstats` VALUES ('8', '3', '46', '46', '100', '73', '49', '58');
INSERT INTO `player_levelstats` VALUES ('8', '3', '47', '47', '102', '74', '50', '59');
INSERT INTO `player_levelstats` VALUES ('8', '3', '48', '48', '104', '76', '51', '60');
INSERT INTO `player_levelstats` VALUES ('8', '3', '49', '48', '106', '77', '52', '61');
INSERT INTO `player_levelstats` VALUES ('8', '3', '50', '49', '108', '78', '53', '62');
INSERT INTO `player_levelstats` VALUES ('8', '3', '51', '50', '110', '80', '54', '63');
INSERT INTO `player_levelstats` VALUES ('8', '3', '52', '51', '113', '81', '55', '64');
INSERT INTO `player_levelstats` VALUES ('8', '3', '53', '51', '115', '83', '56', '65');
INSERT INTO `player_levelstats` VALUES ('8', '3', '54', '52', '117', '84', '57', '66');
INSERT INTO `player_levelstats` VALUES ('8', '3', '55', '53', '119', '86', '58', '67');
INSERT INTO `player_levelstats` VALUES ('8', '3', '56', '54', '121', '87', '59', '68');
INSERT INTO `player_levelstats` VALUES ('8', '3', '57', '54', '123', '89', '60', '69');
INSERT INTO `player_levelstats` VALUES ('8', '3', '58', '55', '126', '90', '61', '70');
INSERT INTO `player_levelstats` VALUES ('8', '3', '59', '56', '128', '92', '62', '71');
INSERT INTO `player_levelstats` VALUES ('8', '3', '60', '57', '130', '93', '63', '73');
INSERT INTO `player_levelstats` VALUES ('8', '3', '61', '58', '132', '95', '64', '74');
INSERT INTO `player_levelstats` VALUES ('8', '3', '62', '58', '134', '96', '65', '75');
INSERT INTO `player_levelstats` VALUES ('8', '3', '63', '59', '137', '98', '66', '76');
INSERT INTO `player_levelstats` VALUES ('8', '3', '64', '60', '139', '99', '67', '77');
INSERT INTO `player_levelstats` VALUES ('8', '3', '65', '61', '141', '101', '68', '78');
INSERT INTO `player_levelstats` VALUES ('8', '3', '66', '62', '144', '103', '69', '79');
INSERT INTO `player_levelstats` VALUES ('8', '3', '67', '62', '146', '104', '70', '80');
INSERT INTO `player_levelstats` VALUES ('8', '3', '68', '63', '148', '106', '71', '82');
INSERT INTO `player_levelstats` VALUES ('8', '3', '69', '64', '151', '107', '72', '83');
INSERT INTO `player_levelstats` VALUES ('8', '3', '70', '65', '153', '109', '73', '84');
INSERT INTO `player_levelstats` VALUES ('8', '4', '1', '22', '25', '22', '16', '21');
INSERT INTO `player_levelstats` VALUES ('8', '4', '2', '23', '26', '23', '16', '21');
INSERT INTO `player_levelstats` VALUES ('8', '4', '3', '24', '28', '23', '16', '22');
INSERT INTO `player_levelstats` VALUES ('8', '4', '4', '24', '29', '24', '16', '22');
INSERT INTO `player_levelstats` VALUES ('8', '4', '5', '25', '31', '25', '17', '22');
INSERT INTO `player_levelstats` VALUES ('8', '4', '6', '26', '32', '25', '17', '23');
INSERT INTO `player_levelstats` VALUES ('8', '4', '7', '27', '34', '26', '17', '23');
INSERT INTO `player_levelstats` VALUES ('8', '4', '8', '27', '35', '27', '17', '24');
INSERT INTO `player_levelstats` VALUES ('8', '4', '9', '28', '37', '28', '17', '24');
INSERT INTO `player_levelstats` VALUES ('8', '4', '10', '29', '38', '28', '18', '24');
INSERT INTO `player_levelstats` VALUES ('8', '4', '11', '30', '40', '29', '18', '25');
INSERT INTO `player_levelstats` VALUES ('8', '4', '12', '31', '41', '30', '18', '25');
INSERT INTO `player_levelstats` VALUES ('8', '4', '13', '32', '43', '31', '18', '26');
INSERT INTO `player_levelstats` VALUES ('8', '4', '14', '32', '45', '32', '18', '26');
INSERT INTO `player_levelstats` VALUES ('8', '4', '15', '33', '46', '32', '19', '26');
INSERT INTO `player_levelstats` VALUES ('8', '4', '16', '34', '48', '33', '19', '27');
INSERT INTO `player_levelstats` VALUES ('8', '4', '17', '35', '50', '34', '19', '27');
INSERT INTO `player_levelstats` VALUES ('8', '4', '18', '36', '51', '35', '19', '28');
INSERT INTO `player_levelstats` VALUES ('8', '4', '19', '37', '53', '36', '19', '28');
INSERT INTO `player_levelstats` VALUES ('8', '4', '20', '38', '55', '36', '20', '29');
INSERT INTO `player_levelstats` VALUES ('8', '4', '21', '39', '56', '37', '20', '29');
INSERT INTO `player_levelstats` VALUES ('8', '4', '22', '40', '58', '38', '20', '30');
INSERT INTO `player_levelstats` VALUES ('8', '4', '23', '41', '60', '39', '20', '30');
INSERT INTO `player_levelstats` VALUES ('8', '4', '24', '42', '62', '40', '20', '31');
INSERT INTO `player_levelstats` VALUES ('8', '4', '25', '43', '63', '41', '21', '31');
INSERT INTO `player_levelstats` VALUES ('8', '4', '26', '44', '65', '42', '21', '32');
INSERT INTO `player_levelstats` VALUES ('8', '4', '27', '45', '67', '43', '21', '32');
INSERT INTO `player_levelstats` VALUES ('8', '4', '28', '46', '69', '44', '21', '33');
INSERT INTO `player_levelstats` VALUES ('8', '4', '29', '47', '71', '44', '22', '33');
INSERT INTO `player_levelstats` VALUES ('8', '4', '30', '48', '72', '45', '22', '34');
INSERT INTO `player_levelstats` VALUES ('8', '4', '31', '49', '74', '46', '22', '34');
INSERT INTO `player_levelstats` VALUES ('8', '4', '32', '50', '76', '47', '22', '35');
INSERT INTO `player_levelstats` VALUES ('8', '4', '33', '51', '78', '48', '23', '35');
INSERT INTO `player_levelstats` VALUES ('8', '4', '34', '52', '80', '49', '23', '36');
INSERT INTO `player_levelstats` VALUES ('8', '4', '35', '53', '82', '50', '23', '36');
INSERT INTO `player_levelstats` VALUES ('8', '4', '36', '54', '84', '51', '24', '37');
INSERT INTO `player_levelstats` VALUES ('8', '4', '37', '55', '86', '52', '24', '37');
INSERT INTO `player_levelstats` VALUES ('8', '4', '38', '56', '88', '53', '24', '38');
INSERT INTO `player_levelstats` VALUES ('8', '4', '39', '57', '90', '54', '24', '38');
INSERT INTO `player_levelstats` VALUES ('8', '4', '40', '58', '92', '55', '25', '39');
INSERT INTO `player_levelstats` VALUES ('8', '4', '41', '59', '94', '56', '25', '40');
INSERT INTO `player_levelstats` VALUES ('8', '4', '42', '60', '96', '57', '25', '40');
INSERT INTO `player_levelstats` VALUES ('8', '4', '43', '62', '98', '58', '26', '41');
INSERT INTO `player_levelstats` VALUES ('8', '4', '44', '63', '100', '59', '26', '41');
INSERT INTO `player_levelstats` VALUES ('8', '4', '45', '64', '102', '60', '26', '42');
INSERT INTO `player_levelstats` VALUES ('8', '4', '46', '65', '104', '61', '27', '43');
INSERT INTO `player_levelstats` VALUES ('8', '4', '47', '66', '107', '63', '27', '43');
INSERT INTO `player_levelstats` VALUES ('8', '4', '48', '67', '109', '64', '27', '44');
INSERT INTO `player_levelstats` VALUES ('8', '4', '49', '69', '111', '65', '27', '44');
INSERT INTO `player_levelstats` VALUES ('8', '4', '50', '70', '113', '66', '28', '45');
INSERT INTO `player_levelstats` VALUES ('8', '4', '51', '71', '115', '67', '28', '46');
INSERT INTO `player_levelstats` VALUES ('8', '4', '52', '72', '117', '68', '28', '46');
INSERT INTO `player_levelstats` VALUES ('8', '4', '53', '74', '120', '69', '29', '47');
INSERT INTO `player_levelstats` VALUES ('8', '4', '54', '75', '122', '70', '29', '48');
INSERT INTO `player_levelstats` VALUES ('8', '4', '55', '76', '124', '72', '29', '48');
INSERT INTO `player_levelstats` VALUES ('8', '4', '56', '77', '126', '73', '30', '49');
INSERT INTO `player_levelstats` VALUES ('8', '4', '57', '79', '129', '74', '30', '50');
INSERT INTO `player_levelstats` VALUES ('8', '4', '58', '80', '131', '75', '30', '50');
INSERT INTO `player_levelstats` VALUES ('8', '4', '59', '81', '133', '76', '31', '51');
INSERT INTO `player_levelstats` VALUES ('8', '4', '60', '82', '136', '77', '31', '52');
INSERT INTO `player_levelstats` VALUES ('8', '4', '61', '84', '138', '79', '32', '52');
INSERT INTO `player_levelstats` VALUES ('8', '4', '62', '85', '140', '80', '32', '53');
INSERT INTO `player_levelstats` VALUES ('8', '4', '63', '86', '143', '81', '32', '54');
INSERT INTO `player_levelstats` VALUES ('8', '4', '64', '88', '145', '82', '33', '55');
INSERT INTO `player_levelstats` VALUES ('8', '4', '65', '89', '148', '84', '33', '55');
INSERT INTO `player_levelstats` VALUES ('8', '4', '66', '90', '150', '85', '33', '56');
INSERT INTO `player_levelstats` VALUES ('8', '4', '67', '92', '153', '86', '34', '57');
INSERT INTO `player_levelstats` VALUES ('8', '4', '68', '93', '155', '87', '34', '58');
INSERT INTO `player_levelstats` VALUES ('8', '4', '69', '95', '157', '89', '35', '58');
INSERT INTO `player_levelstats` VALUES ('8', '4', '70', '96', '160', '90', '35', '59');
INSERT INTO `player_levelstats` VALUES ('8', '5', '1', '21', '22', '21', '18', '24');
INSERT INTO `player_levelstats` VALUES ('8', '5', '2', '21', '22', '21', '19', '25');
INSERT INTO `player_levelstats` VALUES ('8', '5', '3', '21', '22', '22', '21', '27');
INSERT INTO `player_levelstats` VALUES ('8', '5', '4', '21', '23', '22', '22', '28');
INSERT INTO `player_levelstats` VALUES ('8', '5', '5', '22', '23', '22', '23', '29');
INSERT INTO `player_levelstats` VALUES ('8', '5', '6', '22', '23', '23', '25', '31');
INSERT INTO `player_levelstats` VALUES ('8', '5', '7', '22', '23', '23', '26', '32');
INSERT INTO `player_levelstats` VALUES ('8', '5', '8', '22', '24', '24', '27', '34');
INSERT INTO `player_levelstats` VALUES ('8', '5', '9', '22', '24', '24', '29', '35');
INSERT INTO `player_levelstats` VALUES ('8', '5', '10', '22', '24', '24', '30', '37');
INSERT INTO `player_levelstats` VALUES ('8', '5', '11', '23', '24', '25', '32', '38');
INSERT INTO `player_levelstats` VALUES ('8', '5', '12', '23', '24', '25', '33', '40');
INSERT INTO `player_levelstats` VALUES ('8', '5', '13', '23', '25', '26', '35', '41');
INSERT INTO `player_levelstats` VALUES ('8', '5', '14', '23', '25', '26', '36', '43');
INSERT INTO `player_levelstats` VALUES ('8', '5', '15', '23', '25', '26', '38', '44');
INSERT INTO `player_levelstats` VALUES ('8', '5', '16', '24', '26', '27', '39', '46');
INSERT INTO `player_levelstats` VALUES ('8', '5', '17', '24', '26', '27', '41', '47');
INSERT INTO `player_levelstats` VALUES ('8', '5', '18', '24', '26', '28', '42', '49');
INSERT INTO `player_levelstats` VALUES ('8', '5', '19', '24', '26', '28', '44', '50');
INSERT INTO `player_levelstats` VALUES ('8', '5', '20', '24', '27', '29', '45', '52');
INSERT INTO `player_levelstats` VALUES ('8', '5', '21', '25', '27', '29', '47', '54');
INSERT INTO `player_levelstats` VALUES ('8', '5', '22', '25', '27', '30', '48', '55');
INSERT INTO `player_levelstats` VALUES ('8', '5', '23', '25', '28', '30', '50', '57');
INSERT INTO `player_levelstats` VALUES ('8', '5', '24', '25', '28', '31', '52', '59');
INSERT INTO `player_levelstats` VALUES ('8', '5', '25', '25', '28', '31', '53', '60');
INSERT INTO `player_levelstats` VALUES ('8', '5', '26', '26', '28', '32', '55', '62');
INSERT INTO `player_levelstats` VALUES ('8', '5', '27', '26', '29', '32', '56', '64');
INSERT INTO `player_levelstats` VALUES ('8', '5', '28', '26', '29', '33', '58', '65');
INSERT INTO `player_levelstats` VALUES ('8', '5', '29', '26', '29', '33', '60', '67');
INSERT INTO `player_levelstats` VALUES ('8', '5', '30', '27', '30', '34', '62', '69');
INSERT INTO `player_levelstats` VALUES ('8', '5', '31', '27', '30', '34', '63', '71');
INSERT INTO `player_levelstats` VALUES ('8', '5', '32', '27', '30', '35', '65', '73');
INSERT INTO `player_levelstats` VALUES ('8', '5', '33', '27', '31', '35', '67', '74');
INSERT INTO `player_levelstats` VALUES ('8', '5', '34', '28', '31', '36', '68', '76');
INSERT INTO `player_levelstats` VALUES ('8', '5', '35', '28', '32', '36', '70', '78');
INSERT INTO `player_levelstats` VALUES ('8', '5', '36', '28', '32', '37', '72', '80');
INSERT INTO `player_levelstats` VALUES ('8', '5', '37', '29', '32', '37', '74', '82');
INSERT INTO `player_levelstats` VALUES ('8', '5', '38', '29', '33', '38', '76', '84');
INSERT INTO `player_levelstats` VALUES ('8', '5', '39', '29', '33', '38', '77', '86');
INSERT INTO `player_levelstats` VALUES ('8', '5', '40', '29', '33', '39', '79', '87');
INSERT INTO `player_levelstats` VALUES ('8', '5', '41', '30', '34', '40', '81', '89');
INSERT INTO `player_levelstats` VALUES ('8', '5', '42', '30', '34', '40', '83', '91');
INSERT INTO `player_levelstats` VALUES ('8', '5', '43', '30', '35', '41', '85', '93');
INSERT INTO `player_levelstats` VALUES ('8', '5', '44', '31', '35', '41', '87', '95');
INSERT INTO `player_levelstats` VALUES ('8', '5', '45', '31', '35', '42', '89', '97');
INSERT INTO `player_levelstats` VALUES ('8', '5', '46', '31', '36', '43', '91', '99');
INSERT INTO `player_levelstats` VALUES ('8', '5', '47', '32', '36', '43', '93', '101');
INSERT INTO `player_levelstats` VALUES ('8', '5', '48', '32', '37', '44', '94', '103');
INSERT INTO `player_levelstats` VALUES ('8', '5', '49', '32', '37', '44', '96', '105');
INSERT INTO `player_levelstats` VALUES ('8', '5', '50', '33', '37', '45', '98', '107');
INSERT INTO `player_levelstats` VALUES ('8', '5', '51', '33', '38', '46', '100', '110');
INSERT INTO `player_levelstats` VALUES ('8', '5', '52', '33', '38', '46', '102', '112');
INSERT INTO `player_levelstats` VALUES ('8', '5', '53', '34', '39', '47', '104', '114');
INSERT INTO `player_levelstats` VALUES ('8', '5', '54', '34', '39', '48', '106', '116');
INSERT INTO `player_levelstats` VALUES ('8', '5', '55', '34', '40', '48', '109', '118');
INSERT INTO `player_levelstats` VALUES ('8', '5', '56', '35', '40', '49', '111', '120');
INSERT INTO `player_levelstats` VALUES ('8', '5', '57', '35', '41', '50', '113', '122');
INSERT INTO `player_levelstats` VALUES ('8', '5', '58', '35', '41', '50', '115', '125');
INSERT INTO `player_levelstats` VALUES ('8', '5', '59', '36', '42', '51', '117', '127');
INSERT INTO `player_levelstats` VALUES ('8', '5', '60', '36', '42', '52', '119', '129');
INSERT INTO `player_levelstats` VALUES ('8', '5', '61', '36', '42', '52', '121', '131');
INSERT INTO `player_levelstats` VALUES ('8', '5', '62', '37', '43', '53', '123', '133');
INSERT INTO `player_levelstats` VALUES ('8', '5', '63', '37', '43', '54', '125', '136');
INSERT INTO `player_levelstats` VALUES ('8', '5', '64', '38', '44', '55', '128', '138');
INSERT INTO `player_levelstats` VALUES ('8', '5', '65', '38', '44', '55', '130', '140');
INSERT INTO `player_levelstats` VALUES ('8', '5', '66', '38', '45', '56', '132', '143');
INSERT INTO `player_levelstats` VALUES ('8', '5', '67', '39', '45', '57', '134', '145');
INSERT INTO `player_levelstats` VALUES ('8', '5', '68', '39', '46', '58', '136', '147');
INSERT INTO `player_levelstats` VALUES ('8', '5', '69', '40', '46', '58', '139', '150');
INSERT INTO `player_levelstats` VALUES ('8', '5', '70', '40', '47', '59', '141', '152');
INSERT INTO `player_levelstats` VALUES ('8', '7', '1', '22', '22', '22', '17', '23');
INSERT INTO `player_levelstats` VALUES ('8', '7', '2', '23', '22', '23', '18', '24');
INSERT INTO `player_levelstats` VALUES ('8', '7', '3', '24', '23', '24', '19', '25');
INSERT INTO `player_levelstats` VALUES ('8', '7', '4', '25', '23', '25', '20', '26');
INSERT INTO `player_levelstats` VALUES ('8', '7', '5', '25', '24', '26', '21', '27');
INSERT INTO `player_levelstats` VALUES ('8', '7', '6', '26', '24', '27', '22', '28');
INSERT INTO `player_levelstats` VALUES ('8', '7', '7', '27', '25', '28', '23', '29');
INSERT INTO `player_levelstats` VALUES ('8', '7', '8', '28', '25', '29', '24', '30');
INSERT INTO `player_levelstats` VALUES ('8', '7', '9', '29', '25', '30', '25', '31');
INSERT INTO `player_levelstats` VALUES ('8', '7', '10', '30', '26', '31', '26', '33');
INSERT INTO `player_levelstats` VALUES ('8', '7', '11', '31', '26', '32', '27', '34');
INSERT INTO `player_levelstats` VALUES ('8', '7', '12', '32', '27', '33', '28', '35');
INSERT INTO `player_levelstats` VALUES ('8', '7', '13', '33', '27', '34', '29', '36');
INSERT INTO `player_levelstats` VALUES ('8', '7', '14', '34', '28', '35', '30', '37');
INSERT INTO `player_levelstats` VALUES ('8', '7', '15', '34', '28', '36', '31', '38');
INSERT INTO `player_levelstats` VALUES ('8', '7', '16', '35', '29', '38', '32', '39');
INSERT INTO `player_levelstats` VALUES ('8', '7', '17', '36', '29', '39', '33', '41');
INSERT INTO `player_levelstats` VALUES ('8', '7', '18', '37', '30', '40', '34', '42');
INSERT INTO `player_levelstats` VALUES ('8', '7', '19', '38', '30', '41', '35', '43');
INSERT INTO `player_levelstats` VALUES ('8', '7', '20', '39', '31', '42', '36', '44');
INSERT INTO `player_levelstats` VALUES ('8', '7', '21', '40', '32', '43', '37', '45');
INSERT INTO `player_levelstats` VALUES ('8', '7', '22', '41', '32', '45', '38', '47');
INSERT INTO `player_levelstats` VALUES ('8', '7', '23', '43', '33', '46', '39', '48');
INSERT INTO `player_levelstats` VALUES ('8', '7', '24', '44', '33', '47', '40', '49');
INSERT INTO `player_levelstats` VALUES ('8', '7', '25', '45', '34', '48', '42', '51');
INSERT INTO `player_levelstats` VALUES ('8', '7', '26', '46', '34', '49', '43', '52');
INSERT INTO `player_levelstats` VALUES ('8', '7', '27', '47', '35', '51', '44', '53');
INSERT INTO `player_levelstats` VALUES ('8', '7', '28', '48', '35', '52', '45', '54');
INSERT INTO `player_levelstats` VALUES ('8', '7', '29', '49', '36', '53', '46', '56');
INSERT INTO `player_levelstats` VALUES ('8', '7', '30', '50', '37', '54', '48', '57');
INSERT INTO `player_levelstats` VALUES ('8', '7', '31', '51', '37', '56', '49', '59');
INSERT INTO `player_levelstats` VALUES ('8', '7', '32', '52', '38', '57', '50', '60');
INSERT INTO `player_levelstats` VALUES ('8', '7', '33', '53', '38', '58', '51', '61');
INSERT INTO `player_levelstats` VALUES ('8', '7', '34', '55', '39', '60', '52', '63');
INSERT INTO `player_levelstats` VALUES ('8', '7', '35', '56', '40', '61', '54', '64');
INSERT INTO `player_levelstats` VALUES ('8', '7', '36', '57', '40', '62', '55', '66');
INSERT INTO `player_levelstats` VALUES ('8', '7', '37', '58', '41', '64', '56', '67');
INSERT INTO `player_levelstats` VALUES ('8', '7', '38', '59', '42', '65', '57', '68');
INSERT INTO `player_levelstats` VALUES ('8', '7', '39', '61', '42', '66', '59', '70');
INSERT INTO `player_levelstats` VALUES ('8', '7', '40', '62', '43', '68', '60', '71');
INSERT INTO `player_levelstats` VALUES ('8', '7', '41', '63', '44', '69', '61', '73');
INSERT INTO `player_levelstats` VALUES ('8', '7', '42', '64', '44', '71', '63', '74');
INSERT INTO `player_levelstats` VALUES ('8', '7', '43', '65', '45', '72', '64', '76');
INSERT INTO `player_levelstats` VALUES ('8', '7', '44', '67', '46', '74', '65', '77');
INSERT INTO `player_levelstats` VALUES ('8', '7', '45', '68', '46', '75', '67', '79');
INSERT INTO `player_levelstats` VALUES ('8', '7', '46', '69', '47', '76', '68', '80');
INSERT INTO `player_levelstats` VALUES ('8', '7', '47', '71', '48', '78', '69', '82');
INSERT INTO `player_levelstats` VALUES ('8', '7', '48', '72', '49', '79', '71', '83');
INSERT INTO `player_levelstats` VALUES ('8', '7', '49', '73', '49', '81', '72', '85');
INSERT INTO `player_levelstats` VALUES ('8', '7', '50', '74', '50', '82', '74', '87');
INSERT INTO `player_levelstats` VALUES ('8', '7', '51', '76', '51', '84', '75', '88');
INSERT INTO `player_levelstats` VALUES ('8', '7', '52', '77', '51', '85', '77', '90');
INSERT INTO `player_levelstats` VALUES ('8', '7', '53', '78', '52', '87', '78', '92');
INSERT INTO `player_levelstats` VALUES ('8', '7', '54', '80', '53', '89', '79', '93');
INSERT INTO `player_levelstats` VALUES ('8', '7', '55', '81', '54', '90', '81', '95');
INSERT INTO `player_levelstats` VALUES ('8', '7', '56', '83', '55', '92', '82', '96');
INSERT INTO `player_levelstats` VALUES ('8', '7', '57', '84', '55', '93', '84', '98');
INSERT INTO `player_levelstats` VALUES ('8', '7', '58', '85', '56', '95', '85', '100');
INSERT INTO `player_levelstats` VALUES ('8', '7', '59', '87', '57', '97', '87', '102');
INSERT INTO `player_levelstats` VALUES ('8', '7', '60', '88', '58', '98', '88', '103');
INSERT INTO `player_levelstats` VALUES ('8', '7', '61', '90', '58', '100', '90', '105');
INSERT INTO `player_levelstats` VALUES ('8', '7', '62', '91', '59', '101', '91', '107');
INSERT INTO `player_levelstats` VALUES ('8', '7', '63', '93', '60', '103', '93', '108');
INSERT INTO `player_levelstats` VALUES ('8', '7', '64', '94', '61', '105', '94', '110');
INSERT INTO `player_levelstats` VALUES ('8', '7', '65', '95', '62', '106', '96', '112');
INSERT INTO `player_levelstats` VALUES ('8', '7', '66', '97', '63', '108', '98', '114');
INSERT INTO `player_levelstats` VALUES ('8', '7', '67', '98', '63', '110', '99', '116');
INSERT INTO `player_levelstats` VALUES ('8', '7', '68', '100', '64', '112', '101', '117');
INSERT INTO `player_levelstats` VALUES ('8', '7', '69', '101', '65', '113', '102', '119');
INSERT INTO `player_levelstats` VALUES ('8', '7', '70', '103', '66', '115', '104', '121');
INSERT INTO `player_levelstats` VALUES ('8', '8', '1', '21', '22', '21', '19', '23');
INSERT INTO `player_levelstats` VALUES ('8', '8', '2', '21', '22', '21', '20', '24');
INSERT INTO `player_levelstats` VALUES ('8', '8', '3', '21', '22', '22', '22', '26');
INSERT INTO `player_levelstats` VALUES ('8', '8', '4', '21', '22', '22', '23', '27');
INSERT INTO `player_levelstats` VALUES ('8', '8', '5', '21', '23', '22', '25', '28');
INSERT INTO `player_levelstats` VALUES ('8', '8', '6', '21', '23', '22', '26', '30');
INSERT INTO `player_levelstats` VALUES ('8', '8', '7', '21', '23', '23', '27', '31');
INSERT INTO `player_levelstats` VALUES ('8', '8', '8', '22', '23', '23', '29', '32');
INSERT INTO `player_levelstats` VALUES ('8', '8', '9', '22', '23', '23', '30', '34');
INSERT INTO `player_levelstats` VALUES ('8', '8', '10', '22', '23', '24', '32', '35');
INSERT INTO `player_levelstats` VALUES ('8', '8', '11', '22', '24', '24', '33', '37');
INSERT INTO `player_levelstats` VALUES ('8', '8', '12', '22', '24', '24', '35', '38');
INSERT INTO `player_levelstats` VALUES ('8', '8', '13', '22', '24', '25', '36', '39');
INSERT INTO `player_levelstats` VALUES ('8', '8', '14', '22', '24', '25', '38', '41');
INSERT INTO `player_levelstats` VALUES ('8', '8', '15', '22', '24', '25', '39', '42');
INSERT INTO `player_levelstats` VALUES ('8', '8', '16', '22', '24', '26', '41', '44');
INSERT INTO `player_levelstats` VALUES ('8', '8', '17', '23', '25', '26', '42', '45');
INSERT INTO `player_levelstats` VALUES ('8', '8', '18', '23', '25', '26', '44', '47');
INSERT INTO `player_levelstats` VALUES ('8', '8', '19', '23', '25', '27', '46', '48');
INSERT INTO `player_levelstats` VALUES ('8', '8', '20', '23', '25', '27', '47', '50');
INSERT INTO `player_levelstats` VALUES ('8', '8', '21', '23', '25', '27', '49', '51');
INSERT INTO `player_levelstats` VALUES ('8', '8', '22', '23', '26', '28', '51', '53');
INSERT INTO `player_levelstats` VALUES ('8', '8', '23', '23', '26', '28', '52', '55');
INSERT INTO `player_levelstats` VALUES ('8', '8', '24', '24', '26', '29', '54', '56');
INSERT INTO `player_levelstats` VALUES ('8', '8', '25', '24', '26', '29', '56', '58');
INSERT INTO `player_levelstats` VALUES ('8', '8', '26', '24', '27', '29', '57', '60');
INSERT INTO `player_levelstats` VALUES ('8', '8', '27', '24', '27', '30', '59', '61');
INSERT INTO `player_levelstats` VALUES ('8', '8', '28', '24', '27', '30', '61', '63');
INSERT INTO `player_levelstats` VALUES ('8', '8', '29', '24', '27', '31', '63', '65');
INSERT INTO `player_levelstats` VALUES ('8', '8', '30', '24', '28', '31', '64', '66');
INSERT INTO `player_levelstats` VALUES ('8', '8', '31', '25', '28', '31', '66', '68');
INSERT INTO `player_levelstats` VALUES ('8', '8', '32', '25', '28', '32', '68', '70');
INSERT INTO `player_levelstats` VALUES ('8', '8', '33', '25', '28', '32', '70', '71');
INSERT INTO `player_levelstats` VALUES ('8', '8', '34', '25', '29', '33', '71', '73');
INSERT INTO `player_levelstats` VALUES ('8', '8', '35', '25', '29', '33', '73', '75');
INSERT INTO `player_levelstats` VALUES ('8', '8', '36', '26', '29', '34', '75', '77');
INSERT INTO `player_levelstats` VALUES ('8', '8', '37', '26', '29', '34', '77', '79');
INSERT INTO `player_levelstats` VALUES ('8', '8', '38', '26', '30', '35', '79', '80');
INSERT INTO `player_levelstats` VALUES ('8', '8', '39', '26', '30', '35', '81', '82');
INSERT INTO `player_levelstats` VALUES ('8', '8', '40', '26', '30', '35', '83', '84');
INSERT INTO `player_levelstats` VALUES ('8', '8', '41', '27', '31', '36', '85', '86');
INSERT INTO `player_levelstats` VALUES ('8', '8', '42', '27', '31', '36', '87', '88');
INSERT INTO `player_levelstats` VALUES ('8', '8', '43', '27', '31', '37', '89', '90');
INSERT INTO `player_levelstats` VALUES ('8', '8', '44', '27', '32', '37', '91', '91');
INSERT INTO `player_levelstats` VALUES ('8', '8', '45', '27', '32', '38', '93', '93');
INSERT INTO `player_levelstats` VALUES ('8', '8', '46', '28', '32', '38', '95', '95');
INSERT INTO `player_levelstats` VALUES ('8', '8', '47', '28', '32', '39', '97', '97');
INSERT INTO `player_levelstats` VALUES ('8', '8', '48', '28', '33', '39', '99', '99');
INSERT INTO `player_levelstats` VALUES ('8', '8', '49', '28', '33', '40', '101', '101');
INSERT INTO `player_levelstats` VALUES ('8', '8', '50', '29', '33', '40', '103', '103');
INSERT INTO `player_levelstats` VALUES ('8', '8', '51', '29', '34', '41', '105', '105');
INSERT INTO `player_levelstats` VALUES ('8', '8', '52', '29', '34', '42', '107', '107');
INSERT INTO `player_levelstats` VALUES ('8', '8', '53', '29', '35', '42', '109', '109');
INSERT INTO `player_levelstats` VALUES ('8', '8', '54', '30', '35', '43', '111', '111');
INSERT INTO `player_levelstats` VALUES ('8', '8', '55', '30', '35', '43', '113', '113');
INSERT INTO `player_levelstats` VALUES ('8', '8', '56', '30', '36', '44', '115', '115');
INSERT INTO `player_levelstats` VALUES ('8', '8', '57', '30', '36', '44', '118', '118');
INSERT INTO `player_levelstats` VALUES ('8', '8', '58', '31', '36', '45', '120', '120');
INSERT INTO `player_levelstats` VALUES ('8', '8', '59', '31', '37', '45', '122', '122');
INSERT INTO `player_levelstats` VALUES ('8', '8', '60', '31', '37', '46', '124', '124');
INSERT INTO `player_levelstats` VALUES ('8', '8', '61', '31', '37', '47', '126', '126');
INSERT INTO `player_levelstats` VALUES ('8', '8', '62', '32', '38', '47', '129', '128');
INSERT INTO `player_levelstats` VALUES ('8', '8', '63', '32', '38', '48', '131', '130');
INSERT INTO `player_levelstats` VALUES ('8', '8', '64', '32', '39', '48', '133', '133');
INSERT INTO `player_levelstats` VALUES ('8', '8', '65', '33', '39', '49', '135', '135');
INSERT INTO `player_levelstats` VALUES ('8', '8', '66', '33', '39', '50', '138', '137');
INSERT INTO `player_levelstats` VALUES ('8', '8', '67', '33', '40', '50', '140', '139');
INSERT INTO `player_levelstats` VALUES ('8', '8', '68', '33', '40', '51', '142', '141');
INSERT INTO `player_levelstats` VALUES ('8', '8', '69', '34', '41', '51', '145', '144');
INSERT INTO `player_levelstats` VALUES ('8', '8', '70', '34', '41', '52', '147', '146');
INSERT INTO `player_levelstats` VALUES ('10', '2', '1', '19', '22', '21', '24', '20');
INSERT INTO `player_levelstats` VALUES ('10', '2', '2', '20', '23', '22', '25', '21');
INSERT INTO `player_levelstats` VALUES ('10', '2', '3', '21', '23', '23', '25', '21');
INSERT INTO `player_levelstats` VALUES ('10', '2', '4', '22', '24', '24', '26', '22');
INSERT INTO `player_levelstats` VALUES ('10', '2', '5', '23', '24', '25', '27', '23');
INSERT INTO `player_levelstats` VALUES ('10', '2', '6', '25', '25', '26', '27', '24');
INSERT INTO `player_levelstats` VALUES ('10', '2', '7', '26', '25', '27', '28', '24');
INSERT INTO `player_levelstats` VALUES ('10', '2', '8', '27', '26', '28', '29', '25');
INSERT INTO `player_levelstats` VALUES ('10', '2', '9', '28', '27', '29', '29', '26');
INSERT INTO `player_levelstats` VALUES ('10', '2', '10', '29', '27', '31', '30', '26');
INSERT INTO `player_levelstats` VALUES ('10', '2', '11', '30', '28', '32', '31', '27');
INSERT INTO `player_levelstats` VALUES ('10', '2', '12', '32', '29', '33', '31', '28');
INSERT INTO `player_levelstats` VALUES ('10', '2', '13', '33', '29', '34', '32', '29');
INSERT INTO `player_levelstats` VALUES ('10', '2', '14', '34', '30', '35', '33', '30');
INSERT INTO `player_levelstats` VALUES ('10', '2', '15', '35', '31', '36', '33', '30');
INSERT INTO `player_levelstats` VALUES ('10', '2', '16', '37', '31', '37', '34', '31');
INSERT INTO `player_levelstats` VALUES ('10', '2', '17', '38', '32', '39', '35', '32');
INSERT INTO `player_levelstats` VALUES ('10', '2', '18', '39', '33', '40', '36', '33');
INSERT INTO `player_levelstats` VALUES ('10', '2', '19', '40', '33', '41', '36', '34');
INSERT INTO `player_levelstats` VALUES ('10', '2', '20', '42', '34', '42', '37', '35');
INSERT INTO `player_levelstats` VALUES ('10', '2', '21', '43', '35', '44', '38', '35');
INSERT INTO `player_levelstats` VALUES ('10', '2', '22', '44', '35', '45', '39', '36');
INSERT INTO `player_levelstats` VALUES ('10', '2', '23', '46', '36', '46', '40', '37');
INSERT INTO `player_levelstats` VALUES ('10', '2', '24', '47', '37', '47', '40', '38');
INSERT INTO `player_levelstats` VALUES ('10', '2', '25', '49', '38', '49', '41', '39');
INSERT INTO `player_levelstats` VALUES ('10', '2', '26', '50', '38', '50', '42', '40');
INSERT INTO `player_levelstats` VALUES ('10', '2', '27', '51', '39', '51', '43', '41');
INSERT INTO `player_levelstats` VALUES ('10', '2', '28', '53', '40', '53', '44', '42');
INSERT INTO `player_levelstats` VALUES ('10', '2', '29', '54', '41', '54', '45', '43');
INSERT INTO `player_levelstats` VALUES ('10', '2', '30', '56', '41', '55', '45', '43');
INSERT INTO `player_levelstats` VALUES ('10', '2', '31', '57', '42', '57', '46', '44');
INSERT INTO `player_levelstats` VALUES ('10', '2', '32', '58', '43', '58', '47', '45');
INSERT INTO `player_levelstats` VALUES ('10', '2', '33', '60', '44', '59', '48', '46');
INSERT INTO `player_levelstats` VALUES ('10', '2', '34', '61', '45', '61', '49', '47');
INSERT INTO `player_levelstats` VALUES ('10', '2', '35', '63', '45', '62', '50', '48');
INSERT INTO `player_levelstats` VALUES ('10', '2', '36', '64', '46', '64', '51', '49');
INSERT INTO `player_levelstats` VALUES ('10', '2', '37', '66', '47', '65', '52', '50');
INSERT INTO `player_levelstats` VALUES ('10', '2', '38', '67', '48', '67', '53', '51');
INSERT INTO `player_levelstats` VALUES ('10', '2', '39', '69', '49', '68', '54', '52');
INSERT INTO `player_levelstats` VALUES ('10', '2', '40', '71', '50', '69', '55', '53');
INSERT INTO `player_levelstats` VALUES ('10', '2', '41', '72', '50', '71', '55', '54');
INSERT INTO `player_levelstats` VALUES ('10', '2', '42', '74', '51', '72', '56', '55');
INSERT INTO `player_levelstats` VALUES ('10', '2', '43', '75', '52', '74', '57', '56');
INSERT INTO `player_levelstats` VALUES ('10', '2', '44', '77', '53', '75', '58', '57');
INSERT INTO `player_levelstats` VALUES ('10', '2', '45', '79', '54', '77', '59', '59');
INSERT INTO `player_levelstats` VALUES ('10', '2', '46', '80', '55', '78', '60', '60');
INSERT INTO `player_levelstats` VALUES ('10', '2', '47', '82', '56', '80', '61', '61');
INSERT INTO `player_levelstats` VALUES ('10', '2', '48', '83', '57', '82', '62', '62');
INSERT INTO `player_levelstats` VALUES ('10', '2', '49', '85', '58', '83', '63', '63');
INSERT INTO `player_levelstats` VALUES ('10', '2', '50', '87', '59', '85', '64', '64');
INSERT INTO `player_levelstats` VALUES ('10', '2', '51', '89', '60', '86', '66', '65');
INSERT INTO `player_levelstats` VALUES ('10', '2', '52', '90', '61', '88', '67', '66');
INSERT INTO `player_levelstats` VALUES ('10', '2', '53', '92', '61', '90', '68', '67');
INSERT INTO `player_levelstats` VALUES ('10', '2', '54', '94', '62', '91', '69', '69');
INSERT INTO `player_levelstats` VALUES ('10', '2', '55', '95', '63', '93', '70', '70');
INSERT INTO `player_levelstats` VALUES ('10', '2', '56', '97', '64', '95', '71', '71');
INSERT INTO `player_levelstats` VALUES ('10', '2', '57', '99', '65', '96', '72', '72');
INSERT INTO `player_levelstats` VALUES ('10', '2', '58', '101', '66', '98', '73', '73');
INSERT INTO `player_levelstats` VALUES ('10', '2', '59', '102', '67', '100', '74', '74');
INSERT INTO `player_levelstats` VALUES ('10', '2', '60', '104', '68', '101', '75', '76');
INSERT INTO `player_levelstats` VALUES ('10', '2', '61', '106', '69', '103', '76', '77');
INSERT INTO `player_levelstats` VALUES ('10', '2', '62', '108', '70', '105', '78', '78');
INSERT INTO `player_levelstats` VALUES ('10', '2', '63', '110', '72', '106', '79', '79');
INSERT INTO `player_levelstats` VALUES ('10', '2', '64', '112', '73', '108', '80', '80');
INSERT INTO `player_levelstats` VALUES ('10', '2', '65', '113', '74', '110', '81', '82');
INSERT INTO `player_levelstats` VALUES ('10', '2', '66', '115', '75', '112', '82', '83');
INSERT INTO `player_levelstats` VALUES ('10', '2', '67', '117', '76', '114', '83', '84');
INSERT INTO `player_levelstats` VALUES ('10', '2', '68', '119', '77', '115', '85', '85');
INSERT INTO `player_levelstats` VALUES ('10', '2', '69', '121', '78', '117', '86', '87');
INSERT INTO `player_levelstats` VALUES ('10', '2', '70', '123', '79', '119', '87', '88');
INSERT INTO `player_levelstats` VALUES ('10', '3', '1', '17', '25', '20', '24', '20');
INSERT INTO `player_levelstats` VALUES ('10', '3', '2', '17', '26', '21', '25', '21');
INSERT INTO `player_levelstats` VALUES ('10', '3', '3', '18', '28', '22', '25', '21');
INSERT INTO `player_levelstats` VALUES ('10', '3', '4', '18', '29', '23', '26', '22');
INSERT INTO `player_levelstats` VALUES ('10', '3', '5', '19', '30', '24', '26', '23');
INSERT INTO `player_levelstats` VALUES ('10', '3', '6', '19', '32', '25', '27', '23');
INSERT INTO `player_levelstats` VALUES ('10', '3', '7', '20', '33', '26', '27', '24');
INSERT INTO `player_levelstats` VALUES ('10', '3', '8', '20', '35', '27', '28', '25');
INSERT INTO `player_levelstats` VALUES ('10', '3', '9', '21', '36', '27', '29', '25');
INSERT INTO `player_levelstats` VALUES ('10', '3', '10', '21', '38', '28', '29', '26');
INSERT INTO `player_levelstats` VALUES ('10', '3', '11', '22', '39', '29', '30', '27');
INSERT INTO `player_levelstats` VALUES ('10', '3', '12', '22', '41', '30', '31', '27');
INSERT INTO `player_levelstats` VALUES ('10', '3', '13', '23', '42', '31', '31', '28');
INSERT INTO `player_levelstats` VALUES ('10', '3', '14', '23', '44', '32', '32', '29');
INSERT INTO `player_levelstats` VALUES ('10', '3', '15', '24', '45', '34', '32', '29');
INSERT INTO `player_levelstats` VALUES ('10', '3', '16', '24', '47', '35', '33', '30');
INSERT INTO `player_levelstats` VALUES ('10', '3', '17', '25', '48', '36', '34', '31');
INSERT INTO `player_levelstats` VALUES ('10', '3', '18', '25', '50', '37', '34', '32');
INSERT INTO `player_levelstats` VALUES ('10', '3', '19', '26', '51', '38', '35', '32');
INSERT INTO `player_levelstats` VALUES ('10', '3', '20', '26', '53', '39', '36', '33');
INSERT INTO `player_levelstats` VALUES ('10', '3', '21', '27', '55', '40', '37', '34');
INSERT INTO `player_levelstats` VALUES ('10', '3', '22', '27', '56', '41', '37', '35');
INSERT INTO `player_levelstats` VALUES ('10', '3', '23', '28', '58', '42', '38', '36');
INSERT INTO `player_levelstats` VALUES ('10', '3', '24', '28', '60', '43', '39', '36');
INSERT INTO `player_levelstats` VALUES ('10', '3', '25', '29', '61', '44', '39', '37');
INSERT INTO `player_levelstats` VALUES ('10', '3', '26', '30', '63', '46', '40', '38');
INSERT INTO `player_levelstats` VALUES ('10', '3', '27', '30', '65', '47', '41', '39');
INSERT INTO `player_levelstats` VALUES ('10', '3', '28', '31', '66', '48', '42', '40');
INSERT INTO `player_levelstats` VALUES ('10', '3', '29', '31', '68', '49', '42', '40');
INSERT INTO `player_levelstats` VALUES ('10', '3', '30', '32', '70', '50', '43', '41');
INSERT INTO `player_levelstats` VALUES ('10', '3', '31', '33', '72', '52', '44', '42');
INSERT INTO `player_levelstats` VALUES ('10', '3', '32', '33', '73', '53', '45', '43');
INSERT INTO `player_levelstats` VALUES ('10', '3', '33', '34', '75', '54', '46', '44');
INSERT INTO `player_levelstats` VALUES ('10', '3', '34', '34', '77', '55', '46', '45');
INSERT INTO `player_levelstats` VALUES ('10', '3', '35', '35', '79', '57', '47', '46');
INSERT INTO `player_levelstats` VALUES ('10', '3', '36', '36', '81', '58', '48', '47');
INSERT INTO `player_levelstats` VALUES ('10', '3', '37', '36', '83', '59', '49', '47');
INSERT INTO `player_levelstats` VALUES ('10', '3', '38', '37', '85', '60', '50', '48');
INSERT INTO `player_levelstats` VALUES ('10', '3', '39', '38', '86', '62', '51', '49');
INSERT INTO `player_levelstats` VALUES ('10', '3', '40', '38', '88', '63', '51', '50');
INSERT INTO `player_levelstats` VALUES ('10', '3', '41', '39', '90', '64', '52', '51');
INSERT INTO `player_levelstats` VALUES ('10', '3', '42', '40', '92', '66', '53', '52');
INSERT INTO `player_levelstats` VALUES ('10', '3', '43', '40', '94', '67', '54', '53');
INSERT INTO `player_levelstats` VALUES ('10', '3', '44', '41', '96', '68', '55', '54');
INSERT INTO `player_levelstats` VALUES ('10', '3', '45', '42', '98', '70', '56', '55');
INSERT INTO `player_levelstats` VALUES ('10', '3', '46', '42', '100', '71', '57', '56');
INSERT INTO `player_levelstats` VALUES ('10', '3', '47', '43', '102', '72', '58', '57');
INSERT INTO `player_levelstats` VALUES ('10', '3', '48', '44', '104', '74', '59', '58');
INSERT INTO `player_levelstats` VALUES ('10', '3', '49', '45', '106', '75', '60', '59');
INSERT INTO `player_levelstats` VALUES ('10', '3', '50', '45', '108', '77', '61', '60');
INSERT INTO `player_levelstats` VALUES ('10', '3', '51', '46', '110', '78', '61', '61');
INSERT INTO `player_levelstats` VALUES ('10', '3', '52', '47', '113', '79', '62', '62');
INSERT INTO `player_levelstats` VALUES ('10', '3', '53', '47', '115', '81', '63', '63');
INSERT INTO `player_levelstats` VALUES ('10', '3', '54', '48', '117', '82', '64', '64');
INSERT INTO `player_levelstats` VALUES ('10', '3', '55', '49', '119', '84', '65', '65');
INSERT INTO `player_levelstats` VALUES ('10', '3', '56', '50', '121', '85', '66', '66');
INSERT INTO `player_levelstats` VALUES ('10', '3', '57', '50', '123', '87', '67', '67');
INSERT INTO `player_levelstats` VALUES ('10', '3', '58', '51', '126', '88', '68', '68');
INSERT INTO `player_levelstats` VALUES ('10', '3', '59', '52', '128', '90', '69', '70');
INSERT INTO `player_levelstats` VALUES ('10', '3', '60', '53', '130', '91', '70', '71');
INSERT INTO `player_levelstats` VALUES ('10', '3', '61', '54', '132', '93', '71', '72');
INSERT INTO `player_levelstats` VALUES ('10', '3', '62', '54', '134', '94', '72', '73');
INSERT INTO `player_levelstats` VALUES ('10', '3', '63', '55', '137', '96', '73', '74');
INSERT INTO `player_levelstats` VALUES ('10', '3', '64', '56', '139', '97', '75', '75');
INSERT INTO `player_levelstats` VALUES ('10', '3', '65', '57', '141', '99', '76', '76');
INSERT INTO `player_levelstats` VALUES ('10', '3', '66', '58', '144', '101', '77', '77');
INSERT INTO `player_levelstats` VALUES ('10', '3', '67', '58', '146', '102', '78', '78');
INSERT INTO `player_levelstats` VALUES ('10', '3', '68', '59', '148', '104', '79', '80');
INSERT INTO `player_levelstats` VALUES ('10', '3', '69', '60', '151', '105', '80', '81');
INSERT INTO `player_levelstats` VALUES ('10', '3', '70', '61', '153', '107', '81', '82');
INSERT INTO `player_levelstats` VALUES ('10', '4', '1', '18', '25', '20', '24', '19');
INSERT INTO `player_levelstats` VALUES ('10', '4', '2', '19', '26', '21', '24', '19');
INSERT INTO `player_levelstats` VALUES ('10', '4', '3', '20', '28', '21', '24', '20');
INSERT INTO `player_levelstats` VALUES ('10', '4', '4', '20', '29', '22', '24', '20');
INSERT INTO `player_levelstats` VALUES ('10', '4', '5', '21', '31', '23', '25', '20');
INSERT INTO `player_levelstats` VALUES ('10', '4', '6', '22', '32', '24', '25', '21');
INSERT INTO `player_levelstats` VALUES ('10', '4', '7', '23', '34', '24', '25', '21');
INSERT INTO `player_levelstats` VALUES ('10', '4', '8', '24', '35', '25', '25', '22');
INSERT INTO `player_levelstats` VALUES ('10', '4', '9', '24', '37', '26', '25', '22');
INSERT INTO `player_levelstats` VALUES ('10', '4', '10', '25', '38', '26', '25', '22');
INSERT INTO `player_levelstats` VALUES ('10', '4', '11', '26', '40', '27', '25', '23');
INSERT INTO `player_levelstats` VALUES ('10', '4', '12', '27', '41', '28', '26', '23');
INSERT INTO `player_levelstats` VALUES ('10', '4', '13', '28', '43', '29', '26', '24');
INSERT INTO `player_levelstats` VALUES ('10', '4', '14', '29', '45', '30', '26', '24');
INSERT INTO `player_levelstats` VALUES ('10', '4', '15', '29', '46', '30', '26', '25');
INSERT INTO `player_levelstats` VALUES ('10', '4', '16', '30', '48', '31', '26', '25');
INSERT INTO `player_levelstats` VALUES ('10', '4', '17', '31', '50', '32', '27', '25');
INSERT INTO `player_levelstats` VALUES ('10', '4', '18', '32', '51', '33', '27', '26');
INSERT INTO `player_levelstats` VALUES ('10', '4', '19', '33', '53', '34', '27', '26');
INSERT INTO `player_levelstats` VALUES ('10', '4', '20', '34', '55', '35', '27', '27');
INSERT INTO `player_levelstats` VALUES ('10', '4', '21', '35', '56', '35', '27', '27');
INSERT INTO `player_levelstats` VALUES ('10', '4', '22', '36', '58', '36', '28', '28');
INSERT INTO `player_levelstats` VALUES ('10', '4', '23', '37', '60', '37', '28', '28');
INSERT INTO `player_levelstats` VALUES ('10', '4', '24', '38', '62', '38', '28', '29');
INSERT INTO `player_levelstats` VALUES ('10', '4', '25', '39', '63', '39', '28', '29');
INSERT INTO `player_levelstats` VALUES ('10', '4', '26', '40', '65', '40', '29', '30');
INSERT INTO `player_levelstats` VALUES ('10', '4', '27', '41', '67', '41', '29', '30');
INSERT INTO `player_levelstats` VALUES ('10', '4', '28', '42', '69', '42', '29', '31');
INSERT INTO `player_levelstats` VALUES ('10', '4', '29', '43', '71', '43', '29', '31');
INSERT INTO `player_levelstats` VALUES ('10', '4', '30', '44', '72', '43', '29', '32');
INSERT INTO `player_levelstats` VALUES ('10', '4', '31', '45', '74', '44', '30', '32');
INSERT INTO `player_levelstats` VALUES ('10', '4', '32', '46', '76', '45', '30', '33');
INSERT INTO `player_levelstats` VALUES ('10', '4', '33', '47', '78', '46', '30', '33');
INSERT INTO `player_levelstats` VALUES ('10', '4', '34', '48', '80', '47', '31', '34');
INSERT INTO `player_levelstats` VALUES ('10', '4', '35', '49', '82', '48', '31', '34');
INSERT INTO `player_levelstats` VALUES ('10', '4', '36', '50', '84', '49', '31', '35');
INSERT INTO `player_levelstats` VALUES ('10', '4', '37', '51', '86', '50', '31', '35');
INSERT INTO `player_levelstats` VALUES ('10', '4', '38', '52', '88', '51', '32', '36');
INSERT INTO `player_levelstats` VALUES ('10', '4', '39', '53', '90', '52', '32', '37');
INSERT INTO `player_levelstats` VALUES ('10', '4', '40', '54', '92', '53', '32', '37');
INSERT INTO `player_levelstats` VALUES ('10', '4', '41', '56', '94', '54', '33', '38');
INSERT INTO `player_levelstats` VALUES ('10', '4', '42', '57', '96', '55', '33', '38');
INSERT INTO `player_levelstats` VALUES ('10', '4', '43', '58', '98', '56', '33', '39');
INSERT INTO `player_levelstats` VALUES ('10', '4', '44', '59', '100', '57', '33', '39');
INSERT INTO `player_levelstats` VALUES ('10', '4', '45', '60', '102', '59', '34', '40');
INSERT INTO `player_levelstats` VALUES ('10', '4', '46', '61', '104', '60', '34', '41');
INSERT INTO `player_levelstats` VALUES ('10', '4', '47', '62', '107', '61', '34', '41');
INSERT INTO `player_levelstats` VALUES ('10', '4', '48', '64', '109', '62', '35', '42');
INSERT INTO `player_levelstats` VALUES ('10', '4', '49', '65', '111', '63', '35', '43');
INSERT INTO `player_levelstats` VALUES ('10', '4', '50', '66', '113', '64', '35', '43');
INSERT INTO `player_levelstats` VALUES ('10', '4', '51', '67', '115', '65', '36', '44');
INSERT INTO `player_levelstats` VALUES ('10', '4', '52', '68', '117', '66', '36', '44');
INSERT INTO `player_levelstats` VALUES ('10', '4', '53', '70', '120', '67', '36', '45');
INSERT INTO `player_levelstats` VALUES ('10', '4', '54', '71', '122', '69', '37', '46');
INSERT INTO `player_levelstats` VALUES ('10', '4', '55', '72', '124', '70', '37', '46');
INSERT INTO `player_levelstats` VALUES ('10', '4', '56', '73', '126', '71', '37', '47');
INSERT INTO `player_levelstats` VALUES ('10', '4', '57', '75', '129', '72', '38', '48');
INSERT INTO `player_levelstats` VALUES ('10', '4', '58', '76', '131', '73', '38', '48');
INSERT INTO `player_levelstats` VALUES ('10', '4', '59', '77', '133', '74', '39', '49');
INSERT INTO `player_levelstats` VALUES ('10', '4', '60', '79', '136', '76', '39', '50');
INSERT INTO `player_levelstats` VALUES ('10', '4', '61', '80', '138', '77', '39', '51');
INSERT INTO `player_levelstats` VALUES ('10', '4', '62', '81', '140', '78', '40', '51');
INSERT INTO `player_levelstats` VALUES ('10', '4', '63', '82', '143', '79', '40', '52');
INSERT INTO `player_levelstats` VALUES ('10', '4', '64', '84', '145', '80', '41', '53');
INSERT INTO `player_levelstats` VALUES ('10', '4', '65', '85', '148', '82', '41', '53');
INSERT INTO `player_levelstats` VALUES ('10', '4', '66', '87', '150', '83', '41', '54');
INSERT INTO `player_levelstats` VALUES ('10', '4', '67', '88', '153', '84', '42', '55');
INSERT INTO `player_levelstats` VALUES ('10', '4', '68', '89', '155', '85', '42', '56');
INSERT INTO `player_levelstats` VALUES ('10', '4', '69', '91', '157', '87', '43', '56');
INSERT INTO `player_levelstats` VALUES ('10', '4', '70', '92', '160', '88', '43', '57');
INSERT INTO `player_levelstats` VALUES ('10', '5', '1', '17', '22', '19', '26', '22');
INSERT INTO `player_levelstats` VALUES ('10', '5', '2', '17', '22', '19', '27', '23');
INSERT INTO `player_levelstats` VALUES ('10', '5', '3', '17', '22', '20', '29', '25');
INSERT INTO `player_levelstats` VALUES ('10', '5', '4', '17', '23', '20', '30', '26');
INSERT INTO `player_levelstats` VALUES ('10', '5', '5', '18', '23', '20', '31', '27');
INSERT INTO `player_levelstats` VALUES ('10', '5', '6', '18', '23', '21', '33', '29');
INSERT INTO `player_levelstats` VALUES ('10', '5', '7', '18', '23', '21', '34', '30');
INSERT INTO `player_levelstats` VALUES ('10', '5', '8', '18', '24', '22', '35', '32');
INSERT INTO `player_levelstats` VALUES ('10', '5', '9', '18', '24', '22', '37', '33');
INSERT INTO `player_levelstats` VALUES ('10', '5', '10', '19', '24', '22', '38', '35');
INSERT INTO `player_levelstats` VALUES ('10', '5', '11', '19', '24', '23', '39', '36');
INSERT INTO `player_levelstats` VALUES ('10', '5', '12', '19', '24', '23', '41', '38');
INSERT INTO `player_levelstats` VALUES ('10', '5', '13', '19', '25', '24', '42', '39');
INSERT INTO `player_levelstats` VALUES ('10', '5', '14', '19', '25', '24', '44', '41');
INSERT INTO `player_levelstats` VALUES ('10', '5', '15', '19', '25', '25', '45', '42');
INSERT INTO `player_levelstats` VALUES ('10', '5', '16', '20', '26', '25', '47', '44');
INSERT INTO `player_levelstats` VALUES ('10', '5', '17', '20', '26', '25', '48', '45');
INSERT INTO `player_levelstats` VALUES ('10', '5', '18', '20', '26', '26', '50', '47');
INSERT INTO `player_levelstats` VALUES ('10', '5', '19', '20', '26', '26', '51', '49');
INSERT INTO `player_levelstats` VALUES ('10', '5', '20', '21', '27', '27', '53', '50');
INSERT INTO `player_levelstats` VALUES ('10', '5', '21', '21', '27', '27', '54', '52');
INSERT INTO `player_levelstats` VALUES ('10', '5', '22', '21', '27', '28', '56', '53');
INSERT INTO `player_levelstats` VALUES ('10', '5', '23', '21', '28', '28', '58', '55');
INSERT INTO `player_levelstats` VALUES ('10', '5', '24', '21', '28', '29', '59', '57');
INSERT INTO `player_levelstats` VALUES ('10', '5', '25', '22', '28', '29', '61', '58');
INSERT INTO `player_levelstats` VALUES ('10', '5', '26', '22', '28', '30', '62', '60');
INSERT INTO `player_levelstats` VALUES ('10', '5', '27', '22', '29', '30', '64', '62');
INSERT INTO `player_levelstats` VALUES ('10', '5', '28', '22', '29', '31', '66', '64');
INSERT INTO `player_levelstats` VALUES ('10', '5', '29', '23', '29', '31', '67', '65');
INSERT INTO `player_levelstats` VALUES ('10', '5', '30', '23', '30', '32', '69', '67');
INSERT INTO `player_levelstats` VALUES ('10', '5', '31', '23', '30', '32', '71', '69');
INSERT INTO `player_levelstats` VALUES ('10', '5', '32', '23', '30', '33', '72', '71');
INSERT INTO `player_levelstats` VALUES ('10', '5', '33', '24', '31', '33', '74', '72');
INSERT INTO `player_levelstats` VALUES ('10', '5', '34', '24', '31', '34', '76', '74');
INSERT INTO `player_levelstats` VALUES ('10', '5', '35', '24', '32', '34', '78', '76');
INSERT INTO `player_levelstats` VALUES ('10', '5', '36', '24', '32', '35', '80', '78');
INSERT INTO `player_levelstats` VALUES ('10', '5', '37', '25', '32', '35', '81', '80');
INSERT INTO `player_levelstats` VALUES ('10', '5', '38', '25', '33', '36', '83', '82');
INSERT INTO `player_levelstats` VALUES ('10', '5', '39', '25', '33', '37', '85', '84');
INSERT INTO `player_levelstats` VALUES ('10', '5', '40', '26', '33', '37', '87', '86');
INSERT INTO `player_levelstats` VALUES ('10', '5', '41', '26', '34', '38', '89', '88');
INSERT INTO `player_levelstats` VALUES ('10', '5', '42', '26', '34', '38', '91', '89');
INSERT INTO `player_levelstats` VALUES ('10', '5', '43', '27', '35', '39', '92', '91');
INSERT INTO `player_levelstats` VALUES ('10', '5', '44', '27', '35', '39', '94', '93');
INSERT INTO `player_levelstats` VALUES ('10', '5', '45', '27', '35', '40', '96', '95');
INSERT INTO `player_levelstats` VALUES ('10', '5', '46', '27', '36', '41', '98', '97');
INSERT INTO `player_levelstats` VALUES ('10', '5', '47', '28', '36', '41', '100', '99');
INSERT INTO `player_levelstats` VALUES ('10', '5', '48', '28', '37', '42', '102', '101');
INSERT INTO `player_levelstats` VALUES ('10', '5', '49', '28', '37', '43', '104', '103');
INSERT INTO `player_levelstats` VALUES ('10', '5', '50', '29', '37', '43', '106', '106');
INSERT INTO `player_levelstats` VALUES ('10', '5', '51', '29', '38', '44', '108', '108');
INSERT INTO `player_levelstats` VALUES ('10', '5', '52', '29', '38', '44', '110', '110');
INSERT INTO `player_levelstats` VALUES ('10', '5', '53', '30', '39', '45', '112', '112');
INSERT INTO `player_levelstats` VALUES ('10', '5', '54', '30', '39', '46', '114', '114');
INSERT INTO `player_levelstats` VALUES ('10', '5', '55', '30', '40', '46', '116', '116');
INSERT INTO `player_levelstats` VALUES ('10', '5', '56', '31', '40', '47', '118', '118');
INSERT INTO `player_levelstats` VALUES ('10', '5', '57', '31', '41', '48', '120', '120');
INSERT INTO `player_levelstats` VALUES ('10', '5', '58', '31', '41', '48', '123', '123');
INSERT INTO `player_levelstats` VALUES ('10', '5', '59', '32', '42', '49', '125', '125');
INSERT INTO `player_levelstats` VALUES ('10', '5', '60', '32', '42', '50', '127', '127');
INSERT INTO `player_levelstats` VALUES ('10', '5', '61', '33', '42', '51', '129', '129');
INSERT INTO `player_levelstats` VALUES ('10', '5', '62', '33', '43', '51', '131', '131');
INSERT INTO `player_levelstats` VALUES ('10', '5', '63', '33', '43', '52', '133', '134');
INSERT INTO `player_levelstats` VALUES ('10', '5', '64', '34', '44', '53', '135', '136');
INSERT INTO `player_levelstats` VALUES ('10', '5', '65', '34', '44', '53', '138', '138');
INSERT INTO `player_levelstats` VALUES ('10', '5', '66', '34', '45', '54', '140', '141');
INSERT INTO `player_levelstats` VALUES ('10', '5', '67', '35', '45', '55', '142', '143');
INSERT INTO `player_levelstats` VALUES ('10', '5', '68', '35', '46', '56', '144', '145');
INSERT INTO `player_levelstats` VALUES ('10', '5', '69', '36', '46', '56', '147', '148');
INSERT INTO `player_levelstats` VALUES ('10', '5', '70', '36', '47', '57', '149', '150');
INSERT INTO `player_levelstats` VALUES ('10', '8', '1', '17', '22', '19', '27', '21');
INSERT INTO `player_levelstats` VALUES ('10', '8', '2', '17', '22', '19', '28', '22');
INSERT INTO `player_levelstats` VALUES ('10', '8', '3', '17', '22', '20', '30', '24');
INSERT INTO `player_levelstats` VALUES ('10', '8', '4', '17', '22', '20', '31', '25');
INSERT INTO `player_levelstats` VALUES ('10', '8', '5', '17', '23', '20', '32', '26');
INSERT INTO `player_levelstats` VALUES ('10', '8', '6', '17', '23', '20', '34', '28');
INSERT INTO `player_levelstats` VALUES ('10', '8', '7', '18', '23', '21', '35', '29');
INSERT INTO `player_levelstats` VALUES ('10', '8', '8', '18', '23', '21', '37', '30');
INSERT INTO `player_levelstats` VALUES ('10', '8', '9', '18', '23', '21', '38', '32');
INSERT INTO `player_levelstats` VALUES ('10', '8', '10', '18', '23', '22', '40', '33');
INSERT INTO `player_levelstats` VALUES ('10', '8', '11', '18', '24', '22', '41', '35');
INSERT INTO `player_levelstats` VALUES ('10', '8', '12', '18', '24', '22', '42', '36');
INSERT INTO `player_levelstats` VALUES ('10', '8', '13', '18', '24', '23', '44', '37');
INSERT INTO `player_levelstats` VALUES ('10', '8', '14', '18', '24', '23', '45', '39');
INSERT INTO `player_levelstats` VALUES ('10', '8', '15', '18', '24', '23', '47', '40');
INSERT INTO `player_levelstats` VALUES ('10', '8', '16', '19', '24', '24', '49', '42');
INSERT INTO `player_levelstats` VALUES ('10', '8', '17', '19', '25', '24', '50', '43');
INSERT INTO `player_levelstats` VALUES ('10', '8', '18', '19', '25', '24', '52', '45');
INSERT INTO `player_levelstats` VALUES ('10', '8', '19', '19', '25', '25', '53', '46');
INSERT INTO `player_levelstats` VALUES ('10', '8', '20', '19', '25', '25', '55', '48');
INSERT INTO `player_levelstats` VALUES ('10', '8', '21', '19', '25', '26', '57', '50');
INSERT INTO `player_levelstats` VALUES ('10', '8', '22', '19', '26', '26', '58', '51');
INSERT INTO `player_levelstats` VALUES ('10', '8', '23', '20', '26', '26', '60', '53');
INSERT INTO `player_levelstats` VALUES ('10', '8', '24', '20', '26', '27', '61', '54');
INSERT INTO `player_levelstats` VALUES ('10', '8', '25', '20', '26', '27', '63', '56');
INSERT INTO `player_levelstats` VALUES ('10', '8', '26', '20', '27', '27', '65', '58');
INSERT INTO `player_levelstats` VALUES ('10', '8', '27', '20', '27', '28', '67', '59');
INSERT INTO `player_levelstats` VALUES ('10', '8', '28', '20', '27', '28', '68', '61');
INSERT INTO `player_levelstats` VALUES ('10', '8', '29', '21', '27', '29', '70', '63');
INSERT INTO `player_levelstats` VALUES ('10', '8', '30', '21', '28', '29', '72', '64');
INSERT INTO `player_levelstats` VALUES ('10', '8', '31', '21', '28', '30', '74', '66');
INSERT INTO `player_levelstats` VALUES ('10', '8', '32', '21', '28', '30', '75', '68');
INSERT INTO `player_levelstats` VALUES ('10', '8', '33', '21', '28', '30', '77', '70');
INSERT INTO `player_levelstats` VALUES ('10', '8', '34', '21', '29', '31', '79', '71');
INSERT INTO `player_levelstats` VALUES ('10', '8', '35', '22', '29', '31', '81', '73');
INSERT INTO `player_levelstats` VALUES ('10', '8', '36', '22', '29', '32', '83', '75');
INSERT INTO `player_levelstats` VALUES ('10', '8', '37', '22', '29', '32', '85', '77');
INSERT INTO `player_levelstats` VALUES ('10', '8', '38', '22', '30', '33', '86', '78');
INSERT INTO `player_levelstats` VALUES ('10', '8', '39', '22', '30', '33', '88', '80');
INSERT INTO `player_levelstats` VALUES ('10', '8', '40', '23', '30', '34', '90', '82');
INSERT INTO `player_levelstats` VALUES ('10', '8', '41', '23', '31', '34', '92', '84');
INSERT INTO `player_levelstats` VALUES ('10', '8', '42', '23', '31', '35', '94', '86');
INSERT INTO `player_levelstats` VALUES ('10', '8', '43', '23', '31', '35', '96', '88');
INSERT INTO `player_levelstats` VALUES ('10', '8', '44', '23', '32', '36', '98', '90');
INSERT INTO `player_levelstats` VALUES ('10', '8', '45', '24', '32', '36', '100', '92');
INSERT INTO `player_levelstats` VALUES ('10', '8', '46', '24', '32', '37', '102', '93');
INSERT INTO `player_levelstats` VALUES ('10', '8', '47', '24', '32', '37', '104', '95');
INSERT INTO `player_levelstats` VALUES ('10', '8', '48', '24', '33', '38', '106', '97');
INSERT INTO `player_levelstats` VALUES ('10', '8', '49', '25', '33', '38', '108', '99');
INSERT INTO `player_levelstats` VALUES ('10', '8', '50', '25', '33', '39', '110', '101');
INSERT INTO `player_levelstats` VALUES ('10', '8', '51', '25', '34', '39', '112', '103');
INSERT INTO `player_levelstats` VALUES ('10', '8', '52', '25', '34', '40', '114', '105');
INSERT INTO `player_levelstats` VALUES ('10', '8', '53', '25', '35', '40', '117', '107');
INSERT INTO `player_levelstats` VALUES ('10', '8', '54', '26', '35', '41', '119', '109');
INSERT INTO `player_levelstats` VALUES ('10', '8', '55', '26', '35', '41', '121', '111');
INSERT INTO `player_levelstats` VALUES ('10', '8', '56', '26', '36', '42', '123', '113');
INSERT INTO `player_levelstats` VALUES ('10', '8', '57', '26', '36', '42', '125', '116');
INSERT INTO `player_levelstats` VALUES ('10', '8', '58', '27', '36', '43', '127', '118');
INSERT INTO `player_levelstats` VALUES ('10', '8', '59', '27', '37', '43', '130', '120');
INSERT INTO `player_levelstats` VALUES ('10', '8', '60', '27', '37', '44', '132', '122');
INSERT INTO `player_levelstats` VALUES ('10', '8', '61', '27', '37', '45', '134', '124');
INSERT INTO `player_levelstats` VALUES ('10', '8', '62', '28', '38', '45', '136', '126');
INSERT INTO `player_levelstats` VALUES ('10', '8', '63', '28', '38', '46', '139', '128');
INSERT INTO `player_levelstats` VALUES ('10', '8', '64', '28', '39', '46', '141', '131');
INSERT INTO `player_levelstats` VALUES ('10', '8', '65', '29', '39', '47', '143', '133');
INSERT INTO `player_levelstats` VALUES ('10', '8', '66', '29', '39', '48', '146', '135');
INSERT INTO `player_levelstats` VALUES ('10', '8', '67', '29', '40', '48', '148', '137');
INSERT INTO `player_levelstats` VALUES ('10', '8', '68', '29', '40', '49', '150', '139');
INSERT INTO `player_levelstats` VALUES ('10', '8', '69', '30', '41', '49', '153', '142');
INSERT INTO `player_levelstats` VALUES ('10', '8', '70', '30', '41', '50', '155', '144');
INSERT INTO `player_levelstats` VALUES ('10', '9', '1', '17', '22', '20', '26', '21');
INSERT INTO `player_levelstats` VALUES ('10', '9', '2', '17', '22', '21', '27', '22');
INSERT INTO `player_levelstats` VALUES ('10', '9', '3', '18', '23', '21', '28', '23');
INSERT INTO `player_levelstats` VALUES ('10', '9', '4', '18', '23', '22', '29', '24');
INSERT INTO `player_levelstats` VALUES ('10', '9', '5', '18', '23', '22', '31', '26');
INSERT INTO `player_levelstats` VALUES ('10', '9', '6', '18', '24', '23', '32', '27');
INSERT INTO `player_levelstats` VALUES ('10', '9', '7', '19', '24', '23', '33', '28');
INSERT INTO `player_levelstats` VALUES ('10', '9', '8', '19', '25', '24', '34', '29');
INSERT INTO `player_levelstats` VALUES ('10', '9', '9', '19', '25', '25', '36', '30');
INSERT INTO `player_levelstats` VALUES ('10', '9', '10', '20', '25', '25', '37', '32');
INSERT INTO `player_levelstats` VALUES ('10', '9', '11', '20', '26', '26', '38', '33');
INSERT INTO `player_levelstats` VALUES ('10', '9', '12', '20', '26', '26', '39', '34');
INSERT INTO `player_levelstats` VALUES ('10', '9', '13', '21', '27', '27', '41', '36');
INSERT INTO `player_levelstats` VALUES ('10', '9', '14', '21', '27', '28', '42', '37');
INSERT INTO `player_levelstats` VALUES ('10', '9', '15', '21', '27', '28', '43', '38');
INSERT INTO `player_levelstats` VALUES ('10', '9', '16', '22', '28', '29', '45', '39');
INSERT INTO `player_levelstats` VALUES ('10', '9', '17', '22', '28', '30', '46', '41');
INSERT INTO `player_levelstats` VALUES ('10', '9', '18', '23', '29', '30', '47', '42');
INSERT INTO `player_levelstats` VALUES ('10', '9', '19', '23', '29', '31', '49', '43');
INSERT INTO `player_levelstats` VALUES ('10', '9', '20', '23', '30', '32', '50', '45');
INSERT INTO `player_levelstats` VALUES ('10', '9', '21', '24', '30', '32', '51', '46');
INSERT INTO `player_levelstats` VALUES ('10', '9', '22', '24', '31', '33', '53', '48');
INSERT INTO `player_levelstats` VALUES ('10', '9', '23', '24', '31', '34', '54', '49');
INSERT INTO `player_levelstats` VALUES ('10', '9', '24', '25', '31', '34', '56', '50');
INSERT INTO `player_levelstats` VALUES ('10', '9', '25', '25', '32', '35', '57', '52');
INSERT INTO `player_levelstats` VALUES ('10', '9', '26', '26', '32', '36', '59', '53');
INSERT INTO `player_levelstats` VALUES ('10', '9', '27', '26', '33', '37', '60', '55');
INSERT INTO `player_levelstats` VALUES ('10', '9', '28', '26', '33', '37', '62', '56');
INSERT INTO `player_levelstats` VALUES ('10', '9', '29', '27', '34', '38', '63', '58');
INSERT INTO `player_levelstats` VALUES ('10', '9', '30', '27', '34', '39', '65', '59');
INSERT INTO `player_levelstats` VALUES ('10', '9', '31', '28', '35', '40', '66', '61');
INSERT INTO `player_levelstats` VALUES ('10', '9', '32', '28', '36', '40', '68', '62');
INSERT INTO `player_levelstats` VALUES ('10', '9', '33', '29', '36', '41', '69', '64');
INSERT INTO `player_levelstats` VALUES ('10', '9', '34', '29', '37', '42', '71', '65');
INSERT INTO `player_levelstats` VALUES ('10', '9', '35', '29', '37', '43', '73', '67');
INSERT INTO `player_levelstats` VALUES ('10', '9', '36', '30', '38', '43', '74', '69');
INSERT INTO `player_levelstats` VALUES ('10', '9', '37', '30', '38', '44', '76', '70');
INSERT INTO `player_levelstats` VALUES ('10', '9', '38', '31', '39', '45', '77', '72');
INSERT INTO `player_levelstats` VALUES ('10', '9', '39', '31', '39', '46', '79', '73');
INSERT INTO `player_levelstats` VALUES ('10', '9', '40', '32', '40', '47', '81', '75');
INSERT INTO `player_levelstats` VALUES ('10', '9', '41', '32', '41', '48', '82', '77');
INSERT INTO `player_levelstats` VALUES ('10', '9', '42', '33', '41', '48', '84', '78');
INSERT INTO `player_levelstats` VALUES ('10', '9', '43', '33', '42', '49', '86', '80');
INSERT INTO `player_levelstats` VALUES ('10', '9', '44', '34', '42', '50', '88', '82');
INSERT INTO `player_levelstats` VALUES ('10', '9', '45', '34', '43', '51', '89', '83');
INSERT INTO `player_levelstats` VALUES ('10', '9', '46', '35', '44', '52', '91', '85');
INSERT INTO `player_levelstats` VALUES ('10', '9', '47', '35', '44', '53', '93', '87');
INSERT INTO `player_levelstats` VALUES ('10', '9', '48', '36', '45', '54', '95', '89');
INSERT INTO `player_levelstats` VALUES ('10', '9', '49', '36', '45', '54', '96', '90');
INSERT INTO `player_levelstats` VALUES ('10', '9', '50', '37', '46', '55', '98', '92');
INSERT INTO `player_levelstats` VALUES ('10', '9', '51', '37', '47', '56', '100', '94');
INSERT INTO `player_levelstats` VALUES ('10', '9', '52', '38', '47', '57', '102', '96');
INSERT INTO `player_levelstats` VALUES ('10', '9', '53', '38', '48', '58', '104', '97');
INSERT INTO `player_levelstats` VALUES ('10', '9', '54', '39', '49', '59', '105', '99');
INSERT INTO `player_levelstats` VALUES ('10', '9', '55', '39', '49', '60', '107', '101');
INSERT INTO `player_levelstats` VALUES ('10', '9', '56', '40', '50', '61', '109', '103');
INSERT INTO `player_levelstats` VALUES ('10', '9', '57', '40', '51', '62', '111', '105');
INSERT INTO `player_levelstats` VALUES ('10', '9', '58', '41', '51', '63', '113', '107');
INSERT INTO `player_levelstats` VALUES ('10', '9', '59', '42', '52', '64', '115', '108');
INSERT INTO `player_levelstats` VALUES ('10', '9', '60', '42', '53', '65', '117', '110');
INSERT INTO `player_levelstats` VALUES ('10', '9', '61', '43', '53', '66', '119', '112');
INSERT INTO `player_levelstats` VALUES ('10', '9', '62', '43', '54', '67', '121', '114');
INSERT INTO `player_levelstats` VALUES ('10', '9', '63', '44', '55', '68', '123', '116');
INSERT INTO `player_levelstats` VALUES ('10', '9', '64', '44', '56', '69', '125', '118');
INSERT INTO `player_levelstats` VALUES ('10', '9', '65', '45', '56', '70', '127', '120');
INSERT INTO `player_levelstats` VALUES ('10', '9', '66', '46', '57', '71', '129', '122');
INSERT INTO `player_levelstats` VALUES ('10', '9', '67', '46', '58', '72', '131', '124');
INSERT INTO `player_levelstats` VALUES ('10', '9', '68', '47', '58', '73', '133', '126');
INSERT INTO `player_levelstats` VALUES ('10', '9', '69', '47', '59', '74', '135', '128');
INSERT INTO `player_levelstats` VALUES ('10', '9', '70', '48', '60', '75', '137', '130');
INSERT INTO `player_levelstats` VALUES ('11', '1', '1', '24', '17', '21', '21', '22');
INSERT INTO `player_levelstats` VALUES ('11', '1', '2', '25', '18', '22', '21', '22');
INSERT INTO `player_levelstats` VALUES ('11', '1', '3', '27', '19', '23', '21', '23');
INSERT INTO `player_levelstats` VALUES ('11', '1', '4', '28', '19', '25', '21', '23');
INSERT INTO `player_levelstats` VALUES ('11', '1', '5', '29', '20', '26', '21', '23');
INSERT INTO `player_levelstats` VALUES ('11', '1', '6', '31', '21', '27', '21', '23');
INSERT INTO `player_levelstats` VALUES ('11', '1', '7', '32', '22', '28', '21', '24');
INSERT INTO `player_levelstats` VALUES ('11', '1', '8', '33', '23', '29', '22', '24');
INSERT INTO `player_levelstats` VALUES ('11', '1', '9', '35', '24', '31', '22', '24');
INSERT INTO `player_levelstats` VALUES ('11', '1', '10', '36', '24', '32', '22', '25');
INSERT INTO `player_levelstats` VALUES ('11', '1', '11', '37', '25', '33', '22', '25');
INSERT INTO `player_levelstats` VALUES ('11', '1', '12', '39', '26', '34', '22', '25');
INSERT INTO `player_levelstats` VALUES ('11', '1', '13', '40', '27', '36', '22', '26');
INSERT INTO `player_levelstats` VALUES ('11', '1', '14', '42', '28', '37', '22', '26');
INSERT INTO `player_levelstats` VALUES ('11', '1', '15', '43', '29', '38', '22', '26');
INSERT INTO `player_levelstats` VALUES ('11', '1', '16', '45', '30', '40', '22', '27');
INSERT INTO `player_levelstats` VALUES ('11', '1', '17', '46', '31', '41', '23', '27');
INSERT INTO `player_levelstats` VALUES ('11', '1', '18', '48', '32', '43', '23', '27');
INSERT INTO `player_levelstats` VALUES ('11', '1', '19', '49', '33', '44', '23', '28');
INSERT INTO `player_levelstats` VALUES ('11', '1', '20', '51', '34', '45', '23', '28');
INSERT INTO `player_levelstats` VALUES ('11', '1', '21', '52', '34', '47', '23', '28');
INSERT INTO `player_levelstats` VALUES ('11', '1', '22', '54', '35', '48', '23', '29');
INSERT INTO `player_levelstats` VALUES ('11', '1', '23', '55', '36', '50', '23', '29');
INSERT INTO `player_levelstats` VALUES ('11', '1', '24', '57', '37', '51', '24', '30');
INSERT INTO `player_levelstats` VALUES ('11', '1', '25', '59', '38', '52', '24', '30');
INSERT INTO `player_levelstats` VALUES ('11', '1', '26', '60', '39', '54', '24', '30');
INSERT INTO `player_levelstats` VALUES ('11', '1', '27', '62', '40', '55', '24', '31');
INSERT INTO `player_levelstats` VALUES ('11', '1', '28', '63', '41', '57', '24', '31');
INSERT INTO `player_levelstats` VALUES ('11', '1', '29', '65', '43', '58', '24', '32');
INSERT INTO `player_levelstats` VALUES ('11', '1', '30', '67', '44', '60', '24', '32');
INSERT INTO `player_levelstats` VALUES ('11', '1', '31', '69', '45', '62', '25', '32');
INSERT INTO `player_levelstats` VALUES ('11', '1', '32', '70', '46', '63', '25', '33');
INSERT INTO `player_levelstats` VALUES ('11', '1', '33', '72', '47', '65', '25', '33');
INSERT INTO `player_levelstats` VALUES ('11', '1', '34', '74', '48', '66', '25', '34');
INSERT INTO `player_levelstats` VALUES ('11', '1', '35', '75', '49', '68', '25', '34');
INSERT INTO `player_levelstats` VALUES ('11', '1', '36', '77', '50', '69', '26', '35');
INSERT INTO `player_levelstats` VALUES ('11', '1', '37', '79', '51', '71', '26', '35');
INSERT INTO `player_levelstats` VALUES ('11', '1', '38', '81', '52', '73', '26', '35');
INSERT INTO `player_levelstats` VALUES ('11', '1', '39', '83', '53', '74', '26', '36');
INSERT INTO `player_levelstats` VALUES ('11', '1', '40', '84', '55', '76', '26', '36');
INSERT INTO `player_levelstats` VALUES ('11', '1', '41', '86', '56', '78', '27', '37');
INSERT INTO `player_levelstats` VALUES ('11', '1', '42', '88', '57', '79', '27', '37');
INSERT INTO `player_levelstats` VALUES ('11', '1', '43', '90', '58', '81', '27', '38');
INSERT INTO `player_levelstats` VALUES ('11', '1', '44', '92', '59', '83', '27', '38');
INSERT INTO `player_levelstats` VALUES ('11', '1', '45', '94', '60', '85', '27', '39');
INSERT INTO `player_levelstats` VALUES ('11', '1', '46', '96', '62', '86', '28', '39');
INSERT INTO `player_levelstats` VALUES ('11', '1', '47', '98', '63', '88', '28', '40');
INSERT INTO `player_levelstats` VALUES ('11', '1', '48', '100', '64', '90', '28', '40');
INSERT INTO `player_levelstats` VALUES ('11', '1', '49', '102', '65', '92', '28', '41');
INSERT INTO `player_levelstats` VALUES ('11', '1', '50', '103', '66', '93', '29', '41');
INSERT INTO `player_levelstats` VALUES ('11', '1', '51', '105', '68', '95', '29', '42');
INSERT INTO `player_levelstats` VALUES ('11', '1', '52', '107', '69', '97', '29', '42');
INSERT INTO `player_levelstats` VALUES ('11', '1', '53', '109', '70', '99', '29', '43');
INSERT INTO `player_levelstats` VALUES ('11', '1', '54', '112', '71', '101', '30', '44');
INSERT INTO `player_levelstats` VALUES ('11', '1', '55', '114', '73', '103', '30', '44');
INSERT INTO `player_levelstats` VALUES ('11', '1', '56', '116', '74', '104', '30', '45');
INSERT INTO `player_levelstats` VALUES ('11', '1', '57', '118', '75', '106', '30', '45');
INSERT INTO `player_levelstats` VALUES ('11', '1', '58', '120', '77', '108', '31', '46');
INSERT INTO `player_levelstats` VALUES ('11', '1', '59', '122', '78', '110', '31', '46');
INSERT INTO `player_levelstats` VALUES ('11', '1', '60', '124', '79', '112', '31', '47');
INSERT INTO `player_levelstats` VALUES ('11', '1', '61', '126', '81', '114', '31', '48');
INSERT INTO `player_levelstats` VALUES ('11', '1', '62', '128', '82', '116', '32', '48');
INSERT INTO `player_levelstats` VALUES ('11', '1', '63', '130', '83', '118', '32', '49');
INSERT INTO `player_levelstats` VALUES ('11', '1', '64', '133', '85', '120', '32', '49');
INSERT INTO `player_levelstats` VALUES ('11', '1', '65', '135', '86', '122', '33', '50');
INSERT INTO `player_levelstats` VALUES ('11', '1', '66', '137', '87', '124', '33', '51');
INSERT INTO `player_levelstats` VALUES ('11', '1', '67', '139', '89', '126', '33', '51');
INSERT INTO `player_levelstats` VALUES ('11', '1', '68', '141', '90', '128', '33', '52');
INSERT INTO `player_levelstats` VALUES ('11', '1', '69', '144', '92', '130', '34', '52');
INSERT INTO `player_levelstats` VALUES ('11', '1', '70', '146', '93', '132', '34', '53');
INSERT INTO `player_levelstats` VALUES ('11', '2', '1', '23', '17', '21', '21', '23');
INSERT INTO `player_levelstats` VALUES ('11', '2', '2', '24', '18', '22', '22', '24');
INSERT INTO `player_levelstats` VALUES ('11', '2', '3', '25', '18', '23', '22', '24');
INSERT INTO `player_levelstats` VALUES ('11', '2', '4', '26', '19', '24', '23', '25');
INSERT INTO `player_levelstats` VALUES ('11', '2', '5', '27', '19', '25', '24', '26');
INSERT INTO `player_levelstats` VALUES ('11', '2', '6', '29', '20', '26', '24', '26');
INSERT INTO `player_levelstats` VALUES ('11', '2', '7', '30', '21', '27', '25', '27');
INSERT INTO `player_levelstats` VALUES ('11', '2', '8', '31', '21', '28', '26', '28');
INSERT INTO `player_levelstats` VALUES ('11', '2', '9', '32', '22', '29', '26', '29');
INSERT INTO `player_levelstats` VALUES ('11', '2', '10', '33', '22', '31', '27', '29');
INSERT INTO `player_levelstats` VALUES ('11', '2', '11', '34', '23', '32', '28', '30');
INSERT INTO `player_levelstats` VALUES ('11', '2', '12', '36', '24', '33', '28', '31');
INSERT INTO `player_levelstats` VALUES ('11', '2', '13', '37', '24', '34', '29', '32');
INSERT INTO `player_levelstats` VALUES ('11', '2', '14', '38', '25', '35', '30', '32');
INSERT INTO `player_levelstats` VALUES ('11', '2', '15', '39', '26', '36', '31', '33');
INSERT INTO `player_levelstats` VALUES ('11', '2', '16', '40', '26', '37', '31', '34');
INSERT INTO `player_levelstats` VALUES ('11', '2', '17', '42', '27', '39', '32', '35');
INSERT INTO `player_levelstats` VALUES ('11', '2', '18', '43', '28', '40', '33', '36');
INSERT INTO `player_levelstats` VALUES ('11', '2', '19', '44', '28', '41', '34', '37');
INSERT INTO `player_levelstats` VALUES ('11', '2', '20', '46', '29', '42', '34', '37');
INSERT INTO `player_levelstats` VALUES ('11', '2', '21', '47', '30', '44', '35', '38');
INSERT INTO `player_levelstats` VALUES ('11', '2', '22', '48', '31', '45', '36', '39');
INSERT INTO `player_levelstats` VALUES ('11', '2', '23', '50', '31', '46', '37', '40');
INSERT INTO `player_levelstats` VALUES ('11', '2', '24', '51', '32', '47', '38', '41');
INSERT INTO `player_levelstats` VALUES ('11', '2', '25', '52', '33', '49', '38', '42');
INSERT INTO `player_levelstats` VALUES ('11', '2', '26', '54', '34', '50', '39', '43');
INSERT INTO `player_levelstats` VALUES ('11', '2', '27', '55', '34', '51', '40', '44');
INSERT INTO `player_levelstats` VALUES ('11', '2', '28', '56', '35', '53', '41', '44');
INSERT INTO `player_levelstats` VALUES ('11', '2', '29', '58', '36', '54', '42', '45');
INSERT INTO `player_levelstats` VALUES ('11', '2', '30', '59', '37', '55', '43', '46');
INSERT INTO `player_levelstats` VALUES ('11', '2', '31', '61', '37', '57', '43', '47');
INSERT INTO `player_levelstats` VALUES ('11', '2', '32', '62', '38', '58', '44', '48');
INSERT INTO `player_levelstats` VALUES ('11', '2', '33', '64', '39', '59', '45', '49');
INSERT INTO `player_levelstats` VALUES ('11', '2', '34', '65', '40', '61', '46', '50');
INSERT INTO `player_levelstats` VALUES ('11', '2', '35', '67', '41', '62', '47', '51');
INSERT INTO `player_levelstats` VALUES ('11', '2', '36', '68', '42', '64', '48', '52');
INSERT INTO `player_levelstats` VALUES ('11', '2', '37', '70', '42', '65', '49', '53');
INSERT INTO `player_levelstats` VALUES ('11', '2', '38', '71', '43', '67', '50', '54');
INSERT INTO `player_levelstats` VALUES ('11', '2', '39', '73', '44', '68', '51', '55');
INSERT INTO `player_levelstats` VALUES ('11', '2', '40', '74', '45', '69', '52', '56');
INSERT INTO `player_levelstats` VALUES ('11', '2', '41', '76', '46', '71', '53', '57');
INSERT INTO `player_levelstats` VALUES ('11', '2', '42', '78', '47', '72', '54', '58');
INSERT INTO `player_levelstats` VALUES ('11', '2', '43', '79', '47', '74', '55', '59');
INSERT INTO `player_levelstats` VALUES ('11', '2', '44', '81', '48', '75', '56', '60');
INSERT INTO `player_levelstats` VALUES ('11', '2', '45', '82', '49', '77', '57', '61');
INSERT INTO `player_levelstats` VALUES ('11', '2', '46', '84', '50', '78', '58', '62');
INSERT INTO `player_levelstats` VALUES ('11', '2', '47', '86', '51', '80', '59', '64');
INSERT INTO `player_levelstats` VALUES ('11', '2', '48', '87', '52', '82', '60', '65');
INSERT INTO `player_levelstats` VALUES ('11', '2', '49', '89', '53', '83', '61', '66');
INSERT INTO `player_levelstats` VALUES ('11', '2', '50', '91', '54', '85', '62', '67');
INSERT INTO `player_levelstats` VALUES ('11', '2', '51', '92', '55', '86', '63', '68');
INSERT INTO `player_levelstats` VALUES ('11', '2', '52', '94', '56', '88', '64', '69');
INSERT INTO `player_levelstats` VALUES ('11', '2', '53', '96', '57', '90', '65', '70');
INSERT INTO `player_levelstats` VALUES ('11', '2', '54', '97', '58', '91', '66', '71');
INSERT INTO `player_levelstats` VALUES ('11', '2', '55', '99', '59', '93', '67', '73');
INSERT INTO `player_levelstats` VALUES ('11', '2', '56', '101', '60', '95', '68', '74');
INSERT INTO `player_levelstats` VALUES ('11', '2', '57', '103', '61', '96', '69', '75');
INSERT INTO `player_levelstats` VALUES ('11', '2', '58', '105', '62', '98', '70', '76');
INSERT INTO `player_levelstats` VALUES ('11', '2', '59', '106', '63', '100', '71', '77');
INSERT INTO `player_levelstats` VALUES ('11', '2', '60', '108', '64', '101', '72', '78');
INSERT INTO `player_levelstats` VALUES ('11', '2', '61', '110', '65', '103', '74', '80');
INSERT INTO `player_levelstats` VALUES ('11', '2', '62', '112', '66', '105', '75', '81');
INSERT INTO `player_levelstats` VALUES ('11', '2', '63', '114', '67', '106', '76', '82');
INSERT INTO `player_levelstats` VALUES ('11', '2', '64', '116', '68', '108', '77', '83');
INSERT INTO `player_levelstats` VALUES ('11', '2', '65', '117', '69', '110', '78', '85');
INSERT INTO `player_levelstats` VALUES ('11', '2', '66', '119', '70', '112', '79', '86');
INSERT INTO `player_levelstats` VALUES ('11', '2', '67', '121', '71', '114', '80', '87');
INSERT INTO `player_levelstats` VALUES ('11', '2', '68', '123', '72', '115', '82', '88');
INSERT INTO `player_levelstats` VALUES ('11', '2', '69', '125', '73', '117', '83', '90');
INSERT INTO `player_levelstats` VALUES ('11', '2', '70', '127', '74', '119', '84', '91');
INSERT INTO `player_levelstats` VALUES ('11', '3', '1', '21', '20', '20', '21', '23');
INSERT INTO `player_levelstats` VALUES ('11', '3', '2', '21', '21', '21', '22', '24');
INSERT INTO `player_levelstats` VALUES ('11', '3', '3', '22', '23', '22', '22', '24');
INSERT INTO `player_levelstats` VALUES ('11', '3', '4', '22', '24', '23', '23', '25');
INSERT INTO `player_levelstats` VALUES ('11', '3', '5', '23', '25', '24', '23', '25');
INSERT INTO `player_levelstats` VALUES ('11', '3', '6', '23', '27', '25', '24', '26');
INSERT INTO `player_levelstats` VALUES ('11', '3', '7', '24', '28', '26', '24', '27');
INSERT INTO `player_levelstats` VALUES ('11', '3', '8', '24', '30', '27', '25', '27');
INSERT INTO `player_levelstats` VALUES ('11', '3', '9', '25', '31', '27', '26', '28');
INSERT INTO `player_levelstats` VALUES ('11', '3', '10', '25', '33', '28', '26', '29');
INSERT INTO `player_levelstats` VALUES ('11', '3', '11', '25', '34', '29', '27', '29');
INSERT INTO `player_levelstats` VALUES ('11', '3', '12', '26', '36', '30', '28', '30');
INSERT INTO `player_levelstats` VALUES ('11', '3', '13', '26', '37', '31', '28', '31');
INSERT INTO `player_levelstats` VALUES ('11', '3', '14', '27', '39', '32', '29', '32');
INSERT INTO `player_levelstats` VALUES ('11', '3', '15', '27', '40', '34', '30', '32');
INSERT INTO `player_levelstats` VALUES ('11', '3', '16', '28', '42', '35', '30', '33');
INSERT INTO `player_levelstats` VALUES ('11', '3', '17', '28', '43', '36', '31', '34');
INSERT INTO `player_levelstats` VALUES ('11', '3', '18', '29', '45', '37', '32', '35');
INSERT INTO `player_levelstats` VALUES ('11', '3', '19', '29', '47', '38', '32', '35');
INSERT INTO `player_levelstats` VALUES ('11', '3', '20', '30', '48', '39', '33', '36');
INSERT INTO `player_levelstats` VALUES ('11', '3', '21', '31', '50', '40', '34', '37');
INSERT INTO `player_levelstats` VALUES ('11', '3', '22', '31', '51', '41', '34', '38');
INSERT INTO `player_levelstats` VALUES ('11', '3', '23', '32', '53', '42', '35', '38');
INSERT INTO `player_levelstats` VALUES ('11', '3', '24', '32', '55', '43', '36', '39');
INSERT INTO `player_levelstats` VALUES ('11', '3', '25', '33', '57', '44', '37', '40');
INSERT INTO `player_levelstats` VALUES ('11', '3', '26', '33', '58', '46', '37', '41');
INSERT INTO `player_levelstats` VALUES ('11', '3', '27', '34', '60', '47', '38', '42');
INSERT INTO `player_levelstats` VALUES ('11', '3', '28', '35', '62', '48', '39', '42');
INSERT INTO `player_levelstats` VALUES ('11', '3', '29', '35', '63', '49', '40', '43');
INSERT INTO `player_levelstats` VALUES ('11', '3', '30', '36', '65', '50', '40', '44');
INSERT INTO `player_levelstats` VALUES ('11', '3', '31', '36', '67', '52', '41', '45');
INSERT INTO `player_levelstats` VALUES ('11', '3', '32', '37', '69', '53', '42', '46');
INSERT INTO `player_levelstats` VALUES ('11', '3', '33', '38', '71', '54', '43', '47');
INSERT INTO `player_levelstats` VALUES ('11', '3', '34', '38', '72', '55', '44', '48');
INSERT INTO `player_levelstats` VALUES ('11', '3', '35', '39', '74', '57', '44', '48');
INSERT INTO `player_levelstats` VALUES ('11', '3', '36', '39', '76', '58', '45', '49');
INSERT INTO `player_levelstats` VALUES ('11', '3', '37', '40', '78', '59', '46', '50');
INSERT INTO `player_levelstats` VALUES ('11', '3', '38', '41', '80', '60', '47', '51');
INSERT INTO `player_levelstats` VALUES ('11', '3', '39', '41', '82', '62', '48', '52');
INSERT INTO `player_levelstats` VALUES ('11', '3', '40', '42', '84', '63', '49', '53');
INSERT INTO `player_levelstats` VALUES ('11', '3', '41', '43', '86', '64', '50', '54');
INSERT INTO `player_levelstats` VALUES ('11', '3', '42', '43', '88', '66', '50', '55');
INSERT INTO `player_levelstats` VALUES ('11', '3', '43', '44', '90', '67', '51', '56');
INSERT INTO `player_levelstats` VALUES ('11', '3', '44', '45', '91', '68', '52', '57');
INSERT INTO `player_levelstats` VALUES ('11', '3', '45', '45', '93', '70', '53', '58');
INSERT INTO `player_levelstats` VALUES ('11', '3', '46', '46', '95', '71', '54', '59');
INSERT INTO `player_levelstats` VALUES ('11', '3', '47', '47', '98', '72', '55', '60');
INSERT INTO `player_levelstats` VALUES ('11', '3', '48', '48', '100', '74', '56', '61');
INSERT INTO `player_levelstats` VALUES ('11', '3', '49', '48', '102', '75', '57', '62');
INSERT INTO `player_levelstats` VALUES ('11', '3', '50', '49', '104', '77', '58', '63');
INSERT INTO `player_levelstats` VALUES ('11', '3', '51', '50', '106', '78', '59', '64');
INSERT INTO `player_levelstats` VALUES ('11', '3', '52', '51', '108', '79', '60', '65');
INSERT INTO `player_levelstats` VALUES ('11', '3', '53', '51', '110', '81', '61', '66');
INSERT INTO `player_levelstats` VALUES ('11', '3', '54', '52', '112', '82', '61', '67');
INSERT INTO `player_levelstats` VALUES ('11', '3', '55', '53', '114', '84', '62', '68');
INSERT INTO `player_levelstats` VALUES ('11', '3', '56', '54', '116', '85', '63', '69');
INSERT INTO `player_levelstats` VALUES ('11', '3', '57', '54', '118', '87', '64', '70');
INSERT INTO `player_levelstats` VALUES ('11', '3', '58', '55', '121', '88', '65', '71');
INSERT INTO `player_levelstats` VALUES ('11', '3', '59', '56', '123', '90', '66', '72');
INSERT INTO `player_levelstats` VALUES ('11', '3', '60', '57', '125', '91', '67', '74');
INSERT INTO `player_levelstats` VALUES ('11', '3', '61', '58', '127', '93', '68', '75');
INSERT INTO `player_levelstats` VALUES ('11', '3', '62', '58', '130', '94', '69', '76');
INSERT INTO `player_levelstats` VALUES ('11', '3', '63', '59', '132', '96', '71', '77');
INSERT INTO `player_levelstats` VALUES ('11', '3', '64', '60', '134', '97', '72', '78');
INSERT INTO `player_levelstats` VALUES ('11', '3', '65', '61', '136', '99', '73', '79');
INSERT INTO `player_levelstats` VALUES ('11', '3', '66', '62', '139', '101', '74', '80');
INSERT INTO `player_levelstats` VALUES ('11', '3', '67', '62', '141', '102', '75', '81');
INSERT INTO `player_levelstats` VALUES ('11', '3', '68', '63', '143', '104', '76', '83');
INSERT INTO `player_levelstats` VALUES ('11', '3', '69', '64', '146', '105', '77', '84');
INSERT INTO `player_levelstats` VALUES ('11', '3', '70', '65', '148', '107', '78', '85');
INSERT INTO `player_levelstats` VALUES ('11', '5', '1', '21', '17', '19', '23', '25');
INSERT INTO `player_levelstats` VALUES ('11', '5', '2', '21', '17', '19', '24', '26');
INSERT INTO `player_levelstats` VALUES ('11', '5', '3', '21', '17', '20', '26', '28');
INSERT INTO `player_levelstats` VALUES ('11', '5', '4', '21', '18', '20', '27', '29');
INSERT INTO `player_levelstats` VALUES ('11', '5', '5', '22', '18', '20', '28', '30');
INSERT INTO `player_levelstats` VALUES ('11', '5', '6', '22', '18', '21', '30', '32');
INSERT INTO `player_levelstats` VALUES ('11', '5', '7', '22', '18', '21', '31', '33');
INSERT INTO `player_levelstats` VALUES ('11', '5', '8', '22', '19', '22', '32', '35');
INSERT INTO `player_levelstats` VALUES ('11', '5', '9', '22', '19', '22', '34', '36');
INSERT INTO `player_levelstats` VALUES ('11', '5', '10', '22', '19', '22', '35', '38');
INSERT INTO `player_levelstats` VALUES ('11', '5', '11', '23', '19', '23', '37', '39');
INSERT INTO `player_levelstats` VALUES ('11', '5', '12', '23', '20', '23', '38', '41');
INSERT INTO `player_levelstats` VALUES ('11', '5', '13', '23', '20', '24', '39', '42');
INSERT INTO `player_levelstats` VALUES ('11', '5', '14', '23', '20', '24', '41', '44');
INSERT INTO `player_levelstats` VALUES ('11', '5', '15', '23', '20', '25', '42', '45');
INSERT INTO `player_levelstats` VALUES ('11', '5', '16', '24', '21', '25', '44', '47');
INSERT INTO `player_levelstats` VALUES ('11', '5', '17', '24', '21', '25', '45', '48');
INSERT INTO `player_levelstats` VALUES ('11', '5', '18', '24', '21', '26', '47', '50');
INSERT INTO `player_levelstats` VALUES ('11', '5', '19', '24', '22', '26', '48', '51');
INSERT INTO `player_levelstats` VALUES ('11', '5', '20', '24', '22', '27', '50', '53');
INSERT INTO `player_levelstats` VALUES ('11', '5', '21', '25', '22', '27', '51', '55');
INSERT INTO `player_levelstats` VALUES ('11', '5', '22', '25', '22', '28', '53', '56');
INSERT INTO `player_levelstats` VALUES ('11', '5', '23', '25', '23', '28', '55', '58');
INSERT INTO `player_levelstats` VALUES ('11', '5', '24', '25', '23', '29', '56', '60');
INSERT INTO `player_levelstats` VALUES ('11', '5', '25', '25', '23', '29', '58', '61');
INSERT INTO `player_levelstats` VALUES ('11', '5', '26', '26', '24', '30', '60', '63');
INSERT INTO `player_levelstats` VALUES ('11', '5', '27', '26', '24', '30', '61', '65');
INSERT INTO `player_levelstats` VALUES ('11', '5', '28', '26', '24', '31', '63', '66');
INSERT INTO `player_levelstats` VALUES ('11', '5', '29', '26', '25', '31', '65', '68');
INSERT INTO `player_levelstats` VALUES ('11', '5', '30', '27', '25', '32', '66', '70');
INSERT INTO `player_levelstats` VALUES ('11', '5', '31', '27', '25', '32', '68', '72');
INSERT INTO `player_levelstats` VALUES ('11', '5', '32', '27', '26', '33', '70', '73');
INSERT INTO `player_levelstats` VALUES ('11', '5', '33', '27', '26', '33', '71', '75');
INSERT INTO `player_levelstats` VALUES ('11', '5', '34', '28', '26', '34', '73', '77');
INSERT INTO `player_levelstats` VALUES ('11', '5', '35', '28', '27', '34', '75', '79');
INSERT INTO `player_levelstats` VALUES ('11', '5', '36', '28', '27', '35', '77', '81');
INSERT INTO `player_levelstats` VALUES ('11', '5', '37', '29', '28', '35', '79', '83');
INSERT INTO `player_levelstats` VALUES ('11', '5', '38', '29', '28', '36', '80', '85');
INSERT INTO `player_levelstats` VALUES ('11', '5', '39', '29', '28', '37', '82', '86');
INSERT INTO `player_levelstats` VALUES ('11', '5', '40', '29', '29', '37', '84', '88');
INSERT INTO `player_levelstats` VALUES ('11', '5', '41', '30', '29', '38', '86', '90');
INSERT INTO `player_levelstats` VALUES ('11', '5', '42', '30', '29', '38', '88', '92');
INSERT INTO `player_levelstats` VALUES ('11', '5', '43', '30', '30', '39', '90', '94');
INSERT INTO `player_levelstats` VALUES ('11', '5', '44', '31', '30', '39', '91', '96');
INSERT INTO `player_levelstats` VALUES ('11', '5', '45', '31', '31', '40', '93', '98');
INSERT INTO `player_levelstats` VALUES ('11', '5', '46', '31', '31', '41', '95', '100');
INSERT INTO `player_levelstats` VALUES ('11', '5', '47', '32', '31', '41', '97', '102');
INSERT INTO `player_levelstats` VALUES ('11', '5', '48', '32', '32', '42', '99', '104');
INSERT INTO `player_levelstats` VALUES ('11', '5', '49', '32', '32', '43', '101', '106');
INSERT INTO `player_levelstats` VALUES ('11', '5', '50', '33', '33', '43', '103', '108');
INSERT INTO `player_levelstats` VALUES ('11', '5', '51', '33', '33', '44', '105', '110');
INSERT INTO `player_levelstats` VALUES ('11', '5', '52', '33', '34', '44', '107', '113');
INSERT INTO `player_levelstats` VALUES ('11', '5', '53', '34', '34', '45', '109', '115');
INSERT INTO `player_levelstats` VALUES ('11', '5', '54', '34', '34', '46', '111', '117');
INSERT INTO `player_levelstats` VALUES ('11', '5', '55', '34', '35', '46', '113', '119');
INSERT INTO `player_levelstats` VALUES ('11', '5', '56', '35', '35', '47', '115', '121');
INSERT INTO `player_levelstats` VALUES ('11', '5', '57', '35', '36', '48', '118', '123');
INSERT INTO `player_levelstats` VALUES ('11', '5', '58', '35', '36', '48', '120', '126');
INSERT INTO `player_levelstats` VALUES ('11', '5', '59', '36', '37', '49', '122', '128');
INSERT INTO `player_levelstats` VALUES ('11', '5', '60', '36', '37', '50', '124', '130');
INSERT INTO `player_levelstats` VALUES ('11', '5', '61', '36', '38', '51', '126', '132');
INSERT INTO `player_levelstats` VALUES ('11', '5', '62', '37', '38', '51', '128', '134');
INSERT INTO `player_levelstats` VALUES ('11', '5', '63', '37', '39', '52', '130', '137');
INSERT INTO `player_levelstats` VALUES ('11', '5', '64', '38', '39', '53', '133', '139');
INSERT INTO `player_levelstats` VALUES ('11', '5', '65', '38', '40', '53', '135', '141');
INSERT INTO `player_levelstats` VALUES ('11', '5', '66', '38', '40', '54', '137', '144');
INSERT INTO `player_levelstats` VALUES ('11', '5', '67', '39', '40', '55', '139', '146');
INSERT INTO `player_levelstats` VALUES ('11', '5', '68', '39', '41', '56', '141', '148');
INSERT INTO `player_levelstats` VALUES ('11', '5', '69', '40', '41', '56', '144', '151');
INSERT INTO `player_levelstats` VALUES ('11', '5', '70', '40', '42', '57', '146', '153');
INSERT INTO `player_levelstats` VALUES ('11', '7', '1', '22', '17', '20', '22', '24');
INSERT INTO `player_levelstats` VALUES ('11', '7', '2', '23', '17', '21', '23', '25');
INSERT INTO `player_levelstats` VALUES ('11', '7', '3', '24', '18', '22', '24', '26');
INSERT INTO `player_levelstats` VALUES ('11', '7', '4', '25', '18', '23', '25', '27');
INSERT INTO `player_levelstats` VALUES ('11', '7', '5', '25', '19', '24', '26', '28');
INSERT INTO `player_levelstats` VALUES ('11', '7', '6', '26', '19', '25', '27', '29');
INSERT INTO `player_levelstats` VALUES ('11', '7', '7', '27', '20', '26', '28', '30');
INSERT INTO `player_levelstats` VALUES ('11', '7', '8', '28', '20', '27', '28', '31');
INSERT INTO `player_levelstats` VALUES ('11', '7', '9', '29', '21', '28', '29', '32');
INSERT INTO `player_levelstats` VALUES ('11', '7', '10', '30', '21', '29', '30', '33');
INSERT INTO `player_levelstats` VALUES ('11', '7', '11', '31', '22', '30', '31', '35');
INSERT INTO `player_levelstats` VALUES ('11', '7', '12', '32', '22', '31', '32', '36');
INSERT INTO `player_levelstats` VALUES ('11', '7', '13', '33', '23', '32', '33', '37');
INSERT INTO `player_levelstats` VALUES ('11', '7', '14', '34', '23', '33', '34', '38');
INSERT INTO `player_levelstats` VALUES ('11', '7', '15', '34', '24', '35', '35', '39');
INSERT INTO `player_levelstats` VALUES ('11', '7', '16', '35', '24', '36', '36', '40');
INSERT INTO `player_levelstats` VALUES ('11', '7', '17', '36', '25', '37', '38', '42');
INSERT INTO `player_levelstats` VALUES ('11', '7', '18', '37', '25', '38', '39', '43');
INSERT INTO `player_levelstats` VALUES ('11', '7', '19', '38', '26', '39', '40', '44');
INSERT INTO `player_levelstats` VALUES ('11', '7', '20', '39', '26', '40', '41', '45');
INSERT INTO `player_levelstats` VALUES ('11', '7', '21', '40', '27', '41', '42', '46');
INSERT INTO `player_levelstats` VALUES ('11', '7', '22', '41', '27', '43', '43', '48');
INSERT INTO `player_levelstats` VALUES ('11', '7', '23', '43', '28', '44', '44', '49');
INSERT INTO `player_levelstats` VALUES ('11', '7', '24', '44', '28', '45', '45', '50');
INSERT INTO `player_levelstats` VALUES ('11', '7', '25', '45', '29', '46', '46', '51');
INSERT INTO `player_levelstats` VALUES ('11', '7', '26', '46', '30', '47', '48', '53');
INSERT INTO `player_levelstats` VALUES ('11', '7', '27', '47', '30', '49', '49', '54');
INSERT INTO `player_levelstats` VALUES ('11', '7', '28', '48', '31', '50', '50', '55');
INSERT INTO `player_levelstats` VALUES ('11', '7', '29', '49', '31', '51', '51', '57');
INSERT INTO `player_levelstats` VALUES ('11', '7', '30', '50', '32', '53', '52', '58');
INSERT INTO `player_levelstats` VALUES ('11', '7', '31', '51', '33', '54', '53', '59');
INSERT INTO `player_levelstats` VALUES ('11', '7', '32', '52', '33', '55', '55', '61');
INSERT INTO `player_levelstats` VALUES ('11', '7', '33', '53', '34', '56', '56', '62');
INSERT INTO `player_levelstats` VALUES ('11', '7', '34', '55', '34', '58', '57', '64');
INSERT INTO `player_levelstats` VALUES ('11', '7', '35', '56', '35', '59', '58', '65');
INSERT INTO `player_levelstats` VALUES ('11', '7', '36', '57', '36', '60', '60', '66');
INSERT INTO `player_levelstats` VALUES ('11', '7', '37', '58', '36', '62', '61', '68');
INSERT INTO `player_levelstats` VALUES ('11', '7', '38', '59', '37', '63', '62', '69');
INSERT INTO `player_levelstats` VALUES ('11', '7', '39', '61', '38', '65', '63', '71');
INSERT INTO `player_levelstats` VALUES ('11', '7', '40', '62', '38', '66', '65', '72');
INSERT INTO `player_levelstats` VALUES ('11', '7', '41', '63', '39', '67', '66', '74');
INSERT INTO `player_levelstats` VALUES ('11', '7', '42', '64', '40', '69', '67', '75');
INSERT INTO `player_levelstats` VALUES ('11', '7', '43', '65', '40', '70', '69', '77');
INSERT INTO `player_levelstats` VALUES ('11', '7', '44', '67', '41', '72', '70', '78');
INSERT INTO `player_levelstats` VALUES ('11', '7', '45', '68', '42', '73', '71', '80');
INSERT INTO `player_levelstats` VALUES ('11', '7', '46', '69', '42', '75', '73', '81');
INSERT INTO `player_levelstats` VALUES ('11', '7', '47', '71', '43', '76', '74', '83');
INSERT INTO `player_levelstats` VALUES ('11', '7', '48', '72', '44', '78', '76', '84');
INSERT INTO `player_levelstats` VALUES ('11', '7', '49', '73', '45', '79', '77', '86');
INSERT INTO `player_levelstats` VALUES ('11', '7', '50', '74', '45', '81', '78', '88');
INSERT INTO `player_levelstats` VALUES ('11', '7', '51', '76', '46', '82', '80', '89');
INSERT INTO `player_levelstats` VALUES ('11', '7', '52', '77', '47', '84', '81', '91');
INSERT INTO `player_levelstats` VALUES ('11', '7', '53', '78', '47', '85', '83', '92');
INSERT INTO `player_levelstats` VALUES ('11', '7', '54', '80', '48', '87', '84', '94');
INSERT INTO `player_levelstats` VALUES ('11', '7', '55', '81', '49', '88', '86', '96');
INSERT INTO `player_levelstats` VALUES ('11', '7', '56', '83', '50', '90', '87', '97');
INSERT INTO `player_levelstats` VALUES ('11', '7', '57', '84', '50', '91', '89', '99');
INSERT INTO `player_levelstats` VALUES ('11', '7', '58', '85', '51', '93', '90', '101');
INSERT INTO `player_levelstats` VALUES ('11', '7', '59', '87', '52', '95', '92', '102');
INSERT INTO `player_levelstats` VALUES ('11', '7', '60', '88', '53', '96', '93', '104');
INSERT INTO `player_levelstats` VALUES ('11', '7', '61', '90', '54', '98', '95', '106');
INSERT INTO `player_levelstats` VALUES ('11', '7', '62', '91', '54', '99', '96', '108');
INSERT INTO `player_levelstats` VALUES ('11', '7', '63', '93', '55', '101', '98', '109');
INSERT INTO `player_levelstats` VALUES ('11', '7', '64', '94', '56', '103', '99', '111');
INSERT INTO `player_levelstats` VALUES ('11', '7', '65', '95', '57', '104', '101', '113');
INSERT INTO `player_levelstats` VALUES ('11', '7', '66', '97', '58', '106', '103', '115');
INSERT INTO `player_levelstats` VALUES ('11', '7', '67', '98', '58', '108', '104', '117');
INSERT INTO `player_levelstats` VALUES ('11', '7', '68', '100', '59', '110', '106', '118');
INSERT INTO `player_levelstats` VALUES ('11', '7', '69', '101', '60', '111', '107', '120');
INSERT INTO `player_levelstats` VALUES ('11', '7', '70', '103', '61', '113', '109', '122');
INSERT INTO `player_levelstats` VALUES ('11', '8', '1', '21', '17', '19', '24', '24');
INSERT INTO `player_levelstats` VALUES ('11', '8', '2', '21', '17', '19', '25', '25');
INSERT INTO `player_levelstats` VALUES ('11', '8', '3', '21', '17', '20', '27', '27');
INSERT INTO `player_levelstats` VALUES ('11', '8', '4', '21', '17', '20', '28', '28');
INSERT INTO `player_levelstats` VALUES ('11', '8', '5', '21', '18', '20', '29', '29');
INSERT INTO `player_levelstats` VALUES ('11', '8', '6', '21', '18', '20', '31', '31');
INSERT INTO `player_levelstats` VALUES ('11', '8', '7', '21', '18', '21', '32', '32');
INSERT INTO `player_levelstats` VALUES ('11', '8', '8', '22', '18', '21', '34', '33');
INSERT INTO `player_levelstats` VALUES ('11', '8', '9', '22', '18', '21', '35', '35');
INSERT INTO `player_levelstats` VALUES ('11', '8', '10', '22', '19', '22', '37', '36');
INSERT INTO `player_levelstats` VALUES ('11', '8', '11', '22', '19', '22', '38', '37');
INSERT INTO `player_levelstats` VALUES ('11', '8', '12', '22', '19', '22', '40', '39');
INSERT INTO `player_levelstats` VALUES ('11', '8', '13', '22', '19', '23', '41', '40');
INSERT INTO `player_levelstats` VALUES ('11', '8', '14', '22', '19', '23', '43', '42');
INSERT INTO `player_levelstats` VALUES ('11', '8', '15', '22', '19', '23', '44', '43');
INSERT INTO `player_levelstats` VALUES ('11', '8', '16', '22', '20', '24', '46', '45');
INSERT INTO `player_levelstats` VALUES ('11', '8', '17', '23', '20', '24', '47', '46');
INSERT INTO `player_levelstats` VALUES ('11', '8', '18', '23', '20', '24', '49', '48');
INSERT INTO `player_levelstats` VALUES ('11', '8', '19', '23', '20', '25', '50', '49');
INSERT INTO `player_levelstats` VALUES ('11', '8', '20', '23', '21', '25', '52', '51');
INSERT INTO `player_levelstats` VALUES ('11', '8', '21', '23', '21', '26', '54', '52');
INSERT INTO `player_levelstats` VALUES ('11', '8', '22', '23', '21', '26', '55', '54');
INSERT INTO `player_levelstats` VALUES ('11', '8', '23', '23', '21', '26', '57', '56');
INSERT INTO `player_levelstats` VALUES ('11', '8', '24', '24', '21', '27', '59', '57');
INSERT INTO `player_levelstats` VALUES ('11', '8', '25', '24', '22', '27', '60', '59');
INSERT INTO `player_levelstats` VALUES ('11', '8', '26', '24', '22', '27', '62', '60');
INSERT INTO `player_levelstats` VALUES ('11', '8', '27', '24', '22', '28', '64', '62');
INSERT INTO `player_levelstats` VALUES ('11', '8', '28', '24', '22', '28', '65', '64');
INSERT INTO `player_levelstats` VALUES ('11', '8', '29', '24', '23', '29', '67', '65');
INSERT INTO `player_levelstats` VALUES ('11', '8', '30', '24', '23', '29', '69', '67');
INSERT INTO `player_levelstats` VALUES ('11', '8', '31', '25', '23', '30', '71', '69');
INSERT INTO `player_levelstats` VALUES ('11', '8', '32', '25', '23', '30', '73', '71');
INSERT INTO `player_levelstats` VALUES ('11', '8', '33', '25', '24', '30', '74', '72');
INSERT INTO `player_levelstats` VALUES ('11', '8', '34', '25', '24', '31', '76', '74');
INSERT INTO `player_levelstats` VALUES ('11', '8', '35', '25', '24', '31', '78', '76');
INSERT INTO `player_levelstats` VALUES ('11', '8', '36', '26', '24', '32', '80', '78');
INSERT INTO `player_levelstats` VALUES ('11', '8', '37', '26', '25', '32', '82', '79');
INSERT INTO `player_levelstats` VALUES ('11', '8', '38', '26', '25', '33', '84', '81');
INSERT INTO `player_levelstats` VALUES ('11', '8', '39', '26', '25', '33', '86', '83');
INSERT INTO `player_levelstats` VALUES ('11', '8', '40', '26', '26', '34', '87', '85');
INSERT INTO `player_levelstats` VALUES ('11', '8', '41', '27', '26', '34', '89', '87');
INSERT INTO `player_levelstats` VALUES ('11', '8', '42', '27', '26', '35', '91', '89');
INSERT INTO `player_levelstats` VALUES ('11', '8', '43', '27', '27', '35', '93', '91');
INSERT INTO `player_levelstats` VALUES ('11', '8', '44', '27', '27', '36', '95', '92');
INSERT INTO `player_levelstats` VALUES ('11', '8', '45', '27', '27', '36', '97', '94');
INSERT INTO `player_levelstats` VALUES ('11', '8', '46', '28', '27', '37', '99', '96');
INSERT INTO `player_levelstats` VALUES ('11', '8', '47', '28', '28', '37', '101', '98');
INSERT INTO `player_levelstats` VALUES ('11', '8', '48', '28', '28', '38', '103', '100');
INSERT INTO `player_levelstats` VALUES ('11', '8', '49', '28', '28', '38', '105', '102');
INSERT INTO `player_levelstats` VALUES ('11', '8', '50', '29', '29', '39', '107', '104');
INSERT INTO `player_levelstats` VALUES ('11', '8', '51', '29', '29', '39', '110', '106');
INSERT INTO `player_levelstats` VALUES ('11', '8', '52', '29', '29', '40', '112', '108');
INSERT INTO `player_levelstats` VALUES ('11', '8', '53', '29', '30', '40', '114', '110');
INSERT INTO `player_levelstats` VALUES ('11', '8', '54', '30', '30', '41', '116', '112');
INSERT INTO `player_levelstats` VALUES ('11', '8', '55', '30', '30', '41', '118', '114');
INSERT INTO `player_levelstats` VALUES ('11', '8', '56', '30', '31', '42', '120', '116');
INSERT INTO `player_levelstats` VALUES ('11', '8', '57', '30', '31', '42', '122', '118');
INSERT INTO `player_levelstats` VALUES ('11', '8', '58', '31', '31', '43', '125', '121');
INSERT INTO `player_levelstats` VALUES ('11', '8', '59', '31', '32', '43', '127', '123');
INSERT INTO `player_levelstats` VALUES ('11', '8', '60', '31', '32', '44', '129', '125');
INSERT INTO `player_levelstats` VALUES ('11', '8', '61', '31', '33', '45', '131', '127');
INSERT INTO `player_levelstats` VALUES ('11', '8', '62', '32', '33', '45', '133', '129');
INSERT INTO `player_levelstats` VALUES ('11', '8', '63', '32', '33', '46', '136', '131');
INSERT INTO `player_levelstats` VALUES ('11', '8', '64', '32', '34', '46', '138', '134');
INSERT INTO `player_levelstats` VALUES ('11', '8', '65', '33', '34', '47', '140', '136');
INSERT INTO `player_levelstats` VALUES ('11', '8', '66', '33', '34', '48', '143', '138');
INSERT INTO `player_levelstats` VALUES ('11', '8', '67', '33', '35', '48', '145', '140');
INSERT INTO `player_levelstats` VALUES ('11', '8', '68', '33', '35', '49', '147', '142');
INSERT INTO `player_levelstats` VALUES ('11', '8', '69', '34', '36', '49', '150', '145');
INSERT INTO `player_levelstats` VALUES ('11', '8', '70', '34', '36', '50', '152', '147');
INSERT INTO `playercreateinfo` VALUES ('1', '1', '0', '12', '-8949.95', '-132.493', '83.5312');
INSERT INTO `playercreateinfo` VALUES ('1', '2', '0', '12', '-8949.95', '-132.493', '83.5312');
INSERT INTO `playercreateinfo` VALUES ('1', '4', '0', '12', '-8949.95', '-132.493', '83.5312');
INSERT INTO `playercreateinfo` VALUES ('1', '5', '0', '12', '-8949.95', '-132.493', '83.5312');
INSERT INTO `playercreateinfo` VALUES ('1', '8', '0', '12', '-8949.95', '-132.493', '83.5312');
INSERT INTO `playercreateinfo` VALUES ('1', '9', '0', '12', '-8949.95', '-132.493', '83.5312');
INSERT INTO `playercreateinfo` VALUES ('2', '1', '1', '14', '-618.518', '-4251.67', '38.718');
INSERT INTO `playercreateinfo` VALUES ('2', '3', '1', '14', '-618.518', '-4251.67', '38.718');
INSERT INTO `playercreateinfo` VALUES ('2', '4', '1', '14', '-618.518', '-4251.67', '38.718');
INSERT INTO `playercreateinfo` VALUES ('2', '7', '1', '14', '-618.518', '-4251.67', '38.718');
INSERT INTO `playercreateinfo` VALUES ('2', '9', '1', '14', '-618.518', '-4251.67', '38.718');
INSERT INTO `playercreateinfo` VALUES ('3', '1', '0', '1', '-6240.32', '331.033', '382.758');
INSERT INTO `playercreateinfo` VALUES ('3', '2', '0', '1', '-6240.32', '331.033', '382.758');
INSERT INTO `playercreateinfo` VALUES ('3', '3', '0', '1', '-6240.32', '331.033', '382.758');
INSERT INTO `playercreateinfo` VALUES ('3', '4', '0', '1', '-6240.32', '331.033', '382.758');
INSERT INTO `playercreateinfo` VALUES ('3', '5', '0', '1', '-6240.32', '331.033', '382.758');
INSERT INTO `playercreateinfo` VALUES ('4', '1', '1', '141', '10311.3', '832.463', '1326.41');
INSERT INTO `playercreateinfo` VALUES ('4', '3', '1', '141', '10311.3', '832.463', '1326.41');
INSERT INTO `playercreateinfo` VALUES ('4', '4', '1', '141', '10311.3', '832.463', '1326.41');
INSERT INTO `playercreateinfo` VALUES ('4', '5', '1', '141', '10311.3', '832.463', '1326.41');
INSERT INTO `playercreateinfo` VALUES ('4', '11', '1', '141', '10311.3', '832.463', '1326.41');
INSERT INTO `playercreateinfo` VALUES ('5', '1', '0', '85', '1676.71', '1678.31', '121.67');
INSERT INTO `playercreateinfo` VALUES ('5', '4', '0', '85', '1676.71', '1678.31', '121.67');
INSERT INTO `playercreateinfo` VALUES ('5', '5', '0', '85', '1676.71', '1678.31', '121.67');
INSERT INTO `playercreateinfo` VALUES ('5', '8', '0', '85', '1676.71', '1678.31', '121.67');
INSERT INTO `playercreateinfo` VALUES ('5', '9', '0', '85', '1676.71', '1678.31', '121.67');
INSERT INTO `playercreateinfo` VALUES ('6', '1', '1', '215', '-2917.58', '-257.98', '52.9968');
INSERT INTO `playercreateinfo` VALUES ('6', '3', '1', '215', '-2917.58', '-257.98', '52.9968');
INSERT INTO `playercreateinfo` VALUES ('6', '7', '1', '215', '-2917.58', '-257.98', '52.9968');
INSERT INTO `playercreateinfo` VALUES ('6', '11', '1', '215', '-2917.58', '-257.98', '52.9968');
INSERT INTO `playercreateinfo` VALUES ('7', '1', '0', '1', '-6240.32', '331.033', '382.758');
INSERT INTO `playercreateinfo` VALUES ('7', '4', '0', '1', '-6240.32', '331.033', '382.758');
INSERT INTO `playercreateinfo` VALUES ('7', '8', '0', '1', '-6240.32', '331.033', '382.758');
INSERT INTO `playercreateinfo` VALUES ('7', '9', '0', '1', '-6240.32', '331.033', '382.758');
INSERT INTO `playercreateinfo` VALUES ('8', '1', '1', '14', '-618.518', '-4251.67', '38.718');
INSERT INTO `playercreateinfo` VALUES ('8', '3', '1', '14', '-618.518', '-4251.67', '38.718');
INSERT INTO `playercreateinfo` VALUES ('8', '4', '1', '14', '-618.518', '-4251.67', '38.718');
INSERT INTO `playercreateinfo` VALUES ('8', '5', '1', '14', '-618.518', '-4251.67', '38.718');
INSERT INTO `playercreateinfo` VALUES ('8', '7', '1', '14', '-618.518', '-4251.67', '38.718');
INSERT INTO `playercreateinfo` VALUES ('8', '8', '1', '14', '-618.518', '-4251.67', '38.718');
INSERT INTO `playercreateinfo_action` VALUES ('11', '5', '11', '4540', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '5', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '5', '3', '28880', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '5', '2', '2050', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '5', '1', '585', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '5', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '3', '11', '4540', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '3', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '3', '3', '28880', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '3', '2', '75', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '3', '1', '2973', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '3', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '2', '11', '4540', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '2', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '2', '3', '28880', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '2', '2', '635', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '2', '1', '21084', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '2', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '1', '83', '4540', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '1', '74', '28880', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '1', '73', '78', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '1', '72', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '9', '11', '20857', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '9', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '9', '4', '28730', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '9', '3', '28734', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '9', '2', '687', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '9', '1', '686', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '9', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '8', '11', '20857', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '8', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '8', '4', '28730', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '8', '3', '28734', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '8', '2', '168', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '8', '1', '133', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '8', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '5', '11', '20857', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '5', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '5', '4', '28730', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '5', '3', '28734', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '5', '2', '2050', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '5', '1', '585', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '5', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '4', '11', '20857', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '4', '5', '25046', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '4', '4', '28734', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '4', '3', '2764', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '4', '2', '2098', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '4', '1', '1752', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '4', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '3', '11', '20857', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '3', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '3', '4', '28730', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '3', '3', '28734', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '3', '2', '75', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '3', '1', '2973', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '3', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '2', '11', '20857', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '2', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '2', '4', '28730', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '2', '3', '28734', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '2', '2', '635', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '2', '1', '21084', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('10', '2', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '8', '11', '117', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '8', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '8', '2', '168', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '8', '1', '133', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '8', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '7', '11', '117', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '7', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '7', '3', '20544', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '7', '2', '331', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '7', '1', '403', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '7', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '5', '11', '4540', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '5', '2', '2050', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '5', '1', '585', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '5', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '4', '11', '117', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '4', '4', '26972', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '4', '2', '2098', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '4', '1', '1752', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '4', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '3', '11', '4604', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '3', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '3', '2', '75', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '3', '1', '2973', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '3', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '1', '83', '117', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '1', '75', '26296', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '1', '73', '78', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '1', '72', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('7', '9', '11', '4604', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('7', '9', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('7', '9', '2', '687', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('7', '9', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('7', '8', '11', '4536', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('7', '8', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('7', '8', '2', '168', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('7', '8', '1', '133', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('7', '8', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('7', '4', '11', '117', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('7', '4', '3', '2764', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('7', '4', '2', '2098', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('7', '4', '1', '1752', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('7', '4', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('7', '1', '83', '117', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('7', '1', '73', '78', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('7', '1', '72', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('6', '11', '11', '4536', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('6', '11', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('6', '11', '3', '20549', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('6', '11', '2', '5185', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('6', '11', '1', '5176', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('6', '11', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('6', '7', '11', '4604', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('6', '7', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('6', '7', '3', '20549', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('6', '7', '2', '331', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('6', '7', '1', '403', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('6', '7', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('6', '3', '11', '117', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('6', '3', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('6', '3', '3', '20549', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('6', '3', '2', '75', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('6', '3', '1', '2973', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('6', '3', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('6', '1', '83', '4540', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('6', '1', '74', '20549', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('6', '1', '73', '78', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('6', '1', '72', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('5', '9', '11', '4604', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('5', '9', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('5', '9', '3', '20577', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('5', '9', '2', '687', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('5', '9', '1', '686', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('5', '9', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('5', '8', '11', '4604', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('5', '8', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('5', '8', '3', '20577', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('5', '8', '2', '168', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('5', '8', '1', '133', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('5', '8', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('5', '5', '11', '4604', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('5', '5', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('5', '5', '3', '20577', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('5', '5', '2', '2050', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('5', '5', '1', '585', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('5', '5', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('5', '4', '11', '4604', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('5', '4', '4', '20577', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('5', '4', '3', '2764', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('5', '4', '2', '2098', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('5', '4', '1', '1752', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('5', '4', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('5', '1', '83', '4604', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('5', '1', '74', '20577', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('5', '1', '73', '78', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('5', '1', '72', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('4', '11', '11', '4536', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '5', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('4', '11', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('4', '11', '2', '5185', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('4', '11', '1', '5176', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('4', '11', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('4', '5', '11', '2070', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('4', '5', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('4', '5', '3', '20580', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('4', '5', '2', '2050', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('4', '5', '1', '585', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('4', '5', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('4', '4', '11', '4540', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('4', '4', '3', '2764', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('4', '4', '2', '2098', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('4', '4', '1', '1752', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('4', '4', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('4', '3', '11', '117', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('4', '3', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('4', '3', '3', '20580', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('4', '3', '2', '75', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('4', '3', '1', '2973', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('4', '3', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('4', '1', '83', '117', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('4', '1', '74', '20580', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('4', '1', '73', '78', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('4', '1', '72', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '5', '11', '4540', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '4', '3', '2764', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '3', '3', '20544', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('8', '1', '74', '2764', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('7', '9', '1', '686', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '5', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '5', '4', '2481', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '5', '3', '20594', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '5', '2', '2050', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '5', '1', '585', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '5', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '4', '11', '4540', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '4', '5', '2481', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '4', '4', '20594', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '4', '3', '2764', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '4', '2', '2098', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '4', '1', '1752', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '4', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '3', '11', '117', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '3', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '3', '4', '2481', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '3', '3', '20594', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '3', '2', '75', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '3', '1', '2973', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '3', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '2', '11', '4540', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '2', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '2', '4', '2481', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '2', '3', '20594', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '2', '2', '635', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '2', '1', '21084', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '2', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '1', '83', '117', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '1', '75', '2481', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '1', '74', '20594', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '1', '73', '78', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('3', '1', '72', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('2', '9', '11', '117', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('2', '9', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('2', '9', '3', '33702', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('2', '9', '2', '687', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('2', '9', '1', '686', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('2', '9', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('2', '7', '11', '117', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('2', '7', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('2', '7', '3', '33697', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('2', '7', '2', '331', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('2', '7', '1', '403', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('2', '7', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('2', '4', '11', '117', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('2', '4', '4', '20572', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('2', '4', '3', '2764', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('2', '4', '2', '2098', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('2', '4', '1', '1752', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('2', '4', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('2', '3', '11', '117', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('2', '3', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('2', '3', '4', '20572', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('2', '3', '2', '75', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('2', '3', '1', '2973', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('2', '3', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('2', '1', '83', '117', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('2', '1', '74', '20572', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('2', '1', '73', '78', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('2', '1', '72', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('1', '9', '11', '4604', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('1', '9', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('1', '9', '2', '687', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('1', '9', '1', '686', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('1', '9', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('1', '8', '11', '2070', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('1', '8', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('1', '8', '2', '168', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('1', '8', '1', '133', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('1', '8', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('1', '5', '11', '2070', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('1', '5', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('1', '5', '2', '2050', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('1', '5', '1', '585', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('1', '5', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('1', '4', '11', '2070', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('1', '4', '3', '2764', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('1', '4', '2', '2098', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('1', '4', '1', '1752', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('1', '4', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('1', '2', '11', '2070', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('1', '2', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('1', '2', '2', '635', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('1', '2', '1', '21084', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('1', '2', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('1', '1', '83', '117', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('1', '1', '73', '78', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('1', '1', '72', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('4', '11', '3', '20580', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '7', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '7', '1', '403', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '7', '2', '331', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '7', '3', '28880', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '7', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '7', '11', '4540', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '8', '0', '6603', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '8', '1', '133', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '8', '2', '168', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '8', '3', '28880', '0', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '8', '10', '159', '128', '0');
INSERT INTO `playercreateinfo_action` VALUES ('11', '8', '11', '4540', '128', '0');
