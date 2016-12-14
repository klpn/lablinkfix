kataidsgen:
	ghc --make kataidsgen

kataids: kataidsgen
	./kataidsgen

build: kataidsgen kataids
	ghc --make lablinkfix
