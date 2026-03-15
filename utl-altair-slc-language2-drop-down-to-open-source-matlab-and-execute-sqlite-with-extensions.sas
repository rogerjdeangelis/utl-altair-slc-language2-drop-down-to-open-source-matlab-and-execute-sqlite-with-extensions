%let pgm=utl-altair-slc-language2-drop-down-to-open-source-matlab-and-execute-sqlite-with-extensions;

%stop_submission;

Altair slc language2 drop down to open source matlab and execute sqlite with extensions

Too long to post on a list, see github
https://github.com/rogerjdeangelis/utl-altair-slc-language2-drop-down-to-open-source-matlab-and-execute-sqlite-with-extensions

PROBLEM

  PROCESS

  1 SLC    Create sqlite database
  2 SLC    Create sqlite table class
  3 Matlab summarize sqlite class table
           select sex avg(ag) avg(height) avg(weight) from class group by sex
  4 Matlab convert sqlite table to matrix numbers
  5 Matlab create a sqlite table with the summarized data
  6 SLC    read and convert the sqlite class table to a sas dataset


OBJECTIVE

  I am trying to make sql programmers expert matlab programmers, by way of sqlite.
  Use packages and procedures for analysis and sql for data wrangling and interfacing.

  Add very powerfull sql processing to the open source spss
  Posgresql has windows extensions.

  I hope to add repos with  drop downs to sql with windows extensions in many languages

 *language 1   open source spss
 *language 2   open source matlab
  language 3   r
  language 4   python
  language 5   altair odbc sqlite
  language 6   excel
  language 7   perl
  language 8   slc proc sql (the only solution that does not support windows extensions)

Related Repos

https://github.com/rogerjdeangelis/utl-altair-slc-language1-drop-down-to-open-source-spss-and-execute-postgresql-query

https://github.com/rogerjdeangelis/utl-altair-slc-reading-and-writing-hdf5-files-with-open-source-matlab-python-and-r
https://github.com/rogerjdeangelis/utl-altair-slc-using-matlab-to-calculate-Hysteresis-loss-K1-for-a-non-symetric-b-h-loop
https://github.com/rogerjdeangelis/utl-how-to-store-octave-matlab-objects-in-external-files-for-later-use-with-octave-r-and-python
https://github.com/rogerjdeangelis/utl-matlab-combine-every-two-rows-ito-one-and-and-add-a-prefix-to-duplicate-column-names
https://github.com/rogerjdeangelis/utl-octave-matlab-check-if-all-of-the-rows-of-a-dbtable-are-the-same
https://github.com/rogerjdeangelis/utl-octave-matlab-deleting-rows-where-age-is-zero
https://github.com/rogerjdeangelis/utl-personal-altair-slc-with-matlab-sympy-and-r-finite-element-cold-plate-heat-transfer
https://github.com/rogerjdeangelis/utl-randomly-pick-one-player-from-the-heat-and-suns-for-captains-sql-sas-r-python-matlab
https://github.com/rogerjdeangelis/utl-runing-a-regression-using-matlab-syntax-using-the-open-source-r-octave-package
https://github.com/rogerjdeangelis/utl-running-your-matlab-script-in-the-altair-slc-motion-damped-spring
https://github.com/rogerjdeangelis/utl-sas-utility-functions-and-the-lack-of-support-for-utility-functions-r-python-and-matlab
https://github.com/rogerjdeangelis/utl-matlab-select-all-possible-pairs-and-and-use-octave-sqlwrite-to-return-values-to-sas
https://github.com/rogerjdeangelis/utl-bringing-matlab-into-the-larger-family-of-computer-languages
https://github.com/rogerjdeangelis/utl-convert-a-sqlite-numeric-table-to-a-matrix-for-octave-matlab-processing
https://github.com/rogerjdeangelis/utl-cumulative-sum-by-group-in-the-order-of-rank-variable-sas-and-sql-r-python-octave-excel
https://github.com/rogerjdeangelis/utl-how-to-store-octave-matlab-objects-in-external-files-for-later-use-with-octave-r-and-python
https://github.com/rogerjdeangelis/utl-add-sqlite-windows-functions-to-octave-sqlite-temporary-solition-until-put-in-octave-forge


PREP
----
0 Create a sqlite database



