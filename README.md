# madeo01act3_aws - Despliegue de una aplicación mediante  AWS

## Resumen

**Terraform - Infraestructura como Codigo**

En este DEMO se planea demostrar el uso de Terraform para desplegar una Instancia de EC2 en la nube de AWS y una aplicacion Web por medio de codigo de manera automatizada para la Materia de Computación en la Nube y Cultura DevOps. UNIR.

## Como usar

### Pre-requisitos
* Clonar este repositorio localmente
* Tener una cuenta de AWS
* Asegurate de tus credenciales de acceso programatico estan previamente configuradas con `aws configure`, [puedes seguir la documentacion oficial](https://docs.aws.amazon.com/cli/v1/userguide/cli-authentication-user.html)
* Asegurate de que tienes instalado terraform en tu equipo, [puedes seguir la documentacion oficial](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
* Actualiza `providers.tf` linea`3` con la informacion de tus credenciales de AWS
* Ejecuta los siguientes comandos

```bash
terraform init
terraform validate
terraform apply --auto-approve
```

## Comenzando
**Ejemplo**

```terraform
resource "aws_instance" "madeo01act3" {
  ami                         = data.aws_ami.amazon.id
  instance_type               = var.instance_type
  user_data                   = file("post-configuration.sh")
  subnet_id                   = local.public1_subnet_id
  vpc_security_group_ids      = [aws_security_group.madeo01act3_sg.id]
  associate_public_ip_address = true

  root_block_device {
    delete_on_termination = true

  }

  tags = {
    terraform = true
  }

}
```

**Salidas tras la Ejecucion**
| Nombre | Descripcion |
|------|-------------|
| ec2_public_dns | DNS publico de la instancia de EC2 desplegada |
| ec2_public_ip | Direccion IP publica de la instancia de EC2 desplegada |

### Notable
* Nada notable que mencionar ahora

## Contribuidores al Proyecto
| Nombre | Email |
|------|-------|
| Juan Carlos Perez Hernandez | jc.przhdz@gmail.com |
| Fernando Hernandez | fernandoh05@outlook.com |
| Eduardo José Gil Apastillar | eduardojgila@gmail.com |

# Registro de Cambios
***
### Version 1.0.0
***Se Agregaron***
* Se agrego el codigo terraform para crear la red
* Se agrego el codigo terraform para crear el security group
* Se agrego el bash script para hacer la post-configuracion
* Se agrego el README