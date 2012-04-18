clean :
	rm -f *.b#? *.s#? *.l#? *.pro *~

zip :
	rm -f MikeTsao-RPio.zip && zip MikeTsao-RPio.zip *.dri *.xln *.ger *.gpi

zipseeed :
	rm -f MikeTsao-RPio-Seeed.zip && zip MikeTsao-RPio-Seeed.zip *.gpi *.GTL *.dri *.GBL *.GBO *.GBP *.GBS *.GML *.GTO *.GTP *.GTS *.TXT

cleancam :
	rm -f *.dri *.xln *.ger *.gpi *.GTL *.dri *.GBL *.GBO *.GBP *.GBS *.GML *.GTO *.GTP *.GTS *.TXT

