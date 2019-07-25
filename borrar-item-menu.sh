#!/bin/bash
# https://github.com/RobertoIngECR/RobertoIngECR_190725_AgregarItemAlMenuFreeFileSync
# https://gitlab.com/RobertoIngECR/RobertoIngECR_190725_AgregarItemAlMenuFreeFileSync
# https://bitbucket.org/RobertoIngECR/robertoingecr_190725_agregaritemalmenufreefilesync
#Modificado y comentado por: Roberto Eulogio Chavez Ramos (RobertoIngECR, RECHR)
#(Basado en los archivos de agregar y eliminar el acceso del programa SmartGit)

#*****Datos necesarios a cambiar para eliminar el acceso para otros programas:
#####Están marcados por una flecha "<-----=============== <--"
#******************************************************************

PROVEEDOR=FreeFileSync #en el ejemplo de SmartGit (syntevo-smartgit), PROVEEDOR sería syntevo.<-----=============== <--
PRODUCTO=FreeFileSync #en el ejemplo de SmartGit (syntevo-smartgit), PRODUCTO sería smartgit. <-----=============== <--

NOMBRE_ICONO=$PROVEEDOR-$PRODUCTO #Nombre con el que se registró los íconos.
ARCHIVO_LANZADOR=$PROVEEDOR-$PRODUCTO.desktop #Nombre con el que se registró el archivo de configuración.

#Se borra el registro del archivo de configuración o lanzador y los íconos
xdg-desktop-menu uninstall $ARCHIVO_LANZADOR
xdg-icon-resource uninstall --size  32 $NOMBRE_ICONO
xdg-icon-resource uninstall --size  48 $NOMBRE_ICONO
xdg-icon-resource uninstall --size  64 $NOMBRE_ICONO
xdg-icon-resource uninstall --size 128 $NOMBRE_ICONO
