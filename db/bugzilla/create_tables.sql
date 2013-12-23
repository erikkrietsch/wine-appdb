CREATE SEQUENCE version_id_seq;
CREATE TABLE versions (
  value varchar(64) NOT NULL default '',
  product_id smallint NOT NULL default '0',
  id INT NOT NULL DEFAULT nextval('version_id_seq'),
  PRIMARY KEY ( id ),
  UNIQUE (product_id,value)
);
ALTER SEQUENCE version_id_seq OWNED BY versions.id;

--
-- Dumping data for table versions
--

INSERT INTO versions VALUES ('unspecified',1,1);
INSERT INTO versions VALUES ('CVS',1,2);
INSERT INTO versions VALUES ('unspecified',2,3);
INSERT INTO versions VALUES ('unspecified',3,4);
INSERT INTO versions VALUES ('unspecified',4,5);
INSERT INTO versions VALUES ('20010305',1,6);
INSERT INTO versions VALUES ('20010216',1,7);
INSERT INTO versions VALUES ('20010112',1,8);
INSERT INTO versions VALUES ('20010326',1,9);
INSERT INTO versions VALUES ('2.11',3,10);
INSERT INTO versions VALUES ('20010418',1,11);
INSERT INTO versions VALUES ('20020509',1,12);
INSERT INTO versions VALUES ('20010510',1,13);
INSERT INTO versions VALUES ('20010629',1,14);
INSERT INTO versions VALUES ('20010824',1,15);
INSERT INTO versions VALUES ('20011004',1,16);
INSERT INTO versions VALUES ('20011108',1,17);
INSERT INTO versions VALUES ('20020228',1,18);
INSERT INTO versions VALUES ('20020310',1,19);
INSERT INTO versions VALUES ('20020411',1,20);
INSERT INTO versions VALUES ('2.14.2',3,21);
INSERT INTO versions VALUES ('20020605',1,22);
INSERT INTO versions VALUES ('20020710',1,23);
INSERT INTO versions VALUES ('20020804',1,24);
INSERT INTO versions VALUES ('20020904',1,25);
INSERT INTO versions VALUES ('20021007',1,26);
INSERT INTO versions VALUES ('20021031',1,27);
INSERT INTO versions VALUES ('20021125',1,28);
INSERT INTO versions VALUES ('20021219',1,29);
INSERT INTO versions VALUES ('20030115',1,30);
INSERT INTO versions VALUES ('20030219',1,31);
INSERT INTO versions VALUES ('20030318',1,32);
INSERT INTO versions VALUES ('20030408',1,33);
INSERT INTO versions VALUES ('20030508',1,34);
INSERT INTO versions VALUES ('20030618',1,35);
INSERT INTO versions VALUES ('20030709',1,36);
INSERT INTO versions VALUES ('20030813',1,37);
INSERT INTO versions VALUES ('20030911',1,38);
INSERT INTO versions VALUES ('20031016',1,39);
INSERT INTO versions VALUES ('20031118',1,40);
INSERT INTO versions VALUES ('20031212',1,41);
INSERT INTO versions VALUES ('20040121',1,42);
INSERT INTO versions VALUES ('20040213',1,43);
INSERT INTO versions VALUES ('20040309',1,44);
INSERT INTO versions VALUES ('20040408',1,45);
INSERT INTO versions VALUES ('20040505',1,46);
INSERT INTO versions VALUES ('20040615',1,47);
INSERT INTO versions VALUES ('20040716',1,48);
INSERT INTO versions VALUES ('20040813',1,49);
INSERT INTO versions VALUES ('20040914',1,50);
INSERT INTO versions VALUES ('20041019',1,51);
INSERT INTO versions VALUES ('20041201',1,52);
INSERT INTO versions VALUES ('20050111',1,53);
INSERT INTO versions VALUES ('20050211',1,54);
INSERT INTO versions VALUES ('20050310',1,55);
INSERT INTO versions VALUES ('20050419',1,56);
INSERT INTO versions VALUES ('20050524',1,57);
INSERT INTO versions VALUES ('20050628',1,58);
INSERT INTO versions VALUES ('20050725',1,59);
INSERT INTO versions VALUES ('20050830',1,60);
INSERT INTO versions VALUES ('20050930',1,61);
INSERT INTO versions VALUES ('0.9',1,62);
INSERT INTO versions VALUES ('0.9.1.',1,63);
INSERT INTO versions VALUES ('0.9.2.',1,64);
INSERT INTO versions VALUES ('0.9.3.',1,65);
INSERT INTO versions VALUES ('0.9.4.',1,66);
INSERT INTO versions VALUES ('0.9.5.',1,67);
INSERT INTO versions VALUES ('0.9.6.',1,68);
INSERT INTO versions VALUES ('0.9.7.',1,69);
INSERT INTO versions VALUES ('0.9.8.',1,70);
INSERT INTO versions VALUES ('0.9.9.',1,71);
INSERT INTO versions VALUES ('0.9.10.',1,72);
INSERT INTO versions VALUES ('0.9.11.',1,73);
INSERT INTO versions VALUES ('0.9.12.',1,74);
INSERT INTO versions VALUES ('0.9.13.',1,75);
INSERT INTO versions VALUES ('0.9.14.',1,76);
INSERT INTO versions VALUES ('0.9.15.',1,77);
INSERT INTO versions VALUES ('0.9.16.',1,78);
INSERT INTO versions VALUES ('0.9.17.',1,79);
INSERT INTO versions VALUES ('0.9.18.',1,80);
INSERT INTO versions VALUES ('0.9.19.',1,81);
INSERT INTO versions VALUES ('0.9.20.',1,82);
INSERT INTO versions VALUES ('0.9.21.',1,83);
INSERT INTO versions VALUES ('0.9.22.',1,84);
INSERT INTO versions VALUES ('0.9.23.',1,85);
INSERT INTO versions VALUES ('0.9.24.',1,86);
INSERT INTO versions VALUES ('0.9.25.',1,87);
INSERT INTO versions VALUES ('0.9.26.',1,88);
INSERT INTO versions VALUES ('0.9.27.',1,89);
INSERT INTO versions VALUES ('0.9.28.',1,90);
INSERT INTO versions VALUES ('0.9.29.',1,91);
INSERT INTO versions VALUES ('0.9.30.',1,92);
INSERT INTO versions VALUES ('0.9.31.',1,93);
INSERT INTO versions VALUES ('0.9.32.',1,94);
INSERT INTO versions VALUES ('0.9.33.',1,95);
INSERT INTO versions VALUES ('0.9.34.',1,96);
INSERT INTO versions VALUES ('0.9.35.',1,97);
INSERT INTO versions VALUES ('0.9.36.',1,98);
INSERT INTO versions VALUES ('0.9.37.',1,99);
INSERT INTO versions VALUES ('0.9.38.',1,100);
INSERT INTO versions VALUES ('0.9.39.',1,101);
INSERT INTO versions VALUES ('0.9.40.',1,102);
INSERT INTO versions VALUES ('0.9.41.',1,103);
INSERT INTO versions VALUES ('0.9.42.',1,104);
INSERT INTO versions VALUES ('0.9.43.',1,105);
INSERT INTO versions VALUES ('0.9.44.',1,106);
INSERT INTO versions VALUES ('0.9.45.',1,107);
INSERT INTO versions VALUES ('0.9.46.',1,108);
INSERT INTO versions VALUES ('0.9.47.',1,109);
INSERT INTO versions VALUES ('0.9.48.',1,110);
INSERT INTO versions VALUES ('0.9.49.',1,111);
INSERT INTO versions VALUES ('0.9.50.',1,112);
INSERT INTO versions VALUES ('0.9.51.',1,113);
INSERT INTO versions VALUES ('0.9.52.',1,114);
INSERT INTO versions VALUES ('0.9.53.',1,115);
INSERT INTO versions VALUES ('0.9.54.',1,116);
INSERT INTO versions VALUES ('0.9.55.',1,117);
INSERT INTO versions VALUES ('0.9.56.',1,118);
INSERT INTO versions VALUES ('0.9.57.',1,119);
INSERT INTO versions VALUES ('0.9.58.',1,120);
INSERT INTO versions VALUES ('0.9.59.',1,121);
INSERT INTO versions VALUES ('0.9.60.',1,122);
INSERT INTO versions VALUES ('0.9.61.',1,123);
INSERT INTO versions VALUES ('1.0.rc1.',1,124);
INSERT INTO versions VALUES ('1.0.rc2.',1,125);
INSERT INTO versions VALUES ('1.0.rc3.',1,126);
INSERT INTO versions VALUES ('1.0.rc4.',1,127);
INSERT INTO versions VALUES ('1.0.rc5.',1,128);
INSERT INTO versions VALUES ('1.0.0.',1,129);
INSERT INTO versions VALUES ('1.1.0.',1,130);

