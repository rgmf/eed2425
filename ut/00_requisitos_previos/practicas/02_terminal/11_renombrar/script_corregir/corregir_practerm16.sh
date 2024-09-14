#!/bin/bash

total=8
while read u; do
	user=`echo $u | cut -d, -f1`
	nombre=`echo $u | cut -d, -f2`
	dirdone=0

	if [ -d /home/${nombre}/Documentos/practerm16/inicio/ficheros ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm16/inicio/imagenes ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm16/inicio/musica ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm16/inicio/videos ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -f /home/${nombre}/Documentos/practerm16/inicio/fichero.txt ]
	then
		dirdone=$((dirdone+1))
	fi
	
	if [ -f /home/${nombre}/Documentos/practerm16/inicio/imagen.png ]
	then
		dirdone=$((dirdone+1))
	fi
	
	if [ -f /home/${nombre}/Documentos/practerm16/inicio/musica.mp3 ]
	then
		dirdone=$((dirdone+1))
	fi
	
	if [ -f /home/${nombre}/Documentos/practerm16/inicio/video.mpeg ]
	then
		dirdone=$((dirdone+1))
	fi
	
	res=`echo "scale=2; $dirdone / $total * 10" | bc`
	echo "${nombre}: ${dirdone} / ${total} = ${res}"
	
done < usuarios.txt
