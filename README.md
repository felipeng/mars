# Mars Exploration

[![Build Status](https://travis-ci.org/felipeng/mars.svg?branch=master)](https://travis-ci.org/felipeng/mars)

Interface REST para controlar o robô de exploração do terreno em Marte.
Foi utilizar o [Bottle: Python Web Framework](http://bottlepy.org/docs/dev/)

## Instalação

1. Baixar o código: `git clone https://github.com/felipeng/mars.git`
1. Iniciar o servidor: `python mars/app/mars.py`

## Como utilizar

Configurações iniciais:
* Tamanho da área: 5x5
* Posição inicial: (0,0,N) = x = 0, y = 0 e camera = North

Movimentos:
* M = move o robô para frente
* L = gira o robô no próprio eixo, sem movimento, para esquerada (LEFT)
* R = gira o robô no próprio eixo, sem movimento, para direita (RIGHT)

Enviar robô para posição:
* (2,0,S) = `curl -s --request POST http://localhost:8080/rest/mars/MMRMMRMM`
* (0,2,W) = `curl -s --request POST http://localhost:8080/rest/mars/MML`
* (4,4,E) = `curl -s --request POST http://localhost:8080/rest/mars/MMRMMLMMRMM`
* 400 Bad Request = `curl -s --request POST http://localhost:8080/rest/mars/AAAA`
* 400 Bad Request = `curl -s --request POST http://localhost:8080/rest/mars/MMMMM`
* 400 Bad Request = `curl -s --request POST http://localhost:8080/rest/mars/MLX`

## Docker Image

Foi criado um container docker para facilitar a utilização. Para executar o container, execute:

`docker run -ti --rm -p 8080:8080 felipeng/mars:latest`

# License

Mars Exploration is released under the MIT License. See [LICENSE](LICENSE) file for details.
