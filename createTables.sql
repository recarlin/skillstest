CREATE TABLE `parentParts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `partName` varchar(100) NOT NULL DEFAULT '',
  `partNumber` varchar(50) NOT NULL DEFAULT '',
  `partDescription` varchar(1000) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
INSERT INTO `parentParts` (`id`, `partName`, `partNumber`, `partDescription`)
VALUES
	(1,'Right Door','RD04232018','Inner panel for right door. Features electric window, side view mirror, and locks.'),
	(2,'Left Door','LD04232018','Inner panel for left door. Features electric window, side view mirror, and locks.'),
	(3,'Front Bumper','FB04232018','Front bumper. Features various lights and collision cameras.'),
	(4,'Back Bumper','BB04232018','Back bumper. Features various lights and collision cameras.');

CREATE TABLE `childParts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parentPart` int(11) unsigned NOT NULL,
  `partName` varchar(100) NOT NULL DEFAULT '',
  `partNumber` varchar(50) NOT NULL DEFAULT '',
  `partDescription` varchar(1000) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `parentPart` (`parentPart`),
  CONSTRAINT `childParts_ibfk_1` FOREIGN KEY (`parentPart`) REFERENCES `parentParts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
INSERT INTO `childParts` (`id`, `parentPart`, `partName`, `partNumber`, `partDescription`)
VALUES
	(1,1,'Right Door Handle','RDH04232018','Outside door handle. (RIGHT)'),
	(2,1,'Right Window Assembly','RW04232018','Window pane and mechanical components. (RIGHT)'),
	(3,1,'Right Electronics Controls','REC04232018','Control panel for windows, side mirror and locks. (RIGHT)'),
	(4,1,'Right Door Frame','RDF04232018','Frame with outside panel and inner frame. (RIGHT)'),
	(5,1,'Right Door Panel','RDP04232018','Inner plastic panel that holds the inner door handle and controls. (RIGHT)'),
	(6,2,'Left Door Handle','RDH04232018','Outside door handle. (LEFT)'),
	(7,2,'Left Window Assembly','RW04232018','Window pane and mechanical components. (LEFT)'),
	(8,2,'Left Electronics Controls','REC04232018','Control panel for windows, side mirror and locks. (LEFT)'),
	(9,2,'Left Door Frame','RDF04232018','Frame with outside panel and inner frame. (LEFT)'),
	(10,2,'Left Door Panel','RDP04232018','Inner plastic panel that holds the inner door handle and controls. (LEFT)'),
	(11,3,'Left Front Lights Assembly','LFL04232018','Front light assembly with main headlights, turning signals, and fog lights. (LEFT)'),
	(12,3,'Front Collision Camera Assembly','FCC04232018','Camera assembly consisting of two cameras. Used by parking and self-driving. (FRONT)'),
	(13,3,'Right Front Lights Assembly','RFL04232018','Front light assembly with main headlights, turning signals, and fog lights. (RIGHT)'),
	(14,4,'Left Rear Lights Assembly','LRL04232018','Rear light assembly with back up lights, turning signals, and brake lights. (LEFT)'),
	(15,4,'Rear Collision Camera Assembly','RCC04232018','Camera assembly consisting of two cameras. Used by parking and self-driving. (REAR)'),
	(16,4,'Right Rear Lights Assembly','RRL04232018','Rear light assembly with back up lights, turning signals, and brake lights. (RIGHT)');