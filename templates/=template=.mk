#
# %FFILE%
# %USER%, %FDATE%
#

RM = rm -rf
CC = gcc   # clang icc mpicc mpiicc
CXX = g++  # clang++ mpicxx
CFLAGS = -std=c11 -g -Wall  # -O2 -O3 -m64 -xcore-avx2 -mavx2 -fopt-info-all -ftree-vectorize -arch=native -Wl,--no-as-needed
CXXFLAGS = -std=c++17 -g -Wall
PKG += /usr /usr/local # /opt/X11
INCLUDE_PATH += $(addsuffix /include, $(PKG))
LD_LIBRARY_PATH += $(addsuffix /lib, $(PKG))
LIBS = stdc++  # m glut GLUT GL armadillo mpi dl pthread mkl_rt openblas
INCLUDES = $(addprefix -I, $(INCLUDE_PATH))
LDFLAGS = $(addprefix -L, $(LD_LIBRARY_PATH))
LDLIBS = $(addprefix -l, $(LIBS))
LD = $(INCLUDES) $(LDFLAGS) $(LDLIBS)
JC = java
PC = python3
GO = go build
PDFLATEX = pdflatex
XELATEX = xelatex
BIBLATEX = bibtex
PANDOC = pandoc
TEXFLAGS = -interaction=batchmode
PANDOCFLAGS = -f markdown
GITHUB = https://raw.githubusercontent.com/jinlibao/Pandoc_LaTeX_Templates/master/Pandoc-LaTeX%201000/Homework/Template/LaTeX
# OpenGL on macOS
MAC_GLFLAGS = -framework GLUT -framework OpenGL -Wno-deprecated

EXT = *.cc %HERE%
SRC = $(wildcard $(EXT))
# EXT = "*.cc"
# SRC = $(shell find . -maxdepth 1 -name $(EXT))
ALLPROGS = $(basename $(SRC))

.DEFAULT_GOAL := all

all: $(ALLPROGS)

%: %.c
	$(CC) $(CCFLAGS) -o $@ $<

%: %.cpp
	$(CXX) $(CXXFLAGS) -o $@ $< $(LD)

%: %.cxx
	$(CXX) $(CXXFLAGS) -o $@ $< $(LD)

%: %.cc
	$(CXX) $(CXXFLAGS) -o $@ $< $(LD)

%.class: %.java
	$(JC) $(CFLAGS) $<

%: %.go
	$(GO) -o $@ $<

%.pdf: %.tex
	$(XELATEX) $(TEXFLAGS) $<
	$(BIBLATEX) $(NAME)
	$(XELATEX) $(TEXFLAGS) $<
	$(XELATEX) $(TEXFLAGS) $<

%.tex: %.pdc
	$(PANDOC) $(PANDOCFLAGS) -o $@ $<

makefile_update:
	mv $(MAKEFILE) $(MAKEFILE).old
	wget -q $(GITHUB)/$(MAKEFILE)
	if [ -f $(MAKEFILE) ]; then rm $(MAKEFILE).old; else mv $(MAKEFILE).old $(MAKEFILE); fi

clean:
	$(RM) $(ALLPROGS:=.dSYM) $(ALLPROGS:=.o)

distclean: clean
	$(RM) $(ALLPROGS)

tex_clean:
	$(RM) $(NAME:=.out) $(NAME:=.blg) $(NAME:=.bbl)  $(NAME:=.bib) $(NAME:=.idx) $(NAME:=.aux) $(NAME:=.log) $(NAME:=.txt)

tex_distclean: tex_clean
	$(RM) $(NAME:=.pdf)

# vim:ft=make
#
