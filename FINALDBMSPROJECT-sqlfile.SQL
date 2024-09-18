SQL> create table customer(custID number PRIMARY KEY,name varchar2(10),phone number not null unique,address varchar2(15),custype varchar(10),CHECK (custype = 'regular' or custype = 'gold'));

Table created.

SQL> create table gold(custID number PRIMARY KEY,date_joined date,coupons number default 0,FOREIGN KEY (custID) REFERENCES customer(custID));

Table created.

SQL> create table storeItems(itemID number PRIMARY KEY,price number,no_of_copies number,check(no_of_copies > 0));

Table created.

SQL> create table comicbook(itemID number PRIMARY KEY,title varchar2(15),publishDate date,FOREIGN KEY (itemID) REFERENCES storeItems(itemID));

Table created.

SQL> create table cartoonmovie(itemID number PRIMARY KEY,title varchar(15),studio_name varchar(15),description varchar(50),FOREIGN KEY (itemID) REFERENCES storeItems(itemID));

Table created.

SQL> create table custorder(orderID number PRIMARY KEY,date_of_order date,shipped_date date default null,shipping_fee number,check(date_of_order < shipped_date) );

Table created.

SQL> create table orderplaced(custID number,itemID number,orderID number,FOREIGN KEY (itemID) REFERENCES storeItems(itemID),FOREIGN KEY (custID) REFERENCES customer(custID),FOREIGN KEY (orderID) REFERENCES custorder(orderID),PRIMARY KEY(custID,itemID,orderID));

Table created.

SQL> create table order_line_items(LineID number,itemID number,orderID number,quantity number,FOREIGN KEY (itemID) REFERENCES storeItems(itemID),FOREIGN KEY (orderID) REFERENCES custorder(orderID),PRIMARY KEY(LineID,itemID,orderID));

Table created.

SQL> create trigger gold_entries
  2  after insert or update of custype on customer
  3  for each row
  4  when(new.custype = 'gold')
  5  begin
  6  insert into gold(custID,date_joined) values(:new.custID,CURRENT_TIMESTAMP);
  7  end;
  8  /

Trigger created.

SQL> insert into customer values(1,'Krishna',5103406646,'50 Washington' ,'gold'   );

1 row created.

SQL> insert into customer values(2,'vamsi'  ,5109804957,'52 Washington' ,'regular');

1 row created.

SQL> insert into customer values(3,'Rama'   ,4515204527,'64 DDcolony'   ,'gold'   );

1 row created.

SQL> insert into customer values(4,'satya'  ,6692959852,'21 DDcolony'   ,'regular');

1 row created.

SQL> insert into customer values(5,'rahim'  ,8573849372,'48 DDcolony'   ,'gold'   );

1 row created.

SQL> insert into customer values(6,'Anmol'  ,8800291506,'34 DDcolony'   ,'regular');

1 row created.

SQL> insert into customer values(7,'Rohit'  ,4086404309,'40 SanJose'    ,'gold'   );

1 row created.

SQL> insert into customer values(8,'Rohan'  ,4083298001,'30 SanJose'    ,'regular');

1 row created.

SQL> insert into customer values(9,'nikhil' ,6692889391,'12 Washington' ,'gold'   );

1 row created.

SQL> insert into customer values(10,'sucheet',7450064521,'10 Washington','regular');

1 row created.

SQL> insert into storeitems values(1,60,30);

1 row created.

SQL> insert into storeitems values(2,30,70);

1 row created.

SQL> insert into storeitems values(3,80,60);

1 row created.

SQL> insert into storeitems values(4,120,20);

1 row created.

SQL> insert into storeitems values(5,100,30);

1 row created.

SQL> insert into storeitems values(6,30,30);

1 row created.

SQL> insert into storeitems values(7,70,70);

1 row created.

SQL> insert into storeitems values(8,90,30);

1 row created.

SQL> insert into storeitems values(9,100,40);

1 row created.

SQL> insert into storeitems values(10,20,60);

1 row created.

SQL> insert into storeitems values(11,60,30);

1 row created.

SQL> insert into storeitems values(12,70,70);

1 row created.

SQL> insert into storeitems values(13,80,60);

1 row created.

SQL> insert into storeitems values(14,120,20);

1 row created.

SQL> insert into storeitems values(15,10,30);

1 row created.

SQL> insert into storeitems values(16,30,30);

1 row created.

SQL> insert into storeitems values(17,70,70);

1 row created.

SQL> insert into storeitems values(18,90,30);

1 row created.

SQL> insert into storeitems values(19,100,40);

1 row created.

SQL> insert into storeitems values(20,20,60);

1 row created.

SQL> insert into comicbook values(1,'spiderman','09/20/2000');

1 row created.

SQL> insert into comicbook values(2,'ironman','02/20/2001');

1 row created.

SQL> insert into comicbook values(3,'hulk','01/12/2004' );

1 row created.

SQL> insert into comicbook values(4,'thor','10/25/2006');

1 row created.

SQL> insert into comicbook values(5,'black panther','03/15/2008');

1 row created.

SQL> insert into comicbook values(6,'vision','11/20/2002');

1 row created.

SQL> insert into comicbook values(7,'groot','02/20/2005');

1 row created.

SQL> insert into comicbook values(8,'gamora','04/01/2004' );

1 row created.

SQL> insert into comicbook values(9,'antman','11/25/2002');

