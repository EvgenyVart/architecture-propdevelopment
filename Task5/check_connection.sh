# Проверка front-end → back-end-api
kubectl run test-frontend --rm -i -t --image=alpine --labels=role=front-end -- sh -c 'wget -qO- --timeout=2 http://back-end-api-app && echo "Success" || echo "Failed"'

# Проверка admin-front-end → admin-back-end-api
kubectl run test-admin --rm -i -t --image=alpine --labels=role=admin-front-end -- sh -c 'wget -qO- --timeout=2 http://admin-back-end-api-app && echo "Success" || echo "Failed"'