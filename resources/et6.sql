-- ET6

-- 6.1 Crie um comando SQL para alterar a tabela funcionario adicionando a coluna idadefunc (integer) 
		

-- 6.2 Crie uma função chamada que receba como parâmetro o cpf do funcionário (varchar(11)) e retorne um inteiro com a sua idade. 
		-- Observações:
			-- Nome da function: calculaIdade
			-- Dica: para calcular a idade utilize a seguinte consulta: select extract(year from age(datanasc)) from funcionario where cpf=<parametro>;



-- 6.3 - Utilizando a function desenvolvida em 6.2, crie um trigger chamada  com as seguintes regras:
		-- Cada vez que for inserida/atualizado uma nova tupla ou o campo datanasc calcule a idade desse funcionário a partida da sua data de nascimento (datanasc) e 
		-- atualize o campo idadefunc deste funcionário com esse valor calculado. 
		-- Ao atualizar o campo exiba uma mensagem com o nome do funcionário, sua data de nascimento e a idade calculada
		
		-- Nome do trigger: atualizaidade
		-- Nome da function: atualizaidade
		-- Utilize RAISE NOTICE / EXCEPTION para incluir mensagens na sua function  

		-- Definição do trigger



		-- Definição da function




-- 6.4 Crie um comando SQL para testar a função calculaidade


-- 6.5 Crie um comando SQL para apagar a função calculaidade


-- 6.6 Crie comandos SQL para testar todas as ações de seu trigger


-- 6.7 Crie um comando SQL para remover a function e o trigger

