# FIAP SOA
Projeto SOA utilizando Netbeans, ActiveMQ, MySQL e Mule

## Caso de uso
 * Processo de vender
 
## Aplicações
* Java 8
 * http://www.oracle.com/technetwork/java/javase/overview/index.html
* Netbeans 8.1
  * https://netbeans.org/
* ActiveMQ 5.14.0
  * http://activemq.apache.org/
* Mule Anypoint Studio 6
  * https://developer.mulesoft.com/
* Mysql 5.6
  * https://www.mysql.com/

## Bibliotecas adicionais, diretório 3rd-party-libs
 * ActiveMQ: activemq-all-5.14.0.jar
 * JSON: json-20160810.jar

## ActiveMQ
  Sistema cria 3 filas
  * **client**: Operações com dados do cliente
  * **product**: Operações com dados do produto
  * **order**: Operações com dados do pedido
  
Como implementar no JAVA o ActiveMQ com **request-response** [link](http://activemq.apache.org/how-should-i-implement-request-response-with-jms.html)

## Mule
 Utilizado como broker entre ActiveMQ e MYSQL
 
 Os fluxos foram configurados com JMS ActiveMQ utilizando **request-response**
 
## Fluxo de dados
###Request
[INTERFACE JAVA SWING]-> [SEND REQUEST]-> [QUEUE] <-[CONSUME]-> [MULE]-> [ACTION]-> [MYSQL] 
###Response
[MULE]-> [SEND RESPONSE]-> [TEMPORARY RESPONSE QUEUE] <-[CONSUME]-> [INTERFACE JAVA SWING]

## Premissas
* Sistema deve cadastrar produtos e cliente
* Module de vendas deve incluir, alterar e excluir produtos / alterar, incluir e excluir o proprio pedido.
* As telas deverão enviar um XML para o ActiveMQ (consumindo uma fila) e o serviço do Mule deverá consumir a fila e executar os serviços
