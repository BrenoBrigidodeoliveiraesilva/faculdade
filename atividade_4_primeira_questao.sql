## ATIVIDADE 4 PRIMEIRA QUESTAO:

delimiter !!
CREATE TRIGGER tri_vendas_ai 
AFTER INSERT ON comivenda
FOR EACH ROW
BEGIN
	DECLARE vTotal_itens float(10,2) DEFAULT 0;
	DECLARE vTotal_item float(10,2)DEFAULT 0;
	DECLARE total_item float(10,2)DEFAULT 0;
	DECLARE fimLoop INT DEFAULT 0;    
    DECLARE condLoop INT DEFAULT 0; 
    DECLARE qtdProduto INT DEFAULT 0; 
    

    DECLARE busca_itens CURSOR FOR
    SELECT n_valoivenda,n_qtdeivenda
    FROM comivenda
    WHERE n_numevenda = NEW.n_numevenda;
    
    
    SELECT count(n_numevenda) INTO condLoop 
    FROM comivenda
    WHERE n_numevenda = NEW.n_numevenda;  
    
    OPEN busca_itens;   
    
    itens:LOOP
	IF fimLoop=condLoop THEN
	LEAVE itens;
	END IF;
	SET fimLoop=fimLoop+1;        
        
    FETCH busca_itens INTO total_item,qtdProduto;
        

    SET vTotal_item= total_item*qtdProduto;
        
    SET vTotal_itens= vTotal_itens + vTotal_item;
        
    END LOOP itens;    
    CLOSE busca_itens;
    
    
    UPDATE comvenda SET n_totavenda = vTotal_itens
    WHERE n_numevenda = NEW.n_numevenda; 
	
END !!
delimiter ;