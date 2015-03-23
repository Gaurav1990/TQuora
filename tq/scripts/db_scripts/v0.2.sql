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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$10000$z6vH5sPUseZE$SeQZSqSjglDsJ40fbtPJY58b1lfVBoDSaQZKo2XsWO4=','2013-06-14 09:18:01',0,'gaurav.nagpal@tarams.com','Gaurav','Nagpal','gaurav.nagpal@tarams.com',0,1,'2013-06-14 08:51:50');
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_openid_auth_association`
--

LOCK TABLES `django_openid_auth_association` WRITE;
/*!40000 ALTER TABLE `django_openid_auth_association` DISABLE KEYS */;
INSERT INTO `django_openid_auth_association` VALUES (1,'https://www.google.com/accounts/o8/ud','1.AMlYA9VPfxK6sTgHsMnme01B8HYCJyGgr6HkZyt9vFl8G4ezonpToy8s6x_mIw','99DCm9cSWGwjpILGHfQEOjHP/Rk=\n',1371199908,46800,'HMAC-SHA1');
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_openid_auth_nonce`
--

LOCK TABLES `django_openid_auth_nonce` WRITE;
/*!40000 ALTER TABLE `django_openid_auth_nonce` DISABLE KEYS */;
INSERT INTO `django_openid_auth_nonce` VALUES (1,'https://www.google.com/accounts/o8/ud',1371199910,'INZmd7D2q-hl_A');
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
INSERT INTO `django_session` VALUES ('0przphlrlwvoz9m0l547h2cc93astmpd','ZWQ4NDUyNjI3ZDExYjQ4Njk1M2QzODlhMzE5MDg5YWYxMmQ2ZTU3YzqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==','2013-06-28 09:18:01'),('t8l7ec7xkt9owetdezcplj85023yejd5','YzgxMTIzYjZmODQxNGZmNTc2YjBkN2EzMmQ4ZTE2OGVlYjNjNDU2MDqAAn1xAShVBk9QRU5JRH1VEl9hdXRoX3VzZXJfYmFja2VuZHECVRJhdXRoLkdvb2dsZUJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS4=','2013-06-28 08:51:50');
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
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_refs_id_7fdb25f8` (`user_id`),
  KEY `title_id_refs_id_6393b17e` (`title_id`),
  KEY `post_id_refs_id_8e7dbbef` (`post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quora_answer`
--

LOCK TABLES `quora_answer` WRITE;
/*!40000 ALTER TABLE `quora_answer` DISABLE KEYS */;
INSERT INTO `quora_answer` VALUES (1,1,1,2,'Some kind of Monster http://www.imdb.com/title/tt0387...\nA documentary crew followed Metallica for the better part of 2001-2003, a time of tension and release for the rock band, as they recorded their album St. Anger, fought bitterly, and sought the counsel of their on-call shrink.',0,'2013-06-14 09:13:09'),(2,1,1,3,'It might get loud http://www.imdb.com/title/tt1229...\nA documentary on the electric guitar from the point of view of three significant rock musicians: the Edge, Jimmy Page and Jack White.',0,'2013-06-14 09:13:19'),(3,1,1,4,'Latch Drom is an amazing, immersive documentary on Romani (gypsy) music.  It takes a journey from Rajasthan up through Turkey and all the way to France and Spain.  Highly recommended if you have any interest in traditional or world music, or gypsy jazz (a la Django Reinhardt).',0,'2013-06-14 09:13:45'),(4,1,2,6,'I have seen numerous scientific, meta-physical and emotional discussions pertaining to the same.\n\nBut one line I read somewhere just sums it up,\n\n\"Music is what feelings sound like\"',0,'2013-06-14 09:20:45'),(5,1,2,7,'It\'s the language that I use when I want to talk to my inner self.',0,'2013-06-14 09:21:00'),(6,1,2,8,'This question is only interesting at the edge cases. We can all agree that \"Mozart\'s Requiem\" is music, and that the sound of me typing this answer isn\'t. In between there\'s a whole grey area that academics love to haggle over. If you fall in with the John Cage school of thought, any sounds that happen between specified points in time are music, just by you declaring them to be so. ',0,'2013-06-14 09:21:10'),(7,1,2,10,'\nMUSIC is the art of arranging tones in an orderly sequence so as to produce a unified and continuous composition.',0,'2013-06-14 09:21:19'),(8,1,2,11,'Music is organized sound perceived as music.',0,'2013-06-14 09:21:27'),(9,1,3,13,'The future of the music industry is brighter than ever. With the democratization of access to advanced technological recording systems and direct control of distribution (with tons and tons of places to distribute music) true talent can shine through. ',0,'2013-06-14 09:23:07'),(10,1,3,14,'The future of music is free content\n\nMusic will be free streamed like radio of the cloud, perhaps interrupted with ads. And the Internet will intermediate the traditional music industry. There is no future for a mediator. The disintermediation between music artists and fans and the \"cutting out of the middleman\" aka the music industry will continue.',0,'2013-06-14 09:23:17'),(11,1,3,15,'  \nDave Park, Deftones original manager, gone software.\n6 votes by Andrew Gable, Marc Bodnick, Joey Flores, (more)\nGiven the totality of efforts underway at Pandora, Echo Nest, Live Nation Labs, Next Big Sound, Topspin, BandPage, Celemony, Recombinant, Beatport, Ableton, and others who are sure to follow...',0,'2013-06-14 09:23:28'),(12,1,3,16,'For all of the rhetoric about the industry transitioning to almost all music being free and artists just needing to learn how to make money in other ways, the fact is that if people don\'t start supporting musicians they like by purchasing music again, bands will stop making albums. ',0,'2013-06-14 09:23:42'),(13,1,3,17,'I believe labels will die, while corporations and medias will take over their roles.\n\nThe skills and tools of the middle-man working in labels are more and more accessible to everyone, and theses labels have harder and harder time to claim relevant roles, even by coming up with new jobs or marketing specializations.\n',0,'2013-06-14 09:24:24'),(14,1,3,18,'Music will turn into a promotional item, and artists will continue turn to labels for marketing. The deals will shift where the artists hold more sway over how to release the music, however as traditionally done before, label or managers will help artists build a brand.',0,'2013-06-14 09:24:33'),(15,1,3,19,'Artists must be masters of building tribes, continuing brands, and accepting that startups with their ondemand and streaming services may be the new \"labels.',0,'2013-06-14 09:24:45'),(16,1,3,20,'The music industry is already three parts dead, but the music business is thriving.. The problem has always been the middle-men. Now that the artists have direct contact and a direct line of distribution with their consumers- the middle man isn\'t needed. The ants are leaving the ant-hill and are building their own houses.\n\nConsumers want their product straight away. Thats why the CD is obsolete. It can never compete with a product that delivers itself to the consumer and is ready for consumption within a few seconds.',0,'2013-06-14 09:25:03'),(17,1,4,22,'I\'m not a brain scientist or psychologist, but I don\'t think music fits the mold for addiction.\n\nOf course, most people like music.  Some may love it.   Others may go so far as to say music is their life.  On the extreme end of the spectrum, I would call it an extreme passion, but not an addiction.',0,'2013-06-14 09:26:34'),(18,1,4,23,'Yes, I think music is addictive. Apparently brain chemistry is involved, and it is complicated science, but overall there is an increase of chemical dopamine while listening to music we enjoy. ',0,'2013-06-14 09:26:43'),(19,1,4,24,'I co-sign Ellen Clara Takahashi\'s answer though I believe the addictive potency/quality of music is also volatile. I know of some one who tends to find music that he prefers via mixtapes, and some of the songs he finds tend to get radio airplay. By that time he would have been sick of that particular song',0,'2013-06-14 09:26:55'),(20,1,4,25,'Yes, I know people that listen to music 24/7 even at school. Most of them even TRY to hide their headphones but they get in trouble doing what they love, listening to music',0,'2013-06-14 09:27:03'),(21,1,6,30,'Srinivasa Ramanujan: The Man Who Knew Infinity. Greatest Indian Mathematician.\n\nAge 0: Born to a poor family in Madras, India\nAge 2: Encounters smallpox and recovers unlike thousands in same neighborhood who died.\nAge 10: First encounter with Mathematics.\nAge 11: Exhausts mathematical knowledge of two college students who were lodging at his home.\nAge 12: Gets his hands on Advanced Trigonometry by S.L.Loney.\nAge 13: Masters Advanced Trigonometry and starts developing his own theorems.\nAge 16: Some friend gets him library copy of book titled A Synopsis of Elementary Results in Pure and Applied Mathematics and was a collection of 5000 theorems.\nAge 17: Independently researches Bernoulli numbers and calculates Euler\'s constant upto 15 decimal places.\nAge 18: Gets college scholarship and loses it subsequently as he couldn\'t focus on subjects other than mathematics. Runs away from home.\nAge 19: Enrolls in another college but again fails to clear his Fine Arts degree exam.\nAge 20: With no degree in hand leaves college, yet continuing his independent research. Living in extreme poverty and is now on brink of starvation.\nAge 22: Gets married and also develops a life threatening disease. But got no money for surgery so a doctor volunteers and does the surgery for free.\nAge 23: Goes door to door in city of Madras looking for a job of clerk. Finally makes some money by tutoring college students for the same FA exam that he failed few years ago.\nAge 24: Somehow his mathematics notebooks started getting circulated in Maths community of Madras and lands with the Secretary of Indian Mathematical Society. And finally some of his works gets published in Journal of Indian Mathematical Society.\nAge 25: Gets a temporary job as clerk for 20 rupees per month. ($1.00 = 50 INR approx.). Lasts only few weeks.\nAge 26. Another clerk position and this time he is making 30 rupees a month. His boss and colleagues here encouraged him in his mathematical pursuits.\nAge 27: He writes to G.H. Hardy who initially thinks that his work was \"fraud as it was impossible to believe\". Later he figured that Ramanujan\'s theorems \"must be true, because, if they were not true, no one would have the imagination to invent them\".\nAge 27+: Hardy invites Ramanujan to Cambridge. But Ramanujan in accordance to his Brahmin upbringing refuses to leave the country to \"go to a foreign land\". Although he does send him a bunch of theorems, saying \"I have found a friend in you who views my labour sympathetically.\"\nAge 27++: Gets research scholarship at University of Madras on an endorsement from Hardy.\nAge 27+++: Finally agrees to move to England. Hardy and him start looking at his notebooks again. Some results were wrong, some were already discovered but the rest were phenomenal.\nAge 29: Gets his PhD from Cambridge on highly composite numbers.\nAge 30: Becomes member of London Mathematical Society.\nAge 31: Fellow of Royal Society.\nAge 31+: Fellow of Trinity College, Cambridge\nAge 32: Gets diagnosed with Tuberculosis and Vitamin deficiencies. Returns to India and dies soon thereafter at the age of 32.',0,'2013-06-14 09:30:41'),(22,1,6,31,'Evariste Galois (1811-1832)\n\n\ntl;dr\n\n    At school, decides only math is worth studying. Torments his teachers, who tell him he is wasting his time.\n    Applies to Ecole Polytechnique. Throws a blackboard eraser at his examiner, angered by the stupidity of his questions.\n    Offers his body for revolutionary causes. Gets thrown in jail, twice.\n    Enters a duel to fight for the woman he loves. Gets shot, dies at 20.\n    Throughout his life, refuses to conform to expectations of mathematical work. His work is mostly ignored, but he remains convinced of its importance. Centuries later, we know he was right.',0,'2013-06-14 09:31:08'),(25,1,6,34,'Alexandre Grothendieck\n\n \n\n\nSome points that prove just how badass he is:\n\n    At age 12, he briefly escaped an internment camp (\"for undesirables\") in an attempt to kill Hitler [1].\n    While attending a not-so-prestigious university in Montpellier, he essentially rediscovered Measure Theory and the notion of the Lebesque Integral.      He was 17 and on his own.\n    At age 23, Grothendieck had written six papers on functional analysis, all of which his his supervisors deemed worthy of being described as a \"good dissertation\". He was awarded only one doctorate degree (PhD). ',0,'2013-06-14 09:32:08'),(26,1,6,35,'Grigori Perelman\nHe solved one of the Millennium Prize Problems \'Poincaré Conjecture \'.\n@http://www.claymath.org/millenni...\nIn August 2006, Perelman was also awarded the Field Medal but he declined the offer stating that he is not interested in money or fame.he was offered jobs at several top universities in the US, including Princeton and Stanford but he rejected them all.\nWiki-@http://en.wikipedia.org/wiki/Gri.',0,'2013-06-14 09:32:21'),(24,1,6,33,'Paul Erd?s (1913-1996)\n\nErd?s was one of the most prolific publishers of papers in mathematical history, comparable only with Leonard Euler. He is also known for his \"legendarily eccentric\" personality.\n\nIncidents & Personality traits that establish his badass-ery :\n\n    Erdos had no interest in a relationship which was not founded in shared intellectual curiosity.Nor did he see the need to restrict himself to one university, instead he criss-crossed America and Europe from one university and research centre to the next, inspired by making new contacts. When he arrived in a new town he would present himself on the doorstep of the local most prominent mathematician and announce: \"My brain is open.\"',0,'2013-06-14 09:31:32'),(27,1,6,36,'Carl Friedrich Gauss\n\nA child prodigy born to a poor, working class German family in 1777,\nhe is the source from which nearly all of modern mathematics, physics, and engineering arose. \n\namong his notable accomplishments\n\nHe invented Number Theory  at the age of 21\nHe  invented the Fast Fourier Transform\nHe  invented modern Astronomy by solving the motion of the planets\nHe discovered the Gaussian Distribution  and first invented (but did not publish)  Linear Regression ',0,'2013-06-14 09:32:53'),(28,1,7,38,'162 IQ level of Shankutala devi \" Tht human cal culator.\n\nIn 1977 in USA she\ncompeted with a computer\nto see who gives the cube\nroot of 188138517 faster,\nshe won. At the Southern\nMethodist University she\nwas asked to give the 23rd\nroot of a 201-digit\nnumber; she answered in\n50 seconds. Her answer\n—546,372,891—was\nconfirmed by calculations\ndone at the U.S. Bureau\nof Standards by the\nUnivac 1101 computer, for\nwhich a special program\nhad to be written to\nperform such a large\ncalculation.',0,'2013-06-14 09:33:54'),(29,1,8,41,'Working on a PhD., Manjari Narayan, Ph.D. candidate in Signal Processing, but specializing in Statistics, Kevin Lin, PhD Math, Sam Lichtenstein, PhD student in mathematics, Justin Rising, PhD Statistics, Wharton 2013, Yair Livne, Econ PhD from Stanford, took 2 years of stats PhD courses, Ruth Kricheli, PhD in Political Science from Stanford with a focus on statistical methods, Yasha Berchenko-Kogan, PhD student at MIT., Xiao Xiao, PhD in Mathematics, Don van der Drift, In PhD Physics program for 2.5 years, with a focus on statistics and data analysis., Ricky Kwok, Ph.D. student in Applied Math, Ori Gurel-Gurevich, Level 17 Mathematician',0,'2013-06-14 09:35:51'),(30,1,8,42,'  \nJack Miller\n86 votes by Harris B. Daniels, Working on a PhD., Leo Gestur, Johnny Rambland, (more)\nA two part question to determine if you \"think like a mathematician,\" from Prof. Eugene Luks, Bucknell University, circa 1979.\n\n\nPart I: You\'re in a room that is empty except for a functioning stove and a tea kettle with tepid water in it sitting on the floor.  How do you make hot water for tea?\n\nAnswer to Part I: Put tea kettle on stove, turn on burner, heat until water boils.',0,'2013-06-14 09:36:48'),(31,1,8,43,'You can start appreciating and understanding the inner beauty of mathematics at a new, emotional level.\n\nIt is like art - having some knowledge and understanding of it will enable you to appreciate masterpieces even more.\n\nMathematics is, unfortunately, considered as dull and boring in (most of) the popular culture. Big part of that is due to the way it has been taught, almost exclusively as a seemingly endless sequence of rote memorizations of abstract formulae and objects most people have trouble relating to.',0,'2013-06-14 09:37:04'),(32,1,8,44,'It\'s actually really cool, because I remember wondering this very same thing when I was 17 before I began my physics degree.\n\nWhen it really smacked me in the phase was studying quantum mechanics. The thing about this branch of physics is that it’s so far outside of human experience that it essentially escapes conventional explanation.  I mean, I read a lot of popular science books for most of my teenage years, and knew of just how wacky quantum phenomenon could be, but I couldn’t quite understand “why” it was so clear to physicists that particles behaved in these odd ways',0,'2013-06-14 09:37:17'),(33,1,8,45,'Because you understand how beautiful mathematics is, you develop an addiction in which the drug is finding an elegant solution to a seemingly difficult problem.',0,'2013-06-14 09:37:30'),(34,1,8,46,'Once you have a good grasp on Symbolic Logic and its use in proving mathematical equations, seeing the logical flaws in someone\'s argument becomes extremely easy.  When it comes to convincing them of these flaws, math is no help at all.',0,'2013-06-14 09:37:39'),(35,1,8,47,'If there is a God, understanding advanced math and physics allows an occasional conversation with Him about the world in His own language. If there is no God, then advanced mathematics is the highest human form of communication about things that matter. Then again, perhaps this quote says it best: “Mathematics is a language plus reasoning; it is like a language plus logic. Mathematics is a tool for reasoning.”\n? Richard P. Feynman, The Character of Physical Law',0,'2013-06-14 09:37:51'),(36,1,11,58,'Science is the accumulation of independently verifiable facts about the world connected into a coherent framework of consistent principles.\n\nDifferent branches of science favor different organizing principles.\n\nThe \"hard sciences\" (physics especially) favors quantitative measures of nature that can be expressed in terms of mathematical equations.\n',0,'2013-06-14 11:15:05'),(37,1,11,59,'Science is the field of giving rigorous answers, but ironically the definition of \"science\" is itself not rigorous.  The field of \"philosophy of science\" is dedicated to trying to give an answer to the question.\n\nIn school, they teach you about the scientific method: hypothesize, experiment, revise.  They don\'t teach you (generally) about the next step, publication.  Science is a human enterprise, conducted by fallible human beings, and for something to be science it has to be reviewed by other scientists',0,'2013-06-14 11:15:22'),(38,1,11,60,'Science is the way of making the best possible assumption about things by observing all available facts.',0,'2013-06-14 11:15:32'),(39,1,11,61,'Science is a creative process whereby knowledge and method to answer questions create more questions in that process, and because the natural   world can not be controlled.',0,'2013-06-14 11:15:51'),(40,1,11,62,'\"the transformation of rats and chemicals into paper\" -- Bruno Latour',0,'2013-06-14 11:16:00'),(41,1,11,63,'Science is:\n\n1) Processes for creating reliable models for prediction and control of the natural world,\n\n2) Models that result from the application of those processes, and\n\n3) The application of those models.',0,'2013-06-14 11:16:09'),(42,1,11,64,'Self correcting process that produces falsiable models to explain the nature.  Observe something, make model and derive some falsiable claim based on it. Test claim and if result is negative, adjust model or abandon it. Rinse and repeat. With enough evidence best models grow to Theories, which are as close to Fact as we can ever get.',0,'2013-06-14 11:16:19'),(43,1,11,65,'Science is knowledge accumulated through scientific method - ie. it is measurable and repeatable.',0,'2013-06-14 11:16:32'),(44,1,14,67,'Nope. Nothing wrong with science. The method works. It is scientists who are not being very methodical about their science.\n\nThe point in this article is that there is a social pressure to produce positive results, and there is a fear of producing what is seen to be nothing -- no result (failing to reject the null hypothesis).\n\nI see this all the time. I see it in the professors who teach statistics and research methods. I see it in grad students who are trying to get a PhD and believe they can\'t get one if they don\'t have positive results. I see it in undergrads who just think it isn\'t sexy to say they found nothing.',0,'2013-06-14 11:18:08'),(45,1,14,68,'Not really. The New Yorker article has noticed a bit of the sociology of science which is the same as the sociology of anything. Goodman\'s law is that at first, a new drug looks like a panacea. Then when we find its faults, a pandora plague. At last when we get used to it, it becomes one more perfectly pedestrian pharmaceutical. ',0,'2013-06-14 11:18:18'),(46,1,14,69,'Yes, the word is vague.  How can we really discuss whats wrong with science when that word just sucks for such discussions.\n\nDoes science refer to certain methods/routines, beliefs, manifestations, a combo of these, or what? \n\nCan we ask questions like \'Is science the opposite of religion?,\' or is that a nonsense question?\n',0,'2013-06-14 11:18:25'),(47,1,14,70,'I don\'t believe that science itself is at fault.  Rather, it is the way we approach it.  The scientific method is a long-used, profitable way of understanding nature, but the way scientists operate with each other is an entirely different story.',0,'2013-06-14 11:18:37'),(48,1,14,72,'Science is like a process of confirmation. It\'s something that exists in a principle. That process of confirmation is merely called as science by today\'s method of expression.',0,'2013-06-14 11:18:44'),(49,1,15,74,'Absolutely, but only if we loosen up a bit about what we call science.\n\nWriting peer-reviewed papers, grant-writing, comparing academic credentials?\nBorrrrrrrrrrrrrrring.\n\nThose are all administrative parts of the contemporary scientific process, but as a scientist, that\'s not what I find to be \"cool\" about the work I do.',0,'2013-06-14 11:19:40'),(50,1,15,75,'From experience I can say that people who think science is boring and uninteresting are not necessarily stupid but shallow: they think of science as old labs full of goofy guys doing dumb experiments.',0,'2013-06-14 11:19:57'),(51,1,15,76,'We need to bring back Bill Nye. \n\nIt\'s all perception. \n\nNeil DeGrasse Tyson seems to be the heir-apparent in this regard, but his approach is not directed towards kids',0,'2013-06-14 11:20:05'),(52,1,15,77,'I think at some point, almost every child thinks science is cool, whether wowed by a chemical reaction, an explosion, a dynamic physics experiment or some eyeballs or guts brought in by their teacher or explored on their own',0,'2013-06-14 11:20:14'),(53,1,15,78,'I don\'t know what you\'re talking about, I find test tubes and bunsen burners unbelievably cool. And lab coats are hot :P',0,'2013-06-14 11:20:22'),(54,1,15,79,'Cool is arbitrary to your personal beliefs. That being said, I do believe that science is being brought to a younger, more hip generation, and the stereotypical scientist in a lab coat doing boring experiments all day is slowly being fazed out.',0,'2013-06-14 11:20:30'),(55,1,16,81,'\"Most men die at 27, we just bury them at 72.\"\n-- disputed',0,'2013-06-14 11:23:09'),(56,1,16,82,'\" I must study politics and war so that my sons may have liberty to study mathematics and philosophy. My sons ought to study philosophy, mathematics, geography, history, navigation, commerce in order to give their children a right to study painting, poetry, music and architecture.\"\n\n-Source Unknown.',0,'2013-06-14 11:23:20'),(57,1,16,83,'I don\'t like that man. I must get to know him better. -Abraham Lincoln',0,'2013-06-14 11:23:36'),(58,1,16,84,'    \"Every man is a diary in which he writes one story while intending to write another. His humblest moment is when he compares the two.\" - Hugh B. Brown',0,'2013-06-14 11:23:46'),(59,1,17,86,'Online Newsgathering --By Stephen Quinn and Stephen Lamble\n\nThis book serves literally, as a text book to Journalists who never studied the various aspects of internet aided--arm-chair journalism that\'s so rampant these days. ',0,'2013-06-14 11:24:35'),(60,1,17,87,'    The Media and the Mayor\'s Race by Phyllis Kaniss http://www.newsworks.org/index.p...\n    Breaking the News by James Fallows\n    The Good Times by Russell Baker\n    Telling True Stories by Mark Kramer and Wendy Call\n    Backstory by Ken Auletta\n\nand this is just a start...',0,'2013-06-14 11:24:46'),(61,1,17,88,'\"The Elements of Journalism\" by Tom Rosenstiel and Bill Kovach gives an incredibly rich, clear and universal sense of what journalism needs to be to be valuable and a service to society. I read it years ago and made so many notes in some chapters it\'s almost illegible.\n\n\n\nTheir new book, \"Blur,\" tackles the digital landscape, emphasizing the importance of reader savvy in scrutiny in a world where news comes in many shapes, sizes and flavors. It\'s brilliant and absolutely essential for anyone who wonders where the craft is, where it\'s headed and what it means that so many can create, consume, spread and aggregate news',0,'2013-06-14 11:25:21'),(62,1,17,89,'    Great American Fortunes by Gustavus Myers\n    Raising Hell by Mother Jones\n    No Treason by Lysander Spooner\n    (Highly recommended)  Principles of Logic by George Hayward Joyce.',0,'2013-06-14 11:25:58'),(63,1,18,91,'There would be different answers for certain criteria.\n\n    Single Bloom on a bush (Pure Poetry, US, 1995)',0,'2013-06-14 11:27:22'),(64,1,20,94,'Six weeks ago, the notion that I could run 5K without walking would have been ludicrous, and I can\'t recollect ever running a full mile before then.  Back during high school P.E. classes, I was one of the guys who would start gasping for breath after a lap and end up walking half of the required mile that we were supposed to run.  I had tried to train for a 3.5 mile corporate run two years ago, but almost everyone at my startup was a strong runner (some did Stanford track), which made it extremely difficult for a novice runner like me to stay motivated.  I finished fairly poorly in the run and ended up walking a good portion of it.',0,'2013-06-14 11:30:26'),(65,1,20,95,'If I can learn to love running, anybody can. Here\'s the secret: after a certain point, everything you do will be better because you run. You\'ll feel better physically and mentally. You\'ll look better, and people will be more attracted to you. Your attitude will be better. Everything you eat will taste better. You\'ll sleep better, you\'ll have better sex, you\'ll be forced to cut down on negative habits like drinking and smoking just to keep making progress. Everything good about running flows from something else that\'s good about running. It\'s really quite something!',0,'2013-06-14 11:30:38'),(66,1,20,96,'Yes. Definitely yes. I despised running and there is nothing that helped me learn to like running more than learning proper footstriking technique. Incorrect footstriking causes fatigue much faster and results in joint pain. It will take up to a month and feel awkward at first, but once you get the hang of it, you will be much faster and you won\'t tire as easily.\n\nWhen I learned how to do this correctly I went from averaging 8 km/h for 30 minutes to about 13 km/h in about a months time.  ',0,'2013-06-14 11:30:47'),(67,1,21,98,'Funnily enough I\'m in almost the same position as you. I started couch to 5k late last week and completed day 2 yesterday.\n\nI was also extremely sore after day 1. My right calf was especially bothersome. (I assume this might have to do with weight distribution as I run and I\'m looking to improve my form and see how things progress.) I decided to take an extra day off for recovery and then progress.',0,'2013-06-14 11:32:02'),(68,1,21,99,'Ah to push through or not. The eternal question. I started  the program you\'re on and I now run up to 12 miles, my regular run is 5 miles and I find it  hard to injure myself. Here\'s my feedback based on anecdotal experience and some reading of books like Lore of Running:\n',0,'2013-06-14 11:32:09'),(69,1,22,101,'I m a die hard fan of the Greatest Sachin Tendulkar so i would say YES..\n \nHe is not just a great cricketer but a great human being as well.',0,'2013-06-14 11:33:59'),(70,1,22,102,'Among contemporary cricketers, the greatest cricketer is Kallis. Batting average higher than Sachin and bowling average nearly equal to Zaheer Khan, he gives SA the option of playing 2 players in one position. As for greatest ever, comparing players across eras is an excercise in futility.He is however one of the best batsman of all-time in tests, and in ODIs only Viv Richards can be compared to him, at current rate Kohli might end up there as well',0,'2013-06-14 11:34:06'),(71,1,23,104,'Rahul Dravid would have got the credits he actually deserved.',0,'2013-06-14 11:35:13'),(72,1,23,105,'An entire religion would not have existed.',0,'2013-06-14 11:35:20'),(73,1,23,106,'I would never have know cricket existed..',0,'2013-06-14 11:35:27'),(74,1,24,108,'Shakira\'s eyes are brown, according to answers.com, alfy.com, and celebritything.com.',0,'2013-06-14 11:36:41'),(75,1,25,110,'Shakira\'s star sign is Aquarius.\n\nSource(s)\n\n    http://wiki.answers.com/Q/What_is_Shakira_Pipoll_star_sign\n    http://www.trueknowledge.com/q/shakira_star_sign\n    http://www.celebritysky.com/celebrity/152/Shakira-Isabel-Mebarak-Ripoll',0,'2013-06-14 11:37:41'),(76,1,26,112,'You can\'t start with the technology and try to figure out where you\'re going to try to sell it. And I\'ve made this mistake, probably, more than anybody else in this room. And I\'ve got the scar tissue to prove it. And I know that it\'s the case.',0,'2013-06-14 11:38:40'),(77,1,26,113,'  \nNick Manteris, I likez books.\n138 votes by Inigo Sarmiento, Gautam Bakshi, Handowo Dipo, (more)\nI\'m really late to the party for this question, but I think this is a pretty good one:\n\n\n    \"When you grow up you tend to get told the world is the way it is and your life is just to live your life inside the world. Try not to bash into the walls too much. Try to have a nice family, have fun, save a little money.\n',0,'2013-06-14 11:39:03'),(78,1,26,114,'\"I think if you do something and it turns out pretty good, then you should go do something else wonderful, not dwell on it for too long. Just figure out what\'s next.\"',0,'2013-06-14 11:39:11'),(79,1,27,116,'Money can\'t necessarily buy happiness, but the absence of money can buy unhappiness.',0,'2013-06-14 11:40:35'),(80,1,27,117,'Yes, money can buy you happiness. The issue is that a lot of people don\'t understand what they should be buying to result in happiness. Most people are spending their money on things that aren\'t related to long term happiness. Thus, a lot of people aren\'t optimizing their investments and purchases for the goal of long term happiness.',0,'2013-06-14 11:40:43'),(81,1,28,119,'There are a lot of different ways of looking at this. I\'m going to try to be as methodical as possible in my answer by framing the answer around the actual functions of Money.\n\nMost basic economics textbooks will tell you that money is any object that fulfills any of the following functions:\n\n    a medium of exchange,\n    a unit of account, or\n    a store of value.',0,'2013-06-14 11:41:31'),(82,1,28,120,'Let me answer this question, based mainly on how the network is influencing us:\nIt seems to be accurate the notion that Internet devalues everything it touches. Anything that can be converted or made digital. You should notice that we use the word devalue with a materialistic connotation and not in the cultural value sense and that we use the word internet to refer to a class of distributed technologies and applications. The truth is that as you take the friction out of the economic system pricing goes down; Internet remains the ultimate economic lubricant.',0,'2013-06-14 11:41:40'),(83,1,28,121,'Given inflation, the future of money is generally just less money.',0,'2013-06-14 11:41:48'),(84,1,29,123,'I actually think there may be a significant competitive advantage in the future for companies that deploy extreme sincerity and transparency in their Marketing efforts. ',0,'2013-06-14 12:16:57'),(85,1,29,124,'Experiential marketing is a big trend! Evoking emotion from your consumers help gain a bigger following.',0,'2013-06-14 12:17:05'),(86,1,29,125,'Three words: local, mobile, social.\n \nBrevity is!',0,'2013-06-14 12:17:12'),(87,1,29,126,'Video\nMobile\nSearch Integration With Social Media Marketing\nInfluencer Marketing & Targeting',0,'2013-06-14 12:17:23'),(88,1,30,128,'Buzz marketing is a viral marketing technique that attempts to make each encounter with a consumer appear to be a unique, spontaneous personal exchange of information instead of a calculated marketing pitch choreographed by a professional advertiser. ',0,'2013-06-14 12:17:59'),(89,1,30,129,'Buzz Marketing is pretty self-explanatory. Old Spice, Kraft, and Dr. Pepper are great examples of this. Their over-the-top \"weird commercials were so shocking that the only natural reaction was to share it with everyone you know. I recently wrote a blog about this .. Hottest Marketing Trend: Weird is the New Cool?',0,'2013-06-14 12:18:07'),(90,1,30,130,'buzz marketing and viral marketing are essentially the same thing.',0,'2013-06-14 12:18:20'),(91,1,30,131,'Buzz marketing is a way to get people to talking about your company. It is more then viral marketing. You are looking to create a marketing message and assets that get people talking around the proverbial water cooler.',0,'2013-06-14 12:18:32'),(92,1,31,134,'Eric Cantona going to Manchester United from Leeds United for 1.2 million is probably one of the greatest trades ever in football.\n\nThe great Brian Clough going to Nottm Forest from Leeds too.',0,'2013-06-14 12:22:28'),(93,1,31,135,'NFL\n\n    The Herschel Walker trade that formed the foundation for the Dallas Cowboys championship teams of the 1990s\n    Green Bay getting Brett Favre from Atlanta and out of Jerry Glanville\'s doghouse for a 1st round pick\n    Bill Walsh sent second- and fourth-round picks to Tampa Bay and the 49ers received a valuable successor to Joe Montana in Young.\n    The Falcons and Chargers swapped picks and players. Atlanta took Vick with the No. 1 overall pick, while San Diego got Tomlinson with the fifth..',0,'2013-06-14 12:22:35'),(94,1,32,137,'To add to the soccer list:\n\nEPL:\n\n    Liverpool v Manchester United - vicious rivalry\n    Manchester United v Manchester City\n    Chelsea v Arsenal\n    Liverpool v Everton\n    Arsenal v Tottenham (thanks Steven!)',0,'2013-06-14 12:23:55'),(95,1,32,138,'Well almost all sports and rivalries seem to have been covered except cricket. So I\'ll name the best ones in cricket:',0,'2013-06-14 12:24:05'),(96,1,32,139,'Canadians vs Maple Leafs\nVery Old, 50 plus years.',0,'2013-06-14 12:24:11'),(97,1,32,140,'I\'d have to say Packers vs. Bears is the biggest rivalry in all professional sports. Yankees Red Sox is a close second, With Leafs and Habs in the NHL next in line.  in the 1980s the Celtics-Lakers feud was great, the latest version doesn\'t have the same oomph.',0,'2013-06-14 12:24:33');
/*!40000 ALTER TABLE `quora_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quora_answerstream`
--

DROP TABLE IF EXISTS `quora_answerstream`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quora_answerstream` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modified_by_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `operation` varchar(1) NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `modified_by_id_refs_id_51e4a8d5` (`modified_by_id`),
  KEY `answer_id_refs_id_a3973b77` (`answer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quora_answerstream`
--

LOCK TABLES `quora_answerstream` WRITE;
/*!40000 ALTER TABLE `quora_answerstream` DISABLE KEYS */;
INSERT INTO `quora_answerstream` VALUES (1,1,1,'A','2013-06-14 09:13:09'),(2,1,2,'A','2013-06-14 09:13:19'),(3,1,3,'A','2013-06-14 09:13:45'),(4,1,4,'A','2013-06-14 09:20:45'),(5,1,5,'A','2013-06-14 09:21:00'),(6,1,6,'A','2013-06-14 09:21:10'),(7,1,7,'A','2013-06-14 09:21:19'),(8,1,8,'A','2013-06-14 09:21:27'),(9,1,9,'A','2013-06-14 09:23:07'),(10,1,10,'A','2013-06-14 09:23:17'),(11,1,11,'A','2013-06-14 09:23:28'),(12,1,12,'A','2013-06-14 09:23:42'),(13,1,11,'C','2013-06-14 09:23:55'),(14,1,12,'C','2013-06-14 09:24:07'),(15,1,12,'C','2013-06-14 09:24:14'),(16,1,13,'A','2013-06-14 09:24:24'),(17,1,14,'A','2013-06-14 09:24:33'),(18,1,15,'A','2013-06-14 09:24:45'),(19,1,16,'A','2013-06-14 09:25:03'),(20,1,16,'C','2013-06-14 09:25:18'),(21,1,16,'C','2013-06-14 09:25:27'),(22,1,17,'A','2013-06-14 09:26:34'),(23,1,18,'A','2013-06-14 09:26:43'),(24,1,19,'A','2013-06-14 09:26:55'),(25,1,20,'A','2013-06-14 09:27:03'),(26,1,21,'A','2013-06-14 09:30:41'),(27,1,22,'A','2013-06-14 09:31:08'),(28,1,25,'A','2013-06-14 09:32:08'),(29,1,26,'A','2013-06-14 09:32:21'),(30,1,27,'A','2013-06-14 09:32:53'),(31,1,28,'A','2013-06-14 09:33:54'),(32,1,29,'A','2013-06-14 09:35:51'),(33,1,30,'A','2013-06-14 09:36:48'),(34,1,31,'A','2013-06-14 09:37:04'),(35,1,32,'A','2013-06-14 09:37:17'),(36,1,33,'A','2013-06-14 09:37:30'),(37,1,34,'A','2013-06-14 09:37:39'),(38,1,36,'A','2013-06-14 11:15:05'),(39,1,37,'A','2013-06-14 11:15:22'),(40,1,38,'A','2013-06-14 11:15:32'),(41,1,39,'A','2013-06-14 11:15:51'),(42,1,40,'A','2013-06-14 11:16:00'),(43,1,41,'A','2013-06-14 11:16:09'),(44,1,42,'A','2013-06-14 11:16:19'),(45,1,43,'A','2013-06-14 11:16:33'),(46,1,43,'C','2013-06-14 11:16:43'),(47,1,44,'A','2013-06-14 11:18:08'),(48,1,45,'A','2013-06-14 11:18:18'),(49,1,46,'A','2013-06-14 11:18:25'),(50,1,47,'A','2013-06-14 11:18:37'),(51,1,48,'A','2013-06-14 11:18:44'),(52,1,49,'A','2013-06-14 11:19:40'),(53,1,50,'A','2013-06-14 11:19:57'),(54,1,51,'A','2013-06-14 11:20:05'),(55,1,52,'A','2013-06-14 11:20:14'),(56,1,53,'A','2013-06-14 11:20:22'),(57,1,54,'A','2013-06-14 11:20:30'),(58,1,55,'A','2013-06-14 11:23:09'),(59,1,56,'A','2013-06-14 11:23:20'),(60,1,57,'A','2013-06-14 11:23:36'),(61,1,58,'A','2013-06-14 11:23:46'),(62,1,59,'A','2013-06-14 11:24:35'),(63,1,60,'A','2013-06-14 11:24:46'),(64,1,61,'A','2013-06-14 11:25:21'),(65,1,62,'A','2013-06-14 11:25:58'),(66,1,63,'A','2013-06-14 11:27:22'),(67,1,64,'A','2013-06-14 11:30:26'),(68,1,65,'A','2013-06-14 11:30:38'),(69,1,66,'A','2013-06-14 11:30:47'),(70,1,67,'A','2013-06-14 11:32:02'),(71,1,68,'A','2013-06-14 11:32:09'),(72,1,69,'A','2013-06-14 11:33:59'),(73,1,70,'A','2013-06-14 11:34:06'),(74,1,71,'A','2013-06-14 11:35:13'),(75,1,72,'A','2013-06-14 11:35:20'),(76,1,73,'A','2013-06-14 11:35:27'),(77,1,74,'A','2013-06-14 11:36:41'),(78,1,75,'A','2013-06-14 11:37:41'),(79,1,76,'A','2013-06-14 11:38:40'),(80,1,77,'A','2013-06-14 11:39:03'),(81,1,78,'A','2013-06-14 11:39:11'),(82,1,79,'A','2013-06-14 11:40:35'),(83,1,80,'A','2013-06-14 11:40:43'),(84,1,81,'A','2013-06-14 11:41:31'),(85,1,82,'A','2013-06-14 11:41:40'),(86,1,83,'A','2013-06-14 11:41:48'),(87,1,84,'A','2013-06-14 12:16:57'),(88,1,85,'A','2013-06-14 12:17:05'),(89,1,86,'A','2013-06-14 12:17:12'),(90,1,87,'A','2013-06-14 12:17:23'),(91,1,88,'A','2013-06-14 12:17:59'),(92,1,89,'A','2013-06-14 12:18:07'),(93,1,90,'A','2013-06-14 12:18:20'),(94,1,91,'A','2013-06-14 12:18:32'),(95,1,92,'A','2013-06-14 12:22:28'),(96,1,93,'A','2013-06-14 12:22:35'),(97,1,94,'A','2013-06-14 12:23:55'),(98,1,95,'A','2013-06-14 12:24:05'),(99,1,96,'A','2013-06-14 12:24:11'),(100,1,97,'A','2013-06-14 12:24:33');
/*!40000 ALTER TABLE `quora_answerstream` ENABLE KEYS */;
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
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_refs_id_8a8dea4f` (`user_id`),
  KEY `post_id_refs_id_8f4e39a1` (`post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quora_comment`
--

LOCK TABLES `quora_comment` WRITE;
/*!40000 ALTER TABLE `quora_comment` DISABLE KEYS */;
INSERT INTO `quora_comment` VALUES (1,1,1,'\"Hello Quora Fam. I\'m making a documentary on Eddie and the Cruisers  20th anniversary. Looking for a rabid fan who I could interview and  bounce idea off of. I live in NJ and am familiar with many of the  locations used in the film. All Eddie and the Cruisers info, lore,  trivia, and criticism are welcome....\"','2013-06-14 09:12:18'),(2,1,1,'The film about the 1967 Monterey Pop Festival is great. Artistically, if not culturally, this event overshadowed Woodstock and featured some truly memorable performances by some of the best artists of the 60\'s.Janis Joplin\'s rendition of Ball and Chain very nearly defines her and that era.','2013-06-14 09:12:31'),(3,1,5,'There are many issues with coming up with a definition of music.  For instance, does everybody agree on what it is?  Does it have to have been composed intentionally?  Does it have to sound good?  Does it have to have been produced  Pitfalls: 4\'33\" by John Cage, birdsong, algorithmic composition, etc','2013-06-14 09:20:14'),(4,1,5,'I wouldn\'t say that this question is meaningless - it\'s just extremely subjective. Don\'t go around saying \"It has to sound good\" - what sounds good to you might not sound good to me. It seems based on Philip Dorrell\'s comments that he would rather see a definition that fits into his preconceived notion of what music should be than one that is actually functionally appropriate.','2013-06-14 09:20:23'),(5,1,5,'The music topic on Quora is defined as \"The art of combining sounds and silence and sometimes words and stagecraft to produce a subjective experience of beauty, often involving the expression of emotion.\"  What about atonal music? Discordant music? Don\'t these create negative subjective experiences, or experiences that are not subjectively \'beautiful\'?','2013-06-14 09:20:31'),(6,1,12,'The future of the music business is that consumers will have a large music vault in the cloud where they can listen to their music.  Music sales will continue to fall YoY and revenue substitution will gain with Licensing to Commericals, TV shows and movies growing.  Above all, bands will strive to raise their asking rate for Live performances.  So think of the actual music as a loss-leader to brand an Artist or a band in order to make revenues via touring and via licensing music.','2013-06-14 09:22:53'),(7,1,15,'i  like the part about fire-breathing unicorns','2013-06-14 09:23:55'),(8,1,16,'I think you mean that the biggest bands have not been putting out good full length albums.  There are a ton of artists putting out killing music right now.  But no, they are not smashing the charts.','2013-06-14 09:24:07'),(9,1,16,'With very few exceptions, bands have not put out good full length albums since the late nineties. Prior to that record labels took the lions share of the profits. They\'ll always be music, and good music to boot. I too however hope musicians get adequately compensated.','2013-06-14 09:24:14'),(10,1,20,'I think that global system of payments to based on ISPs tracking is near impossible to implement. Even if such system will be available technically, people will use encrypted traffic tools to protect their privacy','2013-06-14 09:25:18'),(11,1,20,'Creative solution.  But who\'s gonna want to pay $200 for a few dozen minutes of music?  And why is it fair that the big consumers pay only $200?','2013-06-14 09:25:27'),(12,1,21,'Do you mean maybe a particular song?','2013-06-14 09:26:21'),(13,1,29,'You will find list http://de.wikipedia.org/wiki/Liste_bedeutender_Mathematiker','2013-06-14 09:29:44'),(14,1,29,'Your post gives lot of interesting and useful information','2013-06-14 09:29:59'),(15,1,29,'I would nominate Tom Lehrer, who was a \"badass\" in a broader sense.  In addition to graduating Phi Beta Kappa from Harvard at 19, teaching at Harvard & MIT, and working at Los Alamos, he authored and sang numerous satirical songs on topics as diverse as nuclear proliferation, religion, and the periodic table. ','2013-06-14 09:30:06'),(16,1,29,'The answers to this question are treat to read and inspiring.','2013-06-14 09:30:13'),(17,1,40,'First of all one must have love for mathematics, passion for it & clear understanding of basic concepts.  Understanding Advanced Mathematics is source of joy, satisfaction & thirst to learn further.  It is not accomplishment of the task, but just achieving a milestone!  The ocean of knowledge is unlimited & out time/ our life is too small. But we really enjoy this.--- Sanjay Chakradeo','2013-06-14 09:34:59'),(18,1,40,'The solution is created by balanced forces. These forces are equations, that represent conditions within the problem. When you balance the total equation, you get a possible answer. You can never know well enough all the input conditions, to guarantee the solution. You get an instinct for this, and cannot totally articulate what process lead to your instinct. You just sort of know it, and go with it.   Mark','2013-06-14 09:35:08'),(19,1,40,'I\'m always astonished at the skills of physicists. They seem to be able to grasp impossible concepts with little or no effort. I KNOW that as a human like them I should be able to do what they do but I simply CAN\'T. It\'s like some cats understand the concept of being brushed and how they should like it, but others CAN\'T. I\'m like Schroedinger\'s Cat ','2013-06-14 09:35:15'),(20,1,40,'As a musician, and as I might somewhat *not braggingly* add, a good one, I think I share many traits of the physicist and mathematician -- I think to be a good musician almost demands that. But literally, I feel like there is a portion of my brain missing -- lobotomised, as it were -- when it comes to understanding math','2013-06-14 09:35:27'),(21,1,40,'This question is linked to the front page of a news reprint site, The Browser, currently, December 29, 2011.  Quora\'s popularity seems to be soaring.','2013-06-14 09:35:34'),(22,1,65,'this is ryt one..','2013-06-14 11:16:43'),(23,1,80,'I read this book on Buddhism readings. It spoke about impermanence and unnecessary attachments we all possess. Buddha often said  \" That which begins, has to end\"  Which is the single wisest thing I\'ve ever read.','2013-06-14 11:22:04'),(24,1,80,'\"Intellect and wisdom are fine, but don\'t be afraid to get your hands dirty.\"','2013-06-14 11:22:11'),(25,1,80,'\"A ship in a harbour is safe, but that is not what ships are built for.\"','2013-06-14 11:22:20'),(26,1,80,'The heart has its reasons, which reason does not know. - Blaise Pascal','2013-06-14 11:22:36'),(27,1,80,'I was taught that you should accept your failings, reading about how something is done/works gives you knowledge but you gain wisdom from trying and failing. Knowledge and wisdom are two different things and by experience you gain a deeper understanding of what is even if you fail from time to time.','2013-06-14 11:22:46'),(28,1,90,'    Overall Bush - (Lavaglut, German, 1978)','2013-06-14 11:27:29'),(29,1,93,'Definitely!  Start slow and build up to more miles.  Sign up for a few small races and soon find yourself running all the time!','2013-06-14 11:30:14'),(30,1,100,'Yes indeed, he is and will be.','2013-06-14 11:33:26'),(31,1,100,'I\'ve been asked to answer this question, but I\'m afraid I can\'t make sense of it. Could you please try re-wording it?','2013-06-14 11:33:37'),(32,1,100,'Your definition of greatness is odd to say the least.','2013-06-14 11:33:44'),(33,1,100,'Is there some option to downvote questions too?','2013-06-14 11:33:50'),(34,1,103,'Cricket have Just like kabbadi fans.','2013-06-14 11:35:53'),(35,1,109,'I changed star sign to sun sign, which is what astrologers call it, and what the question asks for. Star sign is a very common expression, but sun sign is a bit more accurate.','2013-06-14 11:37:26'),(36,1,111,'Don\'t forget to send virtual flowers or light a virtual candle for Steve on http://www.memorialmatters.com/m...','2013-06-14 11:38:51'),(37,1,115,'Money buys your things and things don\'t make you happy.  Unless you are already content, money can create more problems.','2013-06-14 11:40:15'),(38,1,115,'Happiness is an inside job. The most content people I\'ve known were in what most would consider third world countries and, the most dis-contented people I\'ve known were indeed, quite affluent and American. It\'s a bit of a conundrum, money does not beget happiness but it does solve problems. The fallacy lies not in the notion that money can or can\'t buy happiness but, that an absence of problems in itself will yield long term happiness.','2013-06-14 11:40:23'),(39,1,118,'Can you add more \"question details\" to explain more clearly the meaning and context of this question?','2013-06-14 11:41:17'),(40,1,118,'There will be more of it.','2013-06-14 11:41:22'),(41,1,133,'This comment is not responsive to the question, but I have to throw it in.  Perhaps the greatest pick-up in basketball history isn\'t a trade, but a release and a pick-up.  In 1976 the Lakers released Gail Goodrich.  The New Orleans Jazz picked him up.  Because Goodrich was an experienced free agent, the Jazz had to compensate the Lakers with draft picks.  The Jazz finish led to the Lakers getting the #1 pick in the 1979 draft.  Magic.','2013-06-14 12:21:59'),(42,1,133,'heck, in terms of culture Rossi going to Ducati in MotoGP has been huge; if disappointing in results.','2013-06-14 12:22:05'),(43,1,133,'can this include soccer? eric cantona to man utd, henry to arsenal, shearer to blackburn, etc...','2013-06-14 12:22:17'),(44,1,136,'Currently? NHL: Caps-Pens; Pens-Flyers MLB: Giants-Dodgers; Yanks-Sox NFL: Steelers-Ravens; Jets-Patriots','2013-06-14 12:23:48');
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
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quora_comment_likes`
--

LOCK TABLES `quora_comment_likes` WRITE;
/*!40000 ALTER TABLE `quora_comment_likes` DISABLE KEYS */;
INSERT INTO `quora_comment_likes` VALUES (1,1,1,0),(2,1,2,0),(3,1,3,0),(4,1,4,0),(5,1,5,0),(6,1,6,0),(7,1,7,0),(8,1,8,0),(9,1,9,0),(10,1,10,0),(11,1,11,0),(12,1,12,0),(13,1,13,0),(14,1,14,0),(15,1,15,0),(16,1,16,0),(17,1,17,0),(18,1,18,0),(19,1,19,0),(20,1,20,0),(21,1,21,0),(22,1,22,0),(23,1,23,0),(24,1,24,0),(25,1,25,0),(26,1,26,0),(27,1,27,0),(28,1,28,0),(29,1,29,0),(30,1,30,0),(31,1,31,0),(32,1,32,0),(33,1,33,0),(34,1,34,0),(35,1,35,0),(36,1,36,0),(37,1,37,0),(38,1,38,0),(39,1,39,0),(40,1,40,0),(41,1,41,0),(42,1,42,0),(43,1,43,0),(44,1,44,0);
/*!40000 ALTER TABLE `quora_comment_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quora_follow`
--

DROP TABLE IF EXISTS `quora_follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quora_follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `follow_id` int(11) DEFAULT NULL,
  `follower_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `follow_id_refs_id_1c63a758` (`follow_id`),
  KEY `follower_id_refs_id_1c63a758` (`follower_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quora_follow`
--

LOCK TABLES `quora_follow` WRITE;
/*!40000 ALTER TABLE `quora_follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `quora_follow` ENABLE KEYS */;
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
) ENGINE=MyISAM AUTO_INCREMENT=95 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quora_like`
--

LOCK TABLES `quora_like` WRITE;
/*!40000 ALTER TABLE `quora_like` DISABLE KEYS */;
INSERT INTO `quora_like` VALUES (1,1,1,1),(2,1,2,1),(3,1,3,0),(4,1,4,0),(5,1,5,0),(6,1,6,0),(7,1,7,0),(8,1,8,0),(9,1,9,0),(10,1,10,0),(11,1,11,0),(12,1,12,0),(13,1,13,0),(14,1,14,0),(15,1,15,0),(16,1,16,0),(17,1,17,0),(18,1,18,0),(19,1,19,0),(20,1,20,0),(21,1,21,0),(22,1,22,0),(23,1,25,0),(24,1,26,0),(25,1,27,0),(26,1,28,0),(27,1,29,0),(28,1,30,0),(29,1,31,0),(30,1,32,0),(31,1,33,0),(32,1,34,0),(33,1,36,0),(34,1,37,0),(35,1,38,0),(36,1,39,0),(37,1,40,0),(38,1,41,0),(39,1,42,0),(40,1,43,1),(41,1,44,0),(42,1,45,0),(43,1,46,0),(44,1,47,0),(45,1,48,0),(46,1,49,0),(47,1,50,0),(48,1,51,0),(49,1,52,0),(50,1,53,0),(51,1,54,0),(52,1,55,0),(53,1,56,0),(54,1,57,0),(55,1,58,0),(56,1,59,0),(57,1,60,0),(58,1,61,0),(59,1,62,0),(60,1,63,0),(61,1,64,0),(62,1,65,0),(63,1,66,1),(64,1,67,1),(65,1,68,1),(66,1,69,0),(67,1,70,0),(68,1,71,0),(69,1,72,0),(70,1,73,0),(71,1,74,0),(72,1,75,0),(73,1,76,0),(74,1,77,0),(75,1,78,0),(76,1,79,0),(77,1,80,0),(78,1,81,0),(79,1,82,0),(80,1,83,0),(81,1,84,0),(82,1,85,0),(83,1,86,0),(84,1,87,0),(85,1,88,0),(86,1,89,0),(87,1,90,0),(88,1,91,0),(89,1,92,0),(90,1,93,0),(91,1,94,0),(92,1,95,0),(93,1,96,0),(94,1,97,0);
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
) ENGINE=MyISAM AUTO_INCREMENT=141 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quora_post`
--

