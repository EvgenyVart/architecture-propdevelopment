# Проверка front-end → admin-back-end-api (должно быть запрещено)
kubectl run test-cross1 --rm -i -t --image=alpine --labels=role=front-end -- sh -c 'wget -qO- --timeout=2 http://admin-back-end-api-app && echo "Success" || echo "Failed"'

# Проверка admin-front-end → back-end-api (должно быть запрещено)
kubectl run test-cross2 --rm -i -t --image=alpine --labels=role=admin-front-end -- sh -c 'wget -qO- --timeout=2 http://back-end-api-app && echo "Success" || echo "Failed"'