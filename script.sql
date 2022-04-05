CREATE OR REPLACE FUNCTION valor_aleatorio_entre(lim_inferior INT, lim_superior INT) RETURNS INT AS
$$
BEGIN
	RETURN FLOOR(RANDOM() * (lim_superior - lim_inferior + 1) + lim_inferior)::INT;
END;
$$ LANGUAGE plpgsql;


-------------------------------------------
DO $$
DECLARE
	a INT := valor_aleatorio_entre(0, 20);
	b INT := valor_aleatorio_entre (0, 20);
	c INT := valor_aleatorio_entre (0, 20);
	delta NUMERIC(10, 2);
	raizUm NUMERIC(10, 2);
	raizDois NUMERIC (10, 2);
BEGIN
	-- U&'\00B2'
	RAISE NOTICE 'Equação: %x% + %x + % = 0', a, U&'\00B2', b, c;
	IF a = 0 THEN
		RAISE NOTICE 'Não é uma equação do segundo grau';
	ELSE
		delta := b ^ 2 - 4ac;
		RAISE NOTICE 'Valor de delta %', delta;
		IF delta < 0 THEN
			RAISE NOTICE 'Nenhuma raiz';
		--ELSEIF assim vale
		ELSIF delta = 0 THEN
			raizUm := (-b + |/delta) / 2a;
			RAISE NOTICE 'Uma raiz %', raizUm;
		ELSE
			raizUm := (-b + |/delta) / 2a;
			raizDois := (-b - |/delta) / 2a;
			RAISE NOTICE 'Duas raizes: % e %', raizUm, raizDois;
		END IF;
	END IF;
	

END;

$$



