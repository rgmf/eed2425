#!/bin/bash

total=14
while read u; do
	user=`echo $u | cut -d, -f1`
	nombre=`echo $u | cut -d, -f2`
	dirdone=0

	if [ -d /home/${nombre}/Documentos/practerm11/inicio ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm11/inicio/docs ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm11/inicio/img ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm11/inicio/docs/backup ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm11/inicio/img/fondos ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm11/inicio/img/fotos ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm11/inicio/img/fondos/fotos ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -f /home/${nombre}/Documentos/practerm11/inicio/ejercicio.odt ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -f /home/${nombre}/Documentos/practerm11/inicio/docs/backup/fic1.txt ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -f /home/${nombre}/Documentos/practerm11/inicio/docs/backup/ejercicio.odt ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -f /home/${nombre}/Documentos/practerm11/inicio/img/fondos/casa.jpg ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -f /home/${nombre}/Documentos/practerm11/inicio/img/fotos/alpes.jpg ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -f /home/${nombre}/Documentos/practerm11/inicio/img/fotos/aneto.png ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -f /home/${nombre}/Documentos/practerm11/inicio/img/fotos/rio.png ]
	then
		dirdone=$((dirdone+1))
	fi

	res=`echo "scale=2; $dirdone / $total * 10" | bc`
	echo "${nombre}: ${dirdone} / ${total} = ${res}"
	
done < usuarios.txt
