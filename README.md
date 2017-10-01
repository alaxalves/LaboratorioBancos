# Laboratorio de Banco de Dados

Sistema Cinematográfico - Hollywood

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

# Problema Proposto

Hollywood possui diversos estúdios cinematográficos, cada um caracterizado por um nome único, um dono, data de fundação, e o faturamento do ano anterior. Estes estúdiosproduzem filmes que possui um nome único, o número de meses que levou sendo feito, o ano de lançamento, o número do "copyright", e o custo total do filme. Em cada filme
atuam atores, que possuem um nome artístico único, um número de seguro social (também único), uma nacionalidade, idade, sexo, e um conjunto de tipos de papéis para o
qual seu tipo físico é aconselhável (ex: avó, mocinha jovem, galã com idades avançadas, adolescentes). Estes tipos de papéis não são pré-definidos, constituindo uma li ta preenchida a critério de cada ator. Em cada filme onde atua, um ator ganha um cachê, e desempenha um personagem que possui um nome. Estúdios podem existir mesmo que ainda não tiverem produzido um filme, mas só são considerados atores que já atuaram em pelo menos um filme. Todos os filmes possuem pelo menos um diretor.

Em termos de consultas e relatórios, o sistema deverá contemplar:
- Relação dos filmes produzidos por um estúdio;
- Relação dos atores e diretores dos filmes;
- Relação dos cachês de um determinado ator;
- Relação de todos os personagens de um ator

# Dicionário de Dados

### Sumário
1. [Introdução]()
1. [O Minimundo]()	
1. [Dicionário de Dados - DER]()
1. [O Diagrama Entidade Relacionamento]()
1. [Dicionário de Dados]()
1. [Dicionário de Dados - MER]()
1. [O Modelo Entidade Relacionamento]()
1. [Dicionário de Dados]()

### Introdução
Neste documento serão descritos os dados referentes ao mini-mundo ‘sistema cinematográfico’, tema do projeto prático para a dupla durante o curso durante o primeiro semestre de 2017, no formato de dicionário de dados. Neste documento estão listados ambos os dicionários de dados, tanto do MER quanto do DER.

### O Minimundo

Hollywood possui diversos estúdios cinematográficos, cada um caracterizado por um nome único, um dono, data de fundação, e o faturamento do ano anterior. Estes estúdios produzem filmes que possui um nome único, o número de meses que levou sendo feito, o ano de lançamento, o número do "copyright", e o custo total do filme.

Em cada filme atuam atores, que possuem um nome artístico único, um número de seguro social (também único), uma nacionalidade, idade, sexo, e um conjunto de tipos de papéis para o qual seu tipo físico é aconselhável (ex: vó, mocinha jovem, galã com idades avançadas, adolescentes). 

Estes tipos de papéis não são pré-definidos, constituindo uma lista preenchida a critério de cada ator. 

Em cada filme onde atua, um ator ganha um cachê, e desempenha um personagem que possui um nome. 

Estúdios podem existir mesmo que ainda não tiverem produzido um filme, mas só são considerados atores que já atuaram em pelo menos um filme. 

Todos os filmes possuem pelo menos um diretor. 

Em termos de consultas e relatórios, o sistema deverá contemplar: 
- Relação dos filmes produzidos por um estúdio; 
- Relação dos atores e diretores dos filmes; 
- Relação dos cachês de um determinado ator; 
- Relação de todos os personagens de um ator.

### Dicionário de Dados - DER
#### O Diagrama Entidade Relacionamento

![alt text]()


#### Dicionário de Dados

### Dicionário de Dados - MER
#### O Modelo Entidade Relacionamento

![alt text]()

#### Dicionário de Dados



# Requisitos

### Sumário 
1. [Introdução]()	
1. [O Minimundo]()
1. [Requisitos Identificados]()

### Introdução
Neste documento serão listados os requisitos referentes ao mini-mundo ‘sistema cinematográfico’, tema do projeto prático para a dupla durante o curso durante o primeiro semestre de 2017.

### O Minimundo

Hollywood possui diversos estúdios cinematográficos, cada um caracterizado por um nome único, um dono, data de fundação, e o faturamento do ano anterior.
Estes estúdios produzem filmes que possui um nome único, o número de meses que levou sendo feito, o ano de lançamento, o número do "copyright", e o custo total do filme.
Em cada filme atuam atores, que possuem um nome artístico único, um número de seguro social (também único), uma nacionalidade, idade, sexo, e um conjunto de tipos de papéis para o qual seu tipo físico é aconselhável (ex: vó, mocinha jovem, galã com idades avançadas, adolescentes). 
Estes tipos de papéis não são pré-definidos, constituindo uma lista preenchida a critério de cada ator. 
Em cada filme onde atua, um ator ganha um cachê, e desempenha um personagem que possui um nome. 
Estúdios podem existir mesmo que ainda não tiverem produzido um filme, mas só são considerados atores que já atuaram em pelo menos um filme. 
Todos os filmes possuem pelo menos um diretor. Em termos de consultas e relatórios, o sistema deverá contemplar: 

- Relação dos filmes produzidos por um estúdio; 
- Relação dos atores e diretores dos filmes; 
- Relação dos cachês de um determinado ator; 
- Relação de todos os personagens de um ator.

### Requisitos Identificados

Os requisitos passados pelo ministrante da disciplina para o sistema foram:

- O sistema deverá produzir a relação dos filmes produzidos por um determinado estúdio.
- O sistema deverá produzir a relação dos atores e diretores por filme.
- O sistema deverá produzir a relação dos cachês de um determinado ator.
- O sistema deverá produzir a relação de todos os personagens de um ator.
- O sistema deverá produzir pelo menos 8 entidades em seu projeto conceitual.

Outros requisitos, mas tão importantes quanto os anteriores, identificados para o sistema foram:

- Atribuição de tabelas como estado civil, sexo, endereço, telefone, nacionalidade, etc. para Ator, Diretor, e para demais entidades nos quais sejam necessárias.
- Diversas dependências entre tabelas para inclusão de dados. Ex.: Um filme só pode ser criado se possuir pelo menos um diretor, um ator e um estúdio cinematográfico.