1 row created.

SQL> insert into comicbook values(10,'strange','03/05/2000');

1 row created.

SQL> insert into cartoonmovie values(11,'Avatar','20th Century','blue monkeys in different universe');

1 row created.

SQL> insert into cartoonmovie values(12,'Titanic','20th Century','Ship broke into half because of a kiss');

1 row created.

SQL> insert into cartoonmovie values(13,'King Kong','Warner Bros','Tales of a Big Monkey');

1 row created.

SQL> insert into cartoonmovie values(14,'Tenet','Warner Bros','Everything in the world is reverse');

1 row created.

SQL> insert into cartoonmovie values(15,'END GAME','Marvel Studios','I love you 3000');

1 row created.

SQL> insert into cartoonmovie values(16,'Alita','20th Century','robotic girl has a powerful suit');

1 row created.

SQL> insert into cartoonmovie values(17,'Iceage','20th Century','Crazy animals on ice');

1 row created.

SQL> insert into cartoonmovie values(18,'Pacific Rim','Warner Bros','Monster vs Monster');

1 row created.

SQL> insert into cartoonmovie values(19,'Venom','Warner Bros','A parasite eats humans');

1 row created.

SQL> insert into cartoonmovie values(20,'Spiderman','Marvel Studios','With great power comes great responsibility');

1 row created.

SQL> select * from customer;

    CUSTID NAME            PHONE ADDRESS         CUSTYPE                                            
---------- ---------- ---------- --------------- ----------                                         
         1 Krishna    5103406646 50 Washington   gold                                               
         2 vamsi      5109804957 52 Washington   regular                                            
         3 Rama       4515204527 64 DDcolony     gold                                               
         4 satya      6692959852 21 DDcolony     regular                                            
         5 rahim      8573849372 48 DDcolony     gold                                               
         6 Anmol      8800291506 34 DDcolony     regular                                            
         7 Rohit      4086404309 40 SanJose      gold                                               
         8 Rohan      4083298001 30 SanJose      regular                                            
         9 nikhil     6692889391 12 Washington   gold                                               
        10 sucheet    7450064521 10 Washington   regular                                            

10 rows selected.

SQL> select * from gold;

    CUSTID DATE_JOINE    COUPONS                                                                    
---------- ---------- ----------                                                                    
         1 12/02/2022          0                                                                    
         3 12/02/2022          0                                                                    
         5 12/02/2022          0                                                                    
         7 12/02/2022          0                                                                    
         9 12/02/2022          0                                                                    

SQL> select * from storeitems;

    ITEMID      PRICE NO_OF_COPIES                                                                  
---------- ---------- ------------                                                                  
         1         60           30                                                                  
         2         30           70                                                                  
         3         80           60                                                                  
         4        120           20                                                                  
         5        100           30                                                                  
         6         30           30                                                                  
         7         70           70                                                                  
         8         90           30                                                                  
         9        100           40                                                                  
        10         20           60                                                                  
        11         60           30                                                                  
        12         70           70                                                                  
        13         80           60                                                                  
        14        120           20                                                                  
        15         10           30                                                                  
        16         30           30                                                                  
        17         70           70                                                                  
        18         90           30                                                                  
        19        100           40                                                                  
        20         20           60                                                                  

20 rows selected.

SQL> select * from cartoonmovie;

    ITEMID TITLE           STUDIO_NAME     DESCRIPTION                                              
---------- --------------- --------------- --------------------------------------------------       
        11 Avatar          20th Century    blue monkeys in different universe                       
        12 Titanic         20th Century    Ship broke into half because of a kiss                   
        13 King Kong       Warner Bros     Tales of a Big Monkey                                    
        14 Tenet           Warner Bros     Everything in the world is reverse                       
        15 END GAME        Marvel Studios  I love you 3000                                          
        16 Alita           20th Century    robotic girl has a powerful suit                         
        17 Iceage          20th Century    Crazy animals on ice                                     
        18 Pacific Rim     Warner Bros     Monster vs Monster                                       
        19 Venom           Warner Bros     A parasite eats humans                                   
        20 Spiderman       Marvel Studios  With great power comes great responsibility              

10 rows selected.

SQL> select * from comicbook;

    ITEMID TITLE           PUBLISHDAT                                                               
---------- --------------- ----------                                                               
         1 spiderman       09/20/2000                                                               
         2 ironman         02/20/2001                                                               
         3 hulk            01/12/2004                                                               
         4 thor            10/25/2006                                                               
         5 black panther   03/15/2008                                                               
         6 vision          11/20/2002                                                               
         7 groot           02/20/2005                                                               
         8 gamora          04/01/2004                                                               
         9 antman          11/25/2002                                                               
        10 strange         03/05/2000                                                               

10 rows selected.

SQL> create function createCustOrder
  2  return number is
  3  random_number number;
  4  begin
  5  random_number := round(dbms_random.value(0,2147483648),0);
  6  return random_number;
  7  end;
  8  /

Function created.

SQL> CREATE OR REPLACE TYPE MyType AS VARRAY(10) OF number;
  2  /

Type created.

