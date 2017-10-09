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

![hollywood.png](/assets/images/hollywood.png)

#### Dicionário de Dados

Dicionário de Dados

| **NOME** | **TIPO** | **DESCRIÇÃO** |
| --- | --- | --- |
| EstadoCivil | entidade | entidade que define e representa o estado civil de alguém. |
| DonoEstudio | entidade | entidade que define e representa um dono de estúdio. |
| Diretor | entidade | entidade que define e representa um diretor e seus atributos. |
| Sexo | entidade | entidade que define sexo. |
| Ator | entidade | entidade que define e representa dados de um ator. |
| Papel | entidade | entidade que define e representa dados |
| Telefone | entidade | entidade que define e representa dados referentes à telefone. |
| FilmeDiretor | entidade | entidade que define e representa dados da tabela gerada pelo relacionamento entre filme e diretor. |
| AtorPapel | entidade | entidade que define e representa dados provenientes da relação entre as entidades ator e papel. |
| Personagem | entidade | entidade que define e representa dados da entidade que define personagem. |
| Estudio | entidade | entidade que define e representa dados de um estúdio. |
| ContratoAtorFilme | entidade | entidade que define e representa dados provenientes da relação entre ator e filme. |
| Filme | entidade | entidade que define e representa dados de um determinado filme. |
| Endereço | entidade | entidade que define e representa dados compilados de TipoEndereco, Rua, Bairro, Cidade, UF e País. |
| TipoTelefone | entidade | entidade que define e representa dados de tipos de telefone. |
| País | entidade | entidade que define e representa dados de um país. |
| UF | entidade | entidade que define e representa dados de uma unidade federativa pertencente à um país. |
| Cidade | entidade | entidade que define e representa dados de uma cidade pertencente à uma unidade federativa. |
| Bairro | entidade | entidade que define e representa dados referentes à um bairro pertencente a uma cidade. |
| Rua | entidade | entidade que define e representa dados de uma rua pertencente à uma cidade. |
| TipoEndereço | entidade | entidade que define e representa dados para  diferenciar tipos de endereço. |
| EstadoCivil\_Dono | relacionamento | relacionamento entre entidades EstadoCivil(1) e DonoEstudio(n). |
| EstadoCivil\_Diretor | relacionamento | relacionamento entre entidades EstadoCivil(1) e Diretor(n). |
| EstadoCivil\_Ator | relacionamento | relacionamento entre entidades EstadoCivil(1) e Ator(n). |
| Sexo\_Diretor | relacionamento | relacionamento entre entidades Sexol(1) e DIretor(n). |
| Sexo\_Ator | relacionamento | relacionamento entre entidades Sexol(1) e Ator(n). |
| Sexo\_Dono | relacionamento | relacionamento entre entidades Sexol(1) e DonoEstúdio(n). |
| Sexo\_Perso | relacionamento | relacionamento entre entidades Sexol(1) e Personagem(n). |
| Papel\_Ator | relacionamento | relacionamento entre entidades Papel(1) e AtorPapel(n). |
| Ator\_Papel | relacionamento | relacionamento entre entidades Ator(1) e AtorPapel(n). |
| Ator\_Contrato | relacionamento | relacionamento entre entidades Ator(1) e ContratoFilme(n). |
| Filme\_Contrato | relacionamento | relacionamento entre entidades Filme(1) e ContratoFilme(n). |
| Contrato\_Perso | relacionamento | relacionamento entre entidades ContratoFilme(1) e Personagem(n). |
| Dono\_Estúdio | relacionamento | relacionamento entre entidades DonoEstúdio(1) e Estúdio(n). |
| Estud\_FIlme | relacionamento | relacionamento entre entidades Estúdio(1) e Filme(n). |
| Filme\_FIlmeDiretor | relacionamento | relacionamento entre entidades Filme(1) e FilmeDiretor(n). |
| DIretor\_FilmeDiretor | relacionamento | relacionamento entre entidades Diretor(1) e FilmeDiretor(n). |
| Ator\_Endereço | relacionamento | relacionamento entre entidades Ator(1) e Endereço(n). |
| Estud\_Endereço | relacionamento | relacionamento entre entidades Estúdio(1) e Endereço(n). |
| Diretor\_Endereço | relacionamento | relacionamento entre entidades Diretor(1) e Endereço(n). |
| Dono\_Endereço | relacionamento | relacionamento entre entidades Dono(1) e Endereço(n). |
| Tipo\_Endereço | relacionamento | relacionamento entre entidades TipoEndereço(1) e Endereço(n). |
| Rua\_Endereço | relacionamento | relacionamento entre entidades Rua(1) e Endereço(n). |
| Bairro\_Rua | relacionamento | relacionamento entre entidades Bairro(1) e Rua(n). |
| Cidade\_Bairro | relacionamento | relacionamento entre entidades Cidade(1) e Bairro(n). |
| UF\_Cidade | relacionamento | relacionamento entre entidades UF(1) e Cidade(n). |
| País\_UF | relacionamento | relacionamento entre entidades País(1) e UF(n). |
| Ator\_Telefone | relacionamento | relacionamento entre entidades Ator(1) e Telefone(n). |
| Estud\_Telefone | relacionamento | relacionamento entre entidades Estúdio(1) e Telefone(n). |
| Diretor\_Telefone | relacionamento | relacionamento entre entidades Diretor(1) e Telefone(n). |
| Dono\_Telefone | relacionamento | relacionamento entre entidades Dono(1) e Telefone(n). |

### Dicionário de Dados - MER
#### O Modelo Entidade Relacionamento

![estudio_cinematografico_logico.png](/assets/images/estudio_cinematografico_logico.png)

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
