clean :
	rm -f *.b#? *.s#? *.l#? *.pro *~

zip :
	rm -f MikeTsao-RPio.zip && zip MikeTsao-RPio.zip *.dri *.xln *.ger *.gpi

cleancam :
	rm -f *.dri *.xln *.ger *.gpi