SQL> create procedure make_order(cID IN number,itemList Mytype)
  2  AS
  3  i number;
  4  cusordID number;
  5  c_type varchar2(10);
  6  s_fee number;
  7  Begin
  8  i:= 0;
  9  cusordID := createCustOrder;
 10  dbms_output.put_line(' ---------------------------------------- ');
 11  dbms_output.put_line(' your order number is ' || cusordID);
 12  dbms_output.put_line(' ---------------------------------------- ');
 13  
 14  select custype into c_type from customer where custID = cID;
 15  
 16  if c_type = 'gold' then
 17  s_fee := 0;
 18  else
 19  s_fee := 10;
 20  end if;
 21  
 22  insert into custorder values(cusordID,CURRENT_TIMESTAMP,null,s_fee);
 23  for i in 1..itemList.count loop
 24  insert into orderplaced values(cID,itemList(i),cusordID);
 25  end loop;
 26  end;
 27  /

Procedure created.

SQL> Declare
  2  t Mytype;
  3  begin
  4  t := Mytype();
  5  t.EXTEND(4);
  6  t(1) := 1;
  7  t(2) := 10;
  8  t(3) := 16;
  9  t(4) := 17;
 10  make_order(1,t);
 11  end;
 12  /
----------------------------------------                                                            
your order number is 909185113                                                                      
----------------------------------------                                                            

PL/SQL procedure successfully completed.

SQL> Declare
  2  t Mytype;
  3  begin
  4  t := Mytype();
  5  t.EXTEND(3);
  6  t(1) := 5;
  7  t(2) := 6;
  8  t(3) := 12;
  9  make_order(3,t);
 10  end;
 11  /
----------------------------------------                                                            
your order number is 1712960601                                                                     
----------------------------------------                                                            

PL/SQL procedure successfully completed.

SQL> Declare
  2  t Mytype;
  3  begin
  4  t := Mytype();
  5  t.EXTEND(2);
  6  t(1) := 2;
  7  t(2) := 15;
  8  make_order(4,t);
  9  end;
 10  /
----------------------------------------                                                            
your order number is 523559599                                                                      
----------------------------------------                                                            

PL/SQL procedure successfully completed.

SQL> Declare
  2  t Mytype;
  3  begin
  4  t := Mytype();
  5  t.EXTEND(3);
  6  t(1) := 8;
  7  t(2) := 13;
  8  t(3) := 20;
  9  make_order(6,t);
 10  end;
 11  /
----------------------------------------                                                            
your order number is 914276508                                                                      
----------------------------------------                                                            

PL/SQL procedure successfully completed.

SQL> Declare
  2  t Mytype;
  3  begin
  4  t := Mytype();
  5  t.EXTEND(3);
  6  t(1) := 9;
  7  t(2) := 11;
  8  t(3) := 17;
  9  make_order(1,t);
 10  end;
 11  /
----------------------------------------                                                            
your order number is 1761042575                                                                     
----------------------------------------                                                            

PL/SQL procedure successfully completed.

SQL> Declare
  2  t Mytype;
  3  begin
  4  t := Mytype();
  5  t.EXTEND(1);
  6  t(1) := 5;
  7  make_order(5,t);
  8  end;
  9  /
----------------------------------------                                                            
your order number is 330819623                                                                      
----------------------------------------                                                            

PL/SQL procedure successfully completed.


SQL> select * from orderplaced order by custid;

    CUSTID     ITEMID    ORDERID                                                                    
---------- ---------- ----------                                                                    
         1          1  909185113                                                                    
         1          9 1761042575                                                                    
         1         10  909185113                                                                    
         1         11 1761042575                                                                    
         1         16  909185113                                                                    
         1         17  909185113                                                                    
         1         17 1761042575                                                                    
         3          5 1712960601                                                                    
         3          6 1712960601                                                                    
         3         12 1712960601                                                                    
         4          2  523559599                                                                    
         4         15  523559599                                                                    
         5          5  330819623                                                                    
         6          8  914276508                                                                    
         6         13  914276508                                                                    
         6         20  914276508                                                                    

16 rows selected.

SQL> select * from custorder;

   ORDERID DATE_OF_OR SHIPPED_DA SHIPPING_FEE                                                       
---------- ---------- ---------- ------------                                                       
 909185113 12/02/2022                       0                                                       
1712960601 12/02/2022                       0                                                       
 523559599 12/02/2022                      10                                                       
 914276508 12/02/2022                      10                                                       
1761042575 12/02/2022                       0                                                       
 330819623 12/02/2022                       0                                                       

6 rows selected.

SQL> create procedure createOrderLineItem(cID IN number,itemList Mytype,quantity Mytype,custorderID number)
  2  As
  3  
  4  i number;
  5  flag number;
  6  copies number;
  7  c number;
  8  cust_type varchar2(10);
  9  
 10  begin
 11  
 12  flag := 0;
 13  for i in 1..itemList.count loop
 14  select no_of_copies into copies from storeItems where itemID = itemList(i);
 15  IF copies < quantity(i) THEN
 16  dbms_output.put_line('CANNOT PROCEED WITH THE ORDER');
 17  delete from orderplaced where orderID = custorderID;
 18  delete from custorder where orderID = custorderID;
 19  flag := 1;
 20  EXIT;
 21  END IF;
 22  end loop;
 23  
 24  if flag = 0 then
 25  select custype into cust_type from customer where custID = cID;
 26  
 27  if cust_type = 'gold' then
 28  Update custorder set shipping_fee = 0 where orderID = custorderID;
 29  else
 30  Update custorder set shipping_fee = 10 where orderID = custorderID;
 31  end if;
 32  
 33  i:=0;
 34  for i in 1..itemList.count loop
 35  insert into order_line_items values(i,itemList(i),custorderID,quantity(i));
 36  select no_of_copies into copies from storeItems where itemID = itemList(i);
 37  c := copies - quantity(i);
 38  update storeItems set no_of_copies = c where itemID = itemList(i);
 39  end loop;
 40  end if;
 41  
 42  end;
 43  /

