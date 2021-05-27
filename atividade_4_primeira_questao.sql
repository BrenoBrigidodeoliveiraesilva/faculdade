
## ATIVIDADE 4 PRIMEIRA QUESTAO:

## AFTER INSERT

delimiter $$
CREATE TRIGGER tri_vendas_ai
AFTER INSERT ON comivenda
FOR EACH ROW
BEGIN

DECLARE vtotal_itens FLOAT(10,2);
DECLARE vtotal_item FLOAT(10,2);
DECLARE total_item FLOAT(10,2);

DECLARE busca_itens CURSOR FOR
SELECT n_totaivenda
FROM comivenda
WHERE n_numevenda = NEW.n_numevenda;

OPEN busca_itens;

itens : LOOP
FETCH busca_itens INTO total_item;
SET vtotal_itens = vtotal_itens + total_item;

END LOOP itens;

CLOSE busca_itens;

UPDATE comvenda SET n_totavenda = vtotal_itens
WHERE n_numevenda = NEW.n_numevenda;
END
$$
delimiter ;

## AFTER UPDATE

delimiter $$
CREATE TRIGGER tri_ivendas_au
AFTER UPDATE on comivenda
FOR EACH ROW
BEGIN

DECLARE vtotal_itens FLOAT(10,2);
DECLARE vtotal_item FLOAT(10,2);
DECLARE total_item FLOAT(10,2);

DECLARE busca_itens CURSOR FOR
SELECT n_totaivenda
FROM comivenda
WHERE n_numevenda = NEW.n_numevenda;
IF NEW.n_valoivenda <> OLD.n_valoivenda THEN


open busca_itens;

itens : LOOP
FETCH busca_itens INTO total_item;

SET vtotal_itens = vtotal_itens + total_item;
END LOOP itens;
CLOSE busca_itens;

UPDATE comvenda SET n_totavenda = vtotal_itens
WHERE n_numevenda = NEW.n_numevenda;
END IF;

END$$
delimiter ;
