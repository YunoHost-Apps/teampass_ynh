#!/bin/bash

if [ -z "$1" ]	#Si l"argument est manquant
then
echo "Le nom du fichier CSV doit être donné en argument."
exit 1
fi

MODFILE="$1".mod
XMLFILE=$(basename -s csv "$1")xml	# Retire l"extension csv pour la remplacer par xml.

# Méthode peut-être douteuse, mais correct sur tout mes exports. Les lignes se terminent par ;;0
# C'est donc un moyen de reconstituer les lignes.
> "$MODFILE"	# Vide ou crée le fichier MODFILE.
while read LIGNE
do
	if [ "$(echo "$LIGNE")" != "id;label;description;pw;login;restricted_to;perso" ]
	then
		if [ -z "$LIGNE" ] || [ "$(echo "${LIGNE: -3}")" != ";;0" ]		# Si la ligne ne se termine pas par ;;0. Le premier test prend uniqument les 3 derniers caractères, excepté le dernier qui est le retour chariot. Le second test vérifie si la ligne est vide, en ignorant le retour chariot.
		then
			echo -n "$LIGNE\\\\n" >> "$MODFILE"
		else
			echo "$LIGNE" >> "$MODFILE"
		fi
	fi
done < "$1"

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" > "$XMLFILE"
echo "<pwlist>" >> "$XMLFILE"
while read LIGNE
do
	if [ "$(echo "$LIGNE")" != "id;label;description;pw;login;restricted_to;perso" ]	# Si la ligne commence par id, c"est la première ligne à ignorer
	then
		echo "<pwentry>" >> "$XMLFILE"
		echo "	<group>General</group>" >> "$XMLFILE"
		echo -n "	<title>" >> "$XMLFILE"
		echo -n $(echo $LIGNE | cut -f2 -d ";") >> "$XMLFILE" #Copie le label
		echo "</title>" >> "$XMLFILE"
		echo -n "	<username>" >> "$XMLFILE"
		echo -n $(echo $LIGNE | cut -f5 -d ";") >> "$XMLFILE" #Copie le login
		echo "</username>" >> "$XMLFILE"
		echo "	<url></url>" >> "$XMLFILE"
		echo -n "	<password>" >> "$XMLFILE"
		echo -n $(echo $LIGNE | cut -f4 -d ";") >> "$XMLFILE" #Copie le password
		echo "</password>" >> "$XMLFILE"
		echo -n "	<notes>" >> "$XMLFILE"
		echo -n -e $(echo $LIGNE | cut -f3 -d ";") >> "$XMLFILE" #Copie la description
		echo "</notes>" >> "$XMLFILE"
		echo "	<uuid></uuid>" >> "$XMLFILE"
		echo "	<image></image>" >> "$XMLFILE"
		echo "	<creationtime></creationtime>" >> "$XMLFILE"
		echo "	<lastmodtime></lastmodtime>" >> "$XMLFILE"
		echo "	<lastaccesstime></lastaccesstime>" >> "$XMLFILE"
		echo "	<expiretime expires=\"false\"></expiretime>" >> "$XMLFILE"
		echo "</pwentry>" >> "$XMLFILE"
	fi
done < "$MODFILE"
echo "</pwlist>" >> "$XMLFILE"

# Keepass encode ses accents en ISO sur l'xml, alors que Teampass encode en html sur le CSV.
# Une erreur d'encodage empèche l'import du fichier xml, Teampass ne reconnaissant pas un fichier issue de Keepass.

