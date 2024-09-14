#!/bin/bash

total=22
while read u; do
	user=`echo $u | cut -d, -f1`
	nombre=`echo $u | cut -d, -f2`
	dirdone=0

	if [ -d /home/${nombre}/Documentos/practerm15/web ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm15/web/copia_seguridad ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm15/web/css ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm15/web/imagenes ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -d /home/${nombre}/Documentos/practerm15/web/paginas ]
	then
		dirdone=$((dirdone+1))
	fi

	if [ -f /home/${nombre}/Documentos/practerm15/web/index.html ]
	then
		dirdone=$((dirdone+1))
	fi
	
	if [ -f /home/${nombre}/Documentos/practerm15/web/copia_seguridad/ada5.png ]
	then
		dirdone=$((dirdone+1))
	fi
	
	if [ -f /home/${nombre}/Documentos/practerm15/web/copia_seguridad/ama2.jpg ]
	then
		dirdone=$((dirdone+1))
	fi
	
	if [ -f /home/${nombre}/Documentos/practerm15/web/copia_seguridad/img1.jpg ]
	then
		dirdone=$((dirdone+1))
	fi
	
	if [ -f /home/${nombre}/Documentos/practerm15/web/css/a4.css ]
	then
		dirdone=$((dirdone+1))
	fi
	
	if [ -f /home/${nombre}/Documentos/practerm15/web/css/estilos.css ]
	then
		dirdone=$((dirdone+1))
	fi
	
	if [ -f /home/${nombre}/Documentos/practerm15/web/imagenes/ada5.png ]
	then
		dirdone=$((dirdone+1))
	fi
	
	if [ -f /home/${nombre}/Documentos/practerm15/web/imagenes/ama2.jpg ]
	then
		dirdone=$((dirdone+1))
	fi
	
	if [ -f /home/${nombre}/Documentos/practerm15/web/imagenes/img1.jpg ]
	then
		dirdone=$((dirdone+1))
	fi
	
	if [ -f /home/${nombre}/Documentos/practerm15/web/imagenes/logo.jpg ]
	then
		dirdone=$((dirdone+1))
	fi
	
	if [ -f /home/${nombre}/Documentos/practerm15/web/imagenes/logo.png ]
	then
		dirdone=$((dirdone+1))
	fi
	
	if [ -f /home/${nombre}/Documentos/practerm15/web/imagenes/mon.jpg ]
	then
		dirdone=$((dirdone+1))
	fi
	
	if [ -f /home/${nombre}/Documentos/practerm15/web/imagenes/paisaje.png ]
	then
		dirdone=$((dirdone+1))
	fi
	
	if [ -f /home/${nombre}/Documentos/practerm15/web/imagenes/portada.jpg ]
	then
		dirdone=$((dirdone+1))
	fi
	
	if [ -f /home/${nombre}/Documentos/practerm15/web/paginas/pag1.html ]
	then
		dirdone=$((dirdone+1))
	fi
	
	if [ -f /home/${nombre}/Documentos/practerm15/web/paginas/pag2.html ]
	then
		dirdone=$((dirdone+1))
	fi
	
	if [ -f /home/${nombre}/Documentos/practerm15/web/paginas/pag3.html ]
	then
		dirdone=$((dirdone+1))
	fi
	
	res=`echo "scale=2; $dirdone / $total * 10" | bc`
	echo "${nombre}: ${dirdone} / ${total} = ${res}"
	
done < usuarios.txt
