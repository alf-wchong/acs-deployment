# alfresco-content-services

![Version: 5.4.0-SNAPSHOT](https://img.shields.io/badge/Version-5.4.0--SNAPSHOT-informational?style=flat-square)

A Helm chart for deploying Alfresco Content Services

Please refer to the [documentation](https://github.com/Alfresco/acs-deployment/blob/master/docs/helm/README.md) for information on the Helm charts and deployment instructions.

**Homepage:** <https://www.alfresco.com>

## Source Code

* <https://github.com/Alfresco/acs-deployment>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
|  | activemq | 2.1.0 |
|  | alfresco-elasticsearch-connector | 0.1.0 |
|  | alfresco-search | 1.0.4 |
|  | alfresco-sync-service | 3.0.9 |
| https://activiti.github.io/activiti-cloud-helm-charts | alfresco-admin-app(common) | 7.6.0 |
| https://activiti.github.io/activiti-cloud-helm-charts | alfresco-digital-workspace(common) | 7.6.0 |
| https://helm.elastic.co | elasticsearch(elasticsearch) | 7.10.1 |
| https://kubernetes-charts.alfresco.com/incubator | alfresco-common | 0.2.0-SNAPSHOT |
| https://raw.githubusercontent.com/bitnami/charts/archive-full-index/bitnami/ | postgresql | 10.16.2 |
| https://raw.githubusercontent.com/bitnami/charts/archive-full-index/bitnami/ | postgresql-syncservice(postgresql) | 10.16.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| activemq.enabled | bool | `true` |  |
| activemq.nodeSelector | object | `{}` | Possibility to choose Node for pod, key-value pair label of a desired node e.g {"kubernetes.io/hostname": multinode-demo-m02} |
| aiTransformer.environment.JAVA_OPTS | string | `" -XX:MinRAMPercentage=50 -XX:MaxRAMPercentage=80"` |  |
| aiTransformer.image.internalPort | int | `8090` |  |
| aiTransformer.image.pullPolicy | string | `"IfNotPresent"` |  |
| aiTransformer.image.repository | string | `"quay.io/alfresco/alfresco-ai-docker-engine"` |  |
| aiTransformer.image.tag | string | `"1.4.5"` |  |
| aiTransformer.livenessProbe.initialDelaySeconds | int | `10` |  |
| aiTransformer.livenessProbe.livenessPercent | int | `400` |  |
| aiTransformer.livenessProbe.livenessTransformPeriodSeconds | int | `600` |  |
| aiTransformer.livenessProbe.maxTransformSeconds | int | `1800` |  |
| aiTransformer.livenessProbe.maxTransforms | int | `10000` |  |
| aiTransformer.livenessProbe.periodSeconds | int | `20` |  |
| aiTransformer.livenessProbe.timeoutSeconds | int | `10` |  |
| aiTransformer.nodeSelector | object | `{}` |  |
| aiTransformer.readinessProbe.initialDelaySeconds | int | `20` |  |
| aiTransformer.readinessProbe.periodSeconds | int | `60` |  |
| aiTransformer.readinessProbe.timeoutSeconds | int | `10` |  |
| aiTransformer.replicaCount | int | `2` |  |
| aiTransformer.resources.limits.memory | string | `"1000Mi"` |  |
| aiTransformer.resources.requests.memory | string | `"1000Mi"` |  |
| aiTransformer.service.externalPort | int | `80` |  |
| aiTransformer.service.name | string | `"ai-transformer"` |  |
| aiTransformer.service.type | string | `"ClusterIP"` |  |
| alfresco-admin-app.enabled | bool | `true` |  |
| alfresco-admin-app.env.API_URL | string | `"{protocol}//{hostname}{:port}"` |  |
| alfresco-admin-app.env.APP_CONFIG_AUTH_TYPE | string | `"BASIC"` |  |
| alfresco-admin-app.env.APP_CONFIG_PROVIDER | string | `"ECM"` |  |
| alfresco-admin-app.image.pullPolicy | string | `"IfNotPresent"` |  |
| alfresco-admin-app.image.repository | string | `"quay.io/alfresco/alfresco-admin-app"` |  |
| alfresco-admin-app.image.tag | string | `"7.6.0"` |  |
| alfresco-admin-app.ingress.annotations."kubernetes.io/ingress.class" | string | `"nginx"` |  |
| alfresco-admin-app.ingress.path | string | `"/control-center"` |  |
| alfresco-admin-app.ingress.tls | list | `[]` |  |
| alfresco-admin-app.nameOverride | string | `"alfresco-cc"` |  |
| alfresco-admin-app.nodeSelector | object | `{}` |  |
| alfresco-admin-app.resources.limits.cpu | int | `1` |  |
| alfresco-admin-app.resources.limits.memory | string | `"1024Mi"` |  |
| alfresco-admin-app.resources.requests.cpu | string | `"150m"` |  |
| alfresco-admin-app.resources.requests.memory | string | `"256Mi"` |  |
| alfresco-admin-app.service.envType | string | `"frontend"` |  |
| alfresco-digital-workspace.enabled | bool | `true` |  |
| alfresco-digital-workspace.env.API_URL | string | `"{protocol}//{hostname}{:port}"` |  |
| alfresco-digital-workspace.env.APP_CONFIG_AUTH_TYPE | string | `"BASIC"` |  |
| alfresco-digital-workspace.extraEnv | string | `"{{- if .Values.global.ai.enabled }}\n- name: APP_CONFIG_PLUGIN_AI_SERVICE\n  value: '{{ .Values.global.ai.enabled }}'\n{{- end }}"` |  |
| alfresco-digital-workspace.image.pullPolicy | string | `"IfNotPresent"` |  |
| alfresco-digital-workspace.image.repository | string | `"quay.io/alfresco/alfresco-digital-workspace"` |  |
| alfresco-digital-workspace.image.tag | string | `"3.1.0"` |  |
| alfresco-digital-workspace.ingress.annotations."kubernetes.io/ingress.class" | string | `"nginx"` |  |
| alfresco-digital-workspace.ingress.annotations."nginx.ingress.kubernetes.io/proxy-body-size" | string | `"5g"` |  |
| alfresco-digital-workspace.ingress.path | string | `"/workspace"` |  |
| alfresco-digital-workspace.ingress.tls | list | `[]` |  |
| alfresco-digital-workspace.nameOverride | string | `"alfresco-dw"` |  |
| alfresco-digital-workspace.nodeSelector | object | `{}` |  |
| alfresco-digital-workspace.resources.limits.cpu | int | `1` |  |
| alfresco-digital-workspace.resources.limits.memory | string | `"1024Mi"` |  |
| alfresco-digital-workspace.resources.requests.cpu | string | `"150m"` |  |
| alfresco-digital-workspace.resources.requests.memory | string | `"256Mi"` |  |
| alfresco-digital-workspace.service.envType | string | `"frontend"` |  |
| alfresco-elasticsearch-connector.elasticsearch | object | `{"host":null,"password":null,"port":null,"protocol":null,"user":null}` | Overrides .Values.global.elasticsearch |
| alfresco-elasticsearch-connector.enabled | bool | `false` |  |
| alfresco-elasticsearch-connector.messageBroker.existingSecretName | string | `nil` |  |
| alfresco-elasticsearch-connector.messageBroker.password | string | `nil` |  |
| alfresco-elasticsearch-connector.messageBroker.url | string | `nil` |  |
| alfresco-elasticsearch-connector.messageBroker.user | string | `nil` |  |
| alfresco-elasticsearch-connector.reindexing.enabled | bool | `true` |  |
| alfresco-elasticsearch-connector.reindexing.postgresql.database | string | `"alfresco"` |  |
| alfresco-elasticsearch-connector.reindexing.postgresql.hostname | string | `"postgresql-acs"` |  |
| alfresco-elasticsearch-connector.reindexing.postgresql.url | string | `nil` |  |
| alfresco-search.alfresco-insight-zeppelin.insightzeppelin.enabled | bool | `false` |  |
| alfresco-search.alfresco-insight-zeppelin.repository.host | string | `"alfresco-cs"` |  |
| alfresco-search.alfresco-insight-zeppelin.repository.port | int | `80` |  |
| alfresco-search.enabled | bool | `true` |  |
| alfresco-search.external.host | string | `nil` | Host dns/ip of the external solr6 instance. |
| alfresco-search.external.port | string | `nil` | Port of the external solr6 instance. |
| alfresco-search.ingress.basicAuth | string | `nil` | Default solr basic auth user/password: admin / admin You can create your own with htpasswd utilility & encode it with base64. Example: `echo -n "$(htpasswd -nbm admin admin)" | base64 | tr -d '\n'` # i.e. admin / admin basicAuth: YWRtaW46JGFwcjEkVVJqb29uS00kSEMuS1EwVkRScFpwSHB2a3JwTDd1Lg== |
| alfresco-search.ingress.enabled | bool | `false` | Alfresco Search services endpoint ('/solr') is disabled by default To enable it please see: acs-deployment configuration table](https://github.com/Alfresco/acs-deployment/tree/master/helm/alfresco-content-services#configuration) |
| alfresco-search.ingress.tls | list | `[]` |  |
| alfresco-search.nodeSelector | object | `{}` |  |
| alfresco-search.repository.host | string | `"alfresco-cs"` |  |
| alfresco-search.repository.port | int | `80` |  |
| alfresco-search.searchServicesImage.pullPolicy | string | `"IfNotPresent"` |  |
| alfresco-search.searchServicesImage.tag | string | `"2.0.5"` |  |
| alfresco-search.type | string | `"search-services"` |  |
| alfresco-sync-service.image.repository | string | `"quay.io/alfresco/service-sync"` |  |
| alfresco-sync-service.image.tag | string | `"3.8.0"` |  |
| alfresco-sync-service.messageBroker.existingSecretName | string | `nil` |  |
| alfresco-sync-service.messageBroker.password | string | `nil` |  |
| alfresco-sync-service.messageBroker.url | string | `nil` |  |
| alfresco-sync-service.messageBroker.user | string | `nil` |  |
| alfresco-sync-service.nodeSelector | object | `{}` |  |
| alfresco-sync-service.syncservice.enabled | bool | `true` |  |
| apiexplorer | object | `{"ingress":{"path":"/api-explorer"}}` | Declares the api-explorer service used by the content repository |
| database | object | `{"driver":null,"external":false,"password":null,"url":null,"user":null}` | Defines properties required by alfresco for connecting to the database Note! : If you set database.external to true you will have to setup the driver, user, password and JdbcUrl Also make sure that the container has the db driver in /usr/local/tomcat/lib since the current image only has the postgresql driver |
| database.driver | string | `nil` | ex: org.postgresql.Driver |
| database.password | string | `nil` | ex: alfresco |
| database.url | string | `nil` | ex: jdbc:postgresql://oldfashioned-mule-postgresql-acs:5432/alfresco |
| database.user | string | `nil` | ex: alfresco |
| elasticsearch | object | `{"clusterHealthCheckParams":"wait_for_status=yellow&timeout=1s","enabled":false,"image":"docker.elastic.co/elasticsearch/elasticsearch-oss","replicas":1}` | Embedded ElasticSearch cluster powered by Bitnami charts |
| elasticsearch.enabled | bool | `false` | Enable the embedded ElasticSearch cluster |
| email | object | `{"handler":{"folder":{"overwriteDuplicates":true}},"inbound":{"emailContributorsAuthority":"EMAIL_CONTRIBUTORS","enabled":false,"unknownUser":"anonymous"},"initContainers":{"pemToKeystore":{"image":{"pullPolicy":"IfNotPresent","repository":"registry.access.redhat.com/redhat-sso-7/sso71-openshift","tag":"1.1-16"}},"pemToTruststore":{"image":{"pullPolicy":"IfNotPresent","repository":"registry.access.redhat.com/redhat-sso-7/sso71-openshift","tag":"1.1-16"}},"setPerms":{"image":{"pullPolicy":"IfNotPresent","repository":"busybox","tag":"1.35.0"}}},"server":{"allowed":{"senders":".*"},"auth":{"enabled":true},"blocked":{"senders":null},"connections":{"max":3},"domain":null,"enableTLS":true,"enabled":false,"hideTLS":false,"port":1125,"requireTLS":false},"ssl":{"secretName":null}}` | For a full information of properties on the email configuration, please view: https://docs.alfresco.com/6.2/concepts/email.html |
| email.server.enabled | bool | `false` | Enables the email server - see https://docs.alfresco.com/6.2/concepts/email-inboundsmtp-props.html |
| filestore | object | `{"environment":{"JAVA_OPTS":" -XX:MinRAMPercentage=50 -XX:MaxRAMPercentage=80","scheduler.cleanup.interval":"86400000","scheduler.content.age.millis":"86400000"},"image":{"internalPort":8099,"pullPolicy":"IfNotPresent","repository":"quay.io/alfresco/alfresco-shared-file-store","tag":"2.0.0"},"initContainer":{"image":{"pullPolicy":"IfNotPresent","repository":"busybox","tag":"1.35.0"},"resources":{"limits":{"memory":"10Mi"},"requests":{"memory":"5Mi"}}},"livenessProbe":{"initialDelaySeconds":10,"livenessPercent":150,"livenessSavePeriodSeconds":600,"periodSeconds":20,"timeoutSeconds":10},"nodeSelector":{},"persistence":{"accessModes":["ReadWriteOnce"],"data":{"mountPath":"/tmp/Alfresco","subPath":"alfresco-content-services/filestore-data"},"enabled":true,"existingClaim":null,"storageClass":null},"readinessProbe":{"initialDelaySeconds":20,"periodSeconds":60,"timeoutSeconds":10},"replicaCount":1,"resources":{"limits":{"memory":"1000Mi"},"requests":{"memory":"1000Mi"}},"service":{"externalPort":80,"name":"filestore","type":"ClusterIP"}}` | Declares the alfresco-shared-file-store used by the content repository and transform service |
| filestore.persistence.accessModes | list | `["ReadWriteOnce"]` | Specify a storageClass for dynamic provisioning |
| filestore.persistence.enabled | bool | `true` | Persist filestore data |
| filestore.persistence.existingClaim | string | `nil` | Use pre-provisioned pv through its claim (e.g. static provisionning) |
| filestore.persistence.storageClass | string | `nil` | Bind PVC based on storageClass (e.g. dynamic provisionning) |
| global.ai | object | `{"enabled":false}` | Choose if you want AI capabilities (globally - including ADW AI plugin) |
| global.alfrescoRegistryPullSecrets | string | `nil` |  |
| global.elasticsearch | object | `{"host":"elasticsearch-master","password":null,"port":9200,"protocol":"http","user":null}` | Shared connections details for Elasticsearch/Opensearch, required when alfresco-elasticsearch-connector.enabled is true |
| global.elasticsearch.host | string | `"elasticsearch-master"` | The host where service is available. The provided default is for when elasticsearch.enabled is true |
| global.elasticsearch.password | string | `nil` | The password required to access the service, if any |
| global.elasticsearch.port | int | `9200` | The port where service is available |
| global.elasticsearch.protocol | string | `"http"` | Valid values are http or https |
| global.elasticsearch.user | string | `nil` | The username required to access the service, if any |
| global.registryPullSecrets[0] | string | `"quay-registry-secret"` |  |
| global.strategy.rollingUpdate.maxSurge | int | `1` |  |
| global.strategy.rollingUpdate.maxUnavailable | int | `0` |  |
| global.tracking.auth | string | `"secret"` | Select how solr and repo authenticate to each other none: work only prior to acs 7.2 (and was the default) secret: use a shared secret (to specify using `tracking.sharedsecret`) https: to use mTLS auth (require appropriate certificate configuration) |
| global.tracking.sharedsecret | string | `nil` | Shared secret to authenticate repo/solr traffic. Strong enough secret can be generated with `openssl rand 20 -base64` |
| imagemagick | object | `{"environment":{"JAVA_OPTS":" -XX:MinRAMPercentage=50 -XX:MaxRAMPercentage=80"},"image":{"internalPort":8090,"pullPolicy":"IfNotPresent","repository":"alfresco/alfresco-imagemagick","tag":"3.0.0"},"livenessProbe":{"initialDelaySeconds":10,"livenessPercent":150,"livenessTransformPeriodSeconds":600,"maxTransformSeconds":900,"maxTransforms":10000,"periodSeconds":20,"timeoutSeconds":10},"nodeSelector":{},"readinessProbe":{"initialDelaySeconds":20,"periodSeconds":60,"timeoutSeconds":10},"replicaCount":2,"resources":{"limits":{"memory":"1000Mi"},"requests":{"memory":"1000Mi"}},"service":{"externalPort":80,"name":"imagemagick","type":"ClusterIP"}}` | Declares the alfresco-imagemagick service used by the content repository to transform image files |
| imap.mail.from.default | string | `nil` |  |
| imap.mail.to.default | string | `nil` |  |
| imap.server | object | `{"enabled":false,"host":"0.0.0.0","imap":{"enabled":true},"imaps":{"enabled":true,"port":1144},"port":1143}` | Replace this value with the IP address (or corresponding DNS name) of your external IP interface - see https://docs.alfresco.com/6.2/tasks/imap-enable.html |
| libreoffice | object | `{"environment":{"JAVA_OPTS":" -XX:MinRAMPercentage=50 -XX:MaxRAMPercentage=80"},"image":{"internalPort":8090,"pullPolicy":"IfNotPresent","repository":"alfresco/alfresco-libreoffice","tag":"3.0.0"},"livenessProbe":{"initialDelaySeconds":10,"livenessPercent":250,"livenessTransformPeriodSeconds":600,"maxTransformSeconds":1800,"maxTransforms":99999,"periodSeconds":20,"timeoutSeconds":10},"nodeSelector":{},"readinessProbe":{"initialDelaySeconds":20,"periodSeconds":60,"timeoutSeconds":10},"replicaCount":2,"resources":{"limits":{"memory":"1000Mi"},"requests":{"memory":"1000Mi"}},"service":{"externalPort":80,"name":"libreoffice","type":"ClusterIP"}}` | Declares the alfresco-libreoffice service used by the content repository to transform office files |
| mail.encoding | string | `"UTF-8"` |  |
| mail.from.default | string | `nil` |  |
| mail.from.enabled | bool | `false` |  |
| mail.host | string | `nil` | Specifies the host name of the SMTP host, that is, the host name or IP address of the server to which email should be sent - see https://docs.alfresco.com/6.2/concepts/email-outboundsmtp-props.html |
| mail.password | string | `nil` |  |
| mail.port | string | `nil` |  |
| mail.protocol | string | `"smtps"` |  |
| mail.smtp.auth | bool | `true` |  |
| mail.smtp.debug | bool | `false` |  |
| mail.smtp.starttls.enable | bool | `true` |  |
| mail.smtp.timeout | int | `30000` |  |
| mail.smtps.auth | bool | `true` |  |
| mail.smtps.starttls.enable | bool | `true` |  |
| mail.username | string | `nil` |  |
| messageBroker | object | `{"existingSecretName":null,"password":null,"url":null,"user":null}` | external activemq connection setting when activemq.enabled=false |
| metadataKeystore.defaultKeyPassword | string | `"oKIWzVdEdA"` |  |
| metadataKeystore.defaultKeystorePassword | string | `"mp6yc0UD9e"` |  |
| msTeams | object | `{"enabled":false}` | Choose if you want Microsoft Teams Integration capabilities (Alfresco Content Connector for Microsoft Teams) |
| msTeamsService.alfresco.baseUrl | string | `"change_me_alf_base_url"` |  |
| msTeamsService.alfresco.digitalWorkspace.contextPath | string | `"/workspace/"` |  |
| msTeamsService.image.internalPort | int | `3978` |  |
| msTeamsService.image.pullPolicy | string | `"IfNotPresent"` |  |
| msTeamsService.image.repository | string | `"quay.io/alfresco/alfresco-ms-teams-service"` |  |
| msTeamsService.image.tag | string | `"1.1.0"` |  |
| msTeamsService.ingress.path | string | `"/ms-teams-service"` |  |
| msTeamsService.ingress.tls | list | `[]` |  |
| msTeamsService.livenessProbe.initialDelaySeconds | int | `10` |  |
| msTeamsService.livenessProbe.periodSeconds | int | `20` |  |
| msTeamsService.livenessProbe.timeoutSeconds | int | `10` |  |
| msTeamsService.microsoft.app.id | string | `"change_me_app_id"` |  |
| msTeamsService.microsoft.app.oauth.connectionName | string | `"alfresco"` |  |
| msTeamsService.microsoft.app.password | string | `"change_me_app_pwd"` |  |
| msTeamsService.nodeSelector | object | `{}` |  |
| msTeamsService.readinessProbe.initialDelaySeconds | int | `20` |  |
| msTeamsService.readinessProbe.periodSeconds | int | `60` |  |
| msTeamsService.readinessProbe.timeoutSeconds | int | `10` |  |
| msTeamsService.replicaCount | int | `2` |  |
| msTeamsService.resources.limits.memory | string | `"1000Mi"` |  |
| msTeamsService.resources.requests.memory | string | `"1000Mi"` |  |
| msTeamsService.service.externalPort | int | `80` |  |
| msTeamsService.service.name | string | `"ms-teams-service"` |  |
| msTeamsService.service.type | string | `"ClusterIP"` |  |
| msTeamsService.teams.chat.filenameEnabled | bool | `true` |  |
| msTeamsService.teams.chat.imageEnabled | bool | `true` |  |
| msTeamsService.teams.chat.metadataEnabled | bool | `true` |  |
| ooi | object | `{"enabled":false}` | Choose if you want Office Online Integration capabilities (Alfresco Collaboration Connector for Microsoft 365) |
| ooiService.environment.JAVA_OPTS | string | `" -Dalfresco.base-url=http://acs-alfresco-cs-repository:80"` |  |
| ooiService.image.internalPort | int | `9095` |  |
| ooiService.image.pullPolicy | string | `"IfNotPresent"` |  |
| ooiService.image.repository | string | `"quay.io/alfresco/alfresco-ooi-service"` |  |
| ooiService.image.tag | string | `"1.1.3"` |  |
| ooiService.ingress.path | string | `"/ooi-service"` |  |
| ooiService.ingress.tls | list | `[]` |  |
| ooiService.livenessProbe.initialDelaySeconds | int | `10` |  |
| ooiService.livenessProbe.periodSeconds | int | `20` |  |
| ooiService.livenessProbe.timeoutSeconds | int | `10` |  |
| ooiService.nodeSelector | object | `{}` |  |
| ooiService.readinessProbe.initialDelaySeconds | int | `20` |  |
| ooiService.readinessProbe.periodSeconds | int | `60` |  |
| ooiService.readinessProbe.timeoutSeconds | int | `10` |  |
| ooiService.replicaCount | int | `2` |  |
| ooiService.resources.limits.memory | string | `"1000Mi"` |  |
| ooiService.resources.requests.memory | string | `"1000Mi"` |  |
| ooiService.service.externalPort | int | `80` |  |
| ooiService.service.name | string | `"ooi-service"` |  |
| ooiService.service.type | string | `"ClusterIP"` |  |
| pdfrenderer | object | `{"environment":{"JAVA_OPTS":" -XX:MinRAMPercentage=50 -XX:MaxRAMPercentage=80"},"image":{"internalPort":8090,"pullPolicy":"IfNotPresent","repository":"alfresco/alfresco-pdf-renderer","tag":"3.0.0"},"livenessProbe":{"initialDelaySeconds":10,"livenessPercent":150,"livenessTransformPeriodSeconds":600,"maxTransformSeconds":1200,"maxTransforms":10000,"periodSeconds":20,"timeoutSeconds":10},"nodeSelector":{},"readinessProbe":{"initialDelaySeconds":20,"periodSeconds":60,"timeoutSeconds":10},"replicaCount":2,"resources":{"limits":{"memory":"1000Mi"},"requests":{"memory":"1000Mi"}},"service":{"externalPort":80,"name":"pdfrenderer","type":"ClusterIP"}}` | Declares the alfresco-pdf-renderer service used by the content repository to transform pdf files |
| persistence | object | `{"baseSize":"20Gi","enabled":true,"existingClaim":"alfresco-volume-claim","repository":{"config":{"querysetsMountPath":"/usr/local/tomcat/shared/classes/alfresco/extension/querysets/","transform":{"mimetypesMountPath":"/usr/local/tomcat/shared/classes/alfresco/extension/mimetypes/","pipelinesMountPath":"/usr/local/tomcat/shared/classes/alfresco/extension/transform/pipelines/","renditionsMountPath":"/usr/local/tomcat/shared/classes/alfresco/extension/transform/renditions/"}},"data":{"mountPath":"/usr/local/tomcat/alf_data","subPath":"alfresco-content-services/repository-data"},"enabled":true},"storageClass":{"accessModes":["ReadWriteMany"],"enabled":false,"name":"nfs"}}` | Defines the mounting points for the persistence required by the apps in the cluster the alf_data folder from alfresco-content-repository app is mapped to alfresco-content-services/repository-data |
| persistence.storageClass | object | `{"accessModes":["ReadWriteMany"],"enabled":false,"name":"nfs"}` | Enable and define if you already have a custom storage class defined |
| persistence.storageClass.name | string | `"nfs"` | Custom storage class name |
| postgresql | object | `{"commonAnnotations":{"application":"alfresco-content-services"},"enabled":true,"image":{"pullPolicy":"IfNotPresent","tag":"14.4.0"},"nameOverride":"postgresql-acs","persistence":{"existingClaim":null,"storageClass":null,"subPath":"alfresco-content-services/database-data"},"postgresqlDatabase":"alfresco","postgresqlExtendedConf":{"log_min_messages":"LOG","max_connections":300},"postgresqlPassword":"alfresco","postgresqlUsername":"alfresco","primary":{"nodeSelector":{}},"replicaCount":1,"resources":{"limits":{"memory":"1500Mi"},"requests":{"memory":"1500Mi"}}}` | Defines the properties to be used for the required postgres DB Note: the database (tables) information is also saved in the persistent volume claim |
| postgresql-syncservice.commonAnnotations.application | string | `"alfresco-content-services"` |  |
| postgresql-syncservice.enabled | bool | `true` |  |
| postgresql-syncservice.image.pullPolicy | string | `"IfNotPresent"` |  |
| postgresql-syncservice.image.tag | string | `"14.4.0"` |  |
| postgresql-syncservice.name | string | `"postgresql-syncservice"` | If true, install the postgresql chart alongside Alfresco Sync service. Note: Set this to false if you use an external database. |
| postgresql-syncservice.nameOverride | string | `"postgresql-syncservice"` |  |
| postgresql-syncservice.postgresqlDatabase | string | `"syncservice-postgresql"` |  |
| postgresql-syncservice.postgresqlExtendedConf.log_min_messages | string | `"LOG"` |  |
| postgresql-syncservice.postgresqlExtendedConf.max_connections | int | `450` |  |
| postgresql-syncservice.postgresqlPassword | string | `"admin"` |  |
| postgresql-syncservice.postgresqlUsername | string | `"alfresco"` |  |
| postgresql-syncservice.primary.nodeSelector | object | `{}` |  |
| postgresql-syncservice.replicaCount | int | `1` |  |
| postgresql-syncservice.resources.limits.memory | string | `"1500Mi"` |  |
| postgresql-syncservice.resources.requests.memory | string | `"1500Mi"` |  |
| postgresql-syncservice.service.port | int | `5432` |  |
| postgresql.enabled | bool | `true` | If true, install the postgresql chart alongside Alfresco Content Services. Note: Set this to false if you use an external database. |
| postgresql.persistence.existingClaim | string | `nil` | provide an existing persistent volume claim name to persist SQL data Make sure the root folder has the appropriate permissions/ownhership set. |
| postgresql.persistence.storageClass | string | `nil` | set the storageClass to use for dynamic provisioning. setting it to null means "default storageClass". |
| postgresql.postgresqlDatabase | string | `"alfresco"` | Postgresql database name |
| postgresql.postgresqlPassword | string | `"alfresco"` | Postgresql database password |
| postgresql.postgresqlUsername | string | `"alfresco"` | Postgresql database user |
| repository.adminPassword | string | `"209c6174da490caeb422f3fa5a7ae634"` | Administrator password for ACS in md5 hash format |
| repository.command | list | `[]` |  |
| repository.edition | string | `"Enterprise"` |  |
| repository.environment.JAVA_OPTS | string | `"-Dtransform.service.enabled=true -XX:MinRAMPercentage=50 -XX:MaxRAMPercentage=80 -Dencryption.keystore.type=JCEKS -Dencryption.cipherAlgorithm=DESede/CBC/PKCS5Padding -Dencryption.keyAlgorithm=DESede -Dencryption.keystore.location=/usr/local/tomcat/shared/classes/alfresco/extension/keystore/keystore -Dmetadata-keystore.aliases=metadata -Dmetadata-keystore.metadata.algorithm=DESede"` |  |
| repository.extraInitContainers | list | `[]` |  |
| repository.extraLogStatements | object | `{}` | Provide additional log statements by adding classes and/or packages in a key:value fashion |
| repository.extraSideContainers | list | `[]` |  |
| repository.extraVolumeMounts | list | `[]` |  |
| repository.extraVolumes | list | `[]` |  |
| repository.image.hazelcastPort | int | `5701` |  |
| repository.image.internalPort | int | `8080` |  |
| repository.image.pullPolicy | string | `"IfNotPresent"` |  |
| repository.image.repository | string | `"quay.io/alfresco/alfresco-content-repository"` |  |
| repository.image.tag | string | `"7.3.0"` |  |
| repository.ingress.annotations | object | `{}` |  |
| repository.ingress.maxUploadSize | string | `"5g"` |  |
| repository.ingress.path | string | `"/"` |  |
| repository.ingress.tls | list | `[]` |  |
| repository.initContainers.db.image.pullPolicy | string | `"IfNotPresent"` |  |
| repository.initContainers.db.image.repository | string | `"busybox"` |  |
| repository.initContainers.db.image.tag | string | `"1.35.0"` |  |
| repository.initContainers.db.resources.limits.memory | string | `"10Mi"` |  |
| repository.initContainers.db.resources.requests.memory | string | `"5Mi"` |  |
| repository.initContainers.fs.image.pullPolicy | string | `"IfNotPresent"` |  |
| repository.initContainers.fs.image.repository | string | `"busybox"` |  |
| repository.initContainers.fs.image.tag | string | `"1.35.0"` |  |
| repository.initContainers.fs.resources.limits.memory | string | `"10Mi"` |  |
| repository.initContainers.fs.resources.requests.memory | string | `"5Mi"` |  |
| repository.licenseSecret | string | `nil` | The name of the secret holding the ACS repository license if any. it must be contained within a `data['*.lic']` property See https://github.com/Alfresco/acs-deployment/blob/master/docs/helm/examples/alf_license.md for details on how to manage license |
| repository.livenessProbe.initialDelaySeconds | int | `130` |  |
| repository.livenessProbe.periodSeconds | int | `20` |  |
| repository.livenessProbe.timeoutSeconds | int | `10` |  |
| repository.nodeSelector | object | `{}` |  |
| repository.readinessProbe.failureThreshold | int | `6` |  |
| repository.readinessProbe.initialDelaySeconds | int | `60` |  |
| repository.readinessProbe.periodSeconds | int | `20` |  |
| repository.readinessProbe.timeoutSeconds | int | `10` |  |
| repository.replicaCount | int | `2` |  |
| repository.resources.limits.memory | string | `"3000Mi"` |  |
| repository.resources.requests.memory | string | `"3000Mi"` |  |
| repository.service.externalPort | int | `80` |  |
| repository.service.name | string | `"alfresco"` |  |
| repository.service.type | string | `"ClusterIP"` |  |
| repository.startupProbe | object | `{"failureThreshold":10,"periodSeconds":30}` | The startup probe to cover the worse case startup time for slow start containers |
| repository.strategy.type | string | `"Recreate"` |  |
| s3connector | object | `{"enabled":false}` | Defines the properties to be used for the S3 Connector For a full list of properties on the S3 connector, please view: https://docs.alfresco.com/s3connector/references/s3-contentstore-ref-config-props.html |
| share | object | `{"command":[],"environment":{"CATALINA_OPTS":" -XX:MinRAMPercentage=50 -XX:MaxRAMPercentage=80"},"extraInitContainers":[],"extraSideContainers":[],"extraVolumeMounts":[],"extraVolumes":[],"image":{"internalPort":8080,"pullPolicy":"IfNotPresent","repository":"quay.io/alfresco/alfresco-share","tag":"7.3.0"},"ingress":{"annotations":{},"path":"/share","tls":[]},"livenessProbe":{"initialDelaySeconds":200,"periodSeconds":20,"timeoutSeconds":10},"nodeSelector":{},"readinessProbe":{"initialDelaySeconds":60,"periodSeconds":20,"timeoutSeconds":15},"replicaCount":1,"resources":{"limits":{"memory":"2000Mi"},"requests":{"memory":"2000Mi"}},"service":{"externalPort":80,"name":"share","type":"ClusterIP"}}` | Define the alfresco-share properties to use in the k8s cluster This is the default presentation layer(UI) of Alfresco Content Services |
| tika | object | `{"environment":{"JAVA_OPTS":" -XX:MinRAMPercentage=50 -XX:MaxRAMPercentage=80"},"image":{"internalPort":8090,"pullPolicy":"IfNotPresent","repository":"alfresco/alfresco-tika","tag":"3.0.0"},"livenessProbe":{"initialDelaySeconds":60,"livenessPercent":400,"livenessTransformPeriodSeconds":600,"maxTransformSeconds":1800,"maxTransforms":10000,"periodSeconds":20,"timeoutSeconds":10},"nodeSelector":{},"readinessProbe":{"initialDelaySeconds":60,"periodSeconds":60,"timeoutSeconds":10},"replicaCount":2,"resources":{"limits":{"memory":"1000Mi"},"requests":{"memory":"1000Mi"}},"service":{"externalPort":80,"name":"tika","type":"ClusterIP"}}` | Declares the alfresco-tika service used by the content repository to transform office files |
| transformmisc | object | `{"enabled":true,"environment":{"JAVA_OPTS":" -XX:MinRAMPercentage=50 -XX:MaxRAMPercentage=80"},"image":{"internalPort":8090,"pullPolicy":"IfNotPresent","repository":"alfresco/alfresco-transform-misc","tag":"3.0.0"},"livenessProbe":{"initialDelaySeconds":10,"livenessPercent":400,"livenessTransformPeriodSeconds":600,"maxTransformSeconds":1800,"maxTransforms":10000,"periodSeconds":20,"timeoutSeconds":10},"nodeSelector":{},"readinessProbe":{"initialDelaySeconds":20,"periodSeconds":60,"timeoutSeconds":10},"replicaCount":2,"resources":{"limits":{"memory":"1000Mi"},"requests":{"memory":"1000Mi"}},"service":{"externalPort":80,"name":"transformmisc","type":"ClusterIP"}}` | Declares the alfresco-tika service used by the content repository to transform office files |
| transformrouter.environment.JAVA_OPTS | string | `" -XX:MinRAMPercentage=50 -XX:MaxRAMPercentage=80"` |  |
| transformrouter.image.internalPort | int | `8095` |  |
| transformrouter.image.pullPolicy | string | `"IfNotPresent"` |  |
| transformrouter.image.repository | string | `"quay.io/alfresco/alfresco-transform-router"` |  |
| transformrouter.image.tag | string | `"2.0.0"` |  |
| transformrouter.livenessProbe.initialDelaySeconds | int | `140` |  |
| transformrouter.livenessProbe.periodSeconds | int | `120` |  |
| transformrouter.livenessProbe.timeoutSeconds | int | `60` |  |
| transformrouter.nodeSelector | object | `{}` |  |
| transformrouter.readinessProbe.initialDelaySeconds | int | `140` |  |
| transformrouter.readinessProbe.periodSeconds | int | `60` |  |
| transformrouter.readinessProbe.timeoutSeconds | int | `10` |  |
| transformrouter.replicaCount | int | `2` |  |
| transformrouter.resources.limits.memory | string | `"512Mi"` |  |
| transformrouter.resources.requests.memory | string | `"128Mi"` |  |
| transformrouter.service.externalPort | int | `80` |  |
| transformrouter.service.name | string | `"transform-router"` |  |
| transformrouter.service.type | string | `"ClusterIP"` |  |

ACS will be created in a k8s cluster with a minimum of 16GB memory to split among below nodes:
2 x repository, 1 x share, 1 x transformers (pdfrenderer, imagemagick, libreoffice, tika, misc) and 1 x postgresql

Limit container memory and assign X percentage to JVM.  There are couple of ways to allocate JVM Memory for ACS Containers
For example: 'JAVA_OPTS: "$JAVA_OPTS -XX:+PrintFlagsFinal -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap"'
But, as per Oracle docs (https://docs.oracle.com/javase/9/gctuning/parallel-collector1.htm#JSGCT-GUID-CAB83393-3438-44ED-98F0-D15641B43C7D)
If container memory is not explicitly set, then the above flags will default max heap to 1/4th of container's memory which may not be ideal.
Hence, setting up explicit Container memory and then assigning a percentage of it to the JVM for performance tuning.
