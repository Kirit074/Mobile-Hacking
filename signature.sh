#!/bin/bash
if [ "$1" == "" ]
then
echo "<----------------------------------------->"
echo "MOBILE HACKING - Kirito"
echo "PT: Modo de Usar $0 file.apk"
echo "US: How to use: $0 arquivo.apk"
echo "<----------------------------------------->"
else
echo "PT: Entre com um nome para assinatura"
echo "US: Enter a name for subscription"
read signature
echo "PT: Entre com um nome para o arquivo"
echo "US: Enter a name for the file"
read name
echo "PT: Entre com uma senha"
echo "US: Enter a password"
read password
echo "PT: Pegue um café e aguarde..."
echo "US: Get a coffee and wait..."
keytool -genkey -keystore $name.jks -storepass $password -storetype jks -alias $name -keyalg rsa -dname "CN=$signature" -keypass $password
jarsigner -keystore $name.jks -storepass $password -storetype jks -sigalg sha1withrsa -digestalg sha1 $1 $name
jarsigner -verify -certs -verbose $1
echo "PT: Feito"
echo "US: Done"
fi