Procedure created.

SQL> Declare
  2  item Mytype;
  3  quantity Mytype;
  4  begin
  5  item := Mytype();
  6  item.EXTEND(1);
  7  item(1) := 5;
  8  
  9  quantity := Mytype();
 10  quantity.EXTEND(1);
 11  quantity(1) := 100;
 12  
 13  createOrderLineItem(5,item,quantity, 330819623);
 14  end;
 15  /
CANNOT PROCEED WITH THE ORDER                                                                       

PL/SQL procedure successfully completed.

SQL> select * from custorder;

   ORDERID DATE_OF_OR SHIPPED_DA SHIPPING_FEE                                                       
---------- ---------- ---------- ------------                                                       
 909185113 12/02/2022                       0                                                       
1712960601 12/02/2022                       0                                                       
 523559599 12/02/2022                      10                                                       
 914276508 12/02/2022                      10                                                       
1761042575 12/02/2022                       0                                                       

SQL> Declare
  2  item Mytype;
  3  quantity Mytype;
  4  begin
  5  item := Mytype();
  6  item.EXTEND(4);
  7  item(1) := 1;
  8  item(2) := 10;
  9  item(3) := 16;
 10  item(4) := 17;
 11  
 12  quantity := Mytype();
 13  quantity.EXTEND(4);
 14  quantity(1) := 3;
 15  quantity(2) := 2;
 16  quantity(3) := 1;
 17  quantity(4) := 1;
 18  
 19  
 20  createOrderLineItem(1,item,quantity, 909185113);
 21  end;
 22  /

PL/SQL procedure successfully completed.

SQL> Declare
  2  item Mytype;
  3  quantity Mytype;
  4  begin
  5  item := Mytype();
  6  item.EXTEND(3);
  7  item(1) := 5;
  8  item(2) := 6;
  9  item(3) := 12;
 10  
 11  quantity := Mytype();
 12  quantity.EXTEND(3);
 13  quantity(1) := 5;
 14  quantity(2) := 4;
 15  quantity(3) := 2;
 16  
 17  createOrderLineItem(3,item,quantity, 1712960601);
 18  end;
 19  /

PL/SQL procedure successfully completed.

SQL> Declare
  2  item Mytype;
  3  quantity Mytype;
  4  begin
  5  item := Mytype();
  6  item.EXTEND(2);
  7  item(1) := 2;
  8  item(2) := 15;
  9  
 10  quantity := Mytype();
 11  quantity.EXTEND(2);
 12  quantity(1) := 1;
 13  quantity(2) := 1;
 14  
 15  
 16  createOrderLineItem(4,item,quantity,  523559599);
 17  end;
 18  /

PL/SQL procedure successfully completed.

SQL> Declare
  2  item Mytype;
  3  quantity Mytype;
  4  begin
  5  item := Mytype();
  6  item.EXTEND(3);
  7  item(1) := 8;
  8  item(2) := 13;
  9  item(3) := 20;
 10  
 11  quantity := Mytype();
 12  quantity.EXTEND(3);
 13  quantity(1) := 2;
 14  quantity(2) := 4;
 15  quantity(3) := 1;
 16  
 17  
 18  createOrderLineItem(6,item,quantity, 914276508);
 19  end;
 20  /

PL/SQL procedure successfully completed.

SQL> Declare
  2  item Mytype;
  3  quantity Mytype;
  4  begin
  5  item := Mytype();
  6  item.EXTEND(3);
  7  item(1) := 9;
  8  item(2) := 11;
  9  item(3) := 17;
 10  
 11  quantity := Mytype();
 12  quantity.EXTEND(3);
 13  quantity(1) := 2;
 14  quantity(2) := 3;
 15  quantity(3) := 1;
 16  
 17  
 18  createOrderLineItem(1,item,quantity,  1761042575);
 19  end;
 20  /

PL/SQL procedure successfully completed.

SQL> select * from order_line_items order by orderid,lineid;

    LINEID     ITEMID    ORDERID   QUANTITY                                                         
---------- ---------- ---------- ----------                                                         
         1          2  523559599          1                                                         
         2         15  523559599          1                                                         
         1          1  909185113          3                                                         
         2         10  909185113          2                                                         
         3         16  909185113          1                                                         
         4         17  909185113          1                                                         
         1          8  914276508          2                                                         
         2         13  914276508          4                                                         
         3         20  914276508          1                                                         
         1          5 1712960601          5                                                         
         2          6 1712960601          4                                                         
         3         12 1712960601          2                                                         
         1          9 1761042575          2                                                         
         2         11 1761042575          3                                                         
         3         17 1761042575          1                                                         

15 rows selected.

SQL> select * from storeitems;

    ITEMID      PRICE NO_OF_COPIES                                                                  
