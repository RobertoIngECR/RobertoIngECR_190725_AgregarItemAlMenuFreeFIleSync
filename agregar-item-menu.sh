#!/bin/bash
# https://github.com/RobertoIngECR/RobertoIngECR_190725_AgregarItemAlMenuFreeFileSync
# https://gitlab.com/RobertoIngECR/RobertoIngECR_190725_AgregarItemAlMenuFreeFileSync
# https://bitbucket.org/RobertoIngECR/robertoingecr_190725_agregaritemalmenufreefilesync
#Modificado y comentado por: Roberto Eulogio Chavez Ramos (RobertoIngECR, RECHR)
#(Basado en los archivos de agregar y eliminar el acceso del programa SmartGit)

#a) Para crear el acceso para FreeFileSync (Ver captura adjunta)
#	1.-Copiar estos archivos junto a los íconos en la carpeta del ejecutable (FreeFileSync/bin/)
#	2.-Doble clic sobre el archivo "agregar-item-menu.sh" y clic en Ejecutar
#	3.-Automáticamente se agregará el acceso y se guardarán las imágenes de sus íconos

#b) Para crear accesos para otros aplicaciones, respetar la relación que existe en el nombre de las iconos con sus números que representan su dimensión:
#	PRODUCTO-32.png		icono de 32 por 32 pixeles, en el ejemplo FreeFileSync-32.png
#	PRODUCTO-48.png		icono de 48 por 48 pixeles
#	PRODUCTO-64.png		icono de 64 por 64 pixeles
#	PRODUCTO-128.png	icono de 128 por 128 pixeles

#de lo contrario no se crearán los íconos en sus carpetas correspondientes como muestra la captura.
#Este ejemplo fue probado en Debian 10, y con la aplicación FreeFileSync 10.14

#---------------------------------------------------------------------------------------------------
#--Para crear el acceso para otra aplicación solo cambiar los valores de las siguientes 5 variables:
#---------------------------------------------------------------------------------------------------

NOMBRE_EJECUTABLE=FreeFileSync_x86_64
PROVEEDOR=FreeFileSync
PRODUCTO=FreeFileSync
PALABRAS_CLAVES="sincronizar;backup;comparación"
DESCRIPCION="Compara y sincroniza carpetas y archivos."

# Donde:
# NOMBRE_EJECUTABLE=Nombre del ejecutable junto a su extensión.
# PROVEEDOR=En el ejemplo de SmartGit (syntevo-smartgit), PROVEEDOR sería syntevo.
# PRODUCTO=En el ejemplo de SmartGit (syntevo-smartgit), PRODUCTO sería smartgit.
# PALABRAS_CLAVES=Colocar las palabras claves con las que se buscará la aplicación en el menú, separadas una de otra por un ";" y todo entre comillas
# DESCRIPCION=Colocar la descripción de lo que realiza la aplicación a abrir

#---------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------

#$DIR_RobertoIngECR_BIN guarda la ruta absoluta hasta la carpeta que contiene este archivo,
#y a la vez que contiene el archivo ejecutable al que se desea lanzar desde el menú de aplicaciones.
DIR_RobertoIngECR_BIN=`pwd`

NOMBRE_ICONO=$PROVEEDOR-$PRODUCTO #Nombre con el que se registrarán los íconos.
ARCHIVO_LANZADOR=$PROVEEDOR-$PRODUCTO #Nombre con el que se registrará el archivo de configuración.

DIRECTORIO_TEMPORAL=`mktemp --directory` #Crea un nuevo directorio temporal y se guarda la ruta a éste.
ARCHIVO_CONFIGURACION=$DIRECTORIO_TEMPORAL/$ARCHIVO_LANZADOR.desktop #Se guarda la ruta al nuevo archivo de las configuraciones del acceso o lanzador.

#Agrupa el párrafo (cadena multilínea) hasta encontrar la cadena "EOF":
#cat<<EOF (...lineas... EOF),
#y luego esto lo guarda en el archivo de configuraciones a crear (>ARCHIVO_CONFIGURACION)
cat << EOF > $ARCHIVO_CONFIGURACION
[Desktop Entry]
Encoding=UTF-8
Name=$PRODUCTO
Keywords=$PALABRAS_CLAVES
Comment=$DESCRIPCION
Type=Application
Categories=DGNOME;GTK;Utility;X-GNOME-Utilities;
Terminal=false
StartupNotify=true
StartupWMClass=$PRODUCTO
Exec="$DIR_RobertoIngECR_BIN/$NOMBRE_EJECUTABLE"
Icon=$NOMBRE_ICONO.png
EOF

 #Se da permisos de ejecución al archivo que lanzará la aplicación
chmod 644 $ARCHIVO_CONFIGURACION

#Se registran los archivos instalando las propiedades del lanzador y los íconos
xdg-desktop-menu install $ARCHIVO_CONFIGURACION
xdg-icon-resource install --size  32 "$DIR_RobertoIngECR_BIN/$PRODUCTO-32.png"  $NOMBRE_ICONO
xdg-icon-resource install --size  48 "$DIR_RobertoIngECR_BIN/$PRODUCTO-48.png"  $NOMBRE_ICONO
xdg-icon-resource install --size  64 "$DIR_RobertoIngECR_BIN/$PRODUCTO-64.png"  $NOMBRE_ICONO
xdg-icon-resource install --size 128 "$DIR_RobertoIngECR_BIN/$PRODUCTO-128.png" $NOMBRE_ICONO

#Finalmente se borran los archivos temporales
rm $ARCHIVO_CONFIGURACION
rm -R $DIRECTORIO_TEMPORAL