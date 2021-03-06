#! /bin/bash

# Ejercicio nº1 Examen, script que realiza una serie de acciones en tanto a los parámetros introducidos

if  [ $1 == --exec ] ;
  then 
      if [ $# == 2 ] ;
          then $2 &> /tmp/salida.txt ;
      else
	   echo "Parámetro(s) no válido(s) (sólo hay que introducir la orden a ejecutar)" ;
      fi ;

elif [ $1 == --search ] ;
  then
   if [ $# == 2 ] ;
       then
	   echo -e "$2 es usada por:\n" 
	   grep $2 /etc/passwd | cut -d':' -f1 ;
   else
	echo "Parámetro(s) no válido(s) (Quizá falte un tipo de shell, pruebe con bash, sh...)" ;
   fi ;

else
   if [ $# == 0 ] ;
	then echo -e "No ha introducido argumentos, a continuación se mostrará el usuario (y su grupo) que ha ejecutado el guión:\n $USER \nGrupos a los que pertenece: \n`grep $USER /etc/group | cut -d':' -f1`" ;

   elif [ $# -ge 3 ] ;
	then echo -e "Ha introducido demasiados argumentos, a continuación se mostrará el usuario (y su grupo) que ha ejecutado el guión: \n$USER \n\nGrupos a los que pertenece: \n`grep $USER /etc/group | cut -d':' -f1`" ;
   
   elif [ $1 == -h ] || [ $1 == -H ] ;
	then echo -e "Opción elegida: $1 \n\nUsuario: \n$USER \n\nGrupos a los que pertenece: \n`grep $USER /etc/group | cut -d':' -f1`" ;

   echo -e "A continuación se le mostrará el enunciado del ejercicio como ayuda: \n\nEscriba un guión (script) llamado ejercicio1.sh en bash que cumpla los siguientes requisitos: \n(a) Si el guión se ejecuta sin parámetros, con tres o más parámetros o con el parámetro -h o el parámetro -H como primer argumento, entonces el guión devolverá el nombre de usuario que lo ha ejecutado y su grupo. Además, debajo aparecerá el texto de este ejercicio. \n\n(b) Si el guión se ejecuta con el parámetro --exec como primer argumento, entonces tomará el segundo parámetro como una orden y la ejecutará redireccionando la salida estándar y error al fichero salida.txt del directorio tempporal del sistema. \n\n(c) Si el guión se ejecuta con el parámetro --search como primer argumento, entonces tomará el segundo como un tipo de shell (por ejemplo si escribimos bash como segundo parámetro la shell será la bash) y nos devolverá una lista con los usuarios del sistema que usan por defecto la shell indicada. \n\nFinalmente, trate todos los errores posibles debidos a la falta del segundo parámetro en aquellos casos en los que se requiera." ;

   fi ;
fi


