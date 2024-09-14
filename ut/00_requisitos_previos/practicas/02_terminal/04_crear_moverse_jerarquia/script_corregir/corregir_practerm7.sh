#!/bin/bash

total=14
while read u; do
	user=`echo $u | cut -d, -f1`
	nombre=`echo $u | cut -d, -f2`
	dirdone=0

	if [ -d /home/${nombre}/Documentos/practerm7/ordenador ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm7/ordenador/hardware ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm7/ordenador/software ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm7/ordenador/hardware/componentes ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm7/ordenador/hardware/perifericos ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm7/ordenador/software/so ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm7/ordenador/software/apps ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm7/ordenador/software/so/pc ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm7/ordenador/software/so/movil ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm7/ordenador/software/so/pc/linux ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm7/ordenador/software/so/pc/macos ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm7/ordenador/software/so/pc/win ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm7/ordenador/software/so/movil/android ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm7/ordenador/software/so/movil/ios ]
	then
		dirdone=$((dirdone+1))
	fi

	res=`echo "scale=2; $dirdone / $total * 10" | bc`
	echo "${nombre}: ${dirdone} / ${total} = ${res}"
	
done < usuarios.txt
