CREATE TABLE bi_ma_user (
  code varchar(15) NOT NULL,
  name varchar(50) DEFAULT NULL,
  image_url varchar(300) DEFAULT NULL,
  date_of_birth date DEFAULT NULL,
  PRIMARY KEY (code)
);

CREATE TABLE bi_ma_profile (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(100) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE bi_ma_device (
  id int(11) NOT NULL,
  description varchar(100) DEFAULT NULL,
  location varchar(100) DEFAULT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE bi_tr_message (
  id int(11) NOT NULL AUTO_INCREMENT,
  interval_desc varchar(100) DEFAULT NULL,
  created varchar(15) DEFAULT NULL,
  start_date datetime DEFAULT NULL,
  end_date datetime DEFAULT NULL,
  PRIMARY KEY (id),
  KEY fk_msg_created (created),
  CONSTRAINT fk_msg_created FOREIGN KEY (created) REFERENCES bi_ma_user(code)
);

CREATE TABLE bi_tr_message_content(
  id int(11) NOT NULL AUTO_INCREMENT,
  message_id int(11) NOT NULL,
  content varchar(2000) DEFAULT NULL,
  image_url varchar(300) DEFAULT NULL,
  PRIMARY KEY(id),
  KEY fk_msg_content_message_id (message_id),
  CONSTRAINT fk_msg_content_message_id FOREIGN KEY (message_id) REFERENCES bi_tr_message(id)
);


CREATE TABLE bi_lk_user_profile (
  id int(11) NOT NULL AUTO_INCREMENT,
  user_code varchar(15) DEFAULT NULL,
  profile_id int(11) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY fk_up_u_id (user_code),
  KEY fk_up_p_id (profile_id),
  CONSTRAINT fk_up_p_id FOREIGN KEY (profile_id) REFERENCES bi_ma_profile (id),
  CONSTRAINT fk_up_u_id FOREIGN KEY (user_code) REFERENCES bi_ma_user (code)
);

CREATE TABLE bi_lk_profile_device (
  id int(11) NOT NULL AUTO_INCREMENT,
  profile_id int(11) DEFAULT NULL,
  device_id int(11) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY fk_pd_p_id (profile_id),
  KEY fk_pd_d_id (device_id),
  CONSTRAINT fk_pd_d_id FOREIGN KEY (device_id) REFERENCES bi_ma_device (id),
  CONSTRAINT fk_pd_p_id FOREIGN KEY (profile_id) REFERENCES bi_ma_profile (id)
);

CREATE TABLE bi_lk_message_profile (
  id int(11) NOT NULL AUTO_INCREMENT,
  message_id int(11) DEFAULT NULL,
  profile_id int(11) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY fk_mp_msg_id (message_id),
  KEY fk_mp_p_id (profile_id),
  CONSTRAINT fk_mp_msg_id FOREIGN KEY (message_id) REFERENCES bi_tr_message (id),
  CONSTRAINT fk_mp_p_id FOREIGN KEY (profile_id) REFERENCES bi_ma_profile (id)
);

CREATE TABLE bi_lk_message_user (
  id int(11) NOT NULL AUTO_INCREMENT,
  message_id int(11) DEFAULT NULL,
  user_code varchar(15) DEFAULT NULL,
  PRIMARY KEY (id),
  KEY fk_mu_msg_id (message_id),
  KEY fk_mu_u_id (user_code),
  CONSTRAINT fk_mu_msg_id FOREIGN KEY (message_id) REFERENCES bi_tr_message (id),
  CONSTRAINT fk_mu_u_id FOREIGN KEY (user_code) REFERENCES bi_ma_User (code)
);


CREATE TABLE bi_hs_message_user (
  id int(11) NOT NULL AUTO_INCREMENT,
  message_id int(11) DEFAULT NULL,
  user_code varchar(15) DEFAULT NULL,
  date datetime DEFAULT NULL,
  PRIMARY KEY (id),
  KEY fk_mu_hs_u_id (user_code),
  KEY fk_mu_hs_m_id (message_id),
  CONSTRAINT fk_mu_hs_u_id FOREIGN KEY (user_code) REFERENCES bi_ma_user (code),
  CONSTRAINT fk_mu_hs_m_id FOREIGN KEY (message_id) REFERENCES bi_tr_message (id)
);


insert into bi_ma_user( code, name, image_url, date_of_birth ) values ( "xxxxxx", "xxxxx", "/photos/", '1981-07-21');
insert into bi_ma_user( code, name, image_url, date_of_birth ) values ( "xxxxx", "xxxxxx", "/photos/", '1991-07-21');
insert into bi_ma_user( code, name, image_url, date_of_birth ) values ( "xxxxx", "xxxxxxx", "/photos/", '1978-01-01');
insert into bi_ma_user( code, name, image_url, date_of_birth ) values ( "xxxxx", "xxxxxxx", "/photos/", '1991-01-01');
insert into bi_ma_user( code, name, image_url, date_of_birth ) values ( "xxxxxx", "xxxxxxx", "/photos/", '1981-01-01');

insert into bi_ma_profile( name) values ( 'xxxxxxx');
insert into bi_ma_profile( name) values ( 'xxxxxx');
insert into bi_ma_profile( name) values ( 'xxxxxx');
insert into bi_ma_profile( name) values ( 'xxxxx');
insert into bi_ma_profile( name) values ( 'xxxxx');
insert into bi_ma_profile( name) values ( 'xxxxxx');


insert into bi_ma_device( id, description, location) values( 9262,'Estimoto1','Located at xxx Bay');
insert into bi_ma_device( id, description, location) values( 9263,'Estimoto1','Located at xxx Bay');

insert into bi_tr_message( interval_desc, created, start_date, end_date) values(  '0', 'xxxxxx', now(), now()+1); 
insert into bi_tr_message( interval_desc, created, start_date, end_date) values(  '0', 'xxxxxx', now(), now() + interval 1 day); 
insert into bi_tr_message( interval_desc, created, start_date, end_date) values(  '0', 'xxxxxx', now(), now() + interval 1 day); 
insert into bi_tr_message( interval_desc, created, start_date, end_date) values(  '0', 'xxxxxx', now(), now() + interval 1 day); 
insert into bi_tr_message( interval_desc, created, start_date, end_date) values(  '0', 'xxxxx', now(), now() + interval 1 day); 

insert into bi_tr_message_content( message_id, content, image_url ) values ( 1, 'xxxxxx', '/message/');
insert into bi_tr_message_content( message_id, content, image_url ) values ( 1, 'xxxxxx', '/message/');
insert into bi_tr_message_content( message_id, content, image_url ) values ( 1, 'xxxxxxx', '/message/');
insert into bi_tr_message_content( message_id, content, image_url ) values ( 2, 'xxxxxxx', '/message/');
insert into bi_tr_message_content( message_id, content, image_url ) values ( 2, 'xxxxxxx ', '/message/');
insert into bi_tr_message_content( message_id, content, image_url ) values ( 3, 'xxxxxxxx', '/message/');
insert into bi_tr_message_content( message_id, content, image_url ) values ( 4, 'xxxxxxxx', '/message/');
insert into bi_tr_message_content( message_id, content, image_url ) values ( 5, 'xxxxxxx', '/message/');

insert into bi_lk_user_profile( user_code, profile_id ) values ( 'xxxxxx', 2 );
insert into bi_lk_user_profile( user_code, profile_id ) values ( 'xxxxxxx', 1 );
insert into bi_lk_user_profile( user_code, profile_id ) values ( 'xxxxxxx', 1 );
insert into bi_lk_user_profile( user_code, profile_id ) values ( 'xxxxxxx', 6 );
insert into bi_lk_user_profile( user_code, profile_id ) values ( 'xxxxxxx', 4 );


insert into bi_lk_profile_device( profile_id, device_id) values ( 1 ,9262);
insert into bi_lk_profile_device( profile_id, device_id) values ( 2 ,9262);
insert into bi_lk_profile_device( profile_id, device_id) values ( 3 ,9262);
insert into bi_lk_profile_device( profile_id, device_id) values ( 4 ,9263);
insert into bi_lk_profile_device( profile_id, device_id) values ( 5 ,9263);
insert into bi_lk_profile_device( profile_id, device_id) values ( 6 ,9263);


insert into bi_lk_message_profile( message_id, profile_id ) values ( 1, 1);
insert into bi_lk_message_profile( message_id, profile_id ) values ( 2, 1);
insert into bi_lk_message_profile( message_id, profile_id ) values ( 3, 2);
insert into bi_lk_message_profile( message_id, profile_id ) values ( 4, 1);
insert into bi_lk_message_profile( message_id, profile_id ) values ( 4, 2);
insert into bi_lk_message_profile( message_id, profile_id ) values ( 4, 3);
insert into bi_lk_message_profile( message_id, profile_id ) values ( 4, 4);
insert into bi_lk_message_profile( message_id, profile_id ) values ( 4, 5);
insert into bi_lk_message_profile( message_id, profile_id ) values ( 4, 6);

insert into bi_lk_message_user( message_id, user_code) values ( 5, 'xxxxxx' );




select 
    msg.id,
    msg.created,
    usr.image_url,
    msg.start_date,
    msgcont.content,
    msgcont.image_url
from
    bi_tr_message msg,
    bi_lk_profile_device prf_dev,
    bi_lk_message_profile msg_prf,
    bi_lk_user_profile usr_prf,
    bi_ma_user usr,
    bi_tr_message_content msgcont
where
    prf_dev.profile_id = msg_prf.profile_id
        and msg_prf.message_id = msg.id
        and usr_prf.profile_id = msg_prf.profile_id
        and usr_prf.profile_id = prf_dev.profile_id
        and usr.code = usr_prf.user_code
        and msg.id = msgcont.message_id
        and (now() between msg.start_date and msg.end_date)
        and prf_dev.device_id = 'device1'
        and usr_prf.user_code = 'sdfdsfdsf' 
union select 
    msg.id,
    msg.created,
    usr.image_url,
    msg.start_date,
    msgcont.content,
    msgcont.image_url
from
    bi_tr_message msg,
    bi_lk_message_user msg_usr,
    bi_ma_user usr,
    bi_tr_message_content msgcont
where
    msg_usr.message_id = msg.id
        and usr.code = msg_usr.user_code
        and msg.id = msgcont.message_id
        and (now() between msg.start_date and msg.end_date)
        and msg_usr.user_code = 'sdfdsfdsfdsf';
