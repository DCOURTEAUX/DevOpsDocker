# DevOpsDocker

# Projet Docker

- Antoine BLANCHET
- Stéphane LAM
- Martin THOMAS
- Damien COURTEAUX


# 1/ Conteneurisation de l'application web

### Construction du Dockerfile pas à pas : 

1) Image de **départ**
>FROM python:3.6-alpine

2) Définition du **répertoire de travail** et de **son volume** :
>WORKDIR /opt
>ADD . /opt/

3) Installation de **Flask** :
>RUN pip install flask==1.1.2

4) Exposer le **port 8080** :
>EXPOSE 8080

5) Création des **deux variables d'environnement**
>ENV odoo_url="https://www.odoo.com/"
>ENV pgadmin_url="https://www.pgadmin.org/"

6) Création de l'**ENTRYPOINT** : 
>ENTRYPOINT ["python"]
>CMD ["app.py"]

- ### Build du Dockerfile créé avec nano : 

![](https://lh3.googleusercontent.com/UHZLJiAkVT9MGfPMDVsyXQpbfx5PBn2shMiTdVcX7ubFgTV07Y2_do5-QLZhvZk3bEsxIOPZ1DBIIaZGOiYn4JWUgj3Lnc6DFWhvLB1lCKX7vUYtD5oE8Tsvlz1EZ9DqtxS6XDrHaYIgULPE5R3TKE1Gc4npdVeAky98bN8yav31Sm7WcHdUIaHWyL-crg)

- ### Créer un conteneur puis se connecter avec le bon port :

![](https://lh4.googleusercontent.com/bJM7OIBjlwOjffHxqmH3icsUHJujpJjUx48BgSImJ7D7leb8R9NI5WvdPSi4DYI0q5SYdfFHVMIu5oxXWkARqwbXaHK0ob1kygPxblJATYpxCKl8IOfe7iVZleNgN8OE3Q6-AwmyhBKaeHj7SrP3wyQp1dVnNke_kCw4SfG9CvyhlZXWr53FlNqIRtcW_Q)

# 2/ Docker Registry

## 1. Récupération de l'image registry version 2
![](https://lh6.googleusercontent.com/9ku_G1Nd2h8iAXRlBQeSGqBqhaoxdTuD7DwT-sh-5VIeKoLyZBZMIb9eO1axnxiLvmT_Twp7uYFrSOy5NmxRlfyRMRtajrYfB7agTOFycxT-wvU7H8cavNC2NsIyGNJCdCvZAYgpvkOhbcGSJ8pFuhHfGwaSPrZLVfGPVu13hxTnAcoX7uVdYzexVwF2aA)

- ### Tag de l'image vers le registre :
>docker image tag ic-webapp:1.0 localhost:5000/projet

- ### Push de notre image :
>docker push localhost:5000/projet

- ### Récupération de l'image pour vérification :

![](https://lh6.googleusercontent.com/GF6lRUVmVCJcjGvHMfoxGePfITJc7W03jI0gL2wYZ35PrHVa6SQVX3r2EVLpGSqhQLRKRH6ecp4ycpNPQ7IhzVZW8HCs_J9PwZaWYRcP6MvbZh0dEm4Alr9EI3vb4dnCXhvkRgrnRy_l7Fxsrc8CuDu_9AFd2Ojo-gyXmAuH-2yqAHHE5vZ0i2pLUoJ9Fg)

- ### Suppression des containers et image registry :
>docker container stop registry && docker container rm -v registry

## 2. Récupération de l'image et création d'un conteneur docker registry, connexion avec le bon port

![](https://lh5.googleusercontent.com/qmUIILVtRfksu2ABWnZy1L5zPS-hHaoGbIeAzWZdcqu1Wik5pSdfdHywV0n0A3e42nyydjLIKLWGFtsNqHjPtCNPtHtldraLcQ7XD4IwBVVgpyNg_8eS42FDe_RsCnL1DPs7f4Z_8nTKqwaYkPhLUGAsVk0CvZbNjMArNo6s_7vvCHxMmU6RdtHFnKaJFg)

## 3. Push de notre image sur Docker 

![](https://lh3.googleusercontent.com/nYvKRzj_9_jv5CiAO6tIdvjcDyBjYA08zbTCpNilcTg4MgdvUUJtvQhMr-w6jqE4ttqJ7sL7mRzlYmVNHPDMRZEl4CQInGBGZH-6QlKcA6yYqUFcw_VlnnlT4Gf6dR3Cvyh8ivlWUaMJP5qQnBVvu8YaF3JOc1kFT9HS3ibpCn_uQKKViOJb8FFUUN6IuA)


- Sur **dockerhub** :

![](https://lh4.googleusercontent.com/8s7eGt11ZL12VSqAHkMFaLOi1VNrWfTaRitb6PoAgi4Oh1zzcAObYsElQc6J3YiZ-wQvhdoaFVG7bRZ-BHvggGiRz1PVNSFuiaCA4IF6sKjOe_CcxVqzHRNEUehnAEdDvHEN8RXKFvH87irRCrA18L_i_MJuCa-GPhR1pRGoHKMLOXZ5NtLZpXerZOAeoA)


# 3) Docker compose
### Les lignes de commandes :

**![](https://lh4.googleusercontent.com/YSUVJpTrsoQRlTcytUyvPcYNiz8FXp_TEPFLHE36lXXuLLVxrJa5prL4PvYUMXlkLHALX1RVzV-CGLyeCeRxe5Y1lIAqO7R1kFnJcA7EkJ16sfqfV89xmpyHOqFPcWb98Ub_nDmOk475_BwMA1gVoX1eFGnfQtTU4DH4oW95g7p5fBEQRcBbwV2tvAgFRA)**
**![](https://lh5.googleusercontent.com/8GsIn39hdR6yKp197EQu3aqINSoa3VPU3cAJ_SBHO1DAsRB0e35K4fRes0T0JGz8IRuq5JeniT76EgmMArXmMJldWTZa12VKgXoWr2mYy8d0Efo7LppWeczZi9Z9lflwy-aW5tmevGVYlC67g9piOLiqXHyqoSpqV2avt27Q4_byD7peGUDtDio8Z23InQ)**
### Qui donneront ça :
**![](https://lh5.googleusercontent.com/HQPspZcqe_TyVfH9DZUn-fyWjAmlyDoRMq1v0sazvZTtX85_fvsPflZON3UpzEDOcQ0RDZ66UZyUl3sHq7gofmMEnCEd8iYNT6ZuZLiom2Wmm6ZV9na3LAhDS8cVhJKE1Mrk3IpCLg2Cm44DUqIhG6wnhZnZSoNeKzBksrm_O0CeFDxliQapN9761lef9w)**


# Merci
