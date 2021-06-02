## ATIVIDADE 3



## QUESTAO 1
##  1) Considerando a DATABASE disponível em 
## https://github.com/DIOGOBRODRIGUES/DBP_3MA2021_1/blob/master/aula5.sql
## Desenvolva uma função que insere um novo aluno na tabela “Aluno” e retorne o nome 
## do aluno Inserido.


DELIMITER // 
CREATE FUNCTION novoAluno(codigoCurso INT, 
						  dataNascimento DATE, 
                          totalCredito INT, 
                          mgp DOUBLE(10,2), 
                          nomeAluno VARCHAR(50), 
                          email VARCHAR(50)) 
RETURNS VARCHAR(50)
BEGIN
	INSERT INTO aluno(cod_curso, dat_nasc, tot_cred, mgp, nom_alun, email) 
		 VALUES (codigoCurso, 
				 dataNascimento, 
                 totalCredito, 
                 mgp, 
                 nomeAluno, 
                 email);
	RETURN nomeAluno;	
END //
DELIMITER ;






## QUESTAO 2
## Desenvolva um procedimento em MYSQL que imprima a sequência de 5 números 
## utilizando a estrutura de repetição WHILE, saída esperada abaixo.


DELIMITER $$
CREATE PROCEDURE rep_numeros()
BEGIN 
	DECLARE contador TINYINT DEFAULT 1;
    DECLARE str VARCHAR(15) DEFAULT "";
	WHILE contador <= 5 DO
		SET str = CONCAT(str , contador , ", ");
		SET contador = contador + 1;
	END WHILE;
    SELECT str;
END $$
DELIMITER ;

## QUESTAO 3

## Faça um procedimento em MYSQL que use a estrutura de repetição REPEAT para 
## concatenar números de 1 a 9 (função concatenar em MySQL “CONCAT”);






DELIMITER %%
CREATE PROCEDURE rep_1a9()
BEGIN
	DECLARE contador TINYINT DEFAULT 1;
    DECLARE result VARCHAR(50) DEFAULT "";
	REPEAT 
		SET result = CONCAT(result , contador , ',');
        SET contador = contador + 1;
	UNTIL contador > 9
    END REPEAT;
    SELECT result;
END %%
DELIMITER ;
