create external table dim(
    [dimh] varchar(34),
    [segments] varchar(1024),
    [segt] bit
)with(
    LOCATION='sec-fs/dim/',
    DATA_SOURCE=defaultlake,
    FILE_FORMAT=u8stin
);

create external table tag(
[tag] varchar(256),
[version] varchar(20),
[custom] bit,
[abstract] bit,
[datatype] varchar(20),
[iord] varchar(1),
[crdr] varchar(1),
[tlabel] varchar(512),
[doc] varchar(2048)
)with(
    LOCATION='sec-fs/tag/',
    DATA_SOURCE=defaultlake,
    FILE_FORMAT=u8stin
);

create external table sub(
[adsh] char(20),
[cik] varchar(10),
[name] varchar(150),
[sic] char(4),
[countryba] varchar(2),
[stprba] varchar(2),
[cityba] varchar(30),
[zipba] varchar(10),
[bas1] varchar(40),
[bas2] varchar(40),
[baph] varchar(20),
[countryma] varchar(2),
[stprma] varchar(2),
[cityma] varchar(30),
[zipma] varchar(10),
[mas1] varchar(40),
[mas2] varchar(40),
[countryinc] varchar(2),
[stprinc] varchar(2),
[ein] varchar(10),
[former] varchar(150),
[changed] varchar(8),
[afs] varchar(5),
[wksi] bit,
[fye] varchar(4),
[form] varchar(10),
[period] varchar(8),
[fy] int,
[fp] varchar(2),
[filed] varchar(8),
[accepted] varchar(21),
[prevrpt] bit,
[detail] bit,
[instance] varchar(32),
[nciks] int,
[aciks] varchar(120),
[pubfloatusd] float,
[floatdate] varchar(8),
[floataxis] varchar(255),
[floatmems] varchar(1)
)with(
    LOCATION='sec-fs/sub/',
    DATA_SOURCE=defaultlake,
    FILE_FORMAT=u8stin
);

create external table num(
[adsh] char(20),
[tag] varchar(256),
[version] varchar(20),
[ddate] varchar(8),
[qtrs] bigint,
[uom] varchar(20),
[dimh] varchar(34),
[iprx] smallint,
[value] float,
[footnote] varchar(512),
[footlen] int,
[dimn] smallint,
[coreg] varchar(256),
[durp] real,
[datp] real,
[dcml] smallint
)with(
    LOCATION='sec-fs/num/',
    DATA_SOURCE=defaultlake,
    FILE_FORMAT=u8stin
);

create external table txt(
[adsh] char(20),
[tag] varchar(256),
[version] varchar(20),
[ddate] varchar(8),
[qtrs] int,
[iprx] int,
[lang] varchar(5),
[dcml] smallint,
[durp] float,
[datp] float,
[dimh] varchar(34),
[dimn] int,
[coreg] varchar(256),
[escaped] bit,
[srclen] int,
[txtlen] int,
[footnote] varchar(512),
[footlen] int,
[context] varchar(255),
[value] varchar(max)
)with(
    LOCATION='sec-fs/txt/',
    DATA_SOURCE=defaultlake,
    FILE_FORMAT=u8stin
);

create external table cal(
[adsh] char(20),
[grp] smallint,
[arc] smallint,
[negative] bit,
[ptag] varchar(256),
[pversion] varchar(20),
[ctag] varchar(256),
[cversion] varchar(20)
)with(
    LOCATION='sec-fs/cal/',
    DATA_SOURCE=defaultlake,
    FILE_FORMAT=u8stin
);

create external table pre(
[adsh] char(20),
[report] bigint,
[line] bigint,
[stmt] char(2),
[inpth] bit,
[tag] varchar(256),
[version] varchar(20),
[prole] varchar(50),
[plabel] varchar(512),
[negating] bit
)with(
    LOCATION='sec-fs/pre/',
    DATA_SOURCE=defaultlake,
    FILE_FORMAT=u8stin
);

create external table ren(
[adsh] char(20),
[report] bigint,
[rfile] varchar(1),
[menucat] varchar(2),
[shortname] varchar(355),
[longname] varchar(355),
[roleuri] varchar(255),
[parentroleuri] varchar(255),
[parentreport] bigint,
[ultparentrpt] bigint
)with(
    LOCATION='sec-fs/ren/',
    DATA_SOURCE=defaultlake,
    FILE_FORMAT=u8stin
);
