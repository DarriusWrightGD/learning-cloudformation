``` powershell
docker build -t scout2 .
docker run -it -v ${HOME}/.aws:/root/.aws -v ${PWD}:/app scout2 bash
Scout2
```