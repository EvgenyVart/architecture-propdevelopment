# Создаем сервисы с метками
1. Выполнить скрипт создания сервисов ./create-app.sh
2. Описываем файл с сетевыми политиками ./non-admin-api-allow.yaml
3. Применить политики "kubectl apply -f non-admin-api-allow.yaml"
4. Проверки:
   1 Проверяем разрешенные соединения: ./check_connection.sh
   2 Проверяем запрещенные соединения: ./check-distr-connection.sh