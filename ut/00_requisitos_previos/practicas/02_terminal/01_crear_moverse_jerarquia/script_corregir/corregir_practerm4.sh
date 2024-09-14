#!/bin/bash

total=7
while read u; do
	user=`echo $u | cut -d, -f1`
	nombre=`echo $u | cut -d, -f2`
	dirdone=0

	if [ -d /home/${nombre}/Documentos/practerm4/nba ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm4/nba/conferencias ]
	then
		let "dirdone+=1"
	fi

	if [ -d /home/${nombre}/Documentos/practerm4/nba/franquicias ]
	then
		let "dirdone+=1"
	fi

	if [ -d /home/${nombre}/Documentos/practerm4/nba/conferencias/este ]
	then
		let "dirdone+=1"
	fi

	if [ -d /home/${nombre}/Documentos/practerm4/nba/conferencias/oeste ]
	then
		let "dirdone+=1"
	fi

	if [ -d /home/${nombre}/Documentos/practerm4/nba/franquicias/bulls ]
	then
		let "dirdone+=1"
	fi

	if [ -d /home/${nombre}/Documentos/practerm4/nba/franquicias/lakers ]
	then
		let "dirdone+=1"
	fi

	res=`echo "scale=2; $dirdone / $total * 10" | bc`
	echo "${nombre}: ${dirdone} / ${total} = ${res}"
	
done < usuarios.txt