---------- ---------- ------------                                                                  
         1         60           27                                                                  
         2         30           69                                                                  
         3         80           60                                                                  
         4        120           20                                                                  
         5        100           25                                                                  
         6         30           26                                                                  
         7         70           70                                                                  
         8         90           28                                                                  
         9        100           38                                                                  
        10         20           58                                                                  
        11         60           27                                                                  
        12         70           68                                                                  
        13         80           56                                                                  
        14        120           20                                                                  
        15         10           29                                                                  
        16         30           29                                                                  
        17         70           68                                                                  
        18         90           30                                                                  
        19        100           40                                                                  
        20         20           59                                                                  

20 rows selected.

SQL> create trigger gold_update
  2  after update of custype on customer
  3  for each row
  4  when(new.custype = 'gold')
  5  
  6  Declare
  7  
  8  order_number number;
  9  CURSOR c is select distinct(orderID) from orderplaced where custID = :new.custID;
 10  s date;
 11  Begin
 12  open c;
 13  
 14  LOOP
 15  FETCH c into order_number;
 16  EXIT WHEN c%notfound;
 17  
 18  update custorder set shipping_fee = 0 where orderID = order_number and shipped_date is NULL;
 19  
 20  end LOOP;
 21  CLOSE c;
 22  end;
 23  /

Trigger created.

SQL> update customer set custype = 'gold' where custid = 4;

1 row updated.

SQL> select * from custorder;

   ORDERID DATE_OF_OR SHIPPED_DA SHIPPING_FEE                                                       
---------- ---------- ---------- ------------                                                       
 909185113 12/02/2022                       0                                                       
1712960601 12/02/2022                       0                                                       
 523559599 12/02/2022                       0                                                       
 914276508 12/02/2022                      10                                                       
1761042575 12/02/2022                       0                                                       

SQL> create procedure setShippingDate(o IN number,s_d IN date)
  2  As
  3  begin
  4  update custorder set shipped_date = s_d where orderID = o;
  5  end;
  6  /

Procedure created.

SQL> select * from custorder;

   ORDERID DATE_OF_OR SHIPPED_DA SHIPPING_FEE                                                       
---------- ---------- ---------- ------------                                                       
 909185113 12/02/2022                       0                                                       
1712960601 12/02/2022                       0                                                       
 523559599 12/02/2022                       0                                                       
 914276508 12/02/2022                      10                                                       
1761042575 12/02/2022                       0                                                       

SQL> begin
  2  setShippingDate( 909185113,'12/03/2022');
  3  setShippingDate(1712960601,'12/05/2022');
  4  setShippingDate(523559599,'12/05/2022');
  5  setShippingDate(914276508,'12/07/2022');
  6  setShippingDate(1761042575,'12/04/2022');
  7  end;
  8  /

PL/SQL procedure successfully completed.

SQL> select * from custorder;

   ORDERID DATE_OF_OR SHIPPED_DA SHIPPING_FEE                                                       
---------- ---------- ---------- ------------                                                       
 909185113 12/02/2022 12/03/2022            0                                                       
1712960601 12/02/2022 12/05/2022            0                                                       
 523559599 12/02/2022 12/05/2022            0                                                       
 914276508 12/02/2022 12/07/2022           10                                                       
1761042575 12/02/2022 12/04/2022            0                                                       

SQL> create function computeTotal(o IN number)
  2  return number is
  3  
  4  total number := 0;
  5  ct number := 0;
  6  q number := 0;
  7  p number:= 0;
  8  x number := 0;
  9  i number:= 0;
 10  t varchar2(10) := '';
 11  pick number;
 12  
 13  begin
 14  
 15  select count(itemID) into ct from order_line_items where orderID = o;
 16  
 17  for i in 1..ct loop
 18  select itemID,quantity into x,q from order_line_items where orderID = o and LineID = i;
 19  select price into p from storeItems where itemID = x;
 20  total := total + (p*q);
 21  end loop;
 22  
 23  dbms_output.put_line(' total of all items          = ' || total);
 24  
 25  select custype into t from customer where custID = (select distinct(custID) from orderplaced where orderID = o);
 26  
 27  if t = 'gold' then
 28  if total >= 100 then
 29  pick := (0.1*total);
 30  total := total - pick;
 31  dbms_output.put_line(' DISCOUNT FOR GOLDEN MEMBER  = ' || pick);
 32  dbms_output.put_line(' AFTER discount              = ' || total);
 33  
 34  end if;
 35  end if;
 36  
 37  
 38  
 39  select shipping_fee into x from custorder where orderid = o;
 40  dbms_output.put_line(' Shipping charges            = ' || x);
 41  total := total + x;
 42  dbms_output.put_line(' AFTER shipping  fee         = ' || total);
 43  
 44  
 45  pick := (0.05*total);
 46  total := total + pick;
 47  dbms_output.put_line(' TAX 5%                      = ' || pick);
 48  
 49  dbms_output.put_line(' AFTER tax                   = ' || total);
 50  dbms_output.put_line('------------------------------------------');
 51  return total;
 52  end;
 53  /

Function created.
 
SQL> begin
  2  dbms_output.put_line('***********************************************');
  3      dbms_output.put_line(' total cost : ' || computetotal(909185113));
  4  dbms_output.put_line('***********************************************');
  5  end;
  6  /
***********************************************                                                     
total of all items          = 320                                                                   
DISCOUNT FOR GOLDEN MEMBER  = 32                                                                    
AFTER discount              = 288                                                                   
Shipping charges            = 0                                                                     
AFTER shipping  fee         = 288                                                                   
TAX 5%                      = 14.4                                                                  
AFTER tax                   = 302.4                                                                 
------------------------------------------                                                          
total cost : 302.4                                                                                  
***********************************************                                                     

