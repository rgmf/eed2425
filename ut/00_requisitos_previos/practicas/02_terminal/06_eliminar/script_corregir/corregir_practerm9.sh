#!/bin/bash

total=7
while read u; do
	user=`echo $u | cut -d, -f1`
	nombre=`echo $u | cut -d, -f2`
	dirdone=0

	if [ -d /home/${nombre}/Documentos/practerm9/inicio ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm9/inicio/docs ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm9/inicio/docs/backup ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm9/inicio/img ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm9/inicio/img/paisajes ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -f /home/${nombre}/Documentos/practerm9/inicio/ejercicio.odt ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -f /home/${nombre}/Documentos/practerm9/inicio/docs/fic1.txt ]
	then
		dirdone=$((dirdone+1))
	fi

	res=`echo "scale=2; $dirdone / $total * 10" | bc`
	echo "${nombre}: ${dirdone} / ${total} = ${res}"
	
done < usuarios.txt