LOCK TABLES `quora_post` WRITE;
/*!40000 ALTER TABLE `quora_post` DISABLE KEYS */;
INSERT INTO `quora_post` VALUES (1,'Q'),(2,'A'),(3,'A'),(4,'A'),(5,'Q'),(6,'A'),(7,'A'),(8,'A'),(9,'A'),(10,'A'),(11,'A'),(12,'Q'),(13,'A'),(14,'A'),(15,'A'),(16,'A'),(17,'A'),(18,'A'),(19,'A'),(20,'A'),(21,'Q'),(22,'A'),(23,'A'),(24,'A'),(25,'A'),(26,'Q'),(27,'Q'),(28,'Q'),(29,'Q'),(30,'A'),(31,'A'),(32,'A'),(33,'A'),(34,'A'),(35,'A'),(36,'A'),(37,'Q'),(38,'A'),(39,'A'),(40,'Q'),(41,'A'),(42,'A'),(43,'A'),(44,'A'),(45,'A'),(46,'A'),(47,'A'),(48,'Q'),(49,'Q'),(50,'Q'),(51,'Q'),(52,'Q'),(53,'Q'),(54,'Q'),(55,'Q'),(56,'Q'),(57,'Q'),(58,'A'),(59,'A'),(60,'A'),(61,'A'),(62,'A'),(63,'A'),(64,'A'),(65,'A'),(66,'Q'),(67,'A'),(68,'A'),(69,'A'),(70,'A'),(71,'A'),(72,'A'),(73,'Q'),(74,'A'),(75,'A'),(76,'A'),(77,'A'),(78,'A'),(79,'A'),(80,'Q'),(81,'A'),(82,'A'),(83,'A'),(84,'A'),(85,'Q'),(86,'A'),(87,'A'),(88,'A'),(89,'A'),(90,'Q'),(91,'A'),(92,'Q'),(93,'Q'),(94,'A'),(95,'A'),(96,'A'),(97,'Q'),(98,'A'),(99,'A'),(100,'Q'),(101,'A'),(102,'A'),(103,'Q'),(104,'A'),(105,'A'),(106,'A'),(107,'Q'),(108,'A'),(109,'Q'),(110,'A'),(111,'Q'),(112,'A'),(113,'A'),(114,'A'),(115,'Q'),(116,'A'),(117,'A'),(118,'Q'),(119,'A'),(120,'A'),(121,'A'),(122,'Q'),(123,'A'),(124,'A'),(125,'A'),(126,'A'),(127,'Q'),(128,'A'),(129,'A'),(130,'A'),(131,'A'),(132,'Q'),(133,'Q'),(134,'A'),(135,'A'),(136,'Q'),(137,'A'),(138,'A'),(139,'A'),(140,'A');
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
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug_title` (`slug_title`),
  KEY `user_id_refs_id_e7f98fa1` (`user_id`),
  KEY `post_id_refs_id_6ea81c9b` (`post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quora_question`
--

LOCK TABLES `quora_question` WRITE;
/*!40000 ALTER TABLE `quora_question` DISABLE KEYS */;
INSERT INTO `quora_question` VALUES (1,1,1,'gaurav.nagpal@tarams.com','Music','music','What are some great music documentaries?','what-are-some-great-music-documentaries','Rock docs.  The Last Waltz','2013-06-14 09:12:02','2013-06-14 09:12:02'),(2,1,5,'gaurav.nagpal@tarams.com','Music','music','What is music?','what-is-music','How do you define music?','2013-06-14 09:19:54','2013-06-14 09:19:54'),(3,1,12,'gaurav.nagpal@tarams.com','Music','music','What is the future of the music industry?','what-is-the-future-of-the-music-industry','','2013-06-14 09:22:40','2013-06-14 09:22:40'),(4,1,21,'gaurav.nagpal@tarams.com','Music','music','Is music addictive?','is-music-addictive','','2013-06-14 09:26:07','2013-06-14 09:26:07'),(5,1,26,'gaurav.nagpal@tarams.com','Mathematics','mathematics','What are some stories of the \"human calculator\", Shakuntala Devi?','what-are-some-stories-of-the-human-calculator-shakuntala-devi','?http://www.thehindu.com/news/national/karnataka/mathematical-genius-shakuntala-devi-no-more/article4640134.ece','2013-06-14 09:28:13','2013-06-14 09:28:13'),(6,1,29,'gaurav.nagpal@tarams.com','Mathematics','mathematics','Who is the most badass mathematician ever?','who-is-the-most-badass-mathematician-ever','','2013-06-14 09:29:11','2013-06-14 09:29:11'),(7,1,37,'gaurav.nagpal@tarams.com','Mathematics','mathematics','What was the IQ of Shakuntala Devi, The Human Calculator?','what-was-the-iq-of-shakuntala-devi-the-human-calculator','','2013-06-14 09:33:36','2013-06-14 09:33:36'),(8,1,40,'gaurav.nagpal@tarams.com','Mathematics','mathematics','What is it like to understand advanced mathematics?','what-is-it-like-to-understand-advanced-mathematics','I\'m interested to hear what very talented mathematicians and physicists have to say about \"what it\'s like\" to have an internalized sense of very advanced mathematical concepts... As someone who only completed college calculus and physics, and has some basic CS background, but who is very intrigued by mathematics, I\'ve always been curious about this. Does it feel analogous to having mastery of another language like in programming or linguistics? Any honest, candid insights appreciated','2013-06-14 09:34:42','2013-06-14 09:34:42'),(9,1,48,'gaurav.nagpal@tarams.com','Sports','sports','What is the greatest comeback in sports history?','what-is-the-greatest-comeback-in-sports-history','I think the 1986 Masters victory by Jack Nicklaus is right up there.  He was in his mid 40s then and had been all but written off by the press.  What he did on the back nine in the final round was incredible.  When I think of huge and momentous comebacks this tops the list, IMHO','2013-06-14 09:41:38','2013-06-14 09:41:38'),(10,1,52,'gaurav.nagpal@tarams.com','Science','science','Is there an end to science?','is-there-an-end-to-science','Will there be a time when our knowledge of the workings of our universe, from macro to micro scales, is complete?  What would that mean for life as we know it?','2013-06-14 09:45:26','2013-06-14 09:45:26'),(11,1,55,'gaurav.nagpal@tarams.com','Science','science','What is science?','what-is-science','','2013-06-14 09:47:35','2013-06-14 09:47:35'),(12,1,56,'gaurav.nagpal@tarams.com','Maths','maths','sdf','sdf','asdfa','2013-06-14 11:12:52','2013-06-14 11:12:52'),(13,1,57,'gaurav.nagpal@tarams.com','sad','sad','asd','asd','','2013-06-14 11:13:16','2013-06-14 11:13:16'),(14,1,66,'gaurav.nagpal@tarams.com','Science','science','Is there something wrong with science?','is-there-something-wrong-with-science','Evidence here : http://www.newyorker.com/reporting/2010/12/13/101213fa_fact_lehrer','2013-06-14 11:17:43','2013-06-14 11:17:43'),(15,1,73,'gaurav.nagpal@tarams.com','Science','science','Is science cool?','is-science-cool','With TV programs like Horizon, and science celebrities like Prof. Brian Cox becoming increasingly popular, can science take the place of technology in the contemporary coolness stakes? Or will it always be seen as difficult, dull, and the domain of an intellectual elite?','2013-06-14 11:19:23','2013-06-14 11:19:23'),(16,1,80,'gaurav.nagpal@tarams.com','Reading','reading','What are the wisest quotes you\'ve ever heard or read?','what-are-the-wisest-quotes-youve-ever-heard-or-read','Or seen. or heard. Or thought of.','2013-06-14 11:21:41','2013-06-14 11:21:41'),(17,1,85,'gaurav.nagpal@tarams.com','Reading','reading','What are the \'must-reads\' for journalists?','what-are-the-must-reads-for-journalists','','2013-06-14 11:24:10','2013-06-14 11:24:10'),(18,1,90,'gaurav.nagpal@tarams.com','Rose','rose','What is the most beautiful rose?','what-is-the-most-beautiful-rose','','2013-06-14 11:27:08','2013-06-14 11:27:08'),(19,1,92,'gaurav.nagpal@tarams.com','Can anyone learn to enjoy running?','can-anyone-learn-to-enjoy-running','It sure feels like I can\'t!','it-sure-feels-like-i-cant','','2013-06-14 11:28:34','2013-06-14 11:28:34'),(20,1,93,'gaurav.nagpal@tarams.com','Running','running','Can anyone learn to enjoy running?','can-anyone-learn-to-enjoy-running','It sure feels like I can\'t!','2013-06-14 11:29:59','2013-06-14 11:29:59'),(21,1,97,'gaurav.nagpal@tarams.com','Running','running','Should I run if sore?','should-i-run-if-sore','I just started a running program (couch to 5k) and after my first day my legs are extremely sore and my left foot hurts under the outer half.  The first day of the program was run for 90 seconds and walk for 60 and alternate. Yesterday was my off day and I\'m supposed to run today.  I\'m wondering if I should push through the pain or wait another day when it goes away.  I\'d like to stick to the program and the leg soreness wouldn\'t be a problem but my foot feels bruised and that might be a bit much','2013-06-14 11:31:35','2013-06-14 11:31:35'),(22,1,100,'gaurav.nagpal@tarams.com','Sachin','sachin','Is Sachin Tendulkar the greatest cricketer in the world?','is-sachin-tendulkar-the-greatest-cricketer-in-the-world','Disclaimer: This question was originally \"Is Sachin Tendulkar the \'greatest man\' in the world\".','2013-06-14 11:33:06','2013-06-14 11:33:06'),(23,1,103,'gaurav.nagpal@tarams.com','Sachin','sachin','What if there was no Sachin Tendulkar?','what-if-there-was-no-sachin-tendulkar','what would have been the cricketing scenario especially in India if Sachin Tendulkar never existed? Would someone else have risen?Would other sports and sportspersons have gained some prominence?','2013-06-14 11:34:58','2013-06-14 11:34:58'),(24,1,107,'gaurav.nagpal@tarams.com','Shakira','shakira','What color are Shakira\'s eyes?','what-color-are-shakiras-eyes','','2013-06-14 11:36:32','2013-06-14 11:36:32'),(25,1,109,'gaurav.nagpal@tarams.com','Shakira','shakira','What is Shakira\'s sun sign?','what-is-shakiras-sun-sign','','2013-06-14 11:37:18','2013-06-14 11:37:18'),(26,1,111,'gaurav.nagpal@tarams.com','Steve Jobs','steve-jobs','What are the best Steve Jobs quotations?','what-are-the-best-steve-jobs-quotations','','2013-06-14 11:38:26','2013-06-14 11:38:26'),(27,1,115,'gaurav.nagpal@tarams.com','Money','money','Can money buy happiness?','can-money-buy-happiness','','2013-06-14 11:40:04','2013-06-14 11:40:04'),(28,1,118,'gaurav.nagpal@tarams.com','Money','money','What is the future of money?','what-is-the-future-of-money','','2013-06-14 11:41:10','2013-06-14 11:41:10'),(29,1,122,'gaurav.nagpal@tarams.com','Markating','markating','What is the future of marketing?','what-is-the-future-of-marketing','','2013-06-14 11:42:56','2013-06-14 11:42:56'),(30,1,127,'gaurav.nagpal@tarams.com','Markating','markating','What is buzz marketing?','what-is-buzz-marketing','','2013-06-14 12:17:50','2013-06-14 12:17:50'),(31,1,133,'gaurav.nagpal@tarams.com','Sports','sports','What are the greatest trades in sports history?','what-are-the-greatest-trades-in-sports-history','','2013-06-14 12:21:40','2013-06-14 12:21:40'),(32,1,136,'gaurav.nagpal@tarams.com','Sports','sports','What are the biggest professional sports rivalries?','what-are-the-biggest-professional-sports-rivalries','','2013-06-14 12:23:28','2013-06-14 12:23:28');
/*!40000 ALTER TABLE `quora_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quora_questionstream`
--

DROP TABLE IF EXISTS `quora_questionstream`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quora_questionstream` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modified_by_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `operation` varchar(1) NOT NULL,
  `modified_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `modified_by_id_refs_id_f8801d9d` (`modified_by_id`),
  KEY `question_id_refs_id_1edf6696` (`question_id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quora_questionstream`
--

LOCK TABLES `quora_questionstream` WRITE;
/*!40000 ALTER TABLE `quora_questionstream` DISABLE KEYS */;
INSERT INTO `quora_questionstream` VALUES (1,1,1,'A','2013-06-14 09:12:02'),(2,1,1,'C','2013-06-14 09:12:18'),(3,1,1,'C','2013-06-14 09:12:31'),(4,1,2,'A','2013-06-14 09:19:54'),(5,1,2,'C','2013-06-14 09:20:14'),(6,1,2,'C','2013-06-14 09:20:23'),(7,1,2,'C','2013-06-14 09:20:31'),(8,1,3,'A','2013-06-14 09:22:40'),(9,1,3,'C','2013-06-14 09:22:53'),(10,1,4,'A','2013-06-14 09:26:07'),(11,1,4,'C','2013-06-14 09:26:21'),(12,1,6,'A','2013-06-14 09:29:11'),(13,1,6,'C','2013-06-14 09:29:44'),(14,1,6,'C','2013-06-14 09:29:59'),(15,1,6,'C','2013-06-14 09:30:06'),(16,1,6,'C','2013-06-14 09:30:13'),(17,1,7,'A','2013-06-14 09:33:36'),(18,1,8,'A','2013-06-14 09:34:42'),(19,1,8,'C','2013-06-14 09:34:59'),(20,1,8,'C','2013-06-14 09:35:08'),(21,1,8,'C','2013-06-14 09:35:15'),(22,1,8,'C','2013-06-14 09:35:27'),(23,1,8,'C','2013-06-14 09:35:34'),(24,1,9,'A','2013-06-14 09:41:38'),(25,1,10,'A','2013-06-14 09:45:26'),(26,1,11,'A','2013-06-14 09:47:35'),(28,1,14,'A','2013-06-14 11:17:43'),(29,1,15,'A','2013-06-14 11:19:23'),(30,1,16,'A','2013-06-14 11:21:41'),(31,1,16,'C','2013-06-14 11:22:04'),(32,1,16,'C','2013-06-14 11:22:11'),(33,1,16,'C','2013-06-14 11:22:20'),(34,1,16,'C','2013-06-14 11:22:36'),(35,1,16,'C','2013-06-14 11:22:46'),(36,1,17,'A','2013-06-14 11:24:10'),(37,1,18,'A','2013-06-14 11:27:08'),(38,1,18,'C','2013-06-14 11:27:29'),(40,1,20,'A','2013-06-14 11:29:59'),(41,1,20,'C','2013-06-14 11:30:14'),(42,1,21,'A','2013-06-14 11:31:35'),(43,1,22,'A','2013-06-14 11:33:06'),(44,1,22,'C','2013-06-14 11:33:26'),(45,1,22,'C','2013-06-14 11:33:37'),(46,1,22,'C','2013-06-14 11:33:44'),(47,1,22,'C','2013-06-14 11:33:50'),(48,1,23,'A','2013-06-14 11:34:58'),(49,1,23,'C','2013-06-14 11:35:53'),(50,1,24,'A','2013-06-14 11:36:32'),(51,1,25,'A','2013-06-14 11:37:18'),(52,1,25,'C','2013-06-14 11:37:26'),(53,1,26,'A','2013-06-14 11:38:26'),(54,1,26,'C','2013-06-14 11:38:51'),(55,1,27,'A','2013-06-14 11:40:04'),(56,1,27,'C','2013-06-14 11:40:15'),(57,1,27,'C','2013-06-14 11:40:23'),(58,1,28,'A','2013-06-14 11:41:10'),(59,1,28,'C','2013-06-14 11:41:17'),(60,1,28,'C','2013-06-14 11:41:22'),(61,1,29,'A','2013-06-14 11:42:56'),(62,1,30,'A','2013-06-14 12:17:50'),(63,1,31,'A','2013-06-14 12:21:41'),(64,1,31,'C','2013-06-14 12:21:59'),(65,1,31,'C','2013-06-14 12:22:05'),(66,1,31,'C','2013-06-14 12:22:17'),(67,1,32,'A','2013-06-14 12:23:28'),(68,1,32,'C','2013-06-14 12:23:48');
/*!40000 ALTER TABLE `quora_questionstream` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quora_topic`
--

