parameters{
	src_dir_name as string
}
source(output(
		adsh as string,
		cik as string,
		name as string,
		sic as string,
		countryba as string,
		stprba as string,
		cityba as string,
		zipba as string,
		bas1 as string,
		bas2 as string,
		baph as string,
		countryma as string,
		stprma as string,
		cityma as string,
		zipma as string,
		mas1 as string,
		mas2 as string,
		countryinc as string,
		stprinc as string,
		ein as string,
		former as string,
		changed as string,
		afs as string,
		wksi as string,
		fye as string,
		form as string,
		period as string,
		fy as string,
		fp as string,
		filed as string,
		accepted as string,
		prevrpt as string,
		detail as string,
		instance as string,
		nciks as string,
		aciks as string,
		pubfloatusd as string,
		floatdate as string,
		floataxis as string,
		floatmems as string
	),
	allowSchemaDrift: false,
	validateSchema: true,
	purgeFiles: true,
	wildcardPaths:[(concatWS('/',$src_dir_name,'sub-tsv'))]) ~> subsrc
source(output(
		dimhash as string,
		segments as string,
		segt as string
	),
	allowSchemaDrift: false,
	validateSchema: true,
	purgeFiles: true,
	wildcardPaths:[(concatWS('/',$src_dir_name,'dim-tsv'))]) ~> dimsrc
source(output(
		tag as string,
		version as string,
		custom as string,
		abstract as string,
		datatype as string,
		iord as string,
		crdr as string,
		tlabel as string,
		doc as string
	),
	allowSchemaDrift: false,
	validateSchema: true,
	purgeFiles: true,
	wildcardPaths:[(concatWS('/',$src_dir_name,'tag-tsv'))]) ~> tagsrc
source(output(
		adsh as string,
		tag as string,
		version as string,
		ddate as string,
		qtrs as string,
		uom as string,
		dimh as string,
		iprx as string,
		value as string,
		footnote as string,
		footlen as string,
		dimn as string,
		coreg as string,
		durp as string,
		datp as string,
		dcml as string
	),
	allowSchemaDrift: false,
	validateSchema: true,
	purgeFiles: true,
	wildcardPaths:[(concatWS('/',$src_dir_name,'num-tsv'))]) ~> numsrc
source(output(
		adsh as string,
		tag as string,
		version as string,
		ddate as string,
		qtrs as string,
		iprx as string,
		lang as string,
		dcml as string,
		durp as string,
		datp as string,
		dimh as string,
		dimn as string,
		coreg as string,
		escaped as string,
		srclen as string,
		txtlen as string,
		footnote as string,
		footlen as string,
		context as string,
		value as string
	),
	allowSchemaDrift: false,
	validateSchema: true,
	purgeFiles: true,
	wildcardPaths:[(concatWS('/',$src_dir_name,'txt-tsv'))]) ~> txtsrc
source(output(
		adsh as string,
		grp as string,
		arc as string,
		negative as string,
		ptag as string,
		pversion as string,
		ctag as string,
		cversion as string
	),
	allowSchemaDrift: false,
	validateSchema: true,
	purgeFiles: true,
	wildcardPaths:[(concatWS('/',$src_dir_name,'cal-tsv'))]) ~> calsrc
source(output(
		adsh as string,
		report as string,
		line as string,
		stmt as string,
		inpth as string,
		tag as string,
		version as string,
		prole as string,
		plabel as string,
		negating as string
	),
	allowSchemaDrift: false,
	validateSchema: true,
	purgeFiles: true,
	wildcardPaths:[(concatWS('/',$src_dir_name,'pre-tsv'))]) ~> presrc
source(output(
		adsh as string,
		report as string,
		rfile as string,
		menucat as string,
		shortname as string,
		longname as string,
		roleuri as string,
		parentroleuri as string,
		parentreport as string,
		ultparentrpt as string
	),
	allowSchemaDrift: false,
	validateSchema: true,
	purgeFiles: true,
	wildcardPaths:[(concatWS('/',$src_dir_name,'ren-tsv'))]) ~> rensrc
subsrc sink(input(
		Column_1 as string,
		Column_2 as string,
		Column_3 as string,
		Column_4 as string,
		Column_5 as string,
		Column_6 as string,
		Column_7 as string,
		Column_8 as string,
		Column_9 as string,
		Column_10 as string,
		Column_11 as string,
		Column_12 as string,
		Column_13 as string,
		Column_14 as string,
		Column_15 as string,
		Column_16 as string,
		Column_17 as string,
		Column_18 as string,
		Column_19 as string,
		Column_20 as string,
		Column_21 as string,
		Column_22 as string,
		Column_23 as string,
		Column_24 as string,
		Column_25 as string,
		Column_26 as string,
		Column_27 as string,
		Column_28 as string,
		Column_29 as string,
		Column_30 as string,
		Column_31 as string,
		Column_32 as string,
		Column_33 as string,
		Column_34 as string,
		Column_35 as string,
		Column_36 as string,
		Column_37 as string,
		Column_38 as string,
		Column_39 as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	truncate: true,
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true) ~> sub
dimsrc sink(input(
		Column_1 as string,
		Column_2 as string,
		Column_3 as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	truncate: true,
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true) ~> dim
tagsrc sink(input(
		Column_1 as string,
		Column_2 as string,
		Column_3 as string,
		Column_4 as string,
		Column_5 as string,
		Column_6 as string,
		Column_7 as string,
		Column_8 as string,
		Column_9 as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	truncate: true,
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true) ~> tag
numsrc sink(input(
		Column_1 as string,
		Column_2 as string,
		Column_3 as string,
		Column_4 as string,
		Column_5 as string,
		Column_6 as string,
		Column_7 as string,
		Column_8 as string,
		Column_9 as string,
		Column_10 as string,
		Column_11 as string,
		Column_12 as string,
		Column_13 as string,
		Column_14 as string,
		Column_15 as string,
		Column_16 as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	truncate: true,
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true) ~> num
txtsrc sink(input(
		Column_1 as string,
		Column_2 as string,
		Column_3 as string,
		Column_4 as string,
		Column_5 as string,
		Column_6 as string,
		Column_7 as string,
		Column_8 as string,
		Column_9 as string,
		Column_10 as string,
		Column_11 as string,
		Column_12 as string,
		Column_13 as string,
		Column_14 as string,
		Column_15 as string,
		Column_16 as string,
		Column_17 as string,
		Column_18 as string,
		Column_19 as string,
		Column_20 as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	truncate: true,
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true) ~> txt
calsrc sink(input(
		Column_1 as string,
		Column_2 as string,
		Column_3 as string,
		Column_4 as string,
		Column_5 as string,
		Column_6 as string,
		Column_7 as string,
		Column_8 as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	truncate: true,
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true) ~> cal
presrc sink(input(
		Column_1 as string,
		Column_2 as string,
		Column_3 as string,
		Column_4 as string,
		Column_5 as string,
		Column_6 as string,
		Column_7 as string,
		Column_8 as string,
		Column_9 as string,
		Column_10 as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	truncate: true,
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true) ~> pre
rensrc sink(input(
		Column_1 as string,
		Column_2 as string,
		Column_3 as string,
		Column_4 as string,
		Column_5 as string,
		Column_6 as string,
		Column_7 as string,
		Column_8 as string,
		Column_9 as string
	),
	allowSchemaDrift: true,
	validateSchema: false,
	truncate: true,
	skipDuplicateMapInputs: true,
	skipDuplicateMapOutputs: true) ~> ren