PL/SQL procedure successfully completed.

SQL> begin
  2  dbms_output.put_line('***********************************************');
  3       dbms_output.put_line(' total cost : ' || computetotal(1712960601));
  4  dbms_output.put_line('***********************************************');
  5  end;
  6  /
***********************************************                                                     
total of all items          = 760                                                                   
DISCOUNT FOR GOLDEN MEMBER  = 76                                                                    
AFTER discount              = 684                                                                   
Shipping charges            = 0                                                                     
AFTER shipping  fee         = 684                                                                   
TAX 5%                      = 34.2                                                                  
AFTER tax                   = 718.2                                                                 
------------------------------------------                                                          
total cost : 718.2                                                                                  
***********************************************                                                     

PL/SQL procedure successfully completed.

SQL> begin
  2  dbms_output.put_line('***********************************************');
  3      dbms_output.put_line(' total cost : ' || computetotal(523559599));
  4  dbms_output.put_line('***********************************************');
  5  end;
  6  /
***********************************************                                                     
total of all items          = 40                                                                    
Shipping charges            = 0                                                                     
AFTER shipping  fee         = 40                                                                    
TAX 5%                      = 2                                                                     
AFTER tax                   = 42                                                                    
------------------------------------------                                                          
total cost : 42                                                                                     
***********************************************                                                     

PL/SQL procedure successfully completed.

SQL> begin
  2  dbms_output.put_line('***********************************************');
  3       dbms_output.put_line(' total cost : ' || computetotal(914276508));
  4  dbms_output.put_line('***********************************************');
  5  end;
  6  /
***********************************************                                                     
total of all items          = 520                                                                   
Shipping charges            = 10                                                                    
AFTER shipping  fee         = 530                                                                   
TAX 5%                      = 26.5                                                                  
AFTER tax                   = 556.5                                                                 
------------------------------------------                                                          
total cost : 556.5                                                                                  
***********************************************                                                     

PL/SQL procedure successfully completed.

SQL> 
SQL> begin
  2  dbms_output.put_line('***********************************************');
  3      dbms_output.put_line(' total cost : ' || computetotal(1761042575));
  4  dbms_output.put_line('***********************************************');
  5  end;
  6  /
***********************************************                                                     
total of all items          = 450                                                                   
DISCOUNT FOR GOLDEN MEMBER  = 45                                                                    
AFTER discount              = 405                                                                   
Shipping charges            = 0                                                                     
AFTER shipping  fee         = 405                                                                   
TAX 5%                      = 20.25                                                                 
AFTER tax                   = 425.25                                                                
------------------------------------------                                                          
total cost : 425.25                                                                                 
***********************************************                                                     

PL/SQL procedure successfully completed.

SQL> create procedure showitemorders(o in number)
  2  As
  3  
  4  cus number;
  5  c_name varchar2(20);
  6  c_phone number;
  7  c_address varchar2(50);
  8  c_type varchar2(10);
  9  
 10  
 11  cursor c1 is select lineID,quantity,itemID,title,publishdate from order_line_items natural join comicbook where orderID = o;
 12  cursor c2 is select lineID,quantity,itemID,title,studio_name,description from order_line_items natural join cartoonmovie where orderID = o;
 13  
 14  lid number;
 15  q number;
 16  iid number;
 17  t varchar2(15);
 18  
 19  pd date;
 20  
 21  sn varchar2(15);
 22  desi varchar2(50);
 23  
 24  pp number;
 25  
 26  vcount number:=0;
 27  
 28  begin
 29  
 30  select custID,name,phone,address,custype into cus,c_name,c_phone,c_address,c_type from customer where custID = (select distinct(custID)  from orderplaced where orderID = o);
 31  
 32  dbms_output.put_line(' Customer ID      = ' || cus);
 33  dbms_output.put_line(' Customer name    = ' || c_name);
 34  dbms_output.put_line(' Customer phone   = ' || c_phone);
 35  dbms_output.put_line(' Customer address = ' || c_address);
 36  dbms_output.put_line(' Customer type    = ' || c_type );
 37  dbms_output.put_line('----------------------------------------------------------------------');
 38  dbms_output.put_line(' List of items with its details ');
 39  dbms_output.put_line('----------------------------------------------------------------------');
 40  dbms_output.put_line(' COMIC BOOKS' );
 41  dbms_output.put_line('---------');
 42  open c1;
 43  loop
 44  fetch c1 into lid,q,iid,t,pd;
 45  EXIT when c1%notfound;
 46  vcount := vcount+1;
 47  select price into pp from storeitems where itemid = iid;
 48  dbms_output.put_line(' Line number       = ' || lid);
 49  dbms_output.put_line(' item number       = ' || iid);
 50  dbms_output.put_line(' title             = ' || t);
 51  dbms_output.put_line(' publish date      = ' || pd);
 52  dbms_output.put_line(' price per item    = ' || pp);
 53  dbms_output.put_line(' quantity          = ' || q);
 54  dbms_output.put_line('---------');
 55  
 56  end loop;
 57  close c1;
 58  
 59  dbms_output.put_line('-----------------------------------------------------------------------');
 60  dbms_output.put_line(' CARTOON MOVIES' );
 61  dbms_output.put_line('-----------------');
 62  vcount:=0;
 63  
 64  open c2;
 65  loop
 66  fetch c2 into lid,q,iid,t,sn,desi;
 67  EXIT when c2%notfound;
 68  vcount := vcount+1;
 69  select price into pp from storeitems where itemid = iid;
 70  dbms_output.put_line(' Line number       = ' || lid);
 71  dbms_output.put_line(' item number       = ' || iid);
 72  dbms_output.put_line(' title             = ' || t);
 73  dbms_output.put_line(' studio name       = ' || sn);
 74  dbms_output.put_line(' description       = ' || desi);
 75  dbms_output.put_line(' price per item    = ' || pp);
 76  dbms_output.put_line(' quantity          = ' || q);
 77  dbms_output.put_line('---------');
 78  
 79  end loop;
 80  close c2;
 81  dbms_output.put_line('------------------------------------------------------');
 82  dbms_output.put_line(' Grand total                 = ' || computetotal(o));
 83  dbms_output.put_line('------------------------------------------------------');
 84  end;
 85  /

