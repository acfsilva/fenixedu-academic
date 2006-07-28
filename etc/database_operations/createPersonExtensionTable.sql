CREATE TABLE `PERSON_EXTENSION` (
  `ID_INTERNAL` int(11) NOT NULL default '0',
  `KEY_ROOT_DOMAIN_OBJECT` int(11) default NULL,  
  `KEY_EXTENSION` int(11) NOT NULL default '0',  
  `KEY_PERSON` int(11) NOT NULL default '0',
  `BEGIN` varchar(10) NOT NULL default '0000-00-00',
  `END` varchar(10) default NULL,
  PRIMARY KEY  (`ID_INTERNAL`),
  KEY `KEY_EXTENSION` (`KEY_EXTENSION`),
  KEY `KEY_PERSON` (`KEY_PERSON`),
  KEY `KEY_ROOT_DOMAIN_OBJECT` (`KEY_ROOT_DOMAIN_OBJECT`)
) ENGINE=InnoDB; 