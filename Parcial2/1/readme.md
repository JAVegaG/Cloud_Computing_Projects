# Implementación de cluster Kubernetes en Azure

En el portal de Azure se debe acceder a la opción de **crear un recurso**, posterior a esto se selecciona **crear** en la sección de **_Kubernetes Service_** y se sigue el Wizard de creación del cluster para configurarlo de acuerdo con nuestras necesidades. Una vez listo, se selecciona **Revisar y  crear** para validar que las configuraciones sean adecuadas y en ese caso, se procede a crear el recurso.

El proceso de crear el recurso toma un tiempo y una vez termina, el paso siguiente es conectarse a él, un ejemplo de cómo realizar esto se lleva a cabo al ejecutar los siguientes pasos:

- Abrir Cloud Shell o la CLI de Azure
- Ejecutar lo siguientes comandos:
  - az account set --subscription 4010fd84-b28e-4b54-a768-a362607fc8c6
  - az aks get-credentials --resource-group Parcial_group --name Parcial2