DROP TABLE IF EXISTS `quora_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quora_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `topic` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `picture` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quora_topic`
--

LOCK TABLES `quora_topic` WRITE;
/*!40000 ALTER TABLE `quora_topic` DISABLE KEYS */;
INSERT INTO `quora_topic` VALUES (1,'Rats','Rats','topic_pics/rat.jpg'),(2,'Ranbir Kapoor','Ranbir Kapoor','topic_pics/Ranbir-Kapoor-IN-Rocket-Singh-Salesman-of-the-Year.jpg'),(3,'Reading','Reading','topic_pics/reading.jpg'),(4,'Rose','Rose','topic_pics/Red-Roses-Buke-10.jpg'),(5,'Running','Running','topic_pics/RulesOfRunning.jpg'),(6,'Sachin','Sachin','topic_pics/sachin.jpg'),(7,'Shakira','Shakira','topic_pics/shakira.jpg'),(8,'Songs','Songs','topic_pics/songs.jpg'),(9,'Steve Jobs','Steve Jobs','topic_pics/steve-jobs.jpg'),(10,'Science','Scienceq','topic_pics/image_science_globe.gif'),(11,'Mathematics','Mathematics','topic_pics/mathematics.jpg'),(12,'Music','Music','topic_pics/music.jpg'),(13,'Money','Money','topic_pics/moneystack.jpg'),(14,'Markating','Markating','topic_pics/markating.jpg'),(15,'Movies','Movies','topic_pics/the-movies.jpg'),(16,'Sports','Sports','topic_pics/d_sports_logo.jpg');
/*!40000 ALTER TABLE `quora_topic` ENABLE KEYS */;
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

-- Dump completed on 2013-06-14 18:03:28
