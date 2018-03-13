.RECIPEPREFIX +=
NAME=atrakic.github.io
FOO=xomodo
.PHONY: build push run default

default: build

build:  
  docker build -t $(FOO)/$(NAME) --rm=false --no-cache=true .
push: 
  docker push $(FOO)/$(NAME)
run:
  docker run -p 4000:4000 -it -v $(CURDIR):/src --name $(NAME) $(FOO)/$(NAME)
