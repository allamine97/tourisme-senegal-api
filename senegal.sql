-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 16 mars 2021 à 15:18
-- Version du serveur :  5.7.23
-- Version de PHP :  7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `senegal`
--

-- --------------------------------------------------------

--
-- Structure de la table `cultures`
--

DROP TABLE IF EXISTS `cultures`;
CREATE TABLE IF NOT EXISTS `cultures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(120) NOT NULL,
  `url_photo` varchar(120) DEFAULT NULL,
  `nom` varchar(120) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cultures`
--

INSERT INTO `cultures` (`id`, `type`, `url_photo`, `nom`, `description`) VALUES
(1, 'ETHNIE', '', ' Wolofs et Lebous', 'L\'ethnie  Wolofs et Lebous compte une population d\'environ 5 208 000, ce qui correspond à  39,7 % de la population nationale. Leur langue maternelle est le  wolof.'),
(2, 'ETHNIE', '', 'Peuls, Poulars, Fula, Toucouleurs,', 'L\'ethnie  Peuls, Poulars, Fula, Toucouleurs,  compte une population d\'environ 3 452 000, ce qui correspond à  26,3 % de la population nationale. Leur langue maternelle est le  peul.');

-- --------------------------------------------------------

--
-- Structure de la table `persons`
--

DROP TABLE IF EXISTS `persons`;
CREATE TABLE IF NOT EXISTS `persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(120) NOT NULL,
  `domaine` varchar(120) NOT NULL,
  `description` varchar(255) NOT NULL,
  `biographie` text,
  `date_naissance` varchar(120) DEFAULT NULL,
  `date_deces` varchar(120) DEFAULT NULL,
  `url_photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `persons`
--

