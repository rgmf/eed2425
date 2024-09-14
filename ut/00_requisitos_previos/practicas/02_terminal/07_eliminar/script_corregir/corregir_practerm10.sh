#!/bin/bash

total=10
while read u; do
	user=`echo $u | cut -d, -f1`
	nombre=`echo $u | cut -d, -f2`
	dirdone=0

	if [ -d /home/${nombre}/Documentos/practerm10/inicio ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm10/inicio/docs ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm10/inicio/img ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm10/inicio/musica ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm10/inicio/docs/backup ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm10/inicio/docs/ies ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm10/inicio/musica/pop ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm10/inicio/musica/rap ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm10/inicio/musica/rock ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -f /home/${nombre}/Documentos/practerm10/inicio/docs/backup/fic1.txt ]
	then
		dirdone=$((dirdone+1))
	fi

	res=`echo "scale=2; $dirdone / $total * 10" | bc`
	echo "${nombre}: ${dirdone} / ${total} = ${res}"
	
done < usuarios.txt
