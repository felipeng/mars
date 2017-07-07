#!/usr/bin/env python
# -*- coding: utf-8 -*-

from lib.bottle import post, run, response

@post('/rest/mars/<commands>')
def robot(commands):
    # define os valores padroes
    limit_area_x, limit_area_y = 5, 5 # area de exploracao
    cardinals = "NESW"                # pontos cardeais North, East, South, West
    position = [0,0,'N']              # coordenada inicial
    axisX, axisY, direction = position

    # valida entrada de dados, aceita somente: L, R e M
    if not all([c == 'L' or c == 'R' or c == 'M' for c in commands]):
        response.status=400
        return "400 Bad Request"
    else:
        # percorre por cada caracter do comando
        for command in commands:
            if command == 'M':
                if direction == 'N':
                    axisY += 1
                elif direction == 'E':
                    axisX += 1
                elif direction == 'S':
                    axisY -= 1
                elif direction == 'W':
                    axisX -= 1
            else:
                new_direction = cardinals.find(direction)
                if command == 'L':
                    direction = cardinals[new_direction-1]
                elif command == 'R':
                    # se nova direcao for maior que posicao da cardinals, zera
                    if new_direction == 3:
                        direction = cardinals[0]
                    else:
                        direction = cardinals[new_direction+1]

            # Se direcao for para fora da area retorna bad request
            if axisX >= limit_area_x or axisY >= limit_area_y or (axisX or axisY) < 0:
                response.status=400
                return "400 Bad Request"

        # retorna posicao final
        return ("({},{},{})".format(axisX, axisY, direction))

run(host='0.0.0.0', port=8080)