Procedure created.

SQL> begin
  2  dbms_output.put_line('***********************************************');
  3  showitemorders(909185113);
  4  dbms_output.put_line('***********************************************');
  5  end;
  6  /
***********************************************                                                     
Customer ID      = 1                                                                                
Customer name    = Krishna                                                                          
Customer phone   = 5103406646                                                                       
Customer address = 50 Washington                                                                    
Customer type    = gold                                                                             
----------------------------------------------------------------------                              
List of items with its details                                                                      
----------------------------------------------------------------------                              
COMIC BOOKS                                                                                         
---------                                                                                           
Line number       = 1                                                                               
item number       = 1                                                                               
title             = spiderman                                                                       
publish date      = 09/20/2000                                                                      
price per item    = 60                                                                              
quantity          = 3                                                                               
---------                                                                                           
Line number       = 2                                                                               
item number       = 10                                                                              
title             = strange                                                                         
publish date      = 03/05/2000                                                                      
price per item    = 20                                                                              
quantity          = 2                                                                               
---------                                                                                           
-----------------------------------------------------------------------                             
CARTOON MOVIES                                                                                      
-----------------                                                                                   
Line number       = 3                                                                               
item number       = 16                                                                              
title             = Alita                                                                           
studio name       = 20th Century                                                                    
description       = robotic girl has a powerful suit                                                
price per item    = 30                                                                              
quantity          = 1                                                                               
---------                                                                                           
Line number       = 4                                                                               
item number       = 17                                                                              
title             = Iceage                                                                          
studio name       = 20th Century                                                                    
description       = Crazy animals on ice                                                            
price per item    = 70                                                                              
quantity          = 1                                                                               
---------                                                                                           
------------------------------------------------------                                              
total of all items          = 320                                                                   
DISCOUNT FOR GOLDEN MEMBER  = 32                                                                    
AFTER discount              = 288                                                                   
Shipping charges            = 0                                                                     
AFTER shipping  fee         = 288                                                                   
TAX 5%                      = 14.4                                                                  
AFTER tax                   = 302.4                                                                 
------------------------------------------                                                          
Grand total                 = 302.4                                                                 
------------------------------------------------------                                              
***********************************************                                                     

PL/SQL procedure successfully completed.

SQL> begin
  2  dbms_output.put_line('***********************************************');
  3  showitemorders(1712960601);
  4  dbms_output.put_line('***********************************************');
  5  end;
  6  /
***********************************************                                                     
Customer ID      = 3                                                                                
Customer name    = Rama                                                                             
Customer phone   = 4515204527                                                                       
Customer address = 64 DDcolony                                                                      
Customer type    = gold                                                                             
----------------------------------------------------------------------                              
List of items with its details                                                                      
----------------------------------------------------------------------                              
COMIC BOOKS                                                                                         
---------                                                                                           
Line number       = 1                                                                               
item number       = 5                                                                               
title             = black panther                                                                   
publish date      = 03/15/2008                                                                      
price per item    = 100                                                                             
quantity          = 5                                                                               
---------                                                                                           
Line number       = 2                                                                               
item number       = 6                                                                               
title             = vision                                                                          
publish date      = 11/20/2002                                                                      
price per item    = 30                                                                              
quantity          = 4                                                                               
---------                                                                                           
-----------------------------------------------------------------------                             
CARTOON MOVIES                                                                                      
-----------------                                                                                   
Line number       = 3                                                                               
item number       = 12                                                                              
title             = Titanic                                                                         
studio name       = 20th Century                                                                    
description       = Ship broke into half because of a kiss                                          
price per item    = 70                                                                              
quantity          = 2                                                                               
---------                                                                                           
------------------------------------------------------                                              
total of all items          = 760                                                                   
DISCOUNT FOR GOLDEN MEMBER  = 76                                                                    
AFTER discount              = 684                                                                   
Shipping charges            = 0                                                                     
AFTER shipping  fee         = 684                                                                   
TAX 5%                      = 34.2                                                                  
AFTER tax                   = 718.2                                                                 
------------------------------------------                                                          
Grand total                 = 718.2                                                                 
------------------------------------------------------                                              
***********************************************                                                     

PL/SQL procedure successfully completed.

SQL> begin
  2  dbms_output.put_line('***********************************************');
  3  showitemorders(523559599);
  4  dbms_output.put_line('***********************************************');
  5  end;
  6  /
