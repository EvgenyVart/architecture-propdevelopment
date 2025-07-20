#!/bin/bash

# Аналитику даем права viewer
kubectl create clusterrolebinding analyst-viewer \
  --clusterrole=cluster-viewer \
  --user=analyst

# Разработчику даем права editor в default namespace
kubectl create rolebinding dev1-editor \
  --role=namespace-editor \
  --user=dev1 \
  --namespace=default

# Дополнительно: привязка группы безопасности
kubectl create clusterrolebinding security-auditors \
  --clusterrole=security-auditor \
  --group=security-team

echo "Привязки созданы:"
echo "- analyst → cluster-viewer"
echo "- dev1 → namespace-editor (default)"
echo "- Группа security-team → security-auditor"