#!/bin/bash

docker-compose  --profile testing up  --abort-on-container-exit --exit-code-from test
testCode=$?
docker-compose down
exit $testCode
