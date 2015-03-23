-- MySQL dump 10.13  Distrib 5.1.67, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: tq
-- ------------------------------------------------------
-- Server version	5.1.67-0ubuntu0.10.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `permission_id_refs_id_6ba0f519` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$10000$E2hCWSs5Xgf5$IexnUHkEP2kVmlbELhZ//16otH3Bzs81AJV/wr/13c4=','2013-05-29 12:52:06',0,'gaurav.nagpal@tarams.com','Gaurav','Nagpal','gaurav.nagpal@tarams.com',0,1,'2013-05-28 09:43:49'),(2,'pbkdf2_sha256$10000$nIGFAnW04yAY$ah7Aoi1mxsG3G0E9gYHKjIClUhCCIF0u/GOj4akSZQA=','2013-05-29 13:04:52',0,'gauravnagpal2002@gmail.com','Gaurav','Nagpal','gauravnagpal2002@gmail.com',0,1,'2013-05-28 12:27:35');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `group_id_refs_id_274b862c` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `permission_id_refs_id_35d9ac25` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_openid_auth_association`
--

DROP TABLE IF EXISTS `django_openid_auth_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_openid_auth_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` longtext NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` longtext NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_openid_auth_association`
--

LOCK TABLES `django_openid_auth_association` WRITE;
/*!40000 ALTER TABLE `django_openid_auth_association` DISABLE KEYS */;
INSERT INTO `django_openid_auth_association` VALUES (2,'https://www.google.com/accounts/o8/ud','1.AMlYA9UhvYwPaOpBDrP6piLY086Ndy2lPueMBUtsC60r7ubI-0x592u6hUd50g','GuSNz88T8J2JindB6nhtZEaC/Xo=\n',1369805040,46800,'HMAC-SHA1');
/*!40000 ALTER TABLE `django_openid_auth_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_openid_auth_nonce`
--

DROP TABLE IF EXISTS `django_openid_auth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_openid_auth_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(2047) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_openid_auth_nonce`
--

LOCK TABLES `django_openid_auth_nonce` WRITE;
/*!40000 ALTER TABLE `django_openid_auth_nonce` DISABLE KEYS */;
INSERT INTO `django_openid_auth_nonce` VALUES (1,'https://www.google.com/accounts/o8/ud',1369734226,'dA_ZpNY7NU7ISg'),(2,'https://www.google.com/accounts/o8/ud',1369744016,'ojbcTRiIIBD-PQ'),(3,'https://www.google.com/accounts/o8/ud',1369744052,'QZdk2ifNipL-nw'),(4,'https://www.google.com/accounts/o8/ud',1369805042,'XkFYnSOoa9yQRQ'),(5,'https://www.google.com/accounts/o8/ud',1369805301,'DW0u8TSLT5DSvg'),(6,'https://www.google.com/accounts/o8/ud',1369807220,'zylDQcjpQE50bA'),(7,'https://www.google.com/accounts/o8/ud',1369807569,'PzG55-pKwyWIDA'),(8,'https://www.google.com/accounts/o8/ud',1369822425,'EsGsNCvmB50SlQ'),(9,'https://www.google.com/accounts/o8/ud',1369830572,'mb28U7wBmPxfaA'),(10,'https://www.google.com/accounts/o8/ud',1369830929,'GuOAqbsuVgHQbQ'),(11,'https://www.google.com/accounts/o8/ud',1369830974,'76jxkoKODIl5dg'),(12,'https://www.google.com/accounts/o8/ud',1369831028,'Lj5tRf_1fLYtDw'),(13,'https://www.google.com/accounts/o8/ud',1369831368,'xuBYRkOyNonQSg'),(14,'https://www.google.com/accounts/o8/ud',1369831805,'kYYLsVksVcZirQ'),(15,'https://www.google.com/accounts/o8/ud',1369831924,'kZodyD_VNFATsQ'),(16,'https://www.google.com/accounts/o8/ud',1369831969,'Svj7oCEfkwyp2Q'),(17,'https://www.google.com/accounts/o8/ud',1369832040,'l3u7HVPgAe1oXw'),(18,'https://www.google.com/accounts/o8/ud',1369832136,'duDy1mJakZw8AA'),(19,'https://www.google.com/accounts/o8/ud',1369832207,'9Jk2cllgcyBAzA');
/*!40000 ALTER TABLE `django_openid_auth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('518quptz1et0adaqpcodrf97mbi0c450','NDIwMDNlOTQ4ZTgxYTYzMGYyOTczYjdhYzg5MTRkODIzYWQ1NWM0ZjqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQJ1Lg==','2013-06-12 13:04:52');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quora_answer`
--

DROP TABLE IF EXISTS `quora_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quora_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `vote` tinyint(1) NOT NULL,
  `created_date` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_refs_id_7fdb25f8` (`user_id`),
  KEY `post_id_refs_id_8e7dbbef` (`post_id`),
  KEY `title_id_refs_id_6393b17e` (`title_id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quora_answer`
--

LOCK TABLES `quora_answer` WRITE;
/*!40000 ALTER TABLE `quora_answer` DISABLE KEYS */;
INSERT INTO `quora_answer` VALUES (1,1,1,3,'asdfad',0,'2013-05-28 09:48:47'),(2,1,1,5,'awef',0,'2013-05-28 12:25:54'),(3,1,1,6,'asdf',0,'2013-05-28 12:26:34'),(4,2,1,7,'as',0,'2013-05-28 12:41:17'),(8,1,50,69,'asas',0,'2013-05-29 12:19:30'),(9,2,50,70,'sdsd',0,'2013-05-29 12:29:48'),(10,2,52,72,'Yes, there is a great deal of mathematics in Escher\'s work. It mostly boils down to the fact that they are drawings of three dimensional objects, but are drawn on a two dimensional piece of paper.\r\n \r\nWe call a way of converting a 3D object to a 2D image a \"projection\". There are lots of different ways of projecting, but they all involve a loss of information. There is simply no way to include all the information for a 3D object in a 2D image. That loss of information means you can\'t know for sure what the 3D object looked like based on just the 2D image. We can normally figure it out because we know what the object is supposed to look like, so we fill in the missing information from our previous experiences of observing that kind of object.\r\n \r\nWhat Escher did was take advantage of the fact that people viewing his art would fill in the missing information to make sense of it and that they would do that even if the information he did include in the image didn\'t actually make sense. Our minds are so used to filling in that missing information that they do it anyway and you end up with optical illusions.\r\n \r\nFor something like Waterfall, the trick is simply that the angles aren\'t quite what they should be. They are close enough that we don\'t really notice, though, so our minds just interpret the image as though they were correct. That leads to the contradictions you see.',0,'2013-05-29 13:27:51'),(11,2,50,73,'Folks like Bill Gates, Michael Dell, Steve Jobs, Mark Zuckerberg, Ted Turner all attended universities, and subsequently dropped out. So they don\'t count.\r\n\r\n\r\n\r\nSo the poster boy for \"did not attend\" would be Richard Branson who performed poorly in school (partially because of his dsylexia), and left at the age of 16. \r\n\r\nHis first business venture was a magazine called Student. In 1970, he set up an audio-record mail-order business. In 1972, he opened a chain of record stores, Virgin Records, later known as Virgin Megastores. Branson\'s Virgin brand grew rapidly during the 1980s, as he set up Virgin Atlantic Airways and expanded the Virgin Records music label.',0,'2013-05-29 13:38:51'),(12,2,50,74,'Amancio Ortega Gaona is a Spanish fashion executive and founding chairman of the Inditex fashion group, best known for its chain of Zara clothing and accessories retail shops. His father was a railroad worker. At 14, became a shop hand for a local shirtmaker called Gala, which still sits on the same corner in downtown La Coruña.\r\n\r\nOrtega keeps a very low profile. No photograph of Ortega had ever been published before 1999. He goes to the same coffee shop everyday and eats lunch with his employees in the company cafeteria. He refuses to wear a tie and typically wears a simple uniform of a blue blazer, white shirt and gray pants; none of which are Zara products.\r\n\r\nIn early 2013 he was ranked as the third richest person in the world by Forbes with a net worth of US$57,000,000,000.',0,'2013-05-29 13:39:03'),(13,2,50,75,'Forget about attending elite universities. Here\'s a list of successful business people who\'ve never even attended college - they are all either high school drop outs or worse they\'ve never been to a school.\r\n\r\n1)   Dhirajlal Hirachand Ambani or better known to the world as Dhirubhai Ambani\r\n\r\n\r\n\r\n\r\n\r\nHe was the founder of Reliance Industries from scratch and it has gone on to become one of the largest business empires in India and the world today. By 2007, the combined fortune of the family was a staggering $60 Billion; and I say staggering because he studied only till the age of 16!',0,'2013-05-29 13:39:23'),(14,2,50,76,' Walt Disney\r\n\r\n\r\n\r\n\r\nAn American animator, film producer, director, screenwriter, voice actor, entrepreneur, entertainer, international icon, philanthropist and founder of the Walt Disney Company. The company has an annual revenue of $36 billion. He dropped out of high school at the age of 16 to join the army.',0,'2013-05-29 13:39:40'),(15,2,49,77,'In almost every metric, Bill Gates was a great CEO:\r\n1. He created 10s of 1000s of high-paying jobs and is a hero among the developers at Microsoft, even now.\r\n2. He built an excess of $200b for the stockholders and MSFT had one of the dream runs in stock market history (from 1980 to 1999).\r\n3. He brought PC and computing to the common man and without his push, it is arguable that computing world will be a lot different place.\r\n4. He is a great philanthropist who has contributed a lot both to Seattle local community (through United Way & others) and to the broader world.\r\n5. While the tech world has something to hate him, you have to accept that he is the most known CEO in the world. Even in developing world, a random guy would know who Bill Gates is without knowing anything about US economy or technology.\r\n6. If there were no Bill Gates, but just Apple & IBM, it is less likely that the computing revolution would have entered developing world. In countries such as India, we would have never been able to afford the Mac or a proprietary IBM box on a larger scale. That means we would have continued to stay in poverty with no hope.',0,'2013-05-29 13:40:14'),(16,2,49,78,'This is an astonishing question. Bill Gates made Microsoft. Microsoft didn\'t magically spring out of Zeus\'s head and find Bill Gates in the freezer section of CEO-Mart.',0,'2013-05-29 13:40:24'),(18,2,48,80,'Limited period promotion - Start with the free product for a promotional initial period and plan to charge for it later. For instance, 37 Signals provides free 30 day trial offers for most products and then charges if you continue to use. This is a tough thing to master these days.',0,'2013-05-29 13:45:13'),(19,2,48,81,'Targeted advertising model - Know as much as possible about the user and bring targeted ads, e.g. Facebook and Google. \r\n',0,'2013-05-29 13:45:20'),(20,2,48,82,'Sponsorship model - If your service indirectly helps the government and/or major organizations you could ask them to sponsor your service, e.g. Khan Academy is funded by the Gates Foundation and Google.',0,'2013-05-29 13:45:28'),(21,2,48,83,'Gillette model - Printers and razors are sold at less than cost, as they plan to make high margins from selling a complementary product (cartridge/blades). The printer or blade you purchased will become worthless if you don\'t buy the super-high margin complementary products from the manufacturer. On the web, for instance, you could create a cloud based spreadsheet/word processor that is free to  edit/create documents, but charges money for exporting it as a file to  the local machine. Or you could charge higher for the iPhone app that can access the data natively.',0,'2013-05-29 13:45:36'),(22,2,48,84,'Usage charge model -  This is related to the freemium model. Give the product away for free with low usage, but charge when the user exceeds the free limits (many storage applications such as Dropbox fall under this).  ',0,'2013-05-29 13:45:44'),(23,2,47,85,'Almost everything contained here is awesome: Humor: What are some good examples of funny business cards?',0,'2013-05-29 13:47:10'),(24,2,46,86,'After working with Tata Motors for some time, I have following observations that explain the mediocre products and quality.\r\n\r\nTalent acquisition and assimilation:\r\n\r\nMost of the new recruits come from all parts of the nation. They hail from prestigious institutes ( IITs, NITs, BITS, etc). What they bring with them is creativity and leadership. They belong to a dynamic class of youth from the present generation. However, most of their bosses are Marathis who insist on having all Marathi people around them. Infact most of their meetings are conducted in Marathi, which is highly unprofessional. I had a tough time understanding what is going on most of the time because they would stick to Marathi as their primary language of communication. Even seniors resort to this unfair practice thereby closing gates to any person who doesn\'t speak the language. This itself hampers the prospect of new recruits adding anything to the organization.  Most of new recruits therefore quit the company and it is left with a bunch of Marathi speaking crowd where only a few are effective in contributing. Thus ,talent is heavily lost due to this factor… leave alone making good looking cars. \r\n\r\n',0,'2013-05-29 13:48:34'),(25,2,46,87,'\r\nMaking beautiful cars\r\n\r\nMaking beautiful cars requires imagination and creativity. And needs to be expressed and appreciated among the peers and seniors. Tata gets people who can do it but they cannot put their idea into practice due to ineffective organization, mediocre crowd composition and unreasonable Marathi pride.\r\n\r\nInfact the joke among the non-Marathi people in company is that it should rename itself as Tata Marathi Limited. In days to come, it will be outperformed by its competitors. Mahindra has done great for now though even they have quality issues. Toyota is catching up fast and so is VW. Both will overtake Tata Motors as they have nothing new to offer for a few years to come. All that comes is changes in headlight ,bumper and tailgate design. Tata motors is surviving because of Jaguar Land Rover.\r\n',0,'2013-05-29 13:48:44'),(26,2,45,88,'Hey there, \r\n\r\nI just got this in my daily digest. I won\'t add too long an answer, just to say I had a similar scenario to yours - not a lot of money, but I did have time. Also I have a skill in that I can write software. \r\n\r\nIn my spare time (before work 5am - 8am, after work 7pm-10pm) I wrote a piece of software which I now sell online. I did this with almost zero budget and canvassed to get my first sales before the product was even finished. I released early and got both interest and promise of sales before it was completed, so long as I could add X feature. A year on its selling really well and getting some competitors in a tizzy!\r\n\r\nRather than come up with an \'amazing idea which no-one had done before\' I took an existing idea which I believed could be done better. Granted, I had the expertise to build this software, however I would say it is 90% sweat and 10% skill starting any business. Most don\'t bother because its really hard, not because they can\'t, and many do not realize that its not about the idea, but about doing something well that people want (regardless of whether existing companies do similar things). ',0,'2013-05-29 13:52:34'),(27,2,45,89,'Find a sales job and learn to sell.  No matter what else you do in life, take the time and learn to sell as you will have to, over and over again, particularly if you choose to follow the entrepreneurial path.  After you\'ve learned to sell, then focus on what you want to do as a business.  DVDs, CDs, training seminars, etc., well, go at your own risk.  I\'ve personally had mixed results (mostly bad) from programs that can/will teach you to sell.  My best selling training has come from jumping in the fire and learning as I went.\r\n\r\nI\'ll give you your first three lessons in selling now:\r\n\r\n1)  He who asks the questions controls the conversation.\r\n2)  After you\'ve asked your question, shut up and let your prospect respond.\r\n3)  He who talks the most, buys the most.  Make sure your prospect is doing more talking than you.\r\n',0,'2013-05-29 13:55:03'),(28,2,44,90,'This cover letter exemplifies the \"honest approach\", which requires a hell lot of courage to undertake.\r\n\r\nThis was sent by a under-graduate student to a Wall Street boutique Investment firm stating that there was nothing exceptional about him. \r\nAnd the best part, it worked. The guy secured his internship.',0,'2013-05-29 13:56:21'),(29,2,44,91,'Keep it simple.  I never read the cover letters if they are long and verbose.  Just put your name and position you want to pursue.  Put one sentence about why you want that position. Say thank you for your consideration and that\'s it. \r\n\r\nIt almost feels like an act of desperation when people try to sell themselves in the cover letter.  Use the resume for that and avoid being redundant.  Use the cover letter to demonstrate genuine interest in the job I am trying to fill and you will score 10 of 10.',0,'2013-05-29 13:56:32'),(30,2,44,92,'This one worked for me for 20 years, coupled with a resume tailored to the job description.  \r\n\r\n\r\n\"Dear Sir or Madam:\r\n\r\nThe opportunity to meet you is important to me.  I can help your organization with respect to this requirement. Please allow me to provide a brief outline of my experience and attributes.\r\n\r\n* Background in Federal Government Contract Management under FAR, DFAR, CAS, and ITAR, including estimating and pricing.  Proposal preparation and contracts/project management experience from negotiation to close-out.',0,'2013-05-29 13:56:41'),(31,2,43,93,'Not yet.\r\n\r\nBut it\'s going to take real creativity and subtlety.\r\n\r\nI am astounded at the degree of confidence in the \"build it, people will come, then we will make money out of eyeballs philosophy\" that seems to permeate the world of Venture Capital right now.\r\n\r\nThe reality is that 99.999% of companies in this space\'s only exit strategy is to build a user base and then sell, there are remarkably few companies making decent revenue right now and even fewer making profit.',0,'2013-05-29 13:57:10'),(32,2,43,94,'Its not necessary that any site has to be popular in US or a developed country to be successful. Getting to this much user base in 2 years is not bad at all. Quora is growing and we love it. I personally spend more time on Quora than on Facebook. I learn new things each day.\r\n\r\nOne thing that will hurt Quora is that it has no place for stupidity that is prevailing on Facebook and Twitter. So it is only gonna attract selected users who like learning, think logically and discuss. (Look at IQ index of human population, you will understand)\r\n',0,'2013-05-29 13:58:25'),(33,2,42,95,'I have worked with some companies in China, Hong Kong, Taiwan which have market caps > 5B, making them small to medium sized businesses, and from working with their owners, there are a few common threads I have observed:\r\n\r\nBelief in hard asset ownership\r\n\r\nChinese want to own hard assets, which takes several forms:\r\n\r\n-- Real estate\r\n-- Food\r\n-- Minerals and mineral ownership\r\n-- Logistics and distribution\r\n',0,'2013-05-29 13:59:40'),(34,2,42,96,'Quick one: they are Really into numbers, as in numerology. In writing quotes I learned to avoid 4\'s and 7\'s together, and to use lots of 8\'s (the luckiest number).  Fascinating.\r\n  ',0,'2013-05-29 14:00:27'),(35,2,41,97,'BANGALORE: As the alarm goes off at 4am, N Shiva Kumar is up on his feet, stacking his bicycle with newspapers. He has to deliver them before the sun appears on the horizon. A habit since Class 6, Shiva\'s life is set to change now. Come June 16, this newspaper-boy-turned-vendor will walk down the corridors of theIndian Institute of Management-Calcutta as a PGP student.\r\n\r\nIt sounds like a fairy tale, but the TOI vendor who cracked CAT 2012 has indeed grabbed a seat in the premier business school. Shiva, 23, an engineering student from Banaswadi, is the son of an illiterate mother and a father who was a truck driver. He started working as a newspaper delivery boy and for his debt-ridden family of four the Rs 150 he would bring home was a huge relief.',0,'2013-05-29 14:00:56'),(36,2,41,98,'I\'m not a US citizen but this one has always inspired me ...\r\n\"At the age of seven, he was forced to work to support his family. At nine, his mother died. At twenty-two, he lost his job as a store clerk. At twenty-three, he went into debt as partner in a small store, ran for the state legislature, and was promptly defeated. At twenty-six, his partner died leaving him with a large debt. The next year he had a nervous breakdown... At twenty-nine he was defeated in his bid to become house speaker. Two years later he lost a bid for elector. By thirty-five, he had been defeated twice while running for Congress. At thirty-nine after a brief term in Congress',0,'2013-05-29 14:01:09'),(37,2,40,99,' \r\nPeople receiving >1 vote:\r\n\r\nOliver Emberton\r\nMichael Wolfe\r\nMax Levchin\r\nKevin Systrom\r\nJonah Peretti\r\nReed Hastings\r\nSteve Case\r\nEvan Williams\r\nMark Cuban\r\nDennis Crowley\r\nAdam D\'Angelo\r\nDave Morin\r\nVictoria Ransom\r\nAndrew Warner\r\nRyan Carson\r\nDave McClure\r\nDon MacAskill...',0,'2013-05-29 14:01:55'),(38,2,40,100,'I\'d like to add Jason M. Lemkin to the list. He is pretty active on Quora and a Quora \"Top Writer\" too! Surprised that no one mentioned him. Jason is the founder of EchoSign, which got acquired by Adobe!',0,'2013-05-29 14:02:11'),(39,2,40,101,'Mark Cuban (mavs)\r\n\r\nDennis Crowley (foursquare)\r\n\r\nAdam D\'Angelo (quora)',0,'2013-05-29 14:02:32'),(40,2,38,102,'Look at the keyboard and you will see that there are groups of two and three black keys together. The white keys have names while the black keys are variations of the white keys. The white keys are called A, B, C, D, E, F and G. As you can see there are more than seven of them on the keyboard, but they just keep repeating, so after G it starts over again, A, B, C, D et c.\r\n\r\nFind a group of two black keys anywhere on the keyboard. The white key immediately to the left of these two black keys is called C. The next white key to the right is D (between the two black keys) and the white key to the right of D is E. So, everywhere on the keyboard where there is a group of two black keys together, you have the white keys C, D and E.',0,'2013-05-29 14:03:46'),(41,2,38,103,'Here is one video to get you motivated, it\'s been one of my all time favorites for a long-time now',0,'2013-05-29 14:04:04');
/*!40000 ALTER TABLE `quora_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quora_comment`
--

DROP TABLE IF EXISTS `quora_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quora_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `comment` longtext NOT NULL,
  `created_date` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_refs_id_8a8dea4f` (`user_id`),
  KEY `post_id_refs_id_8f4e39a1` (`post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quora_comment`
--

LOCK TABLES `quora_comment` WRITE;
/*!40000 ALTER TABLE `quora_comment` DISABLE KEYS */;
INSERT INTO `quora_comment` VALUES (1,1,1,'asdf','2013-05-28 09:48:38'),(2,1,3,'asdf','2013-05-28 09:48:53'),(3,1,3,'asdf','2013-05-28 09:48:56'),(5,1,9,'ASDF','2013-05-29 10:14:38'),(6,1,9,'ASDASD','2013-05-29 10:14:42'),(8,2,72,'this is very good yr','2013-05-29 13:29:42'),(9,2,63,'\"Attention CEO-Mart Customers, we have a Red Light special on IT Executives, located conveniently in aisle 7m right next to the Engineering Executives.  This sale lasts only for the next five minutes.  So hurry now!\"  \"Attention CEO-Mart Customers . . . How would you like to save 20% on all your items today?  For a limited time only, open a new CEO-Mart Credit Card and you can save 20% on all your purchases today.  That\'s right, 20 PERCENT!  On top of that, we\'ll give you a Bounce-Back coupon for 15% off your next visit!  Just talk to any of our helpful CEO-Mart associates for details and as always, thank you for shopping your local CEO-Mart!\"  \"Attention CEO-Mart associates, I need a bacup cashier to the front registers please.  Backup cashier needed at the front registers.\"  \"Attention CEO-Mart associates, we have a Code Adam in the store.  Description:  Blond hair.  Approximately 5\'8\".  Responds to the name Melissa Meyers.  Last seen in the company of Larry Page in the Feminine Products aisle.\"  Can you tell I\'m a former retail manager?','2013-05-29 13:40:55'),(10,2,78,'I think your response is a bit harsh. When last did Microsoft absolutely wow the world? Windows 3.1?  Yes he built the business. Good. But they had every advantage to have set up iTunes, smart phones, android etc and they didn\'t. They remained the monolith and now they are slowly but surely loosing to apple and google. I know bill hasn\'t been around a while but he this kind if stuff should have been initiated and implemented successfully on his watch.','2013-05-29 13:41:13'),(11,2,72,'Dhirubhai Ambani - The man  But no mention about his college education though.','2013-05-29 13:41:37'),(12,2,72,'Yes, the question is similar to asking if one would have been better off being born to a different mother.','2013-05-29 13:41:48'),(13,2,71,'This is personally one of the best answers that is related to Bill Gate topics on Quora.','2013-05-29 13:42:16'),(14,2,76,'Just to note - Steve Jobs, though a dropout, certainly did not attend an elite university. That does differ from dropping out of Harvard, to my mind.','2013-05-29 13:43:13'),(15,2,76,'but thank god Android came in and basically did the same thing or much more than what Windows did with PC.','2013-05-29 13:43:22'),(16,2,75,'We should not count Frank Lloyd Wright, since at the time, apprenticeship was valued more for an architect than a college education, especially with figures like Adler, Silsbee and Sullivan.  Also, he did attend U of Wisconsin albeit very briefly.','2013-05-29 13:43:45'),(17,2,74,'I believe it is by the virtue of CEOs like Bill Gates, that we even have the ability of establishing objective definitions of the term \"Good CEO\".   ','2013-05-29 13:44:08'),(18,2,77,'he attended reeds didn\'t he ?','2013-05-29 13:44:26'),(19,2,84,'He was the co-founder of what is now the world\'s most popular brand - Coca Cola . He dropped out of school at the age of 10.','2013-05-29 13:45:52'),(20,2,62,' service and convert your users to customers of your affiliates','2013-05-29 13:46:03'),(21,2,84,'If none of the previous stuff works, you could run a free venture to build  your personal brand/get popular and hope to get funding for your next venture.','2013-05-29 13:46:13'),(22,2,84,'As the popular saying goes, \"If you are not paying, you are  not the customer, but you are the product\".','2013-05-29 13:46:27'),(23,2,83,'As of 2010, The Hershey Company\'s annual revenue stood at $5.7 Billion. He was a 4th grade dropout. ','2013-05-29 13:46:41'),(24,2,60,'Not even ugly, their performance is also a setback to the buyer.','2013-05-29 13:48:24'),(25,2,87,'Why Tata designs are being uninspiring ( because that\'s what they are, I believe) Is because of following reasons :','2013-05-29 13:48:55'),(26,2,87,'excruciatingly long product development cycle so the product when released is already out of tune with the times.','2013-05-29 13:49:03'),(27,2,86,'Let\'s not forget the dodgy build quality, poor customer service (relatively) & of course they are not fun to drive either.','2013-05-29 13:49:11'),(28,2,58,'You should learn some skills then.','2013-05-29 13:52:42'),(29,2,58,'You know I do have another suggestion See Food Vendor Cart. House and business cleaning. If you can wheel a mop, broom, vacuum cleaner, duster and toilet bowl brush and know not to mix your chemicals nor use caustic cleaners on fine woods and polished counter tops you can go far in that business. Most will pay cash. I was making $20.00 an hour. To some people that\'s not a lot of money but for others it\'s a step up. If you do it well and you need to make start up money for a different project it can add up. Most homes and business will supply everything you need. I\'m not talking janitorial work either though they encompass much of the same aspects. Find a friend or an associate in the business and get some pointers from them. They may even let you partner up with them for a few jobs just so you can learn the trade. I was my experience that once the costumers get to know you the jobs will start coming your way. Most house cleaners will trade out jobs if convenient and of course if it\'s OK with the customer. Well there you go another idea from the peanut gallery.','2013-05-29 13:52:51'),(30,2,58,'A person with no skills and no money who wants to work for themselves has only a couple of choices - prostitution and robbery. So get some skills working for someone else before you hang out your shingle','2013-05-29 13:52:59'),(31,2,58,'Service sector. I started with minus £11k now a £40m turnover organically. It\'s not about the cash it\'s about mindset and your determination to make it happen. Plenty of people look around but they do not see the opportunity. You just need to have the passion for whatever it is you choose to do then just go for it full on.','2013-05-29 13:53:08'),(32,2,58,'If you are a good driver, then you could actually drive and earn money- thats the best thing to do! though it seems like a job but thats a safe bet.','2013-05-29 13:53:20'),(33,2,88,'I like the bullets you took away from the interview and I\'m glad to hear you now have a business of your own.','2013-05-29 13:54:45'),(34,2,88,'Andrew - I think you are referring to the Sam Ovens interview on Mixergy by Andrew Warner','2013-05-29 13:54:54'),(35,2,89,'A product business doesn\'t have to have such a long lead time or  high a risk IF you do your market research first. You could also offer a Service in a field where you\'re thinking about offering a product. But it is absolutely true that you have to KNOW THE PAIN that your product will solve and why someone would buy it and verify that they WILL buy it. My first (and so far) only company is a product company, but we had deep knowledge of the pain we solved, and even then it took us several years to master the marketing, etc.','2013-05-29 13:55:48'),(36,2,89,'But services companies are hard to sell than the product companies','2013-05-29 13:55:57'),(37,2,54,'How come investors gave the valuation of $400 mln for Quora, according to Forbes Russia (May 2013)?','2013-05-29 13:57:22'),(38,2,54,'I’m always suspicious of loaded questions (especially from anons) that include thinly veiled speculative and pretend answers.   I’d be more likely to answer a more honestly worded question. For example: What are Quora’s chances of succeeding?','2013-05-29 13:57:28'),(39,2,54,'Management has to have some ideas in mind for monetizing, it\'d be cool if they were out in the open. I\'m sure the community could help in the decision','2013-05-29 13:57:34'),(40,2,54,'757 Alexa seems good to me','2013-05-29 13:57:40'),(41,2,93,'You can\'t blame the gold rush in build-a-base and sell. That\'s where the big money is headed. The great experiment is testing the potency of these user bases while the big boys mix in their brand. For example, maybe Yum! (Taco Bell) can successfully integ','2013-05-29 13:57:59'),(42,2,93,'\"4) Charging Experts for using the site for lead generation.\"  That\'s the ultimate Quora fanboy pipedream :) It\'s totally unrealistic.','2013-05-29 13:58:08'),(43,2,93,'If ads were truly relevant and not too obtrusive -- there\'s lots of blank space on the screen right now -- do you think users would be that upset? I hate ads, but I find them pretty easy to ignore online, so if they are paying for my content, I\'m willing to put up with them.','2013-05-29 13:58:15'),(44,2,94,'Missed the bull\'s eye by a few miles.','2013-05-29 13:58:34'),(45,2,94,'Ain\'t we talking abt the business model here?','2013-05-29 13:59:08'),(46,2,95,'pro-found understanding of Chinese business culture! I\'m quite sure all you said is true.','2013-05-29 13:59:58'),(47,2,95,'Art of War in practice.','2013-05-29 14:00:09'),(48,2,95,'That\'s a great answer. Thanks.','2013-05-29 14:00:16'),(49,2,98,'Awesome','2013-05-29 14:01:18'),(50,2,98,'mind blowing.','2013-05-29 14:01:25'),(51,2,100,'Agreed, Jason has the best advice on SaaS business.','2013-05-29 14:02:19'),(52,2,101,'He means CEOs that are actually on Quora.','2013-05-29 14:02:42'),(53,2,101,'they actually are....see new links','2013-05-29 14:02:49'),(54,2,103,'It\'s a lovely talk, no doubt. However, I\'m not sure it\'s quite relevant to what OP is asking. The video is motivational. The question, however, is practical, and asks for direct tips. Not somebody who says, \"Yes, you can do it. Yes, you can get the tips and do it.\" If you were perhaps attempting to address his seeming insecurities in playing the instrument, perhaps this could have been useful as a comment? Just thinking aloud.','2013-05-29 14:04:13');
/*!40000 ALTER TABLE `quora_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quora_comment_likes`
--

DROP TABLE IF EXISTS `quora_comment_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quora_comment_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `likes` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_refs_id_248d8c4c` (`user_id`),
  KEY `comment_id_refs_id_f98b7f70` (`comment_id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quora_comment_likes`
--

LOCK TABLES `quora_comment_likes` WRITE;
/*!40000 ALTER TABLE `quora_comment_likes` DISABLE KEYS */;
INSERT INTO `quora_comment_likes` VALUES (1,1,1,1),(2,1,2,1),(3,1,3,1),(5,1,5,0),(6,1,6,0),(8,2,8,0),(9,2,9,0),(10,2,10,0),(11,2,11,0),(12,2,12,0),(13,2,13,0),(14,2,14,0),(15,2,15,0),(16,2,16,0),(17,2,17,0),(18,2,18,0),(19,2,19,0),(20,2,20,0),(21,2,21,0),(22,2,22,0),(23,2,23,0),(24,2,24,0),(25,2,25,0),(26,2,26,0),(27,2,27,0),(28,2,28,0),(29,2,29,0),(30,2,30,0),(31,2,31,0),(32,2,32,0),(33,2,33,0),(34,2,34,0),(35,2,35,0),(36,2,36,0),(37,2,37,0),(38,2,38,0),(39,2,39,0),(40,2,40,0),(41,2,41,0),(42,2,42,0),(43,2,43,0),(44,2,44,0),(45,2,45,0),(46,2,46,0),(47,2,47,0),(48,2,48,0),(49,2,49,0),(50,2,50,0),(51,2,51,0),(52,2,52,0),(53,2,53,0),(54,2,54,0);
/*!40000 ALTER TABLE `quora_comment_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quora_like`
--

DROP TABLE IF EXISTS `quora_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quora_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `likes` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_refs_id_30e72e7b` (`user_id`),
  KEY `answer_id_refs_id_1cde17f1` (`answer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quora_like`
--

LOCK TABLES `quora_like` WRITE;
/*!40000 ALTER TABLE `quora_like` DISABLE KEYS */;
INSERT INTO `quora_like` VALUES (1,1,1,1),(2,1,2,1),(3,1,3,0),(4,2,3,0),(5,2,2,1),(6,2,1,0),(7,2,4,0),(8,1,4,0),(12,1,8,0),(13,2,9,0),(14,2,10,0),(15,2,11,0),(16,2,12,0),(17,2,13,0),(18,2,14,0),(19,2,15,0),(20,2,16,0),(22,2,18,0),(23,2,19,0),(24,2,20,0),(25,2,21,0),(26,2,22,0),(27,2,23,0),(28,2,24,0),(29,2,25,0),(30,2,26,0),(31,2,27,0),(32,2,28,0),(33,2,29,0),(34,2,30,0),(35,2,31,0),(36,2,32,0),(37,2,33,0),(38,2,34,0),(39,2,35,0),(40,2,36,0),(41,2,37,0),(42,2,38,0),(43,2,39,0),(44,2,40,0),(45,2,41,0);
/*!40000 ALTER TABLE `quora_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quora_post`
--

DROP TABLE IF EXISTS `quora_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quora_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_type` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quora_post`
--

LOCK TABLES `quora_post` WRITE;
/*!40000 ALTER TABLE `quora_post` DISABLE KEYS */;
INSERT INTO `quora_post` VALUES (1,'Q'),(2,'Q'),(3,'A'),(4,'Q'),(5,'A'),(6,'A'),(7,'A'),(8,'Q'),(9,'Q'),(10,'Q'),(11,'Q'),(12,'Q'),(13,'Q'),(14,'Q'),(15,'Q'),(16,'Q'),(17,'Q'),(18,'Q'),(19,'Q'),(20,'Q'),(21,'Q'),(22,'Q'),(23,'Q'),(24,'Q'),(25,'Q'),(26,'Q'),(27,'Q'),(28,'Q'),(29,'Q'),(30,'Q'),(31,'Q'),(32,'Q'),(33,'Q'),(34,'Q'),(35,'Q'),(36,'Q'),(37,'Q'),(38,'Q'),(39,'Q'),(40,'Q'),(41,'Q'),(42,'Q'),(43,'Q'),(44,'Q'),(45,'Q'),(46,'Q'),(47,'Q'),(48,'Q'),(49,'Q'),(50,'Q'),(51,'Q'),(52,'Q'),(53,'Q'),(54,'Q'),(55,'Q'),(56,'Q'),(57,'Q'),(58,'Q'),(59,'Q'),(60,'Q'),(61,'Q'),(62,'Q'),(63,'Q'),(64,'Q'),(65,'A'),(66,'Q'),(67,'A'),(68,'A'),(69,'A'),(70,'A'),(71,'Q'),(72,'A'),(73,'A'),(74,'A'),(75,'A'),(76,'A'),(77,'A'),(78,'A'),(79,'A'),(80,'A'),(81,'A'),(82,'A'),(83,'A'),(84,'A'),(85,'A'),(86,'A'),(87,'A'),(88,'A'),(89,'A'),(90,'A'),(91,'A'),(92,'A'),(93,'A'),(94,'A'),(95,'A'),(96,'A'),(97,'A'),(98,'A'),(99,'A'),(100,'A'),(101,'A'),(102,'A'),(103,'A');
/*!40000 ALTER TABLE `quora_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quora_question`
--

DROP TABLE IF EXISTS `quora_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quora_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `updated_by` varchar(75) NOT NULL,
  `tags` varchar(50) NOT NULL,
  `slug_tags` varchar(255) NOT NULL,
  `title` varchar(200) NOT NULL,
  `slug_title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created_date` varchar(200) NOT NULL,
  `modified_date` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_title` (`slug_title`),
  KEY `user_id_refs_id_e7f98fa1` (`user_id`),
  KEY `post_id_refs_id_6ea81c9b` (`post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quora_question`
--

LOCK TABLES `quora_question` WRITE;
/*!40000 ALTER TABLE `quora_question` DISABLE KEYS */;
INSERT INTO `quora_question` VALUES (1,1,9,'gaurav.nagpal@tarams.com','india','india','we are indian','we-are-indian','this is great place to spend holidays','2013-05-29 06:06:35','2013-05-29 06:06:35'),(2,1,10,'gaurav.nagpal@tarams.com','books','books','Can reading a book really change something or its just a short term illusion?','can-reading-a-book-really-change-something-or-its-just-a-short-term-illusion','Of course, anybody who says books are worthless is an ignorant baggage. But the question should not be misinterpreted. Can we say : \"I don\'t know what to do with my life. Let me read a book.\" ?','2013-05-29 06:09:31','2013-05-29 06:09:31'),(3,1,11,'gaurav.nagpal@tarams.com','Mathematics','mathematics','How does one determine whether a number is evenly divisible by 7?','how-does-one-determine-whether-a-number-is-evenly-divisible-by-7','There is a simple rule for divisibility by seven. Start at the bottom of this diagram.   Now take each digit in turn from left to right in your number. For each digit follow that many black arrows in a row, and then one white arrow. If you finish at the top of the diagram your number is divisible by seven','2013-05-29 06:19:16','2013-05-29 06:19:16'),(4,1,12,'gaurav.nagpal@tarams.com','Business','business','What are some of the worst public relations mistakes an organisation has made?','what-are-some-of-the-worst-public-relations-mistakes-an-organisation-has-made','In the last 24 hours a UK supermarket has sparked a boycott of it\'s premises by suspending an employee for wearing a charity item supporting UK Armed Forces.    The employee was asked several times to remove his wristband and poppy pin but refused.  He was subsequently suspended and posted his suspension letter to Facebook which went viral.    The management faux pas (rightly or wrongly) has now led to calls to boycott the store, inundation of their social media pages and been covered by the International media.    The story has been exaggerated due to the recent murder of a British soldier and the national feeling that Britishness is being eroded.   What are some other critical failures of management by organisations?','2013-05-29 06:20:52','2013-05-29 06:20:52'),(5,1,13,'gaurav.nagpal@tarams.com','Mathematics','mathematics','Function Modeling for Scheduling: What function will give me an output such as this?','function-modeling-for-scheduling-what-function-will-give-me-an-output-such-as-this','I am writing an application which sends email reminders to people about important task they have to do within a certain time frame.   Let\'s say client A has an appointment in 2 months, s/he might want to receive the reminders starting 28 days before the deadline . In the last row of the output below, 28 is the number of days BEFORE the task deadline and the client wants to be reminded from that day. The list of numbers to the right of => is which days during those 28 days I will remind the client about the appointment.  The first row tells us, the appointment deadline is tomorrow, remind them on the appoint due day.  The tenth row tells us, the appointment deadline is in 10 days, remind them on days 1, 4, 6, 8, 9, 10 before the deadline.','2013-05-29 06:21:49','2013-05-29 06:21:49'),(6,1,14,'gaurav.nagpal@tarams.com','Music','music','How can I go back to 2000 and find the top alternative songs for 2000?','how-can-i-go-back-to-2000-and-find-the-top-alternative-songs-for-2000','I need to go to that year and look at the old information I need  specially the new rock 22 charts on www.101xfm.ca/ because I miss it in  2000. I tried the new rock 22 page on the internet way back machine in  2000 it won\'t work stupid I wanna give that guy poo for not taking  snapshots of new rock 22 page in 2000 But the site has to be perfect not  way back machine not all pages and sites work but one perfect site Stop  wasting my time. I\'m too lazy to do my own research because 2000 is  over that\'s impossible. I need lots of help. I only want nice people to  answer. No rude or mean answers please.','2013-05-29 06:23:27','2013-05-29 06:23:27'),(7,1,15,'gaurav.nagpal@tarams.com','Cameras','cameras','Is there developing technology that can capture distance data from a (moving) image?','is-there-developing-technology-that-can-capture-distance-data-from-a-moving-image','And maybe, say, be able to track how far an animal is from other animals or potential landmarks? (I\'m most interested in using this for animal cams where you put cams on animals)','2013-05-29 06:24:02','2013-05-29 06:24:02'),(8,1,16,'gaurav.nagpal@tarams.com','Music','music','What musical band\'s breakup was the most heartbreaking for viewers?','what-musical-bands-breakup-was-the-most-heartbreaking-for-viewers','This music band is too good in world','2013-05-29 06:25:43','2013-05-29 06:25:43'),(9,1,17,'gaurav.nagpal@tarams.com','Business','business','What are the most overlooked concepts when running a business?','what-are-the-most-overlooked-concepts-when-running-a-business','When you\'re talking about overlooked - the simplest models are the most overlooked.  Concepts such as keeping overhead low.  Many start-ups SPEND to impress with big offices and too many staffers than needed.  Further, the concept of maximizing cash flow. ','2013-05-29 06:51:30','2013-05-29 06:51:30'),(10,1,18,'gaurav.nagpal@tarams.com','Mathematics','mathematics','How can I draw a triangle with three 90 degree angles on a sphere?','how-can-i-draw-a-triangle-with-three-90-degree-angles-on-a-sphere','I understand the mathematical concept behind non-Euclidean space, but I am trying to explain it to someone else but have no spheres to draw on! If anyone could provide a visual example that would be great','2013-05-29 06:52:42','2013-05-29 06:52:42'),(11,1,19,'gaurav.nagpal@tarams.com','Books','books','What does your reading list  look like?','what-does-your-reading-list-look-like','And do you read two/three books simultaneously? Or go on to another if you\'ve finished the current one?','2013-05-29 06:53:24','2013-05-29 06:53:24'),(12,1,20,'gaurav.nagpal@tarams.com','Business','business','Why are some business men continuing the tradition of bigotry against business women?','why-are-some-business-men-continuing-the-tradition-of-bigotry-against-business-women',' Business:  Company CultureFeminismGender DifferencesHedge Fund ManagersMenMotherhoodThe WorkplaceWorking Mothers Edit ?Why are some business men continuing the tradition of bigotry against business women?Edit   A recent example:  \"You will never see as many great women investors or traders as men. Period. End of story,\" said billionaire Paul Tudor Jones ... \"As soon as that baby\'s lips touch that girl\'s bosom, forget it,\"...\"Every single investment idea. Every desire to understand what\'s going to make this go up or go down is going to be overwhelmed by the most beautiful experience, which a man will never share about a mode of connection between that mother and baby.\" (Source: Hedge fund guru says moms and trading don\'t mix).','2013-05-29 06:55:02','2013-05-29 06:55:02'),(13,1,23,'gaurav.nagpal@tarams.com','Mathematics','mathematics','What are ways to describe theories in precise terms without math? Is there no other way?','what-are-ways-to-describe-theories-in-precise-terms-without-math-is-there-no-other-way','My question directly was not about social sciences in first instance','2013-05-29 06:56:37','2013-05-29 06:56:37'),(14,1,24,'gaurav.nagpal@tarams.com','Mathematics','mathematics','How does one determine whether a number is evenly divisible by 9?','how-does-one-determine-whether-a-number-is-evenly-divisible-by-9','Let \'abcd\' be the number.  \'abcd\' can be written as 1000a+100b+10c+d.  1000a+100b+10c+d = (999a+99b+9c)+(a+b+c+d)  Since the value in the left bracket is divisible by 9, the number(abcd) is divisible by 9 if and only if the value in the right bracket is divisible by 9.  Therefore, a number is divisible by 9 if and only if the sum of its digits is divisible by 9.','2013-05-29 07:03:37','2013-05-29 07:03:37'),(15,1,25,'gaurav.nagpal@tarams.com','Mathematics','mathematics','In India , why do most teachers teach that \"infinity and \"not defined\" are same thing?','in-india-why-do-most-teachers-teach-that-infinity-and-not-defined-are-same-thing','Most of the students in secondary level consider infinity and not defined as same thing and this is what is taught to them. Only in undergraduate level students find that they both are completely different and that too if they get a chance to know.','2013-05-29 07:04:08','2013-05-29 07:04:08'),(16,1,26,'gaurav.nagpal@tarams.com','Mathematics','mathematics','Why can\'t zero divided by zero be one?','why-cant-zero-divided-by-zero-be-one','','2013-05-29 07:04:29','2013-05-29 07:04:29'),(17,1,27,'gaurav.nagpal@tarams.com','Mathematics','mathematics','(1 ! )^2 + (2 ! )^2 + (3 ! )^2+....till infinity, when divided by 1152, will leave a remainder of ? Options: A) 12 B) 41 C) 152 D) 802','1-2-2-2-3-2till-infinity-when-divided-by-1152-will-leave-a-remainder-of-options-a-12-b-41-c-152-d-802','','2013-05-29 07:04:55','2013-05-29 07:04:55'),(18,1,28,'gaurav.nagpal@tarams.com','Mathematics','mathematics','What are good ways to insult a mathematician?','what-are-good-ways-to-insult-a-mathematician','','2013-05-29 07:05:19','2013-05-29 07:05:19'),(19,1,29,'gaurav.nagpal@tarams.com','Mathematics','mathematics','Could anyone explain to me why +? -? is not equal to zero?','could-anyone-explain-to-me-why-is-not-equal-to-zero','Once it is a really enormous number minus another really enormous number, I can just realize it\'s zero. So, why not?','2013-05-29 07:05:52','2013-05-29 07:05:52'),(20,1,31,'gaurav.nagpal@tarams.com','Mathematics','mathematics','What are some mathematical questions that are fairly easy to state but very difficult to prove?','what-are-some-mathematical-questions-that-are-fairly-easy-to-state-but-very-difficult-to-prove','\"Fermat\'s Last theorem\", for example, can be understood even by a 10 year old kid, yet it baffled mathematicians for over four centuries','2013-05-29 07:06:32','2013-05-29 07:06:32'),(21,1,32,'gaurav.nagpal@tarams.com','Mathematics','mathematics','40 students in a class. A student is allowed to shake hand only once with a student who is taller or equal in height, but not to anybody who is shorter. Average height of the class is 5 feet. Find the','40-students-in-a-class-a-student-is-allowed-to-shake-hand-only-once-with-a-student-who-is-taller-or-equal-in-height-but-not-to-anybody-who-is-shorter-average-height-of-the-class-is-5-feet-find-the-difference-between-the-maximum-and-minimum-number-of-possi','','2013-05-29 07:06:45','2013-05-29 07:06:45'),(22,1,33,'gaurav.nagpal@tarams.com','Mathematics','mathematics','Which are the most magical numbers?','which-are-the-most-magical-numbers','I will take any kind of magic. I was thinking of \"especially cool\" but any magical attribute or system is welcome.','2013-05-29 07:07:23','2013-05-29 07:07:23'),(23,1,34,'gaurav.nagpal@tarams.com','Mathematics','mathematics','How many numbers are there between 1 and 2?','how-many-numbers-are-there-between-1-and-2','','2013-05-29 07:07:56','2013-05-29 07:07:56'),(24,1,35,'gaurav.nagpal@tarams.com','Books','books','What is the best love story that you have heard?','what-is-the-best-love-story-that-you-have-heard','','2013-05-29 07:10:26','2013-05-29 07:10:26'),(25,1,36,'gaurav.nagpal@tarams.com','Books','books','Who ordered the first book from Flipkart and which book was it?','who-ordered-the-first-book-from-flipkart-and-which-book-was-it','Flipkart initially started by selling books. Just curious to know who ordered the first book and gave money to company!','2013-05-29 07:11:50','2013-05-29 07:11:50'),(26,1,37,'gaurav.nagpal@tarams.com','Books','books','What are some good bookshelf designs?','what-are-some-good-bookshelf-designs','','2013-05-29 07:12:11','2013-05-29 07:12:11'),(27,1,38,'gaurav.nagpal@tarams.com','Books','books','Who are some of the most dangerous characters in fiction? ','who-are-some-of-the-most-dangerous-characters-in-fiction','Let the character be from fantasy, science fiction, comedy, animation, horror or any other genre','2013-05-29 07:29:17','2013-05-29 07:29:17'),(28,1,39,'gaurav.nagpal@tarams.com','Books','books','Who is the most influential fictional character ever?','who-is-the-most-influential-fictional-character-ever','from movies, books, cartoons or television ..','2013-05-29 07:30:14','2013-05-29 07:30:14'),(29,1,40,'gaurav.nagpal@tarams.com','Books','books','How do I teach myself to read a 300 pages book in one sitting?','how-do-i-teach-myself-to-read-a-300-pages-book-in-one-sitting','Is there a technique that can allow one to concentrate on a single book for an extended period of time. I read about 15 pages in an hour.','2013-05-29 07:30:41','2013-05-29 07:30:41'),(30,1,41,'gaurav.nagpal@tarams.com','Books','books','What are the best resources for learning bleeding-edge web, UI and UX design?','what-are-the-best-resources-for-learning-bleeding-edge-web-ui-and-ux-design','This is a follow-up question to What are the best books on UI/UX design for software engineers?.  I\'m looking for any kind of resource, including those that are highly technical, those directed to experienced UI/UX designers, and just interesting philosophical works that inform awesome modern/current web UIs/UXs (like Quora\'s!).','2013-05-29 07:31:04','2013-05-29 07:31:04'),(31,1,42,'gaurav.nagpal@tarams.com','Books','books','How many books do people read?','how-many-books-do-people-read','You can define the timeframe.','2013-05-29 07:31:23','2013-05-29 07:31:23'),(32,1,43,'gaurav.nagpal@tarams.com','Books','books','What are some creative or good alternate name suggestions for \"Anon User\"?','what-are-some-creative-or-good-alternate-name-suggestions-for-anon-user','suggestions from the movie world,books or fiction, or something out of the box... something more creative than \"Anonymous\" ... awaiting a refreshing change, aren\'t you :)','2013-05-29 07:31:43','2013-05-29 07:31:43'),(33,1,44,'gaurav.nagpal@tarams.com','Books','books','Why should I watch Game of Thrones if I have already read the books?','why-should-i-watch-game-of-thrones-if-i-have-already-read-the-books','I mean, if you know it all, where is the excitement?','2013-05-29 07:32:18','2013-05-29 07:32:18'),(34,1,45,'gaurav.nagpal@tarams.com','Music','music','Who is the most underrated music director in Bollywood?','who-is-the-most-underrated-music-director-in-bollywood','There are and have been some talented music directors who haven\'t got their due. They may be just 1 movie old but made an impact. Give your choices!','2013-05-29 07:33:52','2013-05-29 07:33:52'),(35,1,46,'gaurav.nagpal@tarams.com','Music','music','Where in Delhi can I get the best deals on acoustic guitars?','where-in-delhi-can-i-get-the-best-deals-on-acoustic-guitars','I\'ve been to Bhargava\'s once, around 4 years back. I found them extremely unfriendly and obnoxious. The prices weren\'t great either.  Any other store you would recommend ?','2013-05-29 07:34:19','2013-05-29 07:34:19'),(36,1,47,'gaurav.nagpal@tarams.com','Music','music','Who is the best ever Indian playback singer till date and why?','who-is-the-best-ever-indian-playback-singer-till-date-and-why','','2013-05-29 07:34:39','2013-05-29 07:34:39'),(37,1,48,'gaurav.nagpal@tarams.com','Music','music','Is an average Indian customer willing to buy mobile apps, software, music, movies, books etc?','is-an-average-indian-customer-willing-to-buy-mobile-apps-software-music-movies-books-etc','I see more than often all users by default browsing the top free apps category and rarely anyone even flipping through the paid ones. We are seldom comfortable buying software (including OS, Office, Imaging, etc.). We love to download free music and videos. All this is available without any restriction.   The question is, are we going to challenge our ethics and start buying stuff that we should not be downloading for free. And if yes, are we going to get some inclination towards buying paid stuff like mobile apps?','2013-05-29 08:44:38','2013-05-29 08:44:38'),(38,1,49,'gaurav.nagpal@tarams.com','Music','music','How should an adult with zero music experience go about learning piano?','how-should-an-adult-with-zero-music-experience-go-about-learning-piano','I\'m 22 years old and I\'ve zero experience with music. I\'m not natural with it either. Right now, my music sense is so bad that I can\'t easily decide which notes are higher and which are lower.   I want to be able to enjoy and create music. How should I go about it? I\'d prefer to do self learning than to join a class.','2013-05-29 08:45:11','2013-05-29 08:45:11'),(39,1,50,'gaurav.nagpal@tarams.com','Business','business','What are the most \"unique\" characteristics of Black businesses?','what-are-the-most-unique-characteristics-of-black-businesses','In other words, what makes most Black businesses different from other businesses other than the fact that they are Black-owned?','2013-05-29 09:06:57','2013-05-29 09:06:57'),(40,1,51,'gaurav.nagpal@tarams.com','Business','business','Who are the \"must follow\" CEOs on Quora?','who-are-the-must-follow-ceos-on-quora','This one need an update!','2013-05-29 09:07:27','2013-05-29 09:07:27'),(41,1,52,'gaurav.nagpal@tarams.com','Business','business','What are the most inspirational success stories ever?','what-are-the-most-inspirational-success-stories-ever','','2013-05-29 09:07:55','2013-05-29 09:07:55'),(42,1,53,'gaurav.nagpal@tarams.com','Business','business','What are some Chinese business practices which most non-Chinese are not aware of?','what-are-some-chinese-business-practices-which-most-non-chinese-are-not-aware-of','','2013-05-29 09:08:13','2013-05-29 09:08:13'),(43,1,54,'gaurav.nagpal@tarams.com','Business','business','Has Quora as a business failed?','has-quora-as-a-business-failed','It has been online for almost two years and eleven months, since June 21, 2010. It hasn\'t attracted a lot of traffic. Its Alexa global traffic rank is 757. Its daily traffic rank has been stagnant for the past 15 months. 38% of visitors are from India = lower monetization potential through ads. Would they even cover their costs if they started to monetize through ads today? They have raised $61M. What will they do when that money is spent? Would they be able to get more funding?','2013-05-29 09:08:38','2013-05-29 09:08:38'),(44,1,55,'gaurav.nagpal@tarams.com','Business','business','What are some examples of cover letters with a creative approach?','what-are-some-examples-of-cover-letters-with-a-creative-approach','E.g. List of 5 reasons why you should hire me, etc etc.','2013-05-29 09:09:06','2013-05-29 09:09:06'),(45,1,58,'gaurav.nagpal@tarams.com','Business','business','What is the best business to start with the lowest overhead?','what-is-the-best-business-to-start-with-the-lowest-overhead','I don\'t have a lot of money. I also don\'t have any real skills (i.e. video editor, designer, writer, etc.). What kind of business could I create that wouldn\'t cost a lot of money?','2013-05-29 09:10:12','2013-05-29 09:10:12'),(46,1,60,'gaurav.nagpal@tarams.com','Business','business','Why does Tata motors manufacture such ugly cars?','why-does-tata-motors-manufacture-such-ugly-cars','','2013-05-29 09:10:58','2013-05-29 09:10:58'),(47,1,61,'gaurav.nagpal@tarams.com','Business','business','What are some of the most awesome business cards?','what-are-some-of-the-most-awesome-business-cards','For example, Mark Zuckerberg\'s card supposedly says: \"I\'m CEO, Bitch\".','2013-05-29 09:11:27','2013-05-29 09:11:27'),(48,1,62,'gaurav.nagpal@tarams.com','Business','business','How do Free Services on the Web Make Money?','how-do-free-services-on-the-web-make-money','','2013-05-29 09:13:58','2013-05-29 09:13:58'),(49,1,63,'gaurav.nagpal@tarams.com','Business','business','Was Bill Gates a good CEO for Microsoft and why?','was-bill-gates-a-good-ceo-for-microsoft-and-why','The general consensus is that Steve Ballmer is the reason for Microsoft\'s troubles and there is talk of bringing Bill Gates back. Was Bill Gates a good CEO for Microsoft? Why?','2013-05-29 09:14:23','2013-05-29 09:14:23'),(50,1,64,'gauravnagpal2002@gmail.com','Business','business','How do I get better at networking?','how-do-i-get-better-at-networking','','2013-05-29 09:15:24','2013-05-29 13:21:50'),(52,2,71,'gauravnagpal2002@gmail.com','Mathematics','mathematics','Is there any mathematical significance of the paintings by M C Escher?','is-there-any-mathematical-significance-of-the-paintings-by-m-c-escher','The paintings like Waterfall, Relativity or Drawing Hands are impossible yet so real. Is there any mathematical significance of them or they are simply an object of art?','2013-05-29 13:27:38','2013-05-29 13:27:38');
/*!40000 ALTER TABLE `quora_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quora_userprofile`
--

DROP TABLE IF EXISTS `quora_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quora_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `profile_pic` varchar(100) NOT NULL,
  `Email_id` varchar(75) NOT NULL,
  `address` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quora_userprofile`
--

LOCK TABLES `quora_userprofile` WRITE;
/*!40000 ALTER TABLE `quora_userprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `quora_userprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-05-29 19:36:09
