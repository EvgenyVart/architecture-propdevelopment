#!/bin/bash

# Создаем пользователей с сертификатами
for user in analyst dev1; do
  openssl genrsa -out ${user}.key 2048
  openssl req -new -key ${user}.key -out ${user}.csr -subj "/CN=${user}/O=dev-group"
  sudo openssl x509 -req -in ${user}.csr -CA /var/lib/minikube/certs/ca.crt -CAkey /var/lib/minikube/certs/ca.key -CAcreateserial -out ${user}.crt -days 365
  
  kubectl config set-credentials ${user} --client-certificate=${user}.crt --client-key=${user}.key
  kubectl config set-context ${user}-context --cluster=minikube --user=${user}
done

echo "Пользователи созданы:"
echo "- analyst (аналитик)"
echo "- dev1 (разработчик)"