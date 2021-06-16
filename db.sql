/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE TABLE IF NOT EXISTS "assetindexdata" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''assetindexdata_id_seq''::regclass)',
	"sessionId" VARCHAR(36) NOT NULL DEFAULT '',
	"volumeId" INTEGER NOT NULL,
	"uri" TEXT NULL DEFAULT NULL,
	"size" BIGINT NULL DEFAULT NULL,
	"timestamp" TIMESTAMP NULL DEFAULT NULL,
	"recordId" INTEGER NULL DEFAULT NULL,
	"inProgress" BOOLEAN NULL DEFAULT 'false',
	"completed" BOOLEAN NULL DEFAULT 'false',
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_rmfdvefpikbtizcuhpxtfakecwkuutchtuvu" ("volumeId"),
	INDEX "idx_nwtoissbdoqmwxaxhbyqmwlfnlxoverynbia" ("sessionId", "volumeId"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_bjzxngbqmipjuchkskvoceteblhkrajyousp" FOREIGN KEY ("volumeId") REFERENCES "public"."volumes" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

DELETE FROM "assetindexdata";
/*!40000 ALTER TABLE "assetindexdata" DISABLE KEYS */;
/*!40000 ALTER TABLE "assetindexdata" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "assets" (
	"id" INTEGER NOT NULL,
	"volumeId" INTEGER NULL DEFAULT NULL,
	"folderId" INTEGER NOT NULL,
	"uploaderId" INTEGER NULL DEFAULT NULL,
	"filename" VARCHAR(255) NOT NULL,
	"kind" VARCHAR(50) NOT NULL DEFAULT 'unknown',
	"width" INTEGER NULL DEFAULT NULL,
	"height" INTEGER NULL DEFAULT NULL,
	"size" BIGINT NULL DEFAULT NULL,
	"focalPoint" VARCHAR(13) NULL DEFAULT 'NULL::character varying',
	"deletedWithVolume" BOOLEAN NULL DEFAULT NULL,
	"keptFile" BOOLEAN NULL DEFAULT NULL,
	"dateModified" TIMESTAMP NULL DEFAULT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_wgenqgpodtuhkqnckkuuortfqnnqynvzjqcz" ("volumeId"),
	INDEX "idx_uhbhhofgupwsnxiwtfygxsysircrcbrgywtt" ("folderId"),
	INDEX "idx_qmcccvpqbpsduuttcxmmnuetrgvvfjvtsxec" ("filename", "folderId"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_akekblfpqnfebxguzisrcoptkfebifsggltr" FOREIGN KEY ("folderId") REFERENCES "public"."volumefolders" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "fk_hxofvcdfghwkivchhtdfunoqofjcudtmhhvr" FOREIGN KEY ("id") REFERENCES "public"."elements" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "fk_ogdhopbyxduubkjtnascpcakaznwwdivekjc" FOREIGN KEY ("volumeId") REFERENCES "public"."volumes" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "fk_vmcajydsjnxpowtueficlzvjuyxuhyhhvkxt" FOREIGN KEY ("uploaderId") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE SET NULL
);

DELETE FROM "assets";
/*!40000 ALTER TABLE "assets" DISABLE KEYS */;
/*!40000 ALTER TABLE "assets" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "assettransformindex" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''assettransformindex_id_seq''::regclass)',
	"assetId" INTEGER NOT NULL,
	"filename" VARCHAR(255) NULL DEFAULT NULL,
	"format" VARCHAR(255) NULL DEFAULT NULL,
	"location" VARCHAR(255) NOT NULL,
	"volumeId" INTEGER NULL DEFAULT NULL,
	"fileExists" BOOLEAN NOT NULL DEFAULT 'false',
	"inProgress" BOOLEAN NOT NULL DEFAULT 'false',
	"error" BOOLEAN NOT NULL DEFAULT 'false',
	"dateIndexed" TIMESTAMP NULL DEFAULT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_nmkqertjztmhzpgxxyqwodkyjuizjcjmwttg" ("volumeId", "assetId", "location"),
	PRIMARY KEY ("id")
);

DELETE FROM "assettransformindex";
/*!40000 ALTER TABLE "assettransformindex" DISABLE KEYS */;
/*!40000 ALTER TABLE "assettransformindex" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "assettransforms" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''assettransforms_id_seq''::regclass)',
	"name" VARCHAR(255) NOT NULL,
	"handle" VARCHAR(255) NOT NULL,
	"mode" VARCHAR(255) NOT NULL DEFAULT 'crop',
	"position" VARCHAR(255) NOT NULL DEFAULT 'center-center',
	"width" INTEGER NULL DEFAULT NULL,
	"height" INTEGER NULL DEFAULT NULL,
	"format" VARCHAR(255) NULL DEFAULT NULL,
	"quality" INTEGER NULL DEFAULT NULL,
	"interlace" VARCHAR(255) NOT NULL DEFAULT 'none',
	"dimensionChangeTime" TIMESTAMP NULL DEFAULT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_nbhjrqdtkbcaubwrokxydykdanznnzoppldo" ("handle"),
	INDEX "idx_amsrzbiyranoqiatbnakjiirglicysgpcumc" ("name"),
	PRIMARY KEY ("id")
);

DELETE FROM "assettransforms";
/*!40000 ALTER TABLE "assettransforms" DISABLE KEYS */;
/*!40000 ALTER TABLE "assettransforms" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "categories" (
	"id" INTEGER NOT NULL,
	"groupId" INTEGER NOT NULL,
	"parentId" INTEGER NULL DEFAULT NULL,
	"deletedWithGroup" BOOLEAN NULL DEFAULT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_sdzevsvzgthasaqyddddioiwtbmxacqvndyq" ("groupId"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_dtehiezykhltqduvhhaxlztwdlzpwfebarjp" FOREIGN KEY ("id") REFERENCES "public"."elements" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "fk_jeqrfyqsyexmcrghdawmtrkbupakczzgcntr" FOREIGN KEY ("groupId") REFERENCES "public"."categorygroups" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "fk_qvfcstzqdteolubmmtjdjdagfbwwivvecdjk" FOREIGN KEY ("parentId") REFERENCES "public"."categories" ("id") ON UPDATE NO ACTION ON DELETE SET NULL
);

DELETE FROM "categories";
/*!40000 ALTER TABLE "categories" DISABLE KEYS */;
/*!40000 ALTER TABLE "categories" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "categorygroups" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''categorygroups_id_seq''::regclass)',
	"structureId" INTEGER NOT NULL,
	"fieldLayoutId" INTEGER NULL DEFAULT NULL,
	"name" VARCHAR(255) NOT NULL,
	"handle" VARCHAR(255) NOT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"dateDeleted" TIMESTAMP NULL DEFAULT 'NULL::timestamp without time zone',
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_zhokpwhxhyhqjdfqrhlvvuwbkuhvimzpmasf" ("dateDeleted"),
	INDEX "idx_xejgmjahokgwylsrwvnuzqxeoupwscvefisg" ("fieldLayoutId"),
	INDEX "idx_cmimcwjkozrlznpbpunflmnxcnuzwrrzckef" ("structureId"),
	INDEX "idx_mglhaggxidbuqxviyzgyiwfyhpgkucnyqmeh" ("handle"),
	INDEX "idx_vqumxgtparjgwoenqcznzyithvtaxojxkvxg" ("name"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_bthgjanysqyiqishldcgkrnihqguegrnodzl" FOREIGN KEY ("structureId") REFERENCES "public"."structures" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "fk_flkcklgakfokkpasryrexgpatbfdwcarzeci" FOREIGN KEY ("fieldLayoutId") REFERENCES "public"."fieldlayouts" ("id") ON UPDATE NO ACTION ON DELETE SET NULL
);

DELETE FROM "categorygroups";
/*!40000 ALTER TABLE "categorygroups" DISABLE KEYS */;
/*!40000 ALTER TABLE "categorygroups" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "categorygroups_sites" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''categorygroups_sites_id_seq''::regclass)',
	"groupId" INTEGER NOT NULL,
	"siteId" INTEGER NOT NULL,
	"hasUrls" BOOLEAN NOT NULL DEFAULT 'true',
	"uriFormat" TEXT NULL DEFAULT NULL,
	"template" VARCHAR(500) NULL DEFAULT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_mvumwcaectevtcxkfikqxproqghcfzbzcrcb" ("siteId"),
	UNIQUE INDEX "idx_hjhxzpdoosonvnweobafwssumfoitfdubhfd" ("groupId", "siteId"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_kmeeukuqrdzwlaaaigprofmnsnrqmnzefvbp" FOREIGN KEY ("siteId") REFERENCES "public"."sites" ("id") ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT "fk_vqijelkdnydiyltexqootnwgldjqazvfmdxh" FOREIGN KEY ("groupId") REFERENCES "public"."categorygroups" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

DELETE FROM "categorygroups_sites";
/*!40000 ALTER TABLE "categorygroups_sites" DISABLE KEYS */;
/*!40000 ALTER TABLE "categorygroups_sites" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "changedattributes" (
	"elementId" INTEGER NOT NULL,
	"siteId" INTEGER NOT NULL,
	"attribute" VARCHAR(255) NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"propagated" BOOLEAN NOT NULL,
	"userId" INTEGER NULL DEFAULT NULL,
	INDEX "idx_zjzqeehemfquegunriwqqlkhddykjnwibwzp" ("elementId", "siteId", "dateUpdated"),
	PRIMARY KEY ("elementId", "siteId", "attribute"),
	CONSTRAINT "fk_ergxkfnnaqjizhvnkhhxbvglmcmqrnvjcqrq" FOREIGN KEY ("userId") REFERENCES "public"."users" ("id") ON UPDATE CASCADE ON DELETE SET NULL,
	CONSTRAINT "fk_gcdrsczmbhupdhwalxwjaizanohwjdsbplwy" FOREIGN KEY ("elementId") REFERENCES "public"."elements" ("id") ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT "fk_wmkamtinjklrmchuwuwucljlmnxtwmtfgoxz" FOREIGN KEY ("siteId") REFERENCES "public"."sites" ("id") ON UPDATE CASCADE ON DELETE CASCADE
);

DELETE FROM "changedattributes";
/*!40000 ALTER TABLE "changedattributes" DISABLE KEYS */;
/*!40000 ALTER TABLE "changedattributes" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "changedfields" (
	"elementId" INTEGER NOT NULL,
	"siteId" INTEGER NOT NULL,
	"fieldId" INTEGER NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"propagated" BOOLEAN NOT NULL,
	"userId" INTEGER NULL DEFAULT NULL,
	INDEX "idx_rphjrzuwuwxxelupzxtpxwjgxaqveofbxbgg" ("elementId", "siteId", "dateUpdated"),
	PRIMARY KEY ("elementId", "siteId", "fieldId"),
	CONSTRAINT "fk_abgeefrkroxefhpkcbgcdubxmecmkjegfaev" FOREIGN KEY ("elementId") REFERENCES "public"."elements" ("id") ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT "fk_dkjsnvtidopnpecrpvufnwqtewwnimwbumvi" FOREIGN KEY ("userId") REFERENCES "public"."users" ("id") ON UPDATE CASCADE ON DELETE SET NULL,
	CONSTRAINT "fk_yryffmqbjaxnezvscjepzuhxugfvdxiubloh" FOREIGN KEY ("siteId") REFERENCES "public"."sites" ("id") ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT "fk_zlxwcmpxyzasvdsfjtgkugyahpfhpbsfwkwn" FOREIGN KEY ("fieldId") REFERENCES "public"."fields" ("id") ON UPDATE CASCADE ON DELETE CASCADE
);

DELETE FROM "changedfields";
/*!40000 ALTER TABLE "changedfields" DISABLE KEYS */;
/*!40000 ALTER TABLE "changedfields" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "content" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''content_id_seq''::regclass)',
	"elementId" INTEGER NOT NULL,
	"siteId" INTEGER NOT NULL,
	"title" VARCHAR(255) NULL DEFAULT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_ismdhsdovlhyvlfealnjuoeeysqthjxtzgbi" ("title"),
	INDEX "idx_klfhugjesvpnhbwavmyfmxshgelrcsbbjzfb" ("siteId"),
	UNIQUE INDEX "idx_nfpmpavaaryuhchlnuchjbwsmwltehprayxh" ("elementId", "siteId"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_bfyjcbqdchixjwpgykhyqhgmwfatpgjuynxj" FOREIGN KEY ("siteId") REFERENCES "public"."sites" ("id") ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT "fk_qddcpglsrnaqekeztkmcsmqhpyjgrksilyen" FOREIGN KEY ("elementId") REFERENCES "public"."elements" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

DELETE FROM "content";
/*!40000 ALTER TABLE "content" DISABLE KEYS */;
INSERT INTO "content" ("id", "elementId", "siteId", "title", "dateCreated", "dateUpdated", "uid") VALUES
	(1, 1, 1, NULL, '2021-06-15 16:14:34', '2021-06-15 16:14:34', '7457e34f-d6ce-41e5-8318-a2fc616c5be2');
/*!40000 ALTER TABLE "content" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "craftidtokens" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''craftidtokens_id_seq''::regclass)',
	"userId" INTEGER NOT NULL,
	"accessToken" TEXT NOT NULL,
	"expiryDate" TIMESTAMP NULL DEFAULT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_ffivfoxosbkgdldhanbnxjfnvsxemerovfen" FOREIGN KEY ("userId") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

DELETE FROM "craftidtokens";
/*!40000 ALTER TABLE "craftidtokens" DISABLE KEYS */;
INSERT INTO "craftidtokens" ("id", "userId", "accessToken", "expiryDate", "dateCreated", "dateUpdated", "uid") VALUES
	(1, 1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjYwYzQzMDc4ZDM1YWQ3NGI4ZGEwYjc4YmUzMjFhYWY2ZGQ4OTk3NzNjYjA1ZTI3MjcxNjc2MTFjZDRiMDgzNWM5NjdkYWE1Y2IzYjEwOWU2In0.eyJhdWQiOiI2RHZFcmE3ZXFSS0xZaWM5Zm92eUQyRldGall4UndabiIsImp0aSI6IjYwYzQzMDc4ZDM1YWQ3NGI4ZGEwYjc4YmUzMjFhYWY2ZGQ4OTk3NzNjYjA1ZTI3MjcxNjc2MTFjZDRiMDgzNWM5NjdkYWE1Y2IzYjEwOWU2IiwiaWF0IjoxNjIzNzczODg5LCJuYmYiOjE2MjM3NzM4ODksImV4cCI6MTYyNjM2NTg4OSwic3ViIjoiODkyNTQiLCJzY29wZXMiOlsicHVyY2hhc2VQbHVnaW5zIiwiZXhpc3RpbmdQbHVnaW5zIiwidHJhbnNmZXJQbHVnaW5MaWNlbnNlIiwiZGVhc3NvY2lhdGVQbHVnaW5MaWNlbnNlIl19.ZJME68KiF2qiY5iVvpyZtEtQoXVLDVmxy3Miqs8V_Iyy7kZdjuUGP8HeaaUWbvM4pCM2USYaSDfdA4KV5_3Zseo5k_uXFxmcvW0RwL3hCZD4V4KzJxto3et_BkbqKB1_71V0uZBQd0drlAQzcmmyCCZiqoz9aR00cO8UDqt0llY', '2021-07-15 16:18:14', '2021-06-15 16:18:14', '2021-06-15 16:18:14', 'ab475303-7922-43d9-bb22-0d13582b9316');
/*!40000 ALTER TABLE "craftidtokens" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "deprecationerrors" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''deprecationerrors_id_seq''::regclass)',
	"key" VARCHAR(255) NOT NULL,
	"fingerprint" VARCHAR(255) NOT NULL,
	"lastOccurrence" TIMESTAMP NOT NULL,
	"file" VARCHAR(255) NOT NULL,
	"line" SMALLINT NULL DEFAULT NULL,
	"message" TEXT NULL DEFAULT NULL,
	"traces" TEXT NULL DEFAULT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	UNIQUE INDEX "idx_rqqqmpvxipkhjmbvfarmzaafgphbdcrkkvib" ("key", "fingerprint"),
	PRIMARY KEY ("id")
);

DELETE FROM "deprecationerrors";
/*!40000 ALTER TABLE "deprecationerrors" DISABLE KEYS */;
/*!40000 ALTER TABLE "deprecationerrors" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "drafts" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''drafts_id_seq''::regclass)',
	"sourceId" INTEGER NULL DEFAULT NULL,
	"creatorId" INTEGER NULL DEFAULT NULL,
	"name" VARCHAR(255) NOT NULL,
	"notes" TEXT NULL DEFAULT NULL,
	"trackChanges" BOOLEAN NOT NULL DEFAULT 'false',
	"dateLastMerged" TIMESTAMP NULL DEFAULT NULL,
	"saved" BOOLEAN NOT NULL DEFAULT 'true',
	INDEX "idx_mlmnxfjngamgyspmmapyfysxbvxnyaxsuixd" ("saved"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_guluqjhrmxbpzshteyxkeamvjfnvralbqyxq" FOREIGN KEY ("sourceId") REFERENCES "public"."elements" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "fk_zboccaafolctochtfdnpcjtqimoilhlnjaac" FOREIGN KEY ("creatorId") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE SET NULL
);

DELETE FROM "drafts";
/*!40000 ALTER TABLE "drafts" DISABLE KEYS */;
/*!40000 ALTER TABLE "drafts" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "elementindexsettings" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''elementindexsettings_id_seq''::regclass)',
	"type" VARCHAR(255) NOT NULL,
	"settings" TEXT NULL DEFAULT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	UNIQUE INDEX "idx_zrmhkratmuxrvdjxnotwluazfoaeryazesgw" ("type"),
	PRIMARY KEY ("id")
);

DELETE FROM "elementindexsettings";
/*!40000 ALTER TABLE "elementindexsettings" DISABLE KEYS */;
/*!40000 ALTER TABLE "elementindexsettings" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "elements" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''elements_id_seq''::regclass)',
	"draftId" INTEGER NULL DEFAULT NULL,
	"revisionId" INTEGER NULL DEFAULT NULL,
	"fieldLayoutId" INTEGER NULL DEFAULT NULL,
	"type" VARCHAR(255) NOT NULL,
	"enabled" BOOLEAN NOT NULL DEFAULT 'true',
	"archived" BOOLEAN NOT NULL DEFAULT 'false',
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"dateDeleted" TIMESTAMP NULL DEFAULT 'NULL::timestamp without time zone',
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_vzdhpjunsyqfsvslrnzzdbpcvjjmjbmmumqi" ("archived", "dateDeleted", "draftId", "revisionId"),
	INDEX "idx_qjpjapjdaupzgcceurtompcrangmviyhhcxz" ("archived", "dateCreated"),
	INDEX "idx_ssszjearzwvalxrrlhcqkbnbocsdlsjrrajp" ("enabled"),
	INDEX "idx_acukcypqxixpzgdwuwzbobbdrmwvvdddocqi" ("type"),
	INDEX "idx_wuwvwtpdbjujyauqsmbyzceastrslnceblpx" ("fieldLayoutId"),
	INDEX "idx_jlbzgnhkbommxlzajtukqgnclqqxdtagwqwv" ("dateDeleted"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_iltimopthialcilgevvbvzwupdrnsvjuvzyw" FOREIGN KEY ("fieldLayoutId") REFERENCES "public"."fieldlayouts" ("id") ON UPDATE NO ACTION ON DELETE SET NULL,
	CONSTRAINT "fk_nqaciuutadohiwcnsncuorlzqllffcvjalcq" FOREIGN KEY ("draftId") REFERENCES "public"."drafts" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "fk_tetauasigaprjomnnlrpcymksekypnizudai" FOREIGN KEY ("revisionId") REFERENCES "public"."revisions" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

DELETE FROM "elements";
/*!40000 ALTER TABLE "elements" DISABLE KEYS */;
INSERT INTO "elements" ("id", "draftId", "revisionId", "fieldLayoutId", "type", "enabled", "archived", "dateCreated", "dateUpdated", "dateDeleted", "uid") VALUES
	(1, NULL, NULL, NULL, 'craft\elements\User', 'true', 'false', '2021-06-15 16:14:34', '2021-06-15 16:14:34', NULL, '6da4c53c-a7bd-4af5-b577-1b491db3b8ad');
/*!40000 ALTER TABLE "elements" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "elements_sites" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''elements_sites_id_seq''::regclass)',
	"elementId" INTEGER NOT NULL,
	"siteId" INTEGER NOT NULL,
	"slug" VARCHAR(255) NULL DEFAULT NULL,
	"uri" VARCHAR(255) NULL DEFAULT NULL,
	"enabled" BOOLEAN NOT NULL DEFAULT 'true',
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_hyufkbujttatbhznwxdjjvyckuttqjkrgzlq" ("siteId"),
	INDEX "idx_cvacdratsltuplfhentdhnugkkcqrctokqmk" ("enabled"),
	INDEX "idx_pebtjvxoomphwgwlaxelyoisariseanzdcrq" ("slug", "siteId"),
	INDEX "idx_adsxcthjkshajugkdkllhvvgmntoblykufjf" ("siteId"),
	UNIQUE INDEX "idx_mhdsracymkmaosjvvzfjixbjuteetmftgaig" ("elementId", "siteId"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_atjdpogncxrinptbsvgatgjbwhyaoxjtogxf" FOREIGN KEY ("elementId") REFERENCES "public"."elements" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "fk_xhwcwenaypjvnpggrfbjzjhudbxgumrbeasz" FOREIGN KEY ("siteId") REFERENCES "public"."sites" ("id") ON UPDATE CASCADE ON DELETE CASCADE
);

DELETE FROM "elements_sites";
/*!40000 ALTER TABLE "elements_sites" DISABLE KEYS */;
INSERT INTO "elements_sites" ("id", "elementId", "siteId", "slug", "uri", "enabled", "dateCreated", "dateUpdated", "uid") VALUES
	(1, 1, 1, NULL, NULL, 'true', '2021-06-15 16:14:34', '2021-06-15 16:14:34', '2557674d-8d04-45cb-9c00-a3339fae7744');
/*!40000 ALTER TABLE "elements_sites" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "entries" (
	"id" INTEGER NOT NULL,
	"sectionId" INTEGER NOT NULL,
	"parentId" INTEGER NULL DEFAULT NULL,
	"typeId" INTEGER NOT NULL,
	"authorId" INTEGER NULL DEFAULT NULL,
	"postDate" TIMESTAMP NULL DEFAULT NULL,
	"expiryDate" TIMESTAMP NULL DEFAULT NULL,
	"deletedWithEntryType" BOOLEAN NULL DEFAULT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_suxlkwroudpjhfchfiqbmbpijtxmmuphqejl" ("typeId"),
	INDEX "idx_pvijjjnmfsvfhhrguiptkubarnazsynaohbj" ("sectionId"),
	INDEX "idx_knwqxoswpebtcnyfyjmcudmiumkqmewvqzkf" ("authorId"),
	INDEX "idx_iwksokjbgtjqpikmkgblrjbwlshtgfmktthq" ("expiryDate"),
	INDEX "idx_saqaqpzdzweopvvlmmcdgcmgnbjhtcvoyutz" ("postDate"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_ifmdzmffmzrnchvxqfocmqnraftdwbxbvsma" FOREIGN KEY ("typeId") REFERENCES "public"."entrytypes" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "fk_lquvuszwaqqqescgohzrnipimpaaxatvcpuc" FOREIGN KEY ("authorId") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE SET NULL,
	CONSTRAINT "fk_nttugorboystgacdcejiqebvaeazlzzuxzir" FOREIGN KEY ("id") REFERENCES "public"."elements" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "fk_ruvuqnvvbhvgbcbhjcmrgdmgnupnwcmkgxbi" FOREIGN KEY ("parentId") REFERENCES "public"."entries" ("id") ON UPDATE NO ACTION ON DELETE SET NULL,
	CONSTRAINT "fk_umxkwsselgoafidvfpumabhxjituoigflycn" FOREIGN KEY ("sectionId") REFERENCES "public"."sections" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

DELETE FROM "entries";
/*!40000 ALTER TABLE "entries" DISABLE KEYS */;
/*!40000 ALTER TABLE "entries" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "entrytypes" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''entrytypes_id_seq''::regclass)',
	"sectionId" INTEGER NOT NULL,
	"fieldLayoutId" INTEGER NULL DEFAULT NULL,
	"name" VARCHAR(255) NOT NULL,
	"handle" VARCHAR(255) NOT NULL,
	"hasTitleField" BOOLEAN NOT NULL DEFAULT 'true',
	"titleTranslationMethod" VARCHAR(255) NOT NULL DEFAULT 'site',
	"titleTranslationKeyFormat" TEXT NULL DEFAULT NULL,
	"titleFormat" VARCHAR(255) NULL DEFAULT NULL,
	"sortOrder" SMALLINT NULL DEFAULT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"dateDeleted" TIMESTAMP NULL DEFAULT 'NULL::timestamp without time zone',
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_mtgaoyjfalqbxcjiqknsggxqokggtpcsjtfq" ("dateDeleted"),
	INDEX "idx_ykcanhxmmyrsbexvpmagjxvrdjjzuesknujv" ("fieldLayoutId"),
	INDEX "idx_xgcjmtvzohcrvshzrpxngqqrwtmjopmxtszv" ("sectionId"),
	INDEX "idx_iyvxbdznnhwnkjkaoroqjaniiyoupxptiwwf" ("handle", "sectionId"),
	INDEX "idx_tehcvsdpbnwiyvfbqbuxbcqsfqfovxkcjjoo" ("name", "sectionId"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_eypdqlomvptitebcnzxpudilhamiwzyvohnt" FOREIGN KEY ("fieldLayoutId") REFERENCES "public"."fieldlayouts" ("id") ON UPDATE NO ACTION ON DELETE SET NULL,
	CONSTRAINT "fk_micmkozixxejhttermhhawziannxjwbpwiag" FOREIGN KEY ("sectionId") REFERENCES "public"."sections" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

DELETE FROM "entrytypes";
/*!40000 ALTER TABLE "entrytypes" DISABLE KEYS */;
/*!40000 ALTER TABLE "entrytypes" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "fieldgroups" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''fieldgroups_id_seq''::regclass)',
	"name" VARCHAR(255) NOT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"dateDeleted" TIMESTAMP NULL DEFAULT 'NULL::timestamp without time zone',
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_swppglovbaacuoxirlypkweupkqmwxiruznv" ("dateDeleted", "name"),
	INDEX "idx_ioevatetkaewtuwvqxwqcxplvowmgpqeyplb" ("name"),
	PRIMARY KEY ("id")
);

DELETE FROM "fieldgroups";
/*!40000 ALTER TABLE "fieldgroups" DISABLE KEYS */;
INSERT INTO "fieldgroups" ("id", "name", "dateCreated", "dateUpdated", "dateDeleted", "uid") VALUES
	(1, 'Common', '2021-06-15 16:14:33', '2021-06-15 16:14:33', NULL, 'b99fcb37-7036-4e10-bbb4-061931f8d954');
/*!40000 ALTER TABLE "fieldgroups" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "fieldlayoutfields" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''fieldlayoutfields_id_seq''::regclass)',
	"layoutId" INTEGER NOT NULL,
	"tabId" INTEGER NOT NULL,
	"fieldId" INTEGER NOT NULL,
	"required" BOOLEAN NOT NULL DEFAULT 'false',
	"sortOrder" SMALLINT NULL DEFAULT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_xobaxbfysjsorpqbuxkzrsuqfookgvnfxlej" ("fieldId"),
	INDEX "idx_bmscuowcanucfottpojokfxumbsboykbwrxx" ("tabId"),
	INDEX "idx_xvmrpgryowiidnuqvzyfctgzhcgczmpwhxed" ("sortOrder"),
	UNIQUE INDEX "idx_rkxulbkgilrwwxhuaixehwvxpazbamrokkgb" ("layoutId", "fieldId"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_rhypsgftihbvqemywpkvkvtxsgubwtbvohuo" FOREIGN KEY ("fieldId") REFERENCES "public"."fields" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "fk_xlabxerdsoxewmlxaemprfyaknhjefsjlwza" FOREIGN KEY ("tabId") REFERENCES "public"."fieldlayouttabs" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "fk_ysytkglfmkafbsjtxqpjrwwxkgcbmdjqmffv" FOREIGN KEY ("layoutId") REFERENCES "public"."fieldlayouts" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

DELETE FROM "fieldlayoutfields";
/*!40000 ALTER TABLE "fieldlayoutfields" DISABLE KEYS */;
/*!40000 ALTER TABLE "fieldlayoutfields" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "fieldlayouts" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''fieldlayouts_id_seq''::regclass)',
	"type" VARCHAR(255) NOT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"dateDeleted" TIMESTAMP NULL DEFAULT 'NULL::timestamp without time zone',
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_pqsutamkfuzezgbvwcirxdfjbhxsrmuctlko" ("type"),
	INDEX "idx_qclvwjxisffvqpggovtglukqnyqfgvbmgwma" ("dateDeleted"),
	PRIMARY KEY ("id")
);

DELETE FROM "fieldlayouts";
/*!40000 ALTER TABLE "fieldlayouts" DISABLE KEYS */;
/*!40000 ALTER TABLE "fieldlayouts" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "fieldlayouttabs" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''fieldlayouttabs_id_seq''::regclass)',
	"layoutId" INTEGER NOT NULL,
	"name" VARCHAR(255) NOT NULL,
	"elements" TEXT NULL DEFAULT NULL,
	"sortOrder" SMALLINT NULL DEFAULT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_myqsvsvnbuhcoholptntmcvqhvqcyblcuors" ("layoutId"),
	INDEX "idx_gacqchcxpajcvyfjldqjvpxzfpeeshyaktbn" ("sortOrder"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_aficfytlopxpsuxszsdecwwdlaxevomqscnj" FOREIGN KEY ("layoutId") REFERENCES "public"."fieldlayouts" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

DELETE FROM "fieldlayouttabs";
/*!40000 ALTER TABLE "fieldlayouttabs" DISABLE KEYS */;
/*!40000 ALTER TABLE "fieldlayouttabs" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "fields" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''fields_id_seq''::regclass)',
	"groupId" INTEGER NULL DEFAULT NULL,
	"name" VARCHAR(255) NOT NULL,
	"handle" VARCHAR(64) NOT NULL,
	"context" VARCHAR(255) NOT NULL DEFAULT 'global',
	"instructions" TEXT NULL DEFAULT NULL,
	"searchable" BOOLEAN NOT NULL DEFAULT 'true',
	"translationMethod" VARCHAR(255) NOT NULL DEFAULT 'none',
	"translationKeyFormat" TEXT NULL DEFAULT NULL,
	"type" VARCHAR(255) NOT NULL,
	"settings" TEXT NULL DEFAULT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_bzpmdtnakalgoqjgmtqpqapynpqstdvfaqao" ("context"),
	INDEX "idx_yyvbszleqhostvhzixsymlggavvmklvabmlp" ("groupId"),
	INDEX "idx_tyayxgmqvicwchxkrgnuyhdipzechxobutub" ("handle", "context"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_zxllabbxuokvpgdlrqncwymcxetudiickhci" FOREIGN KEY ("groupId") REFERENCES "public"."fieldgroups" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

DELETE FROM "fields";
/*!40000 ALTER TABLE "fields" DISABLE KEYS */;
/*!40000 ALTER TABLE "fields" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "globalsets" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''globalsets_id_seq''::regclass)',
	"name" VARCHAR(255) NOT NULL,
	"handle" VARCHAR(255) NOT NULL,
	"fieldLayoutId" INTEGER NULL DEFAULT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_satpoqgmsvibcghrjnvtodgwlkecgvjlmgbj" ("fieldLayoutId"),
	INDEX "idx_nylfyyfyulbglnhbicgmdleguamecqpvyurq" ("handle"),
	INDEX "idx_qscoolgdijfvysizbophxtdjcljwwynbaxxw" ("name"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_exftdcydmmxxhtpszibwhpxpuxagkdmgqgty" FOREIGN KEY ("id") REFERENCES "public"."elements" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "fk_unwdikduwmpmefbdblbyyztqxhfsxuxxjmtw" FOREIGN KEY ("fieldLayoutId") REFERENCES "public"."fieldlayouts" ("id") ON UPDATE NO ACTION ON DELETE SET NULL
);

DELETE FROM "globalsets";
/*!40000 ALTER TABLE "globalsets" DISABLE KEYS */;
/*!40000 ALTER TABLE "globalsets" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "gqlschemas" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''gqlschemas_id_seq''::regclass)',
	"name" VARCHAR(255) NOT NULL,
	"scope" TEXT NULL DEFAULT NULL,
	"isPublic" BOOLEAN NOT NULL DEFAULT 'false',
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	PRIMARY KEY ("id")
);

DELETE FROM "gqlschemas";
/*!40000 ALTER TABLE "gqlschemas" DISABLE KEYS */;
/*!40000 ALTER TABLE "gqlschemas" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "gqltokens" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''gqltokens_id_seq''::regclass)',
	"name" VARCHAR(255) NOT NULL,
	"accessToken" VARCHAR(255) NOT NULL,
	"enabled" BOOLEAN NOT NULL DEFAULT 'true',
	"expiryDate" TIMESTAMP NULL DEFAULT NULL,
	"lastUsed" TIMESTAMP NULL DEFAULT NULL,
	"schemaId" INTEGER NULL DEFAULT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	UNIQUE INDEX "idx_amsbvfndrukmgsftvrkvdfghqkajwslzxhqr" ("name"),
	UNIQUE INDEX "idx_eoocisnkwahuscurkntxdfyxkswcknhikuwi" ("accessToken"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_igumriprrjwfirywjejquuognrcqcwenwkxr" FOREIGN KEY ("schemaId") REFERENCES "public"."gqlschemas" ("id") ON UPDATE NO ACTION ON DELETE SET NULL
);

DELETE FROM "gqltokens";
/*!40000 ALTER TABLE "gqltokens" DISABLE KEYS */;
/*!40000 ALTER TABLE "gqltokens" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "info" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''info_id_seq''::regclass)',
	"version" VARCHAR(50) NOT NULL,
	"schemaVersion" VARCHAR(15) NOT NULL,
	"maintenance" BOOLEAN NOT NULL DEFAULT 'false',
	"configVersion" CHAR(12) NOT NULL DEFAULT '000000000000',
	"fieldVersion" CHAR(12) NOT NULL DEFAULT '000000000000',
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	PRIMARY KEY ("id")
);

DELETE FROM "info";
/*!40000 ALTER TABLE "info" DISABLE KEYS */;
INSERT INTO "info" ("id", "version", "schemaVersion", "maintenance", "configVersion", "fieldVersion", "dateCreated", "dateUpdated", "uid") VALUES
	(1, '3.6.16', '3.6.8', 'false', 'grltlzrifugq', 'ekxadvlkhmbj', '2021-06-15 16:14:33', '2021-06-15 16:18:51', '646437e8-f010-4510-9ad6-7b5de26685b4');
/*!40000 ALTER TABLE "info" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "matrixblocks" (
	"id" INTEGER NOT NULL,
	"ownerId" INTEGER NOT NULL,
	"fieldId" INTEGER NOT NULL,
	"typeId" INTEGER NOT NULL,
	"sortOrder" SMALLINT NULL DEFAULT NULL,
	"deletedWithOwner" BOOLEAN NULL DEFAULT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_pkhnslhgmjahcomkweobcbortlyuvvcrnimh" ("sortOrder"),
	INDEX "idx_bbxxrdixfwstysrwytrkbapgxamvdjticbtr" ("typeId"),
	INDEX "idx_yyanstpigaquaiurtzhkzaczyjescnkosvyy" ("fieldId"),
	INDEX "idx_buwnpwrazmwacqosfwvixbbrawyabaeypzhk" ("ownerId"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_aqyescihtgvprfyoiafqtkpkpxjhwamthojo" FOREIGN KEY ("typeId") REFERENCES "public"."matrixblocktypes" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "fk_fchohkcrbmgixnsagquvpaxmnxjqsbhsgyty" FOREIGN KEY ("id") REFERENCES "public"."elements" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "fk_hqgygzntuwbbmazneotoyezsmdeulhydavzd" FOREIGN KEY ("fieldId") REFERENCES "public"."fields" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "fk_jgcutcftyrcfbqtgofrjsweopzblbffdfldy" FOREIGN KEY ("ownerId") REFERENCES "public"."elements" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

DELETE FROM "matrixblocks";
/*!40000 ALTER TABLE "matrixblocks" DISABLE KEYS */;
/*!40000 ALTER TABLE "matrixblocks" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "matrixblocktypes" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''matrixblocktypes_id_seq''::regclass)',
	"fieldId" INTEGER NOT NULL,
	"fieldLayoutId" INTEGER NULL DEFAULT NULL,
	"name" VARCHAR(255) NOT NULL,
	"handle" VARCHAR(255) NOT NULL,
	"sortOrder" SMALLINT NULL DEFAULT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_xgkdyvksvttubjrbsczjvnxflsjaqbhvlyrv" ("fieldLayoutId"),
	INDEX "idx_jphxrtosmqxgnziyvnnbiluimkadxdeorzma" ("fieldId"),
	INDEX "idx_qwmmahbepgwbilhzgkwtghtsysqzprgrgxof" ("handle", "fieldId"),
	INDEX "idx_byrrntwvwwzllnkmfkynnbgwkomihxiubwal" ("name", "fieldId"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_bjicmnvzisqnhshugjuwcbhigbojhvkevuum" FOREIGN KEY ("fieldId") REFERENCES "public"."fields" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "fk_tmxqlmivzznbhyekvyovpzlqolfumwbhejah" FOREIGN KEY ("fieldLayoutId") REFERENCES "public"."fieldlayouts" ("id") ON UPDATE NO ACTION ON DELETE SET NULL
);

DELETE FROM "matrixblocktypes";
/*!40000 ALTER TABLE "matrixblocktypes" DISABLE KEYS */;
/*!40000 ALTER TABLE "matrixblocktypes" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "migrations" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''migrations_id_seq''::regclass)',
	"track" VARCHAR(255) NOT NULL,
	"name" VARCHAR(255) NOT NULL,
	"applyTime" TIMESTAMP NOT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	UNIQUE INDEX "idx_pzjeukfwcnksgjlafklamiwdtkeckbactsfp" ("track", "name"),
	PRIMARY KEY ("id")
);

DELETE FROM "migrations";
/*!40000 ALTER TABLE "migrations" DISABLE KEYS */;
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(1, 'craft', 'Install', '2021-06-15 16:14:34', '2021-06-15 16:14:34', '2021-06-15 16:14:34', '67b83b97-0ed3-43b1-b8f7-e45feca6f10b');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(2, 'craft', 'm150403_183908_migrations_table_changes', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2f8a967d-6a44-4ea6-bf44-d18667b77714');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(3, 'craft', 'm150403_184247_plugins_table_changes', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '970bef8d-5ef0-4491-8e0b-5ba315ed50c0');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(4, 'craft', 'm150403_184533_field_version', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'c2a51c3e-f0f2-470e-889e-1067854b5c5e');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(5, 'craft', 'm150403_184729_type_columns', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '6f9b50a7-d71f-450a-b69a-e2c2916d7410');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(6, 'craft', 'm150403_185142_volumes', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '5d93723a-2fdb-481c-be18-c982475c27a5');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(7, 'craft', 'm150428_231346_userpreferences', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'fc5e5843-75eb-484f-ae36-081074d8a297');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(8, 'craft', 'm150519_150900_fieldversion_conversion', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '67ec4a58-8eaa-4e6b-961b-a7cbebb610e5');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(9, 'craft', 'm150617_213829_update_email_settings', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '29d0cabb-ed49-44e0-b879-bc3d2d2e0ee8');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(10, 'craft', 'm150721_124739_templatecachequeries', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'f168f7f9-7c1d-4a4f-8ce8-bdf32eebdf92');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(11, 'craft', 'm150724_140822_adjust_quality_settings', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '1299ad88-3165-4bda-80f4-d7eec7cca779');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(12, 'craft', 'm150815_133521_last_login_attempt_ip', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '6e568048-2328-4c72-b4f5-b35fd514bcbc');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(13, 'craft', 'm151002_095935_volume_cache_settings', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'b80272df-fc8e-4df0-9423-1bffbcdf77dd');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(14, 'craft', 'm151005_142750_volume_s3_storage_settings', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '1e3fcedd-e103-42c9-89d9-a7d7db16604e');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(15, 'craft', 'm151016_133600_delete_asset_thumbnails', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'd566432d-23bb-4fbf-b78b-e95f8fff9db6');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(16, 'craft', 'm151209_000000_move_logo', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '508e75d0-ce0f-4639-ac9f-11feef9a300b');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(17, 'craft', 'm151211_000000_rename_fileId_to_assetId', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '763b4502-0fef-4eed-a936-0eec8f80a3bc');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(18, 'craft', 'm151215_000000_rename_asset_permissions', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'd38a6615-dfd6-4268-a93d-38748ee3cd0b');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(19, 'craft', 'm160707_000001_rename_richtext_assetsource_setting', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'bf4e9f16-7951-4302-b358-5143a34c930f');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(20, 'craft', 'm160708_185142_volume_hasUrls_setting', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '5e0b53c0-dcb7-42c1-b898-9635ace00a3e');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(21, 'craft', 'm160714_000000_increase_max_asset_filesize', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'beb31372-2590-4330-932e-596807293bd0');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(22, 'craft', 'm160727_194637_column_cleanup', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '88327542-bf89-4b0c-856b-2c611df5b9c1');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(23, 'craft', 'm160804_110002_userphotos_to_assets', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'b979f10c-f656-46ec-acda-ee91e4509c96');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(24, 'craft', 'm160807_144858_sites', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '303b3eb7-05db-496d-802f-2444a825c642');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(25, 'craft', 'm160829_000000_pending_user_content_cleanup', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'a947c45d-9fda-41e1-b912-e827d4e9d9a7');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(26, 'craft', 'm160830_000000_asset_index_uri_increase', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '22666c0e-0621-474e-90d5-d938945aa611');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(27, 'craft', 'm160912_230520_require_entry_type_id', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '8c3cc969-756c-4f71-9dc2-03b5f7c2142b');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(28, 'craft', 'm160913_134730_require_matrix_block_type_id', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'cb8863a1-8c15-4326-ad5d-201d2635b9f4');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(29, 'craft', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '70728bab-3d8b-4695-b2bf-63a7930663ed');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(30, 'craft', 'm160920_231045_usergroup_handle_title_unique', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'c480b679-3ddb-4dca-ae12-4075b436c7fe');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(31, 'craft', 'm160925_113941_route_uri_parts', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '44a24da7-dd59-46e4-a75a-ee7a64d76159');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(32, 'craft', 'm161006_205918_schemaVersion_not_null', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'd864c997-284f-4c86-8764-3d6edd86d3a4');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(33, 'craft', 'm161007_130653_update_email_settings', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'a4c0325d-ff6a-491f-a8be-dbf7dcfa0769');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(34, 'craft', 'm161013_175052_newParentId', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'bc79256f-ead5-497f-9daa-786f3867b200');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(35, 'craft', 'm161021_102916_fix_recent_entries_widgets', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'a03f5ec2-5d60-4b1a-a704-cdd92fd9b713');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(36, 'craft', 'm161021_182140_rename_get_help_widget', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '9758a2da-a5f4-4859-bf28-3fe96f71c028');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(37, 'craft', 'm161025_000000_fix_char_columns', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'd7cc0fda-7892-46af-81d1-5617839ec1a7');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(38, 'craft', 'm161029_124145_email_message_languages', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2d71c316-6aad-4f93-bd1c-097019ffb515');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(39, 'craft', 'm161108_000000_new_version_format', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '3853b02f-65a6-40a1-9312-ea469de745cd');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(40, 'craft', 'm161109_000000_index_shuffle', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '38ba742d-95a0-4753-9791-f2892576b68e');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(41, 'craft', 'm161122_185500_no_craft_app', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'a0a8398c-3970-4a41-b672-70fc34eedad3');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(42, 'craft', 'm161125_150752_clear_urlmanager_cache', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'd237f0c6-8919-4a59-bf07-486b73d78428');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(43, 'craft', 'm161220_000000_volumes_hasurl_notnull', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '4ff20c15-aa97-4c37-be11-2db36733e193');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(44, 'craft', 'm170114_161144_udates_permission', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'cefdb479-0d24-456e-9688-a83f276be40f');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(45, 'craft', 'm170120_000000_schema_cleanup', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'f81ed50f-3103-4c8a-9476-09eaac0fa683');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(46, 'craft', 'm170126_000000_assets_focal_point', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'f263e130-e058-4a79-abb0-a2323749bcd6');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(47, 'craft', 'm170206_142126_system_name', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'd024cbfb-c0cb-4cc5-b5ce-3cdc2aa889f3');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(48, 'craft', 'm170217_044740_category_branch_limits', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2c7a78e7-acf3-4844-8a12-ee9f1238cccf');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(49, 'craft', 'm170217_120224_asset_indexing_columns', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'cd9ca6ad-ecbf-4331-b831-0186153f5330');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(50, 'craft', 'm170223_224012_plain_text_settings', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '8413f8ea-c5d4-4fe8-abba-41a7973d0f45');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(51, 'craft', 'm170227_120814_focal_point_percentage', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '0e0c0e98-a37d-4e80-b30f-a2750c3c9b3b');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(52, 'craft', 'm170228_171113_system_messages', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '34a50dd6-1493-4b5d-8625-52a580984cff');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(53, 'craft', 'm170303_140500_asset_field_source_settings', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '4f80d6b4-389f-4281-927d-05a4ef877750');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(54, 'craft', 'm170306_150500_asset_temporary_uploads', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'b804b257-a12a-4037-bb86-f26c30afc897');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(55, 'craft', 'm170523_190652_element_field_layout_ids', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'f1782dae-0410-4f6b-8f1e-fea3d47e6f83');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(56, 'craft', 'm170621_195237_format_plugin_handles', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'c175c9d5-ac78-4e1e-ae56-d68fb66aa063');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(57, 'craft', 'm170630_161027_deprecation_line_nullable', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '4df3a899-dbcb-437e-afd1-e6814d2035b0');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(58, 'craft', 'm170630_161028_deprecation_changes', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'dd8a018b-bd63-43a8-8ce9-18dd6e9856b7');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(59, 'craft', 'm170703_181539_plugins_table_tweaks', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '677edca8-56c6-4655-8c96-ce1443f2cf32');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(60, 'craft', 'm170704_134916_sites_tables', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '16891b0f-dbbd-4b2f-acef-fbb1d9241b1c');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(61, 'craft', 'm170706_183216_rename_sequences', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'edec0c18-becb-430e-81b5-1474771c3d24');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(62, 'craft', 'm170707_094758_delete_compiled_traits', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '6d494bed-2f2f-48fa-9cbd-fe80e0b3f310');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(63, 'craft', 'm170731_190138_drop_asset_packagist', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'f943efd9-bcdf-4779-a971-47998f5bcce7');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(64, 'craft', 'm170810_201318_create_queue_table', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '543f459a-9d19-4af0-a135-78d83fa0256f');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(65, 'craft', 'm170903_192801_longblob_for_queue_jobs', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '80f39e2a-a61b-4bcc-8bdf-a8e24e7c91b4');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(66, 'craft', 'm170914_204621_asset_cache_shuffle', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'fe30dcc0-ef72-45cb-8ed8-0c7a981b547d');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(67, 'craft', 'm171011_214115_site_groups', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'fd999cbe-166d-4d8c-9e6f-4bf5fc7b30d8');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(68, 'craft', 'm171012_151440_primary_site', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'c2320ddd-118c-43ba-922b-8bd2b65c0050');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(69, 'craft', 'm171013_142500_transform_interlace', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '108c2cb8-68dd-420a-b39d-3aa2b9617bf6');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(70, 'craft', 'm171016_092553_drop_position_select', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '40bbf6ee-b950-4df1-bb31-54e1b6acae6b');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(71, 'craft', 'm171016_221244_less_strict_translation_method', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '83ae9509-2fbf-4cbb-9780-23e3081fc022');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(72, 'craft', 'm171107_000000_assign_group_permissions', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'f54d4135-3434-4e43-958c-75b9494a5b1c');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(73, 'craft', 'm171117_000001_templatecache_index_tune', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '29397718-d837-46af-9a42-1004aedc5bc2');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(74, 'craft', 'm171126_105927_disabled_plugins', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'ce1436a1-2e6d-443b-8f92-0f304fe935f7');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(75, 'craft', 'm171130_214407_craftidtokens_table', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'c05bb7d4-e9cf-4761-afbb-645386784331');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(76, 'craft', 'm171202_004225_update_email_settings', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'f415ba19-bb3a-4044-897c-70326302502f');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(77, 'craft', 'm171204_000001_templatecache_index_tune_deux', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '0bc1af5e-3e2f-4d7a-aee9-6277fdbe024c');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(78, 'craft', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '87aca7b4-4a76-4652-8bc8-559f11e339f8');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(79, 'craft', 'm171218_143135_longtext_query_column', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'ea1f60a8-5384-42b9-986b-c299e099a83a');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(80, 'craft', 'm171231_055546_environment_variables_to_aliases', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'a48eadf7-6e03-46e7-9f68-8d0d8a4107fe');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(81, 'craft', 'm180113_153740_drop_users_archived_column', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '3fe73d89-fce2-4e96-a68a-acae4c469eac');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(82, 'craft', 'm180122_213433_propagate_entries_setting', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'a20a8444-ad47-46b9-a36c-e50a47d331c3');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(83, 'craft', 'm180124_230459_fix_propagate_entries_values', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '28ef3b06-1065-4106-aaea-2f839c9361f5');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(84, 'craft', 'm180128_235202_set_tag_slugs', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'b54f988f-da4c-495f-90b3-249789e0157f');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(85, 'craft', 'm180202_185551_fix_focal_points', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '6ddb7f7b-f820-47ea-9081-b10467669112');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(86, 'craft', 'm180217_172123_tiny_ints', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'e90dabf0-af3e-4f95-a412-c506dbf9a004');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(87, 'craft', 'm180321_233505_small_ints', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '6ca47582-7b9c-47be-8790-f80a931755df');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(88, 'craft', 'm180404_182320_edition_changes', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '54289791-5276-4a1f-b949-fd9905e26807');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(89, 'craft', 'm180411_102218_fix_db_routes', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'c7897eb3-66d4-4d99-894e-b57b1b3771b5');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(90, 'craft', 'm180416_205628_resourcepaths_table', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'b04d136e-9f9f-4e1e-bb87-4c01c23a8a6d');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(91, 'craft', 'm180418_205713_widget_cleanup', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '5be5f8e2-7b2f-4d7c-9f5a-d867f4d9dc24');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(92, 'craft', 'm180425_203349_searchable_fields', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'be8a9493-7068-4fea-907a-f449a77cf0bc');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(93, 'craft', 'm180516_153000_uids_in_field_settings', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'ea8fd66e-f7ec-42f8-bd7a-925140c9551e');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(94, 'craft', 'm180517_173000_user_photo_volume_to_uid', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2d654a75-86b3-499e-8c02-c07961940e94');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(95, 'craft', 'm180518_173000_permissions_to_uid', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2d97592b-29f3-41e1-8f9d-7113ef1aa3b0');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(96, 'craft', 'm180520_173000_matrix_context_to_uids', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '3ab93c46-3523-4ba1-8158-0d755550b5ba');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(97, 'craft', 'm180521_172900_project_config_table', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'e5819f85-7b25-4c38-9cea-4803071e1791');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(98, 'craft', 'm180521_173000_initial_yml_and_snapshot', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '861507ea-e157-4c34-a6a5-717c194ed3cb');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(99, 'craft', 'm180731_162030_soft_delete_sites', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'caf79a9e-4a22-4a23-b727-5223f4ae22b6');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(100, 'craft', 'm180810_214427_soft_delete_field_layouts', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'd42e2297-73b8-43fc-bd81-3398a3093da1');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(101, 'craft', 'm180810_214439_soft_delete_elements', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '429397b2-97be-4499-ae02-7134e4630f96');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(102, 'craft', 'm180824_193422_case_sensitivity_fixes', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '02d69266-7eb7-40f5-8b9e-c49ebb892dfc');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(103, 'craft', 'm180901_151639_fix_matrixcontent_tables', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'c24baa5a-0d4d-4b49-8783-0619b14334f0');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(104, 'craft', 'm180904_112109_permission_changes', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2bd15988-3b0f-4051-bf93-a08e56ed6dec');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(105, 'craft', 'm180910_142030_soft_delete_sitegroups', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '55b8c157-ca05-4212-952a-39507079203a');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(106, 'craft', 'm181011_160000_soft_delete_asset_support', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'b99a9d39-6567-4ac5-9150-914595a71da8');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(107, 'craft', 'm181016_183648_set_default_user_settings', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'e3903b6b-3e36-4bdd-aa6e-98b4ff19de65');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(108, 'craft', 'm181017_225222_system_config_settings', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'af117db4-33ce-4e92-8db6-152ba0686ee3');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(109, 'craft', 'm181018_222343_drop_userpermissions_from_config', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '1938e527-3b56-41d2-a4a0-b7bed795f1bb');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(110, 'craft', 'm181029_130000_add_transforms_routes_to_config', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'deeacf77-70cb-4a44-8a31-3a85d0508d36');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(111, 'craft', 'm181112_203955_sequences_table', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '04fc2036-2c61-4e52-b264-a1712fe60419');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(112, 'craft', 'm181121_001712_cleanup_field_configs', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '8c8bbdde-d044-49c5-994c-cdc14acc752e');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(113, 'craft', 'm181128_193942_fix_project_config', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '6a909d6e-35fe-44e0-917b-35f4f530ba39');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(114, 'craft', 'm181130_143040_fix_schema_version', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'b3b338c6-d9c9-485e-bec4-83fe7551f486');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(115, 'craft', 'm181211_143040_fix_entry_type_uids', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'f9d17bf4-7f32-419e-9a24-2908c0149c4b');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(116, 'craft', 'm181217_153000_fix_structure_uids', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'cd9da8ac-4140-4f30-aecd-0aaca93ecf20');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(117, 'craft', 'm190104_152725_store_licensed_plugin_editions', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'c4670541-6f78-4ab5-96e3-c04bb5dc00dd');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(118, 'craft', 'm190108_110000_cleanup_project_config', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '7ec798bb-1336-4505-a424-a7758b6c4172');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(119, 'craft', 'm190108_113000_asset_field_setting_change', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '45a908c8-b619-4266-8751-95c13ce02d70');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(120, 'craft', 'm190109_172845_fix_colspan', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'a597eded-3ae1-42ca-9328-19bc12c72bf5');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(121, 'craft', 'm190110_150000_prune_nonexisting_sites', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '9f1b5eb4-9d37-4915-a146-513c558ba908');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(122, 'craft', 'm190110_214819_soft_delete_volumes', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '402bdf6a-328c-4b6d-87fe-dd9d3da7a38f');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(123, 'craft', 'm190112_124737_fix_user_settings', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '35745cfe-ae93-4b77-b38d-15bf8168bc91');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(124, 'craft', 'm190112_131225_fix_field_layouts', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '281eb8f9-cf26-4675-b578-9a229cdea554');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(125, 'craft', 'm190112_201010_more_soft_deletes', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '42844339-bbab-41d1-8d25-8e2e8ba12125');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(126, 'craft', 'm190114_143000_more_asset_field_setting_changes', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '32f76c7c-1138-4fe4-bfc6-23d0a0ab7945');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(127, 'craft', 'm190121_120000_rich_text_config_setting', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '1f8a5085-ca33-43a7-ae0d-a047d9342cce');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(128, 'craft', 'm190125_191628_fix_email_transport_password', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'fdaf60a4-1ebe-46b5-ae90-3832a117352e');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(129, 'craft', 'm190128_181422_cleanup_volume_folders', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'ebf3bce7-e56c-466c-a17c-312e1e75e91e');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(130, 'craft', 'm190205_140000_fix_asset_soft_delete_index', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'c7a88664-f52a-4da3-8b4e-ca6c796f8909');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(131, 'craft', 'm190218_143000_element_index_settings_uid', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '20fd2b88-8c74-4346-a3a3-42c86ef51971');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(132, 'craft', 'm190312_152740_element_revisions', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '1f1815ad-b30b-4bd5-bac8-dcc49f837b86');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(133, 'craft', 'm190327_235137_propagation_method', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '3b2ab33a-68c4-45af-bde8-079878cd2e56');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(134, 'craft', 'm190401_223843_drop_old_indexes', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '09e32f71-b7bc-4a9f-acde-5554cb176fcb');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(135, 'craft', 'm190416_014525_drop_unique_global_indexes', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'ad8c269e-ebea-4d64-8ab6-a8112f0f2140');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(136, 'craft', 'm190417_085010_add_image_editor_permissions', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '3f195bdd-6b0d-44ce-9e55-0ca926345bb4');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(137, 'craft', 'm190502_122019_store_default_user_group_uid', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '5527b25c-e29c-48ca-87d8-b5e1fda8163c');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(138, 'craft', 'm190504_150349_preview_targets', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '57dcafbb-c02c-40ec-b292-31a9ab93f3e2');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(139, 'craft', 'm190516_184711_job_progress_label', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '5d9f156d-2329-4e1b-ac4d-fb4097a5c0bf');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(140, 'craft', 'm190523_190303_optional_revision_creators', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '40acd777-7022-407c-9407-d77fd24dc0be');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(141, 'craft', 'm190529_204501_fix_duplicate_uids', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '8884b739-2ed4-4db3-97de-4074646454fe');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(142, 'craft', 'm190605_223807_unsaved_drafts', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '3762c61e-7b60-46cf-92e8-208aac39a4ab');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(143, 'craft', 'm190607_230042_entry_revision_error_tables', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '00e0daca-23f3-46f1-859f-47155ead3954');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(144, 'craft', 'm190608_033429_drop_elements_uid_idx', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '27243331-3b8d-408f-a0fb-247d3c81a6de');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(145, 'craft', 'm190617_164400_add_gqlschemas_table', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'efffa4a3-b29b-4271-8315-89163dd8fabd');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(146, 'craft', 'm190624_234204_matrix_propagation_method', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2191be52-25b6-4ea6-a3eb-520e47a1698c');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(147, 'craft', 'm190711_153020_drop_snapshots', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '92914ac7-1355-4c45-9138-cf75c0a269c1');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(148, 'craft', 'm190712_195914_no_draft_revisions', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '028e536b-106e-4159-80a4-42dafe3e4956');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(149, 'craft', 'm190723_140314_fix_preview_targets_column', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'e1702912-7a56-490b-9ac1-8b812ce73b38');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(150, 'craft', 'm190820_003519_flush_compiled_templates', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '9b22700e-fc38-4178-a573-66a70f01ac39');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(151, 'craft', 'm190823_020339_optional_draft_creators', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '6abbaffc-d6e3-49d2-893e-4f7637fc7c19');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(152, 'craft', 'm190913_152146_update_preview_targets', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'c93da7b9-ee25-4d95-a9bb-c72b7b82f67c');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(153, 'craft', 'm191107_122000_add_gql_project_config_support', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'd8e5ef00-49df-454d-aa71-e904b1202b9c');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(154, 'craft', 'm191204_085100_pack_savable_component_settings', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'f0a8f2da-3a55-4e30-91d7-ae8ea2c48b01');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(155, 'craft', 'm191206_001148_change_tracking', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'f5c8d545-e861-49f6-ab87-c8e60e00abb6');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(156, 'craft', 'm191216_191635_asset_upload_tracking', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '5979bae4-29f4-4a63-b849-8df89106d76d');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(157, 'craft', 'm191222_002848_peer_asset_permissions', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '9b85aa2b-6d97-4bc4-beeb-059f167321f4');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(158, 'craft', 'm200127_172522_queue_channels', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'e6c71ade-592b-4da5-bb34-be2c4eea284a');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(159, 'craft', 'm200211_175048_truncate_element_query_cache', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'dd921ae7-975f-46b7-bf47-d1ea4baee0e6');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(160, 'craft', 'm200213_172522_new_elements_index', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '827c62db-e154-48f9-8224-c227e556f32b');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(161, 'craft', 'm200228_195211_long_deprecation_messages', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'c3b5a957-b9e7-40c3-bb8e-000d0572d159');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(162, 'craft', 'm200306_054652_disabled_sites', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'cddd01da-7ff7-4504-993e-bb24cef9c7ee');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(163, 'craft', 'm200522_191453_clear_template_caches', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '8977f622-8fed-4b76-a2f5-8b5356f8ea39');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(164, 'craft', 'm200606_231117_migration_tracks', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'd4e9fe88-6bbe-48ae-9e42-78759126a169');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(165, 'craft', 'm200619_215137_title_translation_method', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '980b66c1-ddd0-451e-8c06-1f33e717cafd');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(166, 'craft', 'm200620_005028_user_group_descriptions', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '16801eae-3915-4651-a708-ec13428b95d1');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(167, 'craft', 'm200620_230205_field_layout_changes', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '173e7e2e-3c0b-4bad-aa2d-64301eea844f');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(168, 'craft', 'm200625_131100_move_entrytypes_to_top_project_config', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '214073b1-5c14-4f41-8b97-ebabf431ff3b');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(169, 'craft', 'm200629_112700_remove_project_config_legacy_files', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '8671f68b-1c4e-4641-9978-cf240104fc44');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(170, 'craft', 'm200630_183000_drop_configmap', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'a7deb31e-2dff-45d3-906b-20f43ace5337');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(171, 'craft', 'm200715_113400_transform_index_error_flag', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '153b25a5-705c-4420-ac41-a98ed0336051');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(172, 'craft', 'm200716_110900_replace_file_asset_permissions', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '564c1470-d22d-43da-89f8-e3dc13d44d8f');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(173, 'craft', 'm200716_153800_public_token_settings_in_project_config', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'e0f74c80-6d7e-42e1-a76f-5281694cad3a');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(174, 'craft', 'm200720_175543_drop_unique_constraints', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'e012eed4-0ea8-41ef-a910-a7277ce9bc89');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(175, 'craft', 'm200825_051217_project_config_version', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '7ff3e6fb-0846-4dd5-b194-85c3afceb155');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(176, 'craft', 'm201116_190500_asset_title_translation_method', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '8feeb949-5291-4d5f-bf7b-eafe8162524d');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(177, 'craft', 'm201124_003555_plugin_trials', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '9f6f220a-08e4-44ff-8541-ac9d460c9b45');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(178, 'craft', 'm210209_135503_soft_delete_field_groups', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'c7a6de57-12ad-4f36-90ad-af5990f88bbd');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(179, 'craft', 'm210212_223539_delete_invalid_drafts', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '40e0a994-fe4e-45c4-863d-fab9addacdef');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(180, 'craft', 'm210214_202731_track_saved_drafts', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '3d2f9536-9d22-406b-b2ea-12465f5530da');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(181, 'craft', 'm210223_150900_add_new_element_gql_schema_components', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'f67cc187-ecd0-42f8-9cd3-3b28519749b1');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(182, 'craft', 'm210224_162000_add_projectconfignames_table', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '7155a726-216b-4df2-be2e-cd6f4069a237');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(183, 'craft', 'm210326_132000_invalidate_projectconfig_cache', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2cb97f33-ad78-4d67-886a-f7e8268fc00c');
INSERT INTO "migrations" ("id", "track", "name", "applyTime", "dateCreated", "dateUpdated", "uid") VALUES
	(184, 'craft', 'm210331_220322_null_author', '2021-06-15 16:14:35', '2021-06-15 16:14:35', '2021-06-15 16:14:35', 'f9931b1d-8d18-44ef-9c9b-1c21e2222a14');
/*!40000 ALTER TABLE "migrations" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "plugins" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''plugins_id_seq''::regclass)',
	"handle" VARCHAR(255) NOT NULL,
	"version" VARCHAR(255) NOT NULL,
	"schemaVersion" VARCHAR(255) NOT NULL,
	"licenseKeyStatus" VARCHAR(255) NOT NULL DEFAULT 'unknown',
	"licensedEdition" VARCHAR(255) NULL DEFAULT NULL,
	"installDate" TIMESTAMP NOT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	UNIQUE INDEX "idx_gwyrotqklamzbwszmkkvjbarrmtmykjdfnec" ("handle"),
	PRIMARY KEY ("id")
);

DELETE FROM "plugins";
/*!40000 ALTER TABLE "plugins" DISABLE KEYS */;
/*!40000 ALTER TABLE "plugins" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "projectconfig" (
	"path" VARCHAR(255) NOT NULL,
	"value" TEXT NOT NULL,
	PRIMARY KEY ("path")
);

DELETE FROM "projectconfig";
/*!40000 ALTER TABLE "projectconfig" DISABLE KEYS */;
INSERT INTO "projectconfig" ("path", "value") VALUES
	('fieldGroups.b99fcb37-7036-4e10-bbb4-061931f8d954.name', '"Common"');
INSERT INTO "projectconfig" ("path", "value") VALUES
	('siteGroups.d5f95edd-804e-41ba-927b-9201536c452b.name', '"alerti"');
INSERT INTO "projectconfig" ("path", "value") VALUES
	('sites.e7ddbb89-e989-43d1-86e9-e9e4f45da062.baseUrl', '"$PRIMARY_SITE_URL"');
INSERT INTO "projectconfig" ("path", "value") VALUES
	('sites.e7ddbb89-e989-43d1-86e9-e9e4f45da062.handle', '"default"');
INSERT INTO "projectconfig" ("path", "value") VALUES
	('sites.e7ddbb89-e989-43d1-86e9-e9e4f45da062.hasUrls', 'true');
INSERT INTO "projectconfig" ("path", "value") VALUES
	('sites.e7ddbb89-e989-43d1-86e9-e9e4f45da062.language', '"en-US"');
INSERT INTO "projectconfig" ("path", "value") VALUES
	('sites.e7ddbb89-e989-43d1-86e9-e9e4f45da062.name', '"alerti"');
INSERT INTO "projectconfig" ("path", "value") VALUES
	('sites.e7ddbb89-e989-43d1-86e9-e9e4f45da062.primary', 'true');
INSERT INTO "projectconfig" ("path", "value") VALUES
	('sites.e7ddbb89-e989-43d1-86e9-e9e4f45da062.siteGroup', '"d5f95edd-804e-41ba-927b-9201536c452b"');
INSERT INTO "projectconfig" ("path", "value") VALUES
	('sites.e7ddbb89-e989-43d1-86e9-e9e4f45da062.sortOrder', '1');
INSERT INTO "projectconfig" ("path", "value") VALUES
	('email.fromEmail', '"aminembarki@gmail.com"');
INSERT INTO "projectconfig" ("path", "value") VALUES
	('email.fromName', '"alerti"');
INSERT INTO "projectconfig" ("path", "value") VALUES
	('email.transportType', '"craft\\mail\\transportadapters\\Sendmail"');
INSERT INTO "projectconfig" ("path", "value") VALUES
	('system.name', '"alerti"');
INSERT INTO "projectconfig" ("path", "value") VALUES
	('system.live', 'true');
INSERT INTO "projectconfig" ("path", "value") VALUES
	('system.schemaVersion', '"3.6.8"');
INSERT INTO "projectconfig" ("path", "value") VALUES
	('system.timeZone', '"America/Los_Angeles"');
INSERT INTO "projectconfig" ("path", "value") VALUES
	('users.requireEmailVerification', 'true');
INSERT INTO "projectconfig" ("path", "value") VALUES
	('users.allowPublicRegistration', 'false');
INSERT INTO "projectconfig" ("path", "value") VALUES
	('users.defaultGroup', 'null');
INSERT INTO "projectconfig" ("path", "value") VALUES
	('users.photoVolumeUid', 'null');
INSERT INTO "projectconfig" ("path", "value") VALUES
	('users.photoSubpath', 'null');
INSERT INTO "projectconfig" ("path", "value") VALUES
	('dateModified', '1623773931');
INSERT INTO "projectconfig" ("path", "value") VALUES
	('system.edition', '"pro"');
/*!40000 ALTER TABLE "projectconfig" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "projectconfignames" (
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	"name" VARCHAR(255) NOT NULL,
	PRIMARY KEY ("uid")
);

DELETE FROM "projectconfignames";
/*!40000 ALTER TABLE "projectconfignames" DISABLE KEYS */;
INSERT INTO "projectconfignames" ("uid", "name") VALUES
	('b99fcb37-7036-4e10-bbb4-061931f8d954', 'Common');
INSERT INTO "projectconfignames" ("uid", "name") VALUES
	('d5f95edd-804e-41ba-927b-9201536c452b', 'alerti');
INSERT INTO "projectconfignames" ("uid", "name") VALUES
	('e7ddbb89-e989-43d1-86e9-e9e4f45da062', 'alerti');
/*!40000 ALTER TABLE "projectconfignames" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "queue" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''queue_id_seq''::regclass)',
	"channel" VARCHAR(255) NOT NULL DEFAULT 'queue',
	"job" BYTEA NOT NULL,
	"description" TEXT NULL DEFAULT NULL,
	"timePushed" INTEGER NOT NULL,
	"ttr" INTEGER NOT NULL,
	"delay" INTEGER NOT NULL DEFAULT '0',
	"priority" INTEGER NOT NULL DEFAULT '1024',
	"dateReserved" TIMESTAMP NULL DEFAULT NULL,
	"timeUpdated" INTEGER NULL DEFAULT NULL,
	"progress" SMALLINT NOT NULL DEFAULT '0',
	"progressLabel" VARCHAR(255) NULL DEFAULT NULL,
	"attempt" INTEGER NULL DEFAULT NULL,
	"fail" BOOLEAN NULL DEFAULT 'false',
	"dateFailed" TIMESTAMP NULL DEFAULT NULL,
	"error" TEXT NULL DEFAULT NULL,
	INDEX "idx_mefoeqmumgraaqyujkjfcyvbpohmwjedwjea" ("channel", "fail", "timeUpdated", "delay"),
	INDEX "idx_nwymrcpoybvqymqxwghzslmuexpwiuigourz" ("channel", "fail", "timeUpdated", "timePushed"),
	PRIMARY KEY ("id")
);

DELETE FROM "queue";
/*!40000 ALTER TABLE "queue" DISABLE KEYS */;
/*!40000 ALTER TABLE "queue" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "relations" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''relations_id_seq''::regclass)',
	"fieldId" INTEGER NOT NULL,
	"sourceId" INTEGER NOT NULL,
	"sourceSiteId" INTEGER NULL DEFAULT NULL,
	"targetId" INTEGER NOT NULL,
	"sortOrder" SMALLINT NULL DEFAULT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_gdhwmstjaoltgwsbbqhjriklspuopiyjvwjz" ("sourceSiteId"),
	INDEX "idx_trckfpqkixwegxyrtbusmwfjqbeakxvxcfxj" ("targetId"),
	INDEX "idx_dnajtsthpbihmzgbnsdwwburhocgfrdwmsuf" ("sourceId"),
	UNIQUE INDEX "idx_pfieayzewfpleprbzkkkjvwvlcwazryzbddq" ("fieldId", "sourceId", "sourceSiteId", "targetId"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_gnoafevlzkrdzixppcuzudaayteffnopnxky" FOREIGN KEY ("sourceId") REFERENCES "public"."elements" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "fk_hiijcarscyevguapamiknyljweovrhrsggvg" FOREIGN KEY ("fieldId") REFERENCES "public"."fields" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "fk_jfbkszlnucxrcdwcslesjmlllgcjryhiqjxm" FOREIGN KEY ("targetId") REFERENCES "public"."elements" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "fk_swgjjqzsaruolfggpfyzwmuexhihasiawdsf" FOREIGN KEY ("sourceSiteId") REFERENCES "public"."sites" ("id") ON UPDATE CASCADE ON DELETE CASCADE
);

DELETE FROM "relations";
/*!40000 ALTER TABLE "relations" DISABLE KEYS */;
/*!40000 ALTER TABLE "relations" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "resourcepaths" (
	"hash" VARCHAR(255) NOT NULL,
	"path" VARCHAR(255) NOT NULL,
	PRIMARY KEY ("hash")
);

DELETE FROM "resourcepaths";
/*!40000 ALTER TABLE "resourcepaths" DISABLE KEYS */;
INSERT INTO "resourcepaths" ("hash", "path") VALUES
	('743c8346', '@craft/web/assets/installer/dist');
INSERT INTO "resourcepaths" ("hash", "path") VALUES
	('cc9440c5', '@craft/web/assets/login/dist');
INSERT INTO "resourcepaths" ("hash", "path") VALUES
	('efbfa4cb', '@craft/web/assets/craftsupport/dist');
INSERT INTO "resourcepaths" ("hash", "path") VALUES
	('82c4ec87', '@craft/web/assets/dashboard/dist');
INSERT INTO "resourcepaths" ("hash", "path") VALUES
	('481352c2', '@craft/web/assets/updateswidget/dist');
INSERT INTO "resourcepaths" ("hash", "path") VALUES
	('d0aa998f', '@craft/web/assets/feed/dist');
INSERT INTO "resourcepaths" ("hash", "path") VALUES
	('fec45ab9', '@craft/web/assets/pluginstoreoauth/dist');
INSERT INTO "resourcepaths" ("hash", "path") VALUES
	('ce05d004', '@craft/web/assets/dbbackup/dist');
INSERT INTO "resourcepaths" ("hash", "path") VALUES
	('23b2e05a', '@craft/web/assets/utilities/dist');
INSERT INTO "resourcepaths" ("hash", "path") VALUES
	('7940d890', '@craft/web/assets/cp/dist');
INSERT INTO "resourcepaths" ("hash", "path") VALUES
	('47e4be06', '@lib/axios');
INSERT INTO "resourcepaths" ("hash", "path") VALUES
	('901a8e41', '@lib/d3');
INSERT INTO "resourcepaths" ("hash", "path") VALUES
	('3d853962', '@lib/element-resize-detector');
INSERT INTO "resourcepaths" ("hash", "path") VALUES
	('a3a799c7', '@lib/garnishjs');
INSERT INTO "resourcepaths" ("hash", "path") VALUES
	('12159297', '@bower/jquery/dist');
INSERT INTO "resourcepaths" ("hash", "path") VALUES
	('991b92d2', '@lib/jquery-touch-events');
INSERT INTO "resourcepaths" ("hash", "path") VALUES
	('39a65ea', '@lib/velocity');
INSERT INTO "resourcepaths" ("hash", "path") VALUES
	('4d33fe4f', '@lib/jquery-ui');
INSERT INTO "resourcepaths" ("hash", "path") VALUES
	('1fbdca02', '@lib/jquery.payment');
INSERT INTO "resourcepaths" ("hash", "path") VALUES
	('9ebfae10', '@lib/picturefill');
INSERT INTO "resourcepaths" ("hash", "path") VALUES
	('cac18394', '@lib/selectize');
INSERT INTO "resourcepaths" ("hash", "path") VALUES
	('8657afee', '@lib/fileupload');
INSERT INTO "resourcepaths" ("hash", "path") VALUES
	('c0adc71e', '@lib/xregexp');
INSERT INTO "resourcepaths" ("hash", "path") VALUES
	('b6e14df9', '@lib/fabric');
INSERT INTO "resourcepaths" ("hash", "path") VALUES
	('8af490f9', '@lib/iframe-resizer');
INSERT INTO "resourcepaths" ("hash", "path") VALUES
	('fb9e0a34', '@craft/web/assets/clearcaches/dist');
INSERT INTO "resourcepaths" ("hash", "path") VALUES
	('413c0699', '@craft/web/assets/generalsettings/dist');
INSERT INTO "resourcepaths" ("hash", "path") VALUES
	('703be8ed', '@craft/web/assets/pluginstore/dist');
INSERT INTO "resourcepaths" ("hash", "path") VALUES
	('5d84436f', '@craft/web/assets/recententries/dist');
INSERT INTO "resourcepaths" ("hash", "path") VALUES
	('6a0f1d73', '@lib/vue');
/*!40000 ALTER TABLE "resourcepaths" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "revisions" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''revisions_id_seq''::regclass)',
	"sourceId" INTEGER NOT NULL,
	"creatorId" INTEGER NULL DEFAULT NULL,
	"num" INTEGER NOT NULL,
	"notes" TEXT NULL DEFAULT NULL,
	UNIQUE INDEX "idx_vkyddlqaduxvfguoelzgwzvepzhmsbugeavo" ("sourceId", "num"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_amurjrlcbihncugpomptguywuqapvsdgrvne" FOREIGN KEY ("sourceId") REFERENCES "public"."elements" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "fk_zscdzyryupowzmiwcxhduotyfbfmevupjqwa" FOREIGN KEY ("creatorId") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE SET NULL
);

DELETE FROM "revisions";
/*!40000 ALTER TABLE "revisions" DISABLE KEYS */;
/*!40000 ALTER TABLE "revisions" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "searchindex" (
	"elementId" INTEGER NOT NULL,
	"attribute" VARCHAR(25) NOT NULL,
	"fieldId" INTEGER NOT NULL,
	"siteId" INTEGER NOT NULL,
	"keywords" TEXT NOT NULL,
	"keywords_vector" UNKNOWN NOT NULL,
	INDEX "idx_jqgniexeuovomcougzlurcfewkpifjwvioqf" ("keywords"),
	INDEX "idx_ehuqxceidzvjqvzjgmbdazswybgavmblhjwt" ("keywords_vector"),
	PRIMARY KEY ("elementId", "attribute", "fieldId", "siteId")
);

DELETE FROM "searchindex";
/*!40000 ALTER TABLE "searchindex" DISABLE KEYS */;
INSERT INTO "searchindex" ("elementId", "attribute", "fieldId", "siteId", "keywords", "keywords_vector") VALUES
	(1, 'username', 0, 1, ' admin ', '''admin''');
INSERT INTO "searchindex" ("elementId", "attribute", "fieldId", "siteId", "keywords", "keywords_vector") VALUES
	(1, 'firstname', 0, 1, '', '');
INSERT INTO "searchindex" ("elementId", "attribute", "fieldId", "siteId", "keywords", "keywords_vector") VALUES
	(1, 'lastname', 0, 1, '', '');
INSERT INTO "searchindex" ("elementId", "attribute", "fieldId", "siteId", "keywords", "keywords_vector") VALUES
	(1, 'fullname', 0, 1, '', '');
INSERT INTO "searchindex" ("elementId", "attribute", "fieldId", "siteId", "keywords", "keywords_vector") VALUES
	(1, 'email', 0, 1, ' aminembarki gmail com ', '''aminembarki'' ''com'' ''gmail''');
INSERT INTO "searchindex" ("elementId", "attribute", "fieldId", "siteId", "keywords", "keywords_vector") VALUES
	(1, 'slug', 0, 1, '', '');
/*!40000 ALTER TABLE "searchindex" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "sections" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''sections_id_seq''::regclass)',
	"structureId" INTEGER NULL DEFAULT NULL,
	"name" VARCHAR(255) NOT NULL,
	"handle" VARCHAR(255) NOT NULL,
	"type" VARCHAR(255) NOT NULL DEFAULT 'channel',
	"enableVersioning" BOOLEAN NOT NULL DEFAULT 'false',
	"propagationMethod" VARCHAR(255) NOT NULL DEFAULT 'all',
	"previewTargets" TEXT NULL DEFAULT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"dateDeleted" TIMESTAMP NULL DEFAULT 'NULL::timestamp without time zone',
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_gesuetgkfesrlwzkuiaffovrhsfosoeuxnnu" ("dateDeleted"),
	INDEX "idx_srdnobxifogsqnujzgtgjelbmlvhxcxteizv" ("structureId"),
	INDEX "idx_cgkyzmykmscsvcftwxqyyxaeixcvckjtsten" ("name"),
	INDEX "idx_urrbzhmmwddozlngxrvtikqofvdcvynhdsnv" ("handle"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_nujgvdnurcwbmdhinijfytawnifsfvvywlco" FOREIGN KEY ("structureId") REFERENCES "public"."structures" ("id") ON UPDATE NO ACTION ON DELETE SET NULL
);

DELETE FROM "sections";
/*!40000 ALTER TABLE "sections" DISABLE KEYS */;
/*!40000 ALTER TABLE "sections" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "sections_sites" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''sections_sites_id_seq''::regclass)',
	"sectionId" INTEGER NOT NULL,
	"siteId" INTEGER NOT NULL,
	"hasUrls" BOOLEAN NOT NULL DEFAULT 'true',
	"uriFormat" TEXT NULL DEFAULT NULL,
	"template" VARCHAR(500) NULL DEFAULT NULL,
	"enabledByDefault" BOOLEAN NOT NULL DEFAULT 'true',
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_wihkawxrrrcwcavmadzdhwytfoeybhjwvlcj" ("siteId"),
	UNIQUE INDEX "idx_xvlmzcvjpkosmczkdyeyxvrfykcsvcvukfma" ("sectionId", "siteId"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_qeljmkqxyvgnwzqphlbwipdforhimhzkuapu" FOREIGN KEY ("sectionId") REFERENCES "public"."sections" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "fk_raeojcyityhfuvpfvrvbppomsyeraszceyys" FOREIGN KEY ("siteId") REFERENCES "public"."sites" ("id") ON UPDATE CASCADE ON DELETE CASCADE
);

DELETE FROM "sections_sites";
/*!40000 ALTER TABLE "sections_sites" DISABLE KEYS */;
/*!40000 ALTER TABLE "sections_sites" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "sequences" (
	"name" VARCHAR(255) NOT NULL,
	"next" INTEGER NOT NULL DEFAULT '1',
	PRIMARY KEY ("name")
);

DELETE FROM "sequences";
/*!40000 ALTER TABLE "sequences" DISABLE KEYS */;
/*!40000 ALTER TABLE "sequences" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "sessions" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''sessions_id_seq''::regclass)',
	"userId" INTEGER NOT NULL,
	"token" CHAR(100) NOT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_fgwiwybsvvhleipbrmvbntslkhwrecapwtkq" ("userId"),
	INDEX "idx_hmskeezvpfebplrltrpybiuiuaylvcedslew" ("dateUpdated"),
	INDEX "idx_qeessqxnnfhxnkcaohgwcrbarilsypldyrdw" ("token"),
	INDEX "idx_ihmeeelydatcxrbxbelxcbkbfphufeyypnjf" ("uid"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_yibedpqhgzdpypacvffveljgteyskbmltbqb" FOREIGN KEY ("userId") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

DELETE FROM "sessions";
/*!40000 ALTER TABLE "sessions" DISABLE KEYS */;
INSERT INTO "sessions" ("id", "userId", "token", "dateCreated", "dateUpdated", "uid") VALUES
	(1, 1, 'uRIYsatSpp4wxdx4qknmi87gUWgQVielvKoTop__5A-ZeNqZ5gyfZcjJlw3MinTr_w8GiF5D8eN-X9kchEkrv2mIuPz9uI5Kt2l6', '2021-06-15 16:15:54', '2021-06-15 16:26:44', '5939f26c-5013-4f2d-8ce8-8bf63c970853');
/*!40000 ALTER TABLE "sessions" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "shunnedmessages" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''shunnedmessages_id_seq''::regclass)',
	"userId" INTEGER NOT NULL,
	"message" VARCHAR(255) NOT NULL,
	"expiryDate" TIMESTAMP NULL DEFAULT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	UNIQUE INDEX "idx_echyichkszogvzamthbtpsiofonrowbesgwm" ("userId", "message"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_bcmeefxxzzprixrkrzdoeizpstviwlbfooil" FOREIGN KEY ("userId") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

DELETE FROM "shunnedmessages";
/*!40000 ALTER TABLE "shunnedmessages" DISABLE KEYS */;
/*!40000 ALTER TABLE "shunnedmessages" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "sitegroups" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''sitegroups_id_seq''::regclass)',
	"name" VARCHAR(255) NOT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"dateDeleted" TIMESTAMP NULL DEFAULT 'NULL::timestamp without time zone',
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_zslvdsfcrzouhebgauzuwjoebmgauqujmvzn" ("name"),
	PRIMARY KEY ("id")
);

DELETE FROM "sitegroups";
/*!40000 ALTER TABLE "sitegroups" DISABLE KEYS */;
INSERT INTO "sitegroups" ("id", "name", "dateCreated", "dateUpdated", "dateDeleted", "uid") VALUES
	(1, 'alerti', '2021-06-15 16:14:33', '2021-06-15 16:14:33', NULL, 'd5f95edd-804e-41ba-927b-9201536c452b');
/*!40000 ALTER TABLE "sitegroups" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "sites" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''sites_id_seq''::regclass)',
	"groupId" INTEGER NOT NULL,
	"primary" BOOLEAN NOT NULL,
	"enabled" BOOLEAN NOT NULL DEFAULT 'true',
	"name" VARCHAR(255) NOT NULL,
	"handle" VARCHAR(255) NOT NULL,
	"language" VARCHAR(12) NOT NULL,
	"hasUrls" BOOLEAN NOT NULL DEFAULT 'false',
	"baseUrl" VARCHAR(255) NULL DEFAULT NULL,
	"sortOrder" SMALLINT NULL DEFAULT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"dateDeleted" TIMESTAMP NULL DEFAULT 'NULL::timestamp without time zone',
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_jxeqglegfteckmgjvizclzfihztcjarnrmas" ("sortOrder"),
	INDEX "idx_zhbvpkpzxykmyryhcbwyuwpszalkcawrmizn" ("handle"),
	INDEX "idx_ukiupzkiewchiajlfglvogzgghlmhkgebcop" ("dateDeleted"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_apmocqptfytpksyrxzxijafwmohczchlrcly" FOREIGN KEY ("groupId") REFERENCES "public"."sitegroups" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

DELETE FROM "sites";
/*!40000 ALTER TABLE "sites" DISABLE KEYS */;
INSERT INTO "sites" ("id", "groupId", "primary", "enabled", "name", "handle", "language", "hasUrls", "baseUrl", "sortOrder", "dateCreated", "dateUpdated", "dateDeleted", "uid") VALUES
	(1, 1, 'true', 'true', 'alerti', 'default', 'en-US', 'true', '$PRIMARY_SITE_URL', 1, '2021-06-15 16:14:33', '2021-06-15 16:14:33', NULL, 'e7ddbb89-e989-43d1-86e9-e9e4f45da062');
/*!40000 ALTER TABLE "sites" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "structureelements" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''structureelements_id_seq''::regclass)',
	"structureId" INTEGER NOT NULL,
	"elementId" INTEGER NULL DEFAULT NULL,
	"root" INTEGER NULL DEFAULT NULL,
	"lft" INTEGER NOT NULL,
	"rgt" INTEGER NOT NULL,
	"level" SMALLINT NOT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_lzasguuzixisdeidijhvfbxwblusjkweprcn" ("elementId"),
	INDEX "idx_yfongyorpuxraaqgwwihstoaldzaqqtoaacg" ("level"),
	INDEX "idx_rzowaffaepazasjolseuhqoxodqpgzprofno" ("rgt"),
	INDEX "idx_rreixqpnjpkxgdsirrwjkhlfhzxzblnqcoer" ("lft"),
	INDEX "idx_mqskpjgcgxfejoakpwzrasxjxbwnobsmtdvb" ("root"),
	UNIQUE INDEX "idx_lwkympvbxemygunzzsbjqcdpefrjsmyjglgr" ("structureId", "elementId"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_jzuaaaxjhllqkhjdxwjkwalonxhadjetkvui" FOREIGN KEY ("elementId") REFERENCES "public"."elements" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "fk_twvaqnurgxpkjepmuffrmzhslbdneugkpvqa" FOREIGN KEY ("structureId") REFERENCES "public"."structures" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

DELETE FROM "structureelements";
/*!40000 ALTER TABLE "structureelements" DISABLE KEYS */;
/*!40000 ALTER TABLE "structureelements" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "structures" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''structures_id_seq''::regclass)',
	"maxLevels" SMALLINT NULL DEFAULT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"dateDeleted" TIMESTAMP NULL DEFAULT 'NULL::timestamp without time zone',
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_qeuxujcjxalysyoxtagbvvvtycgcmkydkmui" ("dateDeleted"),
	PRIMARY KEY ("id")
);

DELETE FROM "structures";
/*!40000 ALTER TABLE "structures" DISABLE KEYS */;
/*!40000 ALTER TABLE "structures" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "systemmessages" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''systemmessages_id_seq''::regclass)',
	"language" VARCHAR(255) NOT NULL,
	"key" VARCHAR(255) NOT NULL,
	"subject" TEXT NOT NULL,
	"body" TEXT NOT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_xzawtwugwdepttpgitsrbxvwxtditacytvvi" ("language"),
	UNIQUE INDEX "idx_aalomwepoapiudxtnmnbctayeqxrdlkumhxf" ("key", "language"),
	PRIMARY KEY ("id")
);

DELETE FROM "systemmessages";
/*!40000 ALTER TABLE "systemmessages" DISABLE KEYS */;
/*!40000 ALTER TABLE "systemmessages" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "taggroups" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''taggroups_id_seq''::regclass)',
	"name" VARCHAR(255) NOT NULL,
	"handle" VARCHAR(255) NOT NULL,
	"fieldLayoutId" INTEGER NULL DEFAULT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"dateDeleted" TIMESTAMP NULL DEFAULT 'NULL::timestamp without time zone',
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_lowzabhhxmthmqgecjhlbyvqlmpgjgvnqdvd" ("dateDeleted"),
	INDEX "idx_helnrtpzxfbavskvfkwaxxrdprfgsjauwmpa" ("handle"),
	INDEX "idx_qyobckhdbkyndujvfabxdzkokwurtwsajexz" ("name"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_iwnvhexmbfktrytcaygefuztjmunlgruqcye" FOREIGN KEY ("fieldLayoutId") REFERENCES "public"."fieldlayouts" ("id") ON UPDATE NO ACTION ON DELETE SET NULL
);

DELETE FROM "taggroups";
/*!40000 ALTER TABLE "taggroups" DISABLE KEYS */;
/*!40000 ALTER TABLE "taggroups" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "tags" (
	"id" INTEGER NOT NULL,
	"groupId" INTEGER NOT NULL,
	"deletedWithGroup" BOOLEAN NULL DEFAULT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_clcjbrzitoixelbnjewkptjiztbfysgtaozc" ("groupId"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_evoldopmbhyfegcavtqjnqjblscpnwmioaqh" FOREIGN KEY ("groupId") REFERENCES "public"."taggroups" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "fk_opddkjqmomnzarfykldgybhihmmgeutamtbv" FOREIGN KEY ("id") REFERENCES "public"."elements" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

DELETE FROM "tags";
/*!40000 ALTER TABLE "tags" DISABLE KEYS */;
/*!40000 ALTER TABLE "tags" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "templatecacheelements" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''templatecacheelements_id_seq''::regclass)',
	"cacheId" INTEGER NOT NULL,
	"elementId" INTEGER NOT NULL,
	INDEX "idx_vewgwzeyfnvzvhymmchihkulsvstydbqvfwn" ("elementId"),
	INDEX "idx_fsccgqgqmfmnvgqbtadgqaaiomtzdprjwccg" ("cacheId"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_hvzpgwttnqpbsmdwgbrtmhoaqlvvvlvkhezx" FOREIGN KEY ("elementId") REFERENCES "public"."elements" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "fk_udrcynibaokwtalgguzwgucwawqdnmqlyeat" FOREIGN KEY ("cacheId") REFERENCES "public"."templatecaches" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

DELETE FROM "templatecacheelements";
/*!40000 ALTER TABLE "templatecacheelements" DISABLE KEYS */;
/*!40000 ALTER TABLE "templatecacheelements" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "templatecachequeries" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''templatecachequeries_id_seq''::regclass)',
	"cacheId" INTEGER NOT NULL,
	"type" VARCHAR(255) NOT NULL,
	"query" TEXT NOT NULL,
	INDEX "idx_cxykkiicvgfpbsfoyfczxgyloaijdylforxe" ("type"),
	INDEX "idx_illcqnkoxkhgxityxyjdznfbkoktqggmixqk" ("cacheId"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_gykdcwtfknewwljqkyhvjqiobblhkqulxmkm" FOREIGN KEY ("cacheId") REFERENCES "public"."templatecaches" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

DELETE FROM "templatecachequeries";
/*!40000 ALTER TABLE "templatecachequeries" DISABLE KEYS */;
/*!40000 ALTER TABLE "templatecachequeries" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "templatecaches" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''templatecaches_id_seq''::regclass)',
	"siteId" INTEGER NOT NULL,
	"cacheKey" VARCHAR(255) NOT NULL,
	"path" VARCHAR(255) NULL DEFAULT NULL,
	"expiryDate" TIMESTAMP NOT NULL,
	"body" TEXT NOT NULL,
	INDEX "idx_asiwumbqtzghufhityneowjbmzgzsnbczupc" ("siteId"),
	INDEX "idx_guzacmkhtwsbyqcckzaewudqsbesjxqymtvy" ("cacheKey", "siteId", "expiryDate"),
	INDEX "idx_zgisawgwinlcyzaebvlfdhwcbzbbxuvyiyyp" ("cacheKey", "siteId", "expiryDate", "path"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_cwadrbfqrcsfytruwmheycnczxytrttbfxdr" FOREIGN KEY ("siteId") REFERENCES "public"."sites" ("id") ON UPDATE CASCADE ON DELETE CASCADE
);

DELETE FROM "templatecaches";
/*!40000 ALTER TABLE "templatecaches" DISABLE KEYS */;
/*!40000 ALTER TABLE "templatecaches" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "tokens" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''tokens_id_seq''::regclass)',
	"token" CHAR(32) NOT NULL,
	"route" TEXT NULL DEFAULT NULL,
	"usageLimit" SMALLINT NULL DEFAULT NULL,
	"usageCount" SMALLINT NULL DEFAULT NULL,
	"expiryDate" TIMESTAMP NOT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_zyntinubmemqpsdsparsqrwwgzayvdcqqdfo" ("expiryDate"),
	UNIQUE INDEX "idx_dshmyvgibfuwuhkekdcgdhkcxggujcnvdgzb" ("token"),
	PRIMARY KEY ("id")
);

DELETE FROM "tokens";
/*!40000 ALTER TABLE "tokens" DISABLE KEYS */;
/*!40000 ALTER TABLE "tokens" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "usergroups" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''usergroups_id_seq''::regclass)',
	"name" VARCHAR(255) NOT NULL,
	"handle" VARCHAR(255) NOT NULL,
	"description" TEXT NULL DEFAULT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_fnnzyqbopufqrnrfqpqamlsdwskjakgyacia" ("name"),
	INDEX "idx_mqbkhqdsjfonxqejqvimhygcdobramcmdier" ("handle"),
	PRIMARY KEY ("id")
);

DELETE FROM "usergroups";
/*!40000 ALTER TABLE "usergroups" DISABLE KEYS */;
/*!40000 ALTER TABLE "usergroups" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "usergroups_users" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''usergroups_users_id_seq''::regclass)',
	"groupId" INTEGER NOT NULL,
	"userId" INTEGER NOT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_vymuizbjtxlhrjvxupdkappztlfqjldtwjhu" ("userId"),
	UNIQUE INDEX "idx_vggrjqfjapfmbizynxkmlquygoumldcaucmc" ("groupId", "userId"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_fxxllfhihhrsjgjrhczdrynhbtaaqpffqyos" FOREIGN KEY ("groupId") REFERENCES "public"."usergroups" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "fk_orkrabntqriiefrechagyywwozbuklyptchq" FOREIGN KEY ("userId") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

DELETE FROM "usergroups_users";
/*!40000 ALTER TABLE "usergroups_users" DISABLE KEYS */;
/*!40000 ALTER TABLE "usergroups_users" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "userpermissions" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''userpermissions_id_seq''::regclass)',
	"name" VARCHAR(255) NOT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	UNIQUE INDEX "idx_hsvsoeubiqyoxjpzdautzwttzkdofxbznmmp" ("name"),
	PRIMARY KEY ("id")
);

DELETE FROM "userpermissions";
/*!40000 ALTER TABLE "userpermissions" DISABLE KEYS */;
/*!40000 ALTER TABLE "userpermissions" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "userpermissions_usergroups" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''userpermissions_usergroups_id_seq''::regclass)',
	"permissionId" INTEGER NOT NULL,
	"groupId" INTEGER NOT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_jdmvlmhawyojzjohrbngnhimyosxefzlbaoh" ("groupId"),
	UNIQUE INDEX "idx_cnmzikstsmrshkhhpbvpithwahcnmujqgsvy" ("permissionId", "groupId"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_nlpjsirozgrxidebiynryitmdudhkpwhmvmp" FOREIGN KEY ("groupId") REFERENCES "public"."usergroups" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "fk_trvusyagldkilhywvfxzwzggbtybxarlgsxx" FOREIGN KEY ("permissionId") REFERENCES "public"."userpermissions" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

DELETE FROM "userpermissions_usergroups";
/*!40000 ALTER TABLE "userpermissions_usergroups" DISABLE KEYS */;
/*!40000 ALTER TABLE "userpermissions_usergroups" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "userpermissions_users" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''userpermissions_users_id_seq''::regclass)',
	"permissionId" INTEGER NOT NULL,
	"userId" INTEGER NOT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_tgaylwxhrfuhrjpoispvzwryekmmhzmxahnu" ("userId"),
	UNIQUE INDEX "idx_sbqkpncxvyzzfmitfufojfdcqrheotqphfwm" ("permissionId", "userId"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_dordtiucqrbqipfngrpzssnnroolympekzsf" FOREIGN KEY ("userId") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "fk_vbajtmpggaekuscepwqlwlyfbwvgvhiluroo" FOREIGN KEY ("permissionId") REFERENCES "public"."userpermissions" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

DELETE FROM "userpermissions_users";
/*!40000 ALTER TABLE "userpermissions_users" DISABLE KEYS */;
/*!40000 ALTER TABLE "userpermissions_users" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "userpreferences" (
	"userId" INTEGER NOT NULL DEFAULT 'nextval(''"userpreferences_userId_seq"''::regclass)',
	"preferences" TEXT NULL DEFAULT NULL,
	PRIMARY KEY ("userId"),
	CONSTRAINT "fk_surazuzxivzvakkfyggqzsjqydqifwufqdok" FOREIGN KEY ("userId") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

DELETE FROM "userpreferences";
/*!40000 ALTER TABLE "userpreferences" DISABLE KEYS */;
INSERT INTO "userpreferences" ("userId", "preferences") VALUES
	(1, '{"language":"en-US"}');
/*!40000 ALTER TABLE "userpreferences" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "users" (
	"id" INTEGER NOT NULL,
	"username" VARCHAR(100) NOT NULL,
	"photoId" INTEGER NULL DEFAULT NULL,
	"firstName" VARCHAR(100) NULL DEFAULT NULL,
	"lastName" VARCHAR(100) NULL DEFAULT NULL,
	"email" VARCHAR(255) NOT NULL,
	"password" VARCHAR(255) NULL DEFAULT NULL,
	"admin" BOOLEAN NOT NULL DEFAULT 'false',
	"locked" BOOLEAN NOT NULL DEFAULT 'false',
	"suspended" BOOLEAN NOT NULL DEFAULT 'false',
	"pending" BOOLEAN NOT NULL DEFAULT 'false',
	"lastLoginDate" TIMESTAMP NULL DEFAULT NULL,
	"lastLoginAttemptIp" VARCHAR(45) NULL DEFAULT NULL,
	"invalidLoginWindowStart" TIMESTAMP NULL DEFAULT NULL,
	"invalidLoginCount" SMALLINT NULL DEFAULT NULL,
	"lastInvalidLoginDate" TIMESTAMP NULL DEFAULT NULL,
	"lockoutDate" TIMESTAMP NULL DEFAULT NULL,
	"hasDashboard" BOOLEAN NOT NULL DEFAULT 'false',
	"verificationCode" VARCHAR(255) NULL DEFAULT NULL,
	"verificationCodeIssuedDate" TIMESTAMP NULL DEFAULT NULL,
	"unverifiedEmail" VARCHAR(255) NULL DEFAULT NULL,
	"passwordResetRequired" BOOLEAN NOT NULL DEFAULT 'false',
	"lastPasswordChangeDate" TIMESTAMP NULL DEFAULT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_gmbvfmcrcnkmggilyxmsmvcsgtajegcchjmv" ("verificationCode"),
	INDEX "idx_oltuqfcjnbrffgchcxhgcnslybmcwfvqwddj" ("uid"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_elyaxryircbqlavdtpjhjdiasbqaxageouqh" FOREIGN KEY ("photoId") REFERENCES "public"."assets" ("id") ON UPDATE NO ACTION ON DELETE SET NULL,
	CONSTRAINT "fk_eqrhdmknsllzgrrmrwloynfrtyxrgbnakzqw" FOREIGN KEY ("id") REFERENCES "public"."elements" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

DELETE FROM "users";
/*!40000 ALTER TABLE "users" DISABLE KEYS */;
INSERT INTO "users" ("id", "username", "photoId", "firstName", "lastName", "email", "password", "admin", "locked", "suspended", "pending", "lastLoginDate", "lastLoginAttemptIp", "invalidLoginWindowStart", "invalidLoginCount", "lastInvalidLoginDate", "lockoutDate", "hasDashboard", "verificationCode", "verificationCodeIssuedDate", "unverifiedEmail", "passwordResetRequired", "lastPasswordChangeDate", "dateCreated", "dateUpdated", "uid") VALUES
	(1, 'admin', NULL, NULL, NULL, 'aminembarki@gmail.com', '$2y$13$T0YIXvPSDjAVMZohS80Sbe/fzt7N4NK7Mgd.OzS27VhuMDelm2qe6', 'true', 'false', 'false', 'false', '2021-06-15 16:15:54', NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, 'false', '2021-06-15 16:14:34', '2021-06-15 16:14:34', '2021-06-15 16:16:01', 'b885bdea-f293-4714-bfd8-f0168b1a8c12');
/*!40000 ALTER TABLE "users" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "volumefolders" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''volumefolders_id_seq''::regclass)',
	"parentId" INTEGER NULL DEFAULT NULL,
	"volumeId" INTEGER NULL DEFAULT NULL,
	"name" VARCHAR(255) NOT NULL,
	"path" VARCHAR(255) NULL DEFAULT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_wtljorwynhgiostyfrwwsytelqjxqmkgniez" ("volumeId"),
	INDEX "idx_jkmukoyihyacitpacorrfxzauqqqvbzpampr" ("parentId"),
	UNIQUE INDEX "idx_unoitmyywhiukkqhlgasjzuwoqfephqciwdz" ("name", "parentId", "volumeId"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_iolgspbudhkgjajexfooacwvykycffcadril" FOREIGN KEY ("volumeId") REFERENCES "public"."volumes" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "fk_kfejyawkaxcergjvjbeqvknoygjruacpmdkt" FOREIGN KEY ("parentId") REFERENCES "public"."volumefolders" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

DELETE FROM "volumefolders";
/*!40000 ALTER TABLE "volumefolders" DISABLE KEYS */;
/*!40000 ALTER TABLE "volumefolders" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "volumes" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''volumes_id_seq''::regclass)',
	"fieldLayoutId" INTEGER NULL DEFAULT NULL,
	"name" VARCHAR(255) NOT NULL,
	"handle" VARCHAR(255) NOT NULL,
	"type" VARCHAR(255) NOT NULL,
	"hasUrls" BOOLEAN NOT NULL DEFAULT 'true',
	"url" VARCHAR(255) NULL DEFAULT NULL,
	"titleTranslationMethod" VARCHAR(255) NOT NULL DEFAULT 'site',
	"titleTranslationKeyFormat" TEXT NULL DEFAULT NULL,
	"settings" TEXT NULL DEFAULT NULL,
	"sortOrder" SMALLINT NULL DEFAULT NULL,
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"dateDeleted" TIMESTAMP NULL DEFAULT 'NULL::timestamp without time zone',
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_kawcajvnophnhnulmtetcjtwyjsvajukqigq" ("dateDeleted"),
	INDEX "idx_yujviqtgmryiruaqwcjyvzjuxrpiyfiezudj" ("fieldLayoutId"),
	INDEX "idx_mbsmuonxfuqtmljmpptpwrvpgfivsevjhpat" ("handle"),
	INDEX "idx_aqtceuwsfdcljmrksaydrrzwsuzqstivzqla" ("name"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_eqqgjvzoifkjlsnwslsztgqnkqtseeyxemff" FOREIGN KEY ("fieldLayoutId") REFERENCES "public"."fieldlayouts" ("id") ON UPDATE NO ACTION ON DELETE SET NULL
);

DELETE FROM "volumes";
/*!40000 ALTER TABLE "volumes" DISABLE KEYS */;
/*!40000 ALTER TABLE "volumes" ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS "widgets" (
	"id" INTEGER NOT NULL DEFAULT 'nextval(''widgets_id_seq''::regclass)',
	"userId" INTEGER NOT NULL,
	"type" VARCHAR(255) NOT NULL,
	"sortOrder" SMALLINT NULL DEFAULT NULL,
	"colspan" SMALLINT NULL DEFAULT NULL,
	"settings" TEXT NULL DEFAULT NULL,
	"enabled" BOOLEAN NOT NULL DEFAULT 'true',
	"dateCreated" TIMESTAMP NOT NULL,
	"dateUpdated" TIMESTAMP NOT NULL,
	"uid" CHAR(36) NOT NULL DEFAULT '0',
	INDEX "idx_bltrnnsnsdalijrplpkrpchosqcayyzginbr" ("userId"),
	PRIMARY KEY ("id"),
	CONSTRAINT "fk_cvuuheqbewkqinyribkntxtdckdvvhazfbdp" FOREIGN KEY ("userId") REFERENCES "public"."users" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

DELETE FROM "widgets";
/*!40000 ALTER TABLE "widgets" DISABLE KEYS */;
INSERT INTO "widgets" ("id", "userId", "type", "sortOrder", "colspan", "settings", "enabled", "dateCreated", "dateUpdated", "uid") VALUES
	(1, 1, 'craft\widgets\RecentEntries', 1, NULL, '{"siteId":1,"section":"*","limit":10}', 'true', '2021-06-15 16:16:01', '2021-06-15 16:16:01', 'f3b78f5b-3422-43cd-bf23-4f4549d9e416');
INSERT INTO "widgets" ("id", "userId", "type", "sortOrder", "colspan", "settings", "enabled", "dateCreated", "dateUpdated", "uid") VALUES
	(2, 1, 'craft\widgets\CraftSupport', 2, NULL, '[]', 'true', '2021-06-15 16:16:01', '2021-06-15 16:16:01', 'bd813ec0-eeb7-422f-be25-5a56314d6497');
INSERT INTO "widgets" ("id", "userId", "type", "sortOrder", "colspan", "settings", "enabled", "dateCreated", "dateUpdated", "uid") VALUES
	(3, 1, 'craft\widgets\Updates', 3, NULL, '[]', 'true', '2021-06-15 16:16:01', '2021-06-15 16:16:01', '17668d14-9c30-412e-a33f-f0175f07d982');
INSERT INTO "widgets" ("id", "userId", "type", "sortOrder", "colspan", "settings", "enabled", "dateCreated", "dateUpdated", "uid") VALUES
	(4, 1, 'craft\widgets\Feed', 4, NULL, '{"url":"https://craftcms.com/news.rss","title":"Craft News","limit":5}', 'true', '2021-06-15 16:16:01', '2021-06-15 16:16:01', '2f97e563-f798-4212-9863-df5f6f42c0f5');
/*!40000 ALTER TABLE "widgets" ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
