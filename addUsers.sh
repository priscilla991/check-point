#! /bin/bash 

#######################################################################################################################################
# version 0.0
# Priscilla
# Description: Script qui créé automatiquement les utilisateurs
#######################################################################################################################################

#Vérifier si les arguments ont été passés 

# Vérifier si des arguments ont été passés
if [ $# -eq 0 ]; then
    echo "Il manque les noms d'utilisateurs en argument - Fin du script"
    exit 1
fi

# Boucle pour traiter chaque utilisateur passé en argument
for user in "$@"
do
    # Vérification de l'existence de l'utilisateur
    if id "$user" &>/dev/null; then
        echo "L'utilisateur $user existe déjà"
    else
        # Création de l'utilisateur avec sudo
        sudo useradd "$user"

        # Vérification de la création de l'utilisateur
        if [ $? -eq 0 ]; then
            echo "L'utilisateur $user a été créé"
        else
            echo "Erreur à la création de l'utilisateur $user"
        fi
    fi
done