#!/bin/bash
xelatex main.tex
biber main
xelatex main.tex
xelatex main.tex
zathura main.pdf