***********************************************                                                     
Customer ID      = 4                                                                                
Customer name    = satya                                                                            
Customer phone   = 6692959852                                                                       
Customer address = 21 DDcolony                                                                      
Customer type    = gold                                                                             
----------------------------------------------------------------------                              
List of items with its details                                                                      
----------------------------------------------------------------------                              
COMIC BOOKS                                                                                         
---------                                                                                           
Line number       = 1                                                                               
item number       = 2                                                                               
title             = ironman                                                                         
publish date      = 02/20/2001                                                                      
price per item    = 30                                                                              
quantity          = 1                                                                               
---------                                                                                           
-----------------------------------------------------------------------                             
CARTOON MOVIES                                                                                      
-----------------                                                                                   
Line number       = 2                                                                               
item number       = 15                                                                              
title             = END GAME                                                                        
studio name       = Marvel Studios                                                                  
description       = I love you 3000                                                                 
price per item    = 10                                                                              
quantity          = 1                                                                               
---------                                                                                           
------------------------------------------------------                                              
total of all items          = 40                                                                    
Shipping charges            = 0                                                                     
AFTER shipping  fee         = 40                                                                    
TAX 5%                      = 2                                                                     
AFTER tax                   = 42                                                                    
------------------------------------------                                                          
Grand total                 = 42                                                                    
------------------------------------------------------                                              
***********************************************                                                     

PL/SQL procedure successfully completed.

SQL> begin
  2  dbms_output.put_line('***********************************************');
  3  showitemorders(914276508);
  4  dbms_output.put_line('***********************************************');
  5  end;
  6  /
***********************************************                                                     
Customer ID      = 6                                                                                
Customer name    = Anmol                                                                            
Customer phone   = 8800291506                                                                       
Customer address = 34 DDcolony                                                                      
Customer type    = regular                                                                          
----------------------------------------------------------------------                              
List of items with its details                                                                      
----------------------------------------------------------------------                              
COMIC BOOKS                                                                                         
---------                                                                                           
Line number       = 1                                                                               
item number       = 8                                                                               
title             = gamora                                                                          
publish date      = 04/01/2004                                                                      
price per item    = 90                                                                              
quantity          = 2                                                                               
---------                                                                                           
-----------------------------------------------------------------------                             
CARTOON MOVIES                                                                                      
-----------------                                                                                   
Line number       = 2                                                                               
item number       = 13                                                                              
title             = King Kong                                                                       
studio name       = Warner Bros                                                                     
description       = Tales of a Big Monkey                                                           
price per item    = 80                                                                              
quantity          = 4                                                                               
---------                                                                                           
Line number       = 3                                                                               
item number       = 20                                                                              
title             = Spiderman                                                                       
studio name       = Marvel Studios                                                                  
description       = With great power comes great responsibility                                     
price per item    = 20                                                                              
quantity          = 1                                                                               
---------                                                                                           
------------------------------------------------------                                              
total of all items          = 520                                                                   
Shipping charges            = 10                                                                    
AFTER shipping  fee         = 530                                                                   
TAX 5%                      = 26.5                                                                  
AFTER tax                   = 556.5                                                                 
------------------------------------------                                                          
Grand total                 = 556.5                                                                 
------------------------------------------------------                                              
***********************************************                                                     

PL/SQL procedure successfully completed.

SQL> 
SQL> begin
  2  dbms_output.put_line('***********************************************');
  3  showitemorders(1761042575);
  4  dbms_output.put_line('***********************************************');
  5  end;
  6  /
***********************************************                                                     
Customer ID      = 1                                                                                
Customer name    = Krishna                                                                          
Customer phone   = 5103406646                                                                       
Customer address = 50 Washington                                                                    
Customer type    = gold                                                                             
----------------------------------------------------------------------                              
List of items with its details                                                                      
----------------------------------------------------------------------                              
COMIC BOOKS                                                                                         
---------                                                                                           
Line number       = 1                                                                               
item number       = 9                                                                               
title             = antman                                                                          
publish date      = 11/25/2002                                                                      
price per item    = 100                                                                             
quantity          = 2                                                                               
---------                                                                                           
-----------------------------------------------------------------------                             
CARTOON MOVIES                                                                                      
-----------------                                                                                   
Line number       = 2                                                                               
item number       = 11                                                                              
title             = Avatar                                                                          
studio name       = 20th Century                                                                    
description       = blue monkeys in different universe                                              
price per item    = 60                                                                              
quantity          = 3                                                                               
---------                                                                                           
Line number       = 3                                                                               
item number       = 17                                                                              
title             = Iceage                                                                          
studio name       = 20th Century                                                                    
description       = Crazy animals on ice                                                            
price per item    = 70                                                                              
quantity          = 1                                                                               
---------                                                                                           
------------------------------------------------------                                              
total of all items          = 450                                                                   
DISCOUNT FOR GOLDEN MEMBER  = 45                                                                    
AFTER discount              = 405                                                                   
Shipping charges            = 0                                                                     
AFTER shipping  fee         = 405                                                                   
TAX 5%                      = 20.25                                                                 
AFTER tax                   = 425.25                                                                
------------------------------------------                                                          
Grand total                 = 425.25                                                                
------------------------------------------------------                                              
***********************************************                                                     

PL/SQL procedure successfully completed.

SQL> spool off;
