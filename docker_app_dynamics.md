Quick Summary

# (Initialize data volume) ######### hit me with an -it maybe?
docker run --name \
  platform-data \
  -it \
  docker.io/ctrewe/appdynamics-platform-data


#(Install AppDynamics)
docker run --rm \
  -it \
  --name platform-install \
  -h controller \
  --volumes-from platform-data \
  docker.io/ctrewe/appdynamics-platform-install

#(Add license file)
docker run \
  --rm \
  -it \
  --volumes-from platform-data \
  -v $(pwd)/:/license \
  docker.io/ctrewe/appdynamics-platform-install \
  bash -c "cp /license/license.lic /appdynamics/Controller"


#(Start AppDynamics)
docker \
  run \
  -d \
  --name platform \
  -h controller \
  -p 8090:8090 \
  -p 7001:7001 \
  -p 9080:9080 \
  --volumes-from platform-data \
  docker.io/ctrewe/ctrewe/appdynamics-platform \
  start-appdynamics

#(Stop AppDynamics)
docker exec platform stop-appdynamics

#(Restart AppDynamics)
docker exec platform start-appdynamics





dx search appdynamics
INDEX       NAME                                              DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED
docker.io   appdynamics/ecommerce-activemq          ActiveMQ services for the ECommerce demo        2
docker.io   docker.io/appdynamics/ecommerce-load              Load gen client for the ECommerce demo          2
docker.io   docker.io/appdynamics/lemming                                                                     1
docker.io   docker.io/appdynamics/base-centos                 Centos base image for AppDynamics Platform...   0
docker.io   docker.io/appdynamics/bundy_cron                                                                  0
docker.io   docker.io/appdynamics/bundy_load                                                                  0
docker.io   docker.io/appdynamics/bundy_mem                                                                   0
docker.io   docker.io/appdynamics/ecomm_mobile_load                                                           0
docker.io   docker.io/appdynamics/ecomm_mobile_load_iosdata                                                   0
docker.io   docker.io/appdynamics/ecommerce-browser-load                                                      0
docker.io   docker.io/appdynamics/ecommerce-faultinjection                                                    0
docker.io   docker.io/appdynamics/ecommerce-java                                                              0
docker.io   docker.io/appdynamics/ecommerce-synapse                                                           0
docker.io   docker.io/appdynamics/nodemobile_app                                                              0
docker.io   docker.io/appdynamics/nodemobile_load                                                             0
docker.io   docker.io/appdynamics/nodemobile_mongodb                                                          0
docker.io   docker.io/appdynamics/nodemobile_redis                                                            0
docker.io   docker.io/appdynamics/python-app                                                                  0
docker.io   docker.io/appdynamics/pythondemo-app                                                              0
docker.io   docker.io/appdynamics/selenium                                                                    0
docker.io   docker.io/appdynamics/sti-wildfly-eap64-centos7   EAP 6.4 builder image with AppDynamics Jav...   0
docker.io   docker.io/ctrewe/appdynamics-agent                DB monitoring tool's agent                      0
docker.io   docker.io/ctrewe/appdynamics-platform                                                             0
docker.io   docker.io/ctrewe/appdynamics-platform-data                                                        0
docker.io   docker.io/ctrewe/appdynamics-platform-install
