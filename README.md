# POC for DevConsole Cypress Tests - Docker

## How to run?

1. set your cluster details in devconsole.test.vars
2. execute 
```bash
docker run -it --env-file ./devconsole.test.vars psrna/devconsole-cypress-tests:4.8.x
```

If you want to keep logs, then run:
```basj
docker run -it -v /your/local/path/for/logs:/src/console/frontend/gui_test_screenshots/:Z  --env-file ./devconsole.test.vars psrna/devconsole-cypress-tests:4.8.x
```

## How to build?

```bash
git clone https://github.com/openshift/console.git
cp ./Dockerfile.devconsole.tests ./console/
cp ./devconsole.tests.entrypoint.sh ./console
cd console

docker build -t psrna/devconsole-cypress-tests:4.8.x -f Dockerfile.devconsole.tests .
```
