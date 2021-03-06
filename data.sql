USE panel;

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `username` varchar(65) NOT NULL,
  `email` varchar(65) NOT NULL,
  `active` int(1) NOT NULL,
  `activation_code` varchar(65) NOT NULL,
  `plan` int(8) NOT NULL,
  `initial_setup` int(1) NOT NULL DEFAULT '0',
  `stats_email` int(1) NOT NULL,
  `welcome_closed` int(1) NOT NULL,
  `max_list_files` int(8) NOT NULL DEFAULT '-1',
  `save_sort_files` int(2) NOT NULL DEFAULT '0',
  `default_editor` varchar(65) NOT NULL DEFAULT 'default',
  `wizard_closed` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`username`, `email`, `active`, `activation_code`, `plan`, `initial_setup`, `stats_email`, `welcome_closed`, `max_list_files`, `save_sort_files`, `default_editor`, `wizard_closed`) VALUES
('root', 'admin@localhost', 1, '', 1, 0, 0, 0, '10', 0, 'default', 0);

-- --------------------------------------------------------

--
-- Table structure for table `domains`
--

CREATE TABLE IF NOT EXISTS `domains` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `user_id` int(8) NOT NULL,
  `domain_name` varchar(65) NOT NULL,
  `active` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=42 ;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE IF NOT EXISTS `plans` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(65) NOT NULL,
  `max_domains` int(8) NOT NULL,
  `max_parked_domains` int(8) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(65) NOT NULL,
  `setting_value` varchar(65) NOT NULL,
  `setting_group` varchar(65) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `setting_name`, `setting_value`, `setting_group`) VALUES
(1, 'template', 'blue_default', 'design_settings'),
(2, 'panel_title', 'NEON', 'panel_settings'),
(3, 'registration_enabled', 'disabled', 'panel_settings'),
(4, 'forgotpassword_enabled', 'disabled', 'panel_settings'),
(5, 'default_ip', 'localhost', 'panel_settings'),
(6, 'max_panel_upload_size', '25MB', 'panel_settings'),
(7, 'version', '0', 'panel_settings');


CREATE TABLE IF NOT EXISTS `stats` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `result` varchar(8) NOT NULL,
  `type` varchar(65) NOT NULL,
  `timestamp` int(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1678 ;


DROP DATABASE test;
DELETE FROM mysql.user WHERE User='';

USE dns;

create table domains (
 id              INT auto_increment,
 name            VARCHAR(255) NOT NULL,
 master          VARCHAR(128) DEFAULT NULL,
 last_check      INT DEFAULT NULL,
 type            VARCHAR(6) NOT NULL,
 notified_serial INT DEFAULT NULL, 
 account         VARCHAR(40) DEFAULT NULL,
 primary key (id)
) Engine=InnoDB;

CREATE UNIQUE INDEX name_index ON domains(name);

CREATE TABLE records (
  id              INT auto_increment,
  domain_id       INT DEFAULT NULL,
  name            VARCHAR(255) DEFAULT NULL,
  type            VARCHAR(10) DEFAULT NULL,
  content         VARCHAR(64000) DEFAULT NULL,
  ttl             INT DEFAULT NULL,
  prio            INT DEFAULT NULL,
  change_date     INT DEFAULT NULL,
  primary key(id)
) Engine=InnoDB;

CREATE INDEX rec_name_index ON records(name);
CREATE INDEX nametype_index ON records(name,type);
CREATE INDEX domain_id ON records(domain_id);

create table supermasters (
  ip         VARCHAR(25) NOT NULL, 
  nameserver VARCHAR(255) NOT NULL, 
  account    VARCHAR(40) DEFAULT NULL
) Engine=InnoDB;