INSERT INTO `persons` (`id`, `nom`, `domaine`, `description`, `biographie`, `date_naissance`, `date_deces`, `url_photo`) VALUES
(1, 'Baye Niass', 'Religion', 'Marabout, Religieux (Religion).', 'Biographie Ibrahima Baye Niass est un marabout (islam) de la confrérie des Tidjanes. Il est le fils du marabout El Hadji Abdoulaye Niasse. Il est né en 1900 à Kaolack. Il est le troisiéme calife de cette confrérie et créa une école de pensée spirituelle nomée la TarbiyyaLa ville de Kaolack est devenu une ville sainte pour les Tidjanes et lieu de pelerinage.Sa mère, Sokhna Astou Diankha aurait eu un rêve lorsqu\'elle était enceinte, dont l\'objet était la délivrance du futur Cheikh al-Islam. Elle en parla à son mari qui lui dit de n\'en parler à personne.Dans l\'introduction de son recueil panégyrique sur le Prophète, imprimé pour la première fois à Ibadan au Nigeria, Cheikh Al Islam Ibrahima Boun Abdallahi At-Tijani Al Kawlakhi As-Seneghali décrit sa lignée: Ibrahimfils de Abdallahfils de Seyyidi Muhammadfils de Madembafils de Bakaryfils deMuhammad Al Aminfils de Sambafils de Ridafils de ChamsouDine Missinafils de Ahmadfils de Abiboullah fils de Rida s de Ibrahima fils de As-Siddiqfils de Ibn Naafiahfils de Qaysfils de \'Aqilfils de Amr.Leur origine sénégalaise provient de la princesse ou linguere du Djolof la nommé Djeyla Niass de laquelle ils ont tous herité ce nom de famille à la sénégalaise. Une étude succincte sur les écrits de trois plus grandes renommées de la famille temoignent cela à l\'instar de :Cheikhal Islam Hajj Ibrahim Niass, connu sous Baye NiassCheikh Mouhammad al Khalifa Niass, le demi-frère de ce dernier, l\'aîné de la famille de Hajj Abdallah NiassCheikh Mouhammad Zeynab Niass célèbre pour sa missive éloquente auprès du gouverneur égyptien lors d\'un pelerinage aux liens saints de l\'Islam via l\'Égypte. Source : fr.wikipedia.org', '--', '--', 'https://www.jesuismort.com/img/celebrite/visage/baye-niass.jpg'),
(2, 'Oumar Tall', 'Histoire, Politique, Religion', 'Souverain sénégalais et érudit musulman, fondateur de l\'Empire toucouleur (une partie de l\'actuel Mali).', 'Biographie El Hadj Oumar Tall (Umar al-Fûtî ou Omar Seydou Tall) est un conquérant et souverain Toucouleur, né à Halwar, près de Podor, dans le Fouta-Toro (dans l\'actuel Sénégal) en 1797 et décédé à Deguembéré (près de Bandiagara, actuel Mali) en 1864. Il est le fondateur de l\'Empire toucouleur.Né en 1797 à Halwar près de Podor, il a commencé à approfondir sa connaissance de l\'islam grâce à Abd el-Karim, un lettré musulman originaire du Fouta-Djalon, membre de la confrérie Tidjaniya. À partir de 1827 et pendant dix-huit ans, Omar Seydou tall entreprend plusieurs voyages. Il se rend à Hamdallaye sur le Niger où il rencontre Amadou Cheikhou, puis séjourne plusieurs mois à Sokoto à la cour de Mohammed Bello. Il traverse ensuite le Fezzan et se rend au Caire avant d\'atteindre La Mecque où il reçoit les titres d\'El Hadj et de Calife de la confrérie soufi Tidjane pour le Soudan (1828). Il séjourne ensuite à l\'Université al-Azhar du Caire, puis chez le sultan du Bornou dont il épouse une fille, à la cour de Mohammed Bello dont il épouse également une fille, enfin à Hamdallaye chez Amadou Cheikhou, qui cette fois-ci l\'accueille beaucoup moins favorablement. Puis il est emprisonné par le roi animiste bambara de Ségou. Lorsqu\'il est relâché, il se rend dans le Fouta-Djalon où l\'almami l\'autorise à créer une zaouïa (1841). Pendant treize ans, il prêche la doctrine de la Tidjaniya d\'abord au Fouta-Djalon, puis à Dinguiraye (actuelle Guinée) en 1848A Dinguiraye, il prépare le djihad (guerre sainte). Il acquiert une réputation de saint et rassemble de nombreux disciples qui formeront les cadres de son armée. Son armée, équipée d\'armes légères européennes reçues de trafiquants britanniques de Sierra Leone, s\'attaque à plusieurs régions malinkées à partir de 1850. Il occupe sans difficulté les territoires du Mandingueet du Bambouk (1853), puis attaque les Bambaras Massassi dont il prend la capitale Nioro (1854). En 1856, il annexe le royaume bambara du Kaarta et réprime sévèrement les révoltes.Luttant contre l\'armée coloniale française, il fait construire un tata (une fortification) à Koniakary (77 Km à  l\'ouest de Kayes). En avril 1857, il déclare la guerre contre le royaume du Khasso et assiège le fort de Médine, qui sera libéré par les troupes de Louis Faidherbe le 18 juillet 1857.Entre 1858 et 1861, El Hadj Oumar Tall s\'attaque aux royaumes bambaras de Kaarta et de Ségou. Le 10 mars 1861, il conquiert Ségou qu\'il confie un an plus tard à son fils Ahmadou pour partir à la conquête d\'Hamdallaye, capitale de l\'Empire peul du Macina qui tombera le 16 mars 1862 après trois batailles faisant plus de 70 000 morts. Obligé de se réfugier dans les grottes de Deguembéré, près de Bandiagara, il disparait dans une grotte le 12 février 1864. Son neveu Tidiani Tall sera son successeur et installera la capitale de l\'Empire Toucouleur à Bandiagara. Son fils Ahmadou Tall règne à Ségou, jusqu\'à l\'occupation française en 1893.Mû par l\'idéologie universaliste de l\'islam et par un projet de rénovation égalitaire de la société, El Hadj Oumar encourage le libéralisme de la confrérie Tidjaniya, dont il est le représentant, et se promet d\'imposer une « fraternité transcendante » aux peuples du Soudan occidental.El Hadj Oumar gouverne ses États comme une théocratie, assisté par un conseil comprenant quelques grands marabouts, certains de ses frères et des compagnons de pèlerinage. La loi coranique est le principe fondamental du gouvernement. Sur le plan administratif, El Hadj Oumar s\'inspire du modèle égypto-turc avec la division du pouvoir en en un gouverneur civil (pacha) et un gouverneur militaire (bey). Chaque province dispose d\'une puissante forteresse (tata) commandée par un chef militaire dirigeant une importante garnison.El Hadj Oumar est aussi un personnage de légende, dont s\'empara l\'imagination populaire : plusieurs récits merveilleux circulèrent et circulent encore à son sujet. Au Sénégal, El Hadj Oumar Tall est perçu comme un résistant, au Mali, d\'après David Robinson il serait vécu comme l\'envahisseur qui fit le lit de la conquête européenne. En tout cas sa mémoire reste vive en milieu haalpular (nord du Sénégal) où porter le nom de Tall reste prestigieux, surtout si l\'on peut se dire son descendant. Source : fr.wikipedia.org', '1796', '12 février 1864', 'https://www.jesuismort.com/img/celebrite/visage/oumar-tall.jpg'),
(3, 'Thione Seck', 'Art, Musique, World music', 'Chanteur sénégalais de mbalakh, a fondé le groupe Raam Daam dans les années 1980, un groupe de pur mbalax (genre né de la rencontre entre plusieurs rythmes locaux, le chant, le funk et parfois le reggae).', 'Biographie Thione \"Ballago\" Seck, né le 12 mars 1955 à Dakar et mort le 14 mars 2021 dans la même ville, est un chanteur sénégalais de mbalakh. Il avait fondé, dans les années 1980, Raam Daam, un groupe de pur mbalax, genre né de la rencontre entre plusieurs rythmes locaux, le chant, le funk et parfois le reggae.Né en 1955 à Dakar, Thione Seck est issu d\'une famille de griots wolof (musiciens traditionnels). Son arrière-grand-père était chanteur à la cour de Lat Dior, célèbre damel (roi) du Cayor et résistant notoire à la colonisation française. Il participe donc naturellement dès l\'enfance aux cérémonies et aux fêtes traditionnelles comme chanteur et percussionniste. Puis, il devient membre du groupe dakarois Star Band. Étant percussionniste, il intègre le grand orchestre Orchestra Baobab.Thione Seck travaille ensuite avec l\'orchestre Orchestra Baobab. En 1984, le chanteur forme avec son cousin un duo appelé Raam Daan qui livre un premier album. Juin 1987, Thione Seck effectue avec le Raam Daan une première tournée européenne avec AKAN Productions (Félix Anagonou) et produit dans la foulée avec son tourneur l\'album Le pouvoir d\'un coeur pur. À l\'issue d\'une deuxième tournée européenne en 1988, Thione Seck produit avec son tourneur Félix Anagonou l\'album Dieulleul.... En 1996, le producteur sénégalais Ibrahima Sylla entreprend de le produire. Thione Seck sortira trois albums sous le label Syllart. Dont l\'album Orientissime qui fut acclamé par la presse, album-concept enregistré entre Dakar, Le Caire et Bombay. L\'album enregistré dès 2003 fut une idée du producteur Ibrahima Sylla.En mai 2015, à 60 ans, il est inculpé par la justice sénégalaise. Thione Seck est arrêté par la gendarmerie le 27 mai au soir à son domicile à Dakar, et placé en garde à vue dans le cadre d\'une enquête sur une affaire de faux billets et de transactions douteuses en devises étrangères, impliquant ses entourages professionnel et familial. Outre de fortes sommes en faux billets d\'euros et de francs CFA, la perquisition conduite chez lui permet de découvrir 50 millions d’euros. Le 2 juin 2015, il est placé sous mandat de dépôt et rejoint la prison centrale de Rebeuss au centre de Dakar. Thione Seck dément toute participation à ces opérations, se disant au contraire la victime de faussaires.Le 12 février 2016, il bénéficie d\'une mesure de liberté provisoire pour raisons médicales et continue de se dire victime d’une escroquerie. En mars 2016, son fils Seydina Alioune Seck est incarcéré à son tour car soupçonné d\'être mêlé à la même affaire que son père. Selon son avocat Ousmane Sèye, « la Cour suprême du Sénégal […]a annulé toute la procédure et a totalement blanchi [Thione Seck], par ordonnance rendue le 4 mars [2021] », ce qu’aucune autre source ne confirme pour l’instant.Thione Seck est mort le dimanche 14 mars 2021, à l\'âge de 66 ans, des suites d’une courte maladie, à Dakar (Sénégal). Il est inhumé au cimetière musulman de Yoff, à Dakar. Source : fr.wikipedia.org', '12 mars 1955', 'Dimanche 14 mars 2021', 'https://www.jesuismort.com/img/celebrite/visage/thione-seck.jpg'),
(4, 'Papa Bouba Diop', 'Football, Sport, Sport collectif', 'Footballeur sénégalais, évoluant au poste de milieu, il avait inscrit le seul but de France-Sénégal lors de la Coupe du monde 2002.', 'Biographie Papa Bouba Diop, né le 28 janvier 1978 à Dakar (Sénégal) et mort le 29 novembre 2020 en France, est un footballeur international sénégalais. Il évolue au poste de milieu. Il avait inscrit le seul but de France-Sénégal lors de la Coupe du monde 2002.Il a commencé le football à 5 ans, tout comme son frère Lamine. Aimant jouer dans les rues de Dakar, il progresse au poste de milieu de terrain en jouant au club de Ndeffann Saltigue à partir de 1994 avant de rejoindre l\'équipe junior de l\'ASC Diaraf l\'année suivante.En 1996, ses progrès au sein de l\'équipe senior de l\'ASC Diaraf sont remarqués et il est appelé en équipe du Sénégal junior. Ses performances lui permettent d\'espérer poursuivre son rêve de départ en Europe. Il a alors des contacts avec club arabes et suisses.En 1999, son frère arrange son arrivée au club de Neuchâtel Xamax. Il doit malgré tout passer par le club de Vevey-Sports, en 1re ligue (D3), pour s’acclimater au football et à son nouveau pays. Dans son petit appartement, l\'adaptation est difficile mais il fait une bonne saison pleine (35 matchs). Il arrive alors en juin 2000 à Neuchâtel. Après avoir été placé en attaque, il est rapidement replacé milieu de terrain et devient rapidement l\'un des titulaires indiscutables du club. Après quelques mois et 19 matchs de championnats, il est recruté par Grasshopper. Il trouve sa place dans l\'effectif zurichois et devient Champion de Suisse 2001.Il fait ses débuts lors du 3e tour préliminaire de Ligue des Champions contre le FC Porto. Le début de saison est plutôt bon et il est repéré par le RC Lens, notamment grâce à son impressionnant match de 16e de finale de Coupe UEFA contre Leeds United (1-2 puis 2-2). Les 2 clubs se mettent d\'accord pour un transfert début janvier 2002 pour un prix de 3,6 millions d\'euros.Arrivé en janvier 2002 avec un contrat portant sur cinq ans et demie, il ne joue que 5 matchs en 6 mois mais aide le club à être vice-champion de France 2002. Par la suite, Papa Bouba Diop deviendra un joueur régulier du RC Lens, ayant une très grosse frappe de balle, mais aussi grâce à son puissant physique très impressionnant lui permettant de prendre beaucoup de ballon dans le domaine aérien, autant dans le secteur de jeu défensif, qu\'offensif en marquant des buts de la tête.De plus, jouant en club avec des joueurs qu\'il fréquente en sélection nationale du Sénégal ( El-Hadji Diouf, Pape Sarr, Ferdinand Coly, etc. ), Papa Bouba Diop réalise d\'excellentes performances en Ligue 1, au point de se faire repérer par les clubs anglais, intéressés par son puissant physique taillé pour la Premier League.Papa Bouba Diop fut un joueur très apprécié par de très nombreux supporteurs du RC Lens.Après s\'être établi dans le championnat anglais en jouant pour Fulham (2004-2007), puis Portsmouth (2007-2010). En mai 2010, une offre du club grec de l\'AEK Athènes lui est faite, avec un salaire net de 700 000 euros par an. Il la refuse tout d\'abord, mais finalement il signe en juillet 2010 avec le club grec pour deux ans et un salaire de 800 000 euros par an.Bouba Diop retrouve l\'Angleterre fin août 2011 en s\'engageant pour un an, avec option d\'une année supplémentaire, à West Ham United.Le 9 octobre 2012, il signe en faveur de Birmingham City un contrat d\'une durée d\'un mois.Au sein de l\'équipe nationale sénégalaise, il a marqué le but victorieux contre la France lors du match d\'ouverture de la Coupe du monde de 2002. Auteur de deux autres buts lors de cette coupe du monde où le Sénégal ne s\'est arrêté qu\'en quart de finale, il fait partie selon le journal Le Monde d\'une liste de onze jeunes joueurs qui se sont révélés au cours de cette coupe du monde et qui doivent confirmer à l\'avenir.Il est le meilleur buteur sénégalais en phase finale de coupe du monde avec 3 réalisations.Papa Bouba Diop est mort le dimanche 29 novembre 2020 en France, à l\'âge de 42 ans, de la maladie de Carcot, en France. Source : fr.wikipedia.org', 'Samedi 28 janvier 1978', 'Dimanche 29 novembre 2020', 'https://www.jesuismort.com/img/celebrite/visage/papa-bouba-diop.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `sites`
--

DROP TABLE IF EXISTS `sites`;
CREATE TABLE IF NOT EXISTS `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(120) NOT NULL,
  `note` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `lieu` varchar(255) DEFAULT NULL,
  `url_photo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `sites`
--

INSERT INTO `sites` (`id`, `nom`, `note`, `description`, `lieu`, `url_photo`) VALUES
(1, 'Lac Rose', 4, 'Lac rose forte teneur en sels', NULL, NULL),
(2, 'ile de Goree', 5, 'Maison des Esclaves et fort dEstres', NULL, NULL),
(3, 'Maison des esclaves', 4, 'Musée sur la traite négriére atlantique', NULL, NULL),
(4, 'Parc national des oiseaux du Djoudj', 2, 'Zone humide avec animaux sauvages et oiseaux', NULL, NULL),
(5, 'Parc national du Niokolo-Koba', 3, 'Vaste parc, animaux voie de disparition', NULL, NULL),
(6, 'Monument de la Renaissance Africaine', 7, 'Statue la plus haute dAfrique, bronze', NULL, NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