--
-- Table structure for table bugs
--

DROP TABLE IF EXISTS bugs;
CREATE TYPE bug_severity_type AS ENUM('blocker','critical','major','normal','minor','trivial','enhancement');
CREATE TYPE bug_status_type AS ENUM('UNCONFIRMED','NEW','ASSIGNED','REOPENED','RESOLVED','VERIFIED','CLOSED');
CREATE TYPE op_sys_type AS ENUM('All','Windows 3.1','Windows 95','Windows 98','Windows ME','Windows 2000',
	'Windows NT','Windows XP','Mac System 7','Mac System 7.5','Mac System 7.6.1','Mac System 8.0',
	'Mac System 8.5','Mac System 8.6','Mac System 9.x','Mac OS X 10.0','Mac OS X 10.1','Mac OS X 10.2',
	'Linux','BSDI','FreeBSD','NetBSD','OpenBSD','AIX','BeOS','HP-UX','IRIX','Neutrino','OpenVMS','OS/2',
	'OSF/1','Solaris','SunOS','other'); 
CREATE TYPE bug_priority_type AS ENUM('P1','P2','P3','P4','P5');
CREATE TYPE rep_platform_type AS ENUM('All','DEC','HP','Macintosh','PC','PC-x86-64','SGI','Sun','Other');
CREATE TYPE bug_resolution_type AS ENUM('','FIXED','INVALID','WONTFIX','LATER','REMIND','DUPLICATE','WORKSFORME','MOVED','ABANDONED'); 
CREATE SEQUENCE bug_id_seq;
CREATE TABLE bugs (
  bug_id INT NOT NULL DEFAULT nextval('bug_id_seq'),
  assigned_to INT NOT NULL DEFAULT '0',
  bug_file_loc text,
  bug_severity bug_severity_type NOT NULL DEFAULT 'blocker',
  bug_status bug_status_type NOT NULL DEFAULT 'UNCONFIRMED',
  creation_ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  delta_ts timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  short_desc text,
  op_sys op_sys_type NOT NULL default 'All',
  priority bug_priority_type NOT NULL default 'P1',
  rep_platform rep_platform_type default NULL,
  reporter INT NOT NULL default '0',
  version varchar(64) NOT NULL default '',
  resolution bug_resolution_type NOT NULL default '',
  target_milestone varchar(20) NOT NULL default '---',
  qa_contact INT NOT NULL default '0',
  status_whiteboard text NOT NULL,
  votes INT NOT NULL default '0',
  keywords text NOT NULL,
  lastdiffed TIMESTAMP NOT NULL default CURRENT_TIMESTAMP,
  everconfirmed smallint NOT NULL default '0',
  environment varchar(80) default NULL,
  reporter_accessible smallint NOT NULL default '1',
  cclist_accessible smallint NOT NULL default '1',
  estimated_time decimal(5,2) NOT NULL default '0.00',
  remaining_time decimal(5,2) NOT NULL default '0.00',
  alias varchar(20) default NULL,
  product_id smallint NOT NULL default '0',
  component_id smallint NOT NULL default '0',
  PRIMARY KEY  (bug_id),
  UNIQUE (alias)
);
ALTER SEQUENCE bug_id_seq OWNED BY bugs.bug_id;