1 INSTALL CHRISTIAN WERNER ODBC DRIVER (THIS IS A SYSTEM ODBC DRIVER)
-----------------------------------------------------------------------

 a  Download Christian Werner ODBC Drive (sqliteodbc_w64)
    Note some browsers will block the download as unsafe mainly because
    the site is http and not https. I have tested the download for malicious software and
    it is ok, however always 'create a restore point' before downloading.

    http://www.ch-werner.de/sqliteodbc/
    https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories
    https://github.com/rogerjdeangelis/utl-altair-slc-sqlite-odbc-reading-and-writing-tables-using-passthru-processing/blob/main/sqliteodbc_w64.exe

 b  I assigned DSN 'wernerdsn' and tied it to database 'd:/sqlite/mysqlite.db'.
    You need to use Windows 'Data Source Admistator (64bit)' and a system DSN options.
    Also create dsn and path to sqlite file.

    In the SQLite3 ODBC Configuation Panel Enter

       Data Source:    Name wernerdsn
       Database Name:  d:/sqlite/mysqlite.db   /*--- Download from this repo or you can create one in r or python ---*/

       Load Extension: d:/dll/sqlean.dll       /*--- Download from this repo, make sure your add to odbc          ---*/

 2  INSTALLING OCTAVE ODBC PACKAGE (BE PATIENT THE INSTALL CAN TAKE A MINUTE OR MORE)
 --------------------------------------------------------------------------------------

    I could not get the command line install to work, you need touse the gui.

    Click on
    C:\Program Files\GNU Octave\Octave-10.3.0\octave-launch.exe
    The GUI will open (with a command line interface)

    >> pkg install -forge odbc
    Please report any issues with the tablicious package at "https://github.com/apjanke/octave-tablicious"
    >> pkg list

    Package Name         | Version | Installation directory
                   odbc *|   0.0.6 | C:\Users\roger\AppData\Roaming\octave\api-v60\packages\odbc-0.0.6

    DOC
    https://gnu-octave.github.io/octave-odbc/

    If you want to download the odbc package
    Download the odbc package from

    Got to and click on odbc download option
    https://gnu-octave.github.io/packages/

    I downloaded to
    d:/zip/octave-odbc-0.0.6.tar.gz

  3.  DROP DOWN MACROS (ALSO IN REPO AND  https://github.com/rogerjdeangelis/utl-macros-used-in-many-of-rogerjdeangelis-repositories)
  --------------------------------------------------------------------------------------------------------------------------------------

/*--- copy macros to your autocall library. You will need to edit paths ---*/

%macro slc_mbegin;
%utlfkil(c:/temp/m_pgm.m);
%utlfkil(c:/temp/m_pgm.log);
data _null_;
 file "c:/temp/m_pgm.m";
 input;
 put _infile_;
%mend slc_mbegin;

%macro slc_mend(returnvar=N);
options noxwait noxsync;
filename rut pipe  "C:\Progra~1\GNUOCT~1\Octave-10.3.0\mingw64\bin\octave-cli c:/temp/m_pgm.m > c:/temp/m_pgm.log";
run;quit;
  data _null_;
    file print;
    infile rut recfm=v lrecl=32756;
    input;
    put _infile_;
    putlog _infile_;
  run;

  * use the clipboard to create macro variable;
  %if %upcase(%substr(&returnVar.,1,1)) ne N %then %do;
    filename clp clipbrd ;
    data _null_;
     length txt $200;
     infile clp;
     input;
     putlog "macro variable &returnVar = " _infile_;
     call symputx("&returnVar.",_infile_,"G");
    run;quit;
  %end;
data _null_;
  file print;
  infile "c:/temp/m_pgm.log" ;
  input;
  put _infile_;
  putlog _infile_;
run;quit;

%mend slc_mend;

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/


* best first;
%utlfkil(d:/sqlite/mysqlite.db);

libname workx "d:/wpswrkx"; /*---  put in autoexec ---*/

proc datasets lib=workx kill;
run;

libname sqlite odbc noprompt="driver=sqlite3 odbc driver; database=d:/sqlite/mysqlite.db;LoadExt=d:/dll/sqlean.dll;";

data sqlite.class;
informat
NAME $8.
SEX $1.
AGE 8.
HEIGHT 8.
WEIGHT 8.
;
input
NAME SEX AGE HEIGHT WEIGHT;
cards4;
Alfred M 14 69 112.5
Alice F 13 56.5 84
Barbara F 13 65.3 98
Carol F 14 62.8 102.5
Henry M 14 63.5 102.5
;;;;
run;quit;

proc contents data=sqlite.class;
run;

proc sql;
 SELECT sql FROM sqlite.sqlite_master WHERE name='class'
;quit;

libname sqlite clear;


/*************************************************************************************************************************************************/
/* database d:\sqlite\mysqlite.db         | Here i what the mysqlite.db contains                                                                 */
/* sqlite table class                     |                                                                                                      */
/*                                        | d:\sqlite\mysqlite.db                                                                                */
/*                                        |                                                                                                      */
/* The CONTENTS Procedure                 |  --- Record Number ---  1   ---  Record Length ---- 100                                              */
/*                                        |                                                                                                      */
/* Data Set Name           CLASS          | SQLite format 3......@  ..........................................................................n. */
/* Member Type             VIEW           | 1...5....10...15...20...25...30...35...40...45...50...55...60...65...70...75...80...85...90...95...1 */
/* Engine                                 | 554676266766723010000422000000000000000000000000000000000000000000000000000000000000000000000000026B */
/* Observations            .              | 31C94506F2D14030001100000003000400000000000200040000000000010000000000000000000000000000000000030EEA */
/* Variables               5              |                                                                                                      */
/* Indexes                 0              |                                                                                                      */
/* Observation Length      33             |  --- Record Number ---  38   ---  Record Length ---- 100                                             */
/* Deleted Observations    0              |                                                                                                      */
/* Data Set Type                          | ............................................................................tableclassclass.CREATE T */
/* Label                                  | 1...5....10...15...20...25...30...35...40...45...50...55...60...65...70...75...80...85...90...95...1 */
/* Compressed              NO             | 0000000000000000000000000000000000000000000000000000000000000000008100111080766666667766677045445425 */
/* Sorted                  NO             | 0000000000000000000000000000000000000000000000000000000000000000001437777127412C53C1333C133432514504 */
/* Data Representation                    |                                                                                                      */
/* Encoding wlatin1 Windows-1252 Western  |                                                                                                      */
/*                                        |  --- Record Number ---  39   ---  Record Length ---- 100                                             */
/* Variables and Attributes               |                                                                                                      */
/*                                        | ABLE class( NAME VARCHAR(8), SEX VARCHAR(1), AGE DOUBLE PRECISION, HEIGHT DOUBLE PRECISION, WEIGHT D */
/* Number Variable Type  Len  Pos Informat| 1...5....10...15...20...25...30...35...40...45...50...55...60...65...70...75...80...85...90...95...1 */
/* _______________________________________| 4444266677224444254544452322254525454445232224442445444255444544422444445244544425544454442254444524 */
/*  1    NAME       Char   8    0  $8.    | 12C503C13380E1D506123812889C035806123812819C017504F52C500253939FEC085978404F52C500253939FEC075978404 */
/*  2    SEX        Char   1    8  $1.    |                                                                                                      */
/*  3    AGE        Num    8    9         |                                                                                                      */
/*  4    HEIGHT     Num    8   17         |  --- Record Number ---  40   ---  Record Length ---- 100                                             */
/*  5    WEIGHT     Num    8   25         |                                                                                                      */
/*                                        | OUBLE PRECISION )n...''.. tablesqlean_definesqlean_define.CREATE TABLE sqlean_define(name text prima */
/*                                        | 1...5....10...15...20...25...30...35...40...45...50...55...60...65...70...75...80...85...90...95...1 */
/* CLASS TABLE                            | 4544425544454442260012208176666776666566666677666656666660454454254444277666656666662666627677277666 */
/*                                        | F52C500253939FE09E1777711B412C531C51EF4569E531C51EF4569E523251450412C5031C51EF4569E58E1D5045840029D1 */
/*   NAME   SEX AGE HEIGHT WEIGHT         |                                                                                                      */
/*                                        |                                                                                                      */
/*  Alfred   M   14  69.0   112.5         |  --- Record Number ---  41   ---  Record Length ---- 100                                             */
/*  Alice    F   13  56.5    84.0         |                                                                                                      */
/*  Barbara  F   13  65.3    98.0         | ry key, type text, body text)9...M'..indexsqlite_autoindex_sqlean_define_1sqlean_define............. */
/*  Carol    F   14  62.8   102.5         | 1...5....10...15...20...25...30...35...40...45...50...55...60...65...70...75...80...85...90...95...1 */
/*  Henry    M   14  63.5   102.5         | 7726672277762767722666727677230014200666677766765677666667577666656666665377666656666660000000000000 */
/*                                        | 290B59C0490504584C02F490458499267D7109E45831C945F154F9E458F31C51EF4569E5F131C51EF4569E5300080000D000 */
/*                                        |                                                                                                      */
/* GENERATED SQL CODE                     | ...                                                                                                  */
/* sql                                    |  --- Record Number ---  163   ---  Record Length ---- 100                 h       w                  */
/* -----------------------------          |                                                                         e       e                    */
/* create                                 |                                                         n               i       i                    */
/*  table class(                          |                                                         a  s   a        g       g                    */
/*    name varchar(8),                    |                                                         m  e   g        h       h                    */
/*    sex varchar(1),                     |                                                         e  x   e        t       t                    */
/*    age double precision,               |                                                        ---  - ------- ------- -------                */
/*    height double precision,            | .......................................................HenryM.@.......@...............CarolF.@Offfff */
/*    weight double precision )           | 1...5....10...15...20...25...30...35...40...45...50...55...60...65...70...75...80...85...90...95...1 */
/*                                        | 0000000000000000000000000000000000000000000000010010000466774044C0000045A000001001000046766404466666 */
/*                                        | 00000000000000000000000000000000000000000000000D567F17785E29DE0F00000009000000D467F177312FC6E0F66666 */
/*                                        |                                                                                                      */
/*                                        |                                                                                                      */
/*                                        |  --- Record Number ---  164   ---  Record Length ---- 84                                             */
/*                                        |                                                                                                      */
/*                                        | f@Y..............BarbaraF.@PS33333b........AliceF.@L@.....T........AlfredM.E@\ .....                 */
/*                                        | 1...5....10...15...20...25...30...35...40...45...50...55...60...65...70...75...80...                 */
/*                                        | 645A00000100100004676676404553333361001000046666404440000051001000046676640445200000                 */
/*                                        | 609000000836BF17121221216D0033333326267F1711C9356D0C00000047169F1171C6254DE50C000000                 */
/*************************************************************************************************************************************************/

/*                   _     _
(_)_ __  _ __  _   _| |_  | | ___   __ _
| | `_ \| `_ \| | | | __| | |/ _ \ / _` |
| | | | | |_) | |_| | |_  | | (_) | (_| |
|_|_| |_| .__/ \__,_|\__| |_|\___/ \__, |
        |_|                        |___/
*/

1                                          Altair SLC          13:21 Sunday, March 15, 2026

NOTE: Copyright 2002-2025 World Programming, an Altair Company
NOTE: Altair SLC 2026 (05.26.01.00.000758)
      Licensed to Roger DeAngelis
NOTE: This session is executing on the X64_WIN11PRO platform and is running in 64 bit mode

NOTE: AUTOEXEC processing beginning; file is C:\wpsoto\autoexec.sas
NOTE: AUTOEXEC source line
1       +  ï»¿ods _all_ close;
           ^
ERROR: Expected a statement keyword : found "?"

NOTE: AUTOEXEC processing completed

1          * best first;
2         %utlfkil(d:/sqlite/mysqlite.db);
The file d:/sqlite/mysqlite.db does not exist
3
4         libname workx "d:/wpswrkx"; /*---  put in autoexec ---*/
NOTE: Library workx assigned as follows:
      Engine:        WPD
      Physical Name: d:\wpswrkx


Altair SLC

The DATASETS Procedure

         Directory

Libref           WORKX
Engine           WPD
Physical Name    d:\wpswrkx
5
6         proc datasets lib=workx kill;
NOTE: No matching members in directory
7         run;
8
9         libname sqlite odbc noprompt=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
NOTE: Library sqlite assigned as follows:
      Engine:        ODBC
      Physical Name:  (SQLite version 3.43.2)

NOTE: Procedure datasets step took :
      real time : 0.139
      cpu time  : 0.046


10
11        data sqlite.class;
12        informat
13        NAME $8.
14        SEX $1.
15        AGE 8.
16        HEIGHT 8.
17        WEIGHT 8.
18        ;
19        input
20        NAME SEX AGE HEIGHT WEIGHT;
21        cards4;

NOTE: Data set "SQLITE.class" has an unknown number of observation(s) and 5 variable(s)
NOTE: The data step took :
      real time : 0.130
      cpu time  : 0.015


22        Alfred M 14 69 112.5
23        Alice F 13 56.5 84
24        Barbara F 13 65.3 98
25        Carol F 14 62.8 102.5
26        Henry M 14 63.5 102.5
27        ;;;;
28        run;quit;
29
30        proc contents data=sqlite.class;
31        run;
NOTE: Procedure contents step took :
      real time : 0.082
      cpu time  : 0.031


32
33        proc sql;
34         SELECT sql FROM sqlite.sqlite_master WHERE name='class'
35        ;quit;
WARNING: truncating character column type to 1024 characters long, based on dbmax_text setting.
WARNING: truncating character column name to 1024 characters long, based on dbmax_text setting.
WARNING: truncating character column tbl_name to 1024 characters long, based on dbmax_text setting.
WARNING: truncating character column sql to 1024 characters long, based on dbmax_text setting.
WARNING: truncating character column SQL to 1024 characters long, based on dbmax_text setting.
NOTE: Procedure sql step took :
      real time : 0.037
      cpu time  : 0.031


NOTE: Libref SQLITE has been deassigned.
36
37        libname sqlite clear;
ERROR: Error printed on page 1

NOTE: Submitted statements took :
      real time : 0.510
      cpu time  : 0.187


/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/


%slc_mbegin;
cards4;
pkg load sqlite

db = sqlite("d:/sqlite/mysqlite.db");
execute(db, 'select load_extension("d:/dll/sqlean")');

# create avgs table to pass to the slc
execute(db,' drop table if exists avgs');

# Create table with explicit data types
execute(db,
   ["CREATE TABLE avgs (                          " ...
    "    sex VARCHAR(1),                          " ...
    "    count DOUBLE PRECISION,                  " ...
    "    avg_age DOUBLE PRECISION,                " ...
    "    avg_height DOUBLE PRECISION,             " ...
    "    avg_weight DOUBLE PRECISION              " ...
    ");                                           " ...
]);

# Insert the aggregated data
execute(db,
   ["INSERT INTO avgs                              " ...
    "SELECT                                        " ...
    "    sex,                                      " ...
    "    COUNT(*) as count,                        " ...
    "    ROUND(AVG(age),1) as avg_age,             " ...
    "    ROUND(AVG(height),1) as avg_height,       " ...
    "    ROUND(AVG(weight),1) as avg_weight        " ...
    "FROM class                                    " ...
    "GROUP BY sex                                  " ...
]);

# query your class table with aggregation
result = fetch(db,
   ["select                                     " ...
    "    *                                      " ...
    "from                                       " ...
    "    avgs                                   " ...
]);

# print the summary values
printf("\n=== class summary statistics ===\n");
printf("----------------------------------------\n");
printf("sex  count  avg age  avg ht  avg wt\n");
printf("----------------------------------------\n");

for i = 1:rows(result)
    # convert all values - both string and numeric are in cells
    sex = char(result{i,1});           # convert cell to string
    count = cell2mat(result{i,2});      # convert cell to number
    avg_age = cell2mat(result{i,3});    # convert cell to number
    avg_height = cell2mat(result{i,4}); # convert cell to number
    avg_weight = cell2mat(result{i,5}); # convert cell to number

    printf("%-3s  %3d    %5.1f    %5.1f   %5.1f\n",
           sex, count, avg_age, avg_height, avg_weight);
end

printf("----------------------------------------\n");

close(db);
;;;;
%slc_mend;


libname sqlite odbc noprompt="driver=sqlite3 odbc driver; database=d:/sqlite/mysqlite.db;LoadExt=d:/dll/sqlean.dll;";

proc contents data=sqlite.avgs;
run;

proc print data=sqlite.avgs;
run;quit;

libname sqlite clear;


/**************************************************************************************************************************/
/*  MATLAB                                                                                                                */
/*                                                                                                                        */
/*  === class summary statistics ===                                                                                      */
/*  ----------------------------------------                                                                              */
/*  sex  count  avg age  avg ht  avg wt                                                                                   */
/*  ----------------------------------------                                                                              */
/*  F      3     13.3     61.5    94.8                                                                                    */
/*  M      2     14.0     66.3   107.5                                                                                    */
/*  ----------------------------------------                                                                              */
/*                                                                                                                        */
/*  SLC                                                                                                                   */
/*  Sqllite AVGS                                                                                                          */
/*                                                                                                                        */
/*  Obs    SEX    COUNT    AVG_AGE    AVG_HEIGHT    AVG_WEIGHT                                                            */
/*                                                                                                                        */
/*   1      F       3        13.3        61.5           94.8                                                              */
/*   2      M       2        14.0        66.3          107.5                                                              */
/*                                                                                                                        */
/*  The CONTENTS Procedure                                                                                                */
/*                                                                                                                        */
/*  Data Set Name           AVGS                                                                                          */
/*  Member Type             VIEW                                                                                          */
/*  Engine                                                                                                                */
/*  Observations                .                                                                                         */
/*  Variables               5                                                                                             */
/*  Indexes                 0                                                                                             */
/*  Observation Length      33                                                                                            */
/*  Deleted Observations             0                                                                                    */
/*  Data Set Type                                                                                                         */
/*  Label                                                                                                                 */
/*  Compressed              NO                                                                                            */
/*  Sorted                  NO                                                                                            */
/*  Data Representation                                                                                                   */
/*  Encoding                wlatin1 Windows-1252 Western                                                                  */
/*                                                                                                                        */
/*      Alphabetic List of Variables and Attributes                                                                       */
/*                                                                                                                        */
/*  Number    Variable      Type  Len   Pos    Format                                                                     */
/*  __________________________________________________                                                                    */
/*       1    SEX           Char    1     0    $1.                                                                        */
/*       2    COUNT         Num     8     1                                                                               */
/*       3    AVG_AGE       Num     8     9                                                                               */
/*       4    AVG_HEIGHT    Num     8    17                                                                               */
/*       5    AVG_WEIGHT    Num     8    25                                                                               */
/**************************************************************************************************************************/

/*                                   _
 _ __  _ __ ___   ___ ___  ___ ___  | | ___   __ _
| `_ \| `__/ _ \ / __/ _ \/ __/ __| | |/ _ \ / _` |
| |_) | | | (_) | (_|  __/\__ \__ \ | | (_) | (_| |
| .__/|_|  \___/ \___\___||___/___/ |_|\___/ \__, |
|_|                                          |___/
*/


1                                          Altair SLC          13:59 Sunday, March 15, 2026

NOTE: Copyright 2002-2025 World Programming, an Altair Company
NOTE: Altair SLC 2026 (05.26.01.00.000758)
      Licensed to Roger DeAngelis
NOTE: This session is executing on the X64_WIN11PRO platform and is running in 64 bit mode

NOTE: AUTOEXEC processing beginning; file is C:\wpsoto\autoexec.sas
NOTE: AUTOEXEC source line
1       +  ï»¿ods _all_ close;
           ^
ERROR: Expected a statement keyword : found "?"

NOTE: AUTOEXEC processing completed

1         %slc_mbegin;
2         cards4;

NOTE: The file 'c:\temp\m_pgm.m' is:
      Filename='c:\temp\m_pgm.m',
      Owner Name=SLC\suzie,
      File size (bytes)=0,
      Create Time=13:59:04 Mar 14 2026,
      Last Accessed=13:59:03 Mar 15 2026,
      Last Modified=13:59:03 Mar 15 2026,
      Lrecl=32767, Recfm=V

NOTE: 61 records were written to file 'c:\temp\m_pgm.m'
      The minimum record length was 80
      The maximum record length was 80
NOTE: The data step took :
      real time : 0.003
      cpu time  : 0.015


3         pkg load sqlite
4
5         db = sqlite("d:/sqlite/mysqlite.db");
6         execute(db, 'select load_extension("d:/dll/sqlean")');
7
8         # create avgs table to pass to the slc
9         execute(db,' drop table if exists avgs');
10
11        # Create table with explicit data types
12        execute(db,
13           ["CREATE TABLE avgs (                          " ...
14            "    sex VARCHAR(1),                          " ...
15            "    count DOUBLE PRECISION,                  " ...
16            "    avg_age DOUBLE PRECISION,                " ...
17            "    avg_height DOUBLE PRECISION,             " ...
18            "    avg_weight DOUBLE PRECISION              " ...
19            ");                                           " ...
20        ]);
21
22        # Insert the aggregated data
23        execute(db,
24           ["INSERT INTO avgs                              " ...
25            "SELECT                                        " ...
26            "    sex,                                      " ...
27            "    COUNT(*) as count,                        " ...
28            "    ROUND(AVG(age),1) as avg_age,             " ...
29            "    ROUND(AVG(height),1) as avg_height,       " ...
30            "    ROUND(AVG(weight),1) as avg_weight        " ...
31            "FROM class                                    " ...
32            "GROUP BY sex                                  " ...
33        ]);
34
35        # query your class table with aggregation
36        result = fetch(db,
37           ["select                                     " ...
38            "    *                                      " ...
39            "from                                       " ...
40            "    avgs                                   " ...
41        ]);
42
43        # print the summary values
44        printf("\n=== class summary statistics ===\n");
45        printf("----------------------------------------\n");
46        printf("sex  count  avg age  avg ht  avg wt\n");
47        printf("----------------------------------------\n");
48
49        for i = 1:rows(result)
50            # convert all values - both string and numeric are in cells
51            sex = char(result{i,1});           # convert cell to string
52            count = cell2mat(result{i,2});      # convert cell to number
53            avg_age = cell2mat(result{i,3});    # convert cell to number
54            avg_height = cell2mat(result{i,4}); # convert cell to number
55            avg_weight = cell2mat(result{i,5}); # convert cell to number
56
57            printf("%-3s  %3d    %5.1f    %5.1f   %5.1f\n",
58                   sex, count, avg_age, avg_height, avg_weight);
59        end
60
61        printf("----------------------------------------\n");
62
63        close(db);
64        ;;;;
65        %slc_mend;

NOTE: The infile rut is:
      Unnamed Pipe Access Device,
      Process=C:\Progra~1\GNUOCT~1\Octave-10.3.0\mingw64\bin\octave-cli c:/temp/m_pgm.m > c:/temp/m_pgm.log,
      Lrecl=32756, Recfm=V

NOTE: No records were written to file PRINT

NOTE: No records were read from file rut
NOTE: The data step took :
      real time : 1.745
      cpu time  : 0.000



NOTE: The infile 'c:\temp\m_pgm.log' is:
      Filename='c:\temp\m_pgm.log',
      Owner Name=SLC\suzie,
      File size (bytes)=263,
      Create Time=14:36:22 Mar 14 2026,
      Last Accessed=13:59:05 Mar 15 2026,
      Last Modified=13:59:05 Mar 15 2026,
      Lrecl=32767, Recfm=V


=== class summary statistics ===
----------------------------------------
sex  count  avg age  avg ht  avg wt
----------------------------------------
F      3     13.3     61.5    94.8
M      2     14.0     66.3   107.5
----------------------------------------
NOTE: 8 records were written to file PRINT

NOTE: 8 records were read from file 'c:\temp\m_pgm.log'
      The minimum record length was 0
      The maximum record length was 40
NOTE: The data step took :
      real time : 0.013
      cpu time  : 0.015


66
67
68        libname sqlite odbc noprompt=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX;
NOTE: Library sqlite assigned as follows:
      Engine:        ODBC
      Physical Name:  (SQLite version 3.43.2)

69
70        proc contents data=sqlite.avgs;
71        run;
NOTE: Procedure contents step took :
      real time : 0.053
      cpu time  : 0.000


72
73        proc print data=sqlite.avgs;
74        run;quit;
NOTE: 2 observations were read from "SQLITE.avgs"
NOTE: Procedure print step took :
      real time : 0.011
      cpu time  : 0.000


NOTE: Libref SQLITE has been deassigned.
75
76        libname sqlite clear;
ERROR: Error printed on page 1

NOTE: Submitted statements took :
      real time : 2.006
      cpu time  : 0.125

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
