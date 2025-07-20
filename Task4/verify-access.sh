#!/bin/bash

# Проверяем доступ аналитика
echo "Проверка прав analyst:"
kubectl --context=analyst-context get pods

# Проверяем доступ разработчика
echo "Проверка прав dev1:"
kubectl --context=dev1-context run test --image=nginx --restart=Never
kubectl --context=dev1-context delete pod test