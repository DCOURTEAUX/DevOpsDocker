# EXAMEN FINAL DOCKER. 

## Introduction

La société **IC GROUP** dans laquelle vous travaillez en tant qu’ingénieur Devops souhaite mettre sur pied une application web vitrine devant permettre d’accéder à ses 02 applications phares qui sont :  

1) Odoo 
2) Pgadmin 

**Odoo** est un ERP multi usage qui permet de gérer les ventes, les achats, la comptabilité, l’inventaire, le personnel …  

Odoo est distribué en version communautaire et Enterprise. **IC GROUP** souhaite avoir la main sur le code et apporter ses propres modifications. Ainsi elle a opté pour l’édition communautaire.  Plusieurs versions de Odoo sont disponibles et celle retenue est la 13.0 car elle intègre un système de LMS (Learning Management System) qui sera utilisé pour publier les formations en internes et ainsi diffuser plus facilement l’information.  

Liens utiles : 

- Site officiel :[ https://www.odoo.com/ ](https://www.odoo.com/) 
- GitHub officiel:[ https://github.com/odoo/odoo.git ](https://github.com/odoo/odoo.git) 
- Docker Hub officiel :[ https://hub.docker.com/_/odoo ](https://hub.docker.com/_/odoo) 

**PgAdmin** quant à elle devra être utilisée pour administrer de façon graphique la base de données PostgreSQL crée précédemment. 

- Site officiel :[ https://www.pgadmin.org/ ](https://www.pgadmin.org/) 
- Docker Hub officiel:[ https://hub.docker.com/r/dpage/pgadmin4/ ](https://hub.docker.com/r/dpage/pgadmin4/) 

L'application web vitrine a été conçu par l’équipe de développeurs de l’entreprise et les fichiers y relatifs se trouvent dans [ce dépôt git](https://github.com/sadofrazer/ic-webapp.git). Il est de votre responsabilité de conteneuriser cette application tout en permettant la saisie des différentes URL des applications (Odoo et pgadmin) par le biais des variables d’environnement. 

Ci-dessous un aperçu du site vitrine attendu. 

![](images/site_vitrine.jpeg)

---
**NB :** L’image créée devra permettre de lancer un container permettant d’héberger ce site web et ayant les liens adéquats permettant d’accéder à nos applications internes 

---


## 1) Conteneurisation de l’application web (6 Points)

Il s’agit effet d’une application web python utilisant le module Flask. Les étapes à suivre pour la conteneurisation de cette application sont les suivantes : 

1) Image de base : `python:3.6-alpine`
2) Définir le répertoire `/opt` comme répertoire de travail 
3) Installer le module Flask version 1.1.2 à l’aide de `pip install flask==1.1.2`
4) Exposer le port `8080` qui est celui utilisé par défaut par l'application
5) Créer les variables d’environnement `ODOO_URL` et `PGADMIN_URL` afin de permettre la définition de ces url lors du lancement du container 
6) Lancer l’application `app.py` dans le `ENTRYPOINT` grâce à la commande `python`  

Une fois le Dockerfile crée, Buildez le et lancer un container test permettant d’aller sur les sites web officiels de chacune de ces applications (site web officiels fournis ci-dessus). 

**Nom de l’image :**  ic-webapp ;*  
**tag :** 1.0*  
**container test_name :** test-ic-webapp* 


## 2) Docker Registry (4 Points)
Il est question de sauvegarder votre image afin que vos collaborateurs puissent la réutiliser.

1. Mettez en place un registre privé avec [docker registry](https://docs.docker.com/registry/).

2. Vous pourrez rajouter une [interface web](https://hub.docker.com/r/joxit/docker-registry-ui/) à ce registre.

3. Une fois le test terminé, supprimez le container test et poussez votre image sur votre registre privé Docker, et aussi sur le registre [dockerhub](https://hub.docker.com/). 

## 3) docker-compose (6 Points)
A ce stade, vous avez mis à disposition une image de l'application sur vos registres. A date, quand on clic sur odoo ou pgadmin, on est redirigé sur les sites officiels. Il est question de modifier les urls afin qu'elles pointent plutôt sur un odoo et un pgadmin, tous deux déployés sur les serveurs de l'entreprise **IC-GROUP**. Nous allons donc devoir déployer odoo et pgadmin en local.

Proposer un fichier docker-compose.yml qui déploie les quatres services suivants : 

1. Une base de donnée [postgresql](https://hub.docker.com/_/postgres) pour l'application odoo.

2. L'application [odoo](https://hub.docker.com/_/odoo) qui stocke ses informations dans la base postgres

3. L'application [pgadmin](https://hub.docker.com/r/dpage/pgadmin4/) permettant de visualiser la base postgres dans une IHM.
4. L'application ic-webapp buildée précédemment, qui pointe sur le odoo et le pgadmin déployés localement.



 ## 4) Rapport final (4 Points)

Ci-dessous un exemple de description des qualifications souhaitées pour un poste de Devops 

![](images/offre_emploi.jpeg)

---
**N.B**: Bien vouloir preter attention aux qualités encadrées en jaune ci-dessus, afin de prendre conscience **que maîtriser les technologies ne suffit pas**. Il faut en plus de celà, avoir un esprit très créatif, de très bonnes capacités redactionnelles pour rediger vos différents rapports et également des qualités de pédagogue qui vous aideront à parfaire les explications de vos actions afin de faciliter leur compréhension. 

---

Compte tenu de tout cela, merci de **rédiger correctement** votre rapport, avec les captures d’écran, commentaires et explications qui vont bien car cette partie sera prise en compte dans votre note finale.

Le rapport attendu est **un repos git, contenant votre documentation en Markdown**.
Vous devrez renseigner la liste des membres de votre groupe dans ce rapport.

![good luck](https://64.media.tumblr.com/d7f11e1bf87f984433f3ed4422cb7a37/tumblr_inline_p3ubk7xbQs1qbolbn_500.gifv)