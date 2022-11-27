# Requisitos

1.  AWS CLI instalado
2.  Cuenta de AWS
3.  Terraform
4.  Make
5.  Docker y Docker Compose
6.  Imagen base Jenkins 

# En local

1.  Crear usuario en el IAM de AWS con permisos de administración.
2.  Descargar o anotar las claves secretas

Ejecutar  el comando:

```bash
aws configure
```
Ponemos los datos que nos solicita con la información previamente descargada (las claves secretas del usuario IAM)

las claves  se encontraran en la carpeta: `~/.aws/credentials`

Ejecutamos:

```bash

make all 

```

# Jenkins

Ingresamos a nuestro Jenkins y lo primero que haremos será instalar el siguiente listado de plugins:

- `Git`, `Job DSL`, `build timeout`,`Job DSL`, `Docker`, `SSH Agent Plugin`, `Folders`, `Pipeline: AWS Steps`, `Timestamper`, `Docker`, `pipeline: stage view` .

Añadimos las credenciales a través del menú de Jenkins
Manage Jenkins > Manage Credentials > System > add credential

Añadimos nuestra clave ssh, podemos obtenerla con el comando: `cat ~/.ssh/id_rsa`

Añadimos las 2 claves más que serán las secret key de nuestro usuario de AWS

# Configuración Docker images

Jenkins -> Manage Nodes -> Configure Clouds

En Docker Agent templates :
- Labels: base
- checkbox de Enabled
- Name: base
- Docker image: edgyss/base-jenkins-agent 
- Remote File System Root: /home/jenkins
- Connect Method: Connect with SSH
- SSH Key: jenkins/*****
- Host Key Verification Strategy: Non Verifying Verification Strategy
- Pull Strategy: Pull all images every time
 # 
- Labels: terraform
- checkbox de Enabled
- Name: terraform
- Docker image: edgyss/terraform-agent 

#

1. Creamos un proyecto
   
2.  En Build Steps en el select buscamos la opción que dice Process Job DSLs. Añadimos la información del archivo `job.dsl`
   
3.  clic en Build now
   
4.  Aprovamos la ejecución
  

# Github Actions 

Accedemos a Settings > Secrets > Actions > New Repository

Le ponemos el nombre que sea y añadimos el id de usuario de AWS. Añadimos otro para la contraseña del usuario de AWS.

En el apartado de Actions añadimos el Terraform para que nos genere el archivo yaml para la configuración.







