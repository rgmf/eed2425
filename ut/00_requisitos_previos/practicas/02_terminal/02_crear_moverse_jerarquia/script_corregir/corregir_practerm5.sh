#!/bin/bash

total=6
while read u; do
	user=`echo $u | cut -d, -f1`
	nombre=`echo $u | cut -d, -f2`
	dirdone=0

	if [ -d /home/${nombre}/Documentos/practerm5/informatica ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm5/informatica/alus ]
	then
		let "dirdone+=1"
	fi

	if [ -d /home/${nombre}/Documentos/practerm5/informatica/img ]
	then
		let "dirdone+=1"
	fi

	if [ -d /home/${nombre}/Documentos/practerm5/informatica/musica ]
	then
		let "dirdone+=1"
	fi

	if [ -d /home/${nombre}/Documentos/practerm5/informatica/img/animales ]
	then
		let "dirdone+=1"
	fi

	if [ -d /home/${nombre}/Documentos/practerm5/informatica/img/paisajes ]
	then
		let "dirdone+=1"
	fi


	res=`echo "scale=2; $dirdone / $total * 10" | bc`
	echo "${nombre}: ${dirdone} / ${total} = ${res}"
	
done < usuarios.txt