sed -i "s@\&quot|@\&#34;@g" "$XMLFILE"		#"
sed -i "s@\&amp|@\&#38;@g" "$XMLFILE"		#&
sed -i "s@\&euro|@\&#128;@g" "$XMLFILE"		#€
sed -i "s@\&#39|@\&#130;@g" "$XMLFILE"		#'
sed -i "s@\&hellip|@\&#133;@g" "$XMLFILE"	#…
sed -i "s@\&lt|@\&#139;@g" "$XMLFILE"		#<
sed -i "s@\&OElig|@\&#140;@g" "$XMLFILE"	#Œ
sed -i "s@\&trade|@\&#153;@g" "$XMLFILE"	#™
sed -i "s@\&gt|@\&#155;@g" "$XMLFILE"		#>
sed -i "s@\&pound|@\&#163;@g" "$XMLFILE"	#£
sed -i "s@\&curren|@\&#164;@g" "$XMLFILE"	#¤
sed -i "s@\&yen|@\&#165;@g" "$XMLFILE"		#¥
sed -i "s@\&brvbar|@\&#166;@g" "$XMLFILE"	#¦
sed -i "s@\&sect|@\&#167;@g" "$XMLFILE"		#§
sed -i "s@\&copy|@\&#169;@g" "$XMLFILE"		#©
sed -i "s@\&laquo|@\&#171;@g" "$XMLFILE"	#«
sed -i "s@\&reg|@\&#174;@g" "$XMLFILE"		#®
sed -i "s@\&deg|@\&#176;@g" "$XMLFILE"		#°
sed -i "s@\&plusmn|@\&#177;@g" "$XMLFILE"	#±
sed -i "s@\&sup2|@\&#178;@g" "$XMLFILE"		#²
sed -i "s@\&sup3|@\&#179;@g" "$XMLFILE"		#³
sed -i "s@\&micro|@\&#181;@g" "$XMLFILE"	#µ
sed -i "s@\&para|@\&#182;@g" "$XMLFILE"		#¶
sed -i "s@\&sup1|@\&#185;@g" "$XMLFILE"		#¹
sed -i "s@\&ordm|@\&#186;@g" "$XMLFILE"		#º
sed -i "s@\&raquo|@\&#187;@g" "$XMLFILE"	#»
sed -i "s@\&frac14|@\&#188;@g" "$XMLFILE"	#¼
sed -i "s@\&frac12|@\&#189;@g" "$XMLFILE"	#½
sed -i "s@\&frac34|@\&#190;@g" "$XMLFILE"	#¾
sed -i "s@\&iquest|@\&#191;@g" "$XMLFILE"	#¿
sed -i "s@\&Agrave|@\&#192;@g" "$XMLFILE"	#À
sed -i "s@\&Aacute|@\&#193;@g" "$XMLFILE"	#Á
sed -i "s@\&Acirc|@\&#194;@g" "$XMLFILE"	#Â
sed -i "s@\&Atilde|@\&#195;@g" "$XMLFILE"	#Ã
sed -i "s@\&Auml|@\&#196;@g" "$XMLFILE"		#Ä
sed -i "s@\&Aring|@\&#197;@g" "$XMLFILE"	#Å
sed -i "s@\&Aelig|@\&#198;@g" "$XMLFILE"	#Æ
sed -i "s@\&Ccedil|@\&#199;@g" "$XMLFILE"	#Ç
sed -i "s@\&Egrave|@\&#200;@g" "$XMLFILE"	#È
sed -i "s@\&Eacute|@\&#201;@g" "$XMLFILE"	#É
sed -i "s@\&Ecirc|@\&#202;@g" "$XMLFILE"	#Ê
sed -i "s@\&Euml|@\&#203;@g" "$XMLFILE"		#Ë
sed -i "s@\&Igrave|@\&#204;@g" "$XMLFILE"	#Ì
sed -i "s@\&Iacute|@\&#205;@g" "$XMLFILE"	#Í
sed -i "s@\&Icirc|@\&#206;@g" "$XMLFILE"	#Î
sed -i "s@\&Iuml|@\&#207;@g" "$XMLFILE"		#Ï
sed -i "s@\&Ntilde|@\&#209;@g" "$XMLFILE"	#Ñ
sed -i "s@\&Ograve|@\&#210;@g" "$XMLFILE"	#Ò
sed -i "s@\&Oacute|@\&#211;@g" "$XMLFILE"	#Ó
sed -i "s@\&Ocirc|@\&#212;@g" "$XMLFILE"	#Ô
sed -i "s@\&Otilde|@\&#213;@g" "$XMLFILE"	#Õ
sed -i "s@\&Ouml|@\&#214;@g" "$XMLFILE"		#Ö
sed -i "s@\&Oslash|@\&#216;@g" "$XMLFILE"	#Ø
sed -i "s@\&Ugrave|@\&#217;@g" "$XMLFILE"	#Ù
sed -i "s@\&Uacute|@\&#218;@g" "$XMLFILE"	#Ú
sed -i "s@\&Ucirc|@\&#219;@g" "$XMLFILE"	#Û
sed -i "s@\&Uuml|@\&#220;@g" "$XMLFILE"		#Ü
sed -i "s@\&Yacute|@\&#221;@g" "$XMLFILE"	#Ý
sed -i "s@\&agrave|@\&#224;@g" "$XMLFILE"	#à
sed -i "s@\&aacute|@\&#225;@g" "$XMLFILE"	#á
sed -i "s@\&acirc|@\&#226;@g" "$XMLFILE"	#â
sed -i "s@\&atilde|@\&#227;@g" "$XMLFILE"	#ã
sed -i "s@\&auml|@\&#228;@g" "$XMLFILE"		#ä
sed -i "s@\&aring|@\&#229;@g" "$XMLFILE"	#å
sed -i "s@\&aelig|@\&#230;@g" "$XMLFILE"	#æ
sed -i "s@\&ccedil|@\&#231;@g" "$XMLFILE"	#ç
sed -i "s@\&egrave|@\&#232;@g" "$XMLFILE"	#è
sed -i "s@\&eacute|@\&#233;@g" "$XMLFILE"	#é
sed -i "s@\&ecirc|@\&#234;@g" "$XMLFILE"	#ê
sed -i "s@\&euml|@\&#235;@g" "$XMLFILE"		#ë
sed -i "s@\&igrave|@\&#236;@g" "$XMLFILE"	#ì
sed -i "s@\&iacute|@\&#237;@g" "$XMLFILE"	#í
sed -i "s@\&icirc|@\&#238;@g" "$XMLFILE"	#î
sed -i "s@\&iuml|@\&#239;@g" "$XMLFILE"		#ï
sed -i "s@\&ntilde|@\&#241;@g" "$XMLFILE"	#ñ
sed -i "s@\&ograve|@\&#242;@g" "$XMLFILE"	#ò
sed -i "s@\&oacute|@\&#243;@g" "$XMLFILE"	#ó
sed -i "s@\&ocirc|@\&#244;@g" "$XMLFILE"	#ô
sed -i "s@\&otilde|@\&#245;@g" "$XMLFILE"	#õ
sed -i "s@\&ouml|@\&#246;@g" "$XMLFILE"		#ö
sed -i "s@\&divide|@\&#247;@g" "$XMLFILE"	#÷
sed -i "s@\&oslash|@\&#248;@g" "$XMLFILE"	#ø
sed -i "s@\&ugrave|@\&#249;@g" "$XMLFILE"	#ù
sed -i "s@\&uacute|@\&#250;@g" "$XMLFILE"	#ú
sed -i "s@\&ucirc|@\&#251;@g" "$XMLFILE"	#û
sed -i "s@\&uuml|@\&#252;@g" "$XMLFILE"		#ü
sed -i "s@\&yacute|@\&#253;@g" "$XMLFILE"	#ý
sed -i "s@\&yuml|@\&#255;@g" "$XMLFILE"		#ÿ
sed -i "s@\&nbsp|@\&#160;@g" "$XMLFILE"		#Espace insécable


# Converti les & qui ne passent pas en l'état.
# Mais avant de convertir les & isolés, il faut ignorer les &# correspondants aux codages de caractères.
sed -i "s@\&#@#~#@g" "$XMLFILE"		# Remplace &# par #~#.
sed -i "s@\&@\&#38;@g" "$XMLFILE"	# Remplace les & isolés.
sed -i "s@#~#@\&#@g" "$XMLFILE"		# Restaure les &#.

rm "$MODFILE"
