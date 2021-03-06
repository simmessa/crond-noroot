# CROND NON ROOT ALPINE - DOCKER IMAGE

[![N|Solid](https://cldup.com/dTxpPi9lDf.thumb.png)](https://nodesource.com/products/nsolid)

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)


## Detalles

- Non root container
- Openshift ready!
- Configmap para el seteo de cron
- Notificaciones por email


### Ejemplo de archivo tasks

```bash
SHELL=/bin/bash
###SEND EMAIL AFTER EXECUTION true | false
EMAIL_NOTIFICACION=true
* * * * * 1001 sleep 5 && id >> /tmp/test-1
```
#####  El archivo task utiliza la syntaxis del cron de linux :

 ```bash
SHELL=/bin/bash
dia(*) hora(*) dia_del_mes(*) mes(*) dia_semana(*) usuario(crond) commando(sleep 5 && id >> /tmp/test-1)
```


## Iniciar servicios

```bash

oc create -f crond-noroot-template-openshift.yaml

```


## Notificaciones por email

Para activar el envio de notificaciones por email del resultado de las ejecuciones edite el configmap task y descomente las lineas en config.ini.

```bash

oc edit configmap tasks

```


```bash

Mailuser="mail@mail.com"
Mailpassword="password"
Mailhost="host.com.uy"
Mailport=25
Maildestinos="mail@mail.com"
Ambiente="TEST"

```







## License
Martin Fabrizzio Vilche
