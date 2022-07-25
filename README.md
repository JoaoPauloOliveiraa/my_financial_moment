# My financial moment

### Aplicação desenvolvida para cumprir os requisitos do desafio 4, proposto pela comunidade DevsFree.

---
## Executando a aplicação

Instale o [docker](https://docs.docker.com/get-docker/) e o [docker-compose](https://docs.docker.com/compose/install/)

Instale o [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

Para clonar o repositório abra o terminal e execute o comando abaixo:

```bash
git clone https://github.com/JoaoPauloOliveiraa/my_financial_moment.git
```
Entre no diretório my-financial-moment executando o seguinte comando:

```bash
cd my-financial-moment
```

Após isso execute os seguinte comandos:

```bash
cp .env.example .env
```

```bash
docker-compose build
```

Se receber alguma mensagem de erro: `ERROR: Service 'mfm.api' failed to build : Build failed`
Execute o comando abaixo para se tornar proprietário do diretório e execute novamente o comando anterior (docker-compose build)

```bash
sudo chown -R $USER:$USER .
```

Prossiga com os próximos passos

```bash
docker-compose run --rm mfm.api bash
```
Esse comando irá abrir um bash dentro do container criado

Então execute os seguintes comandos

```bash
bundle install
rails db:create db:migrate db:seed
```

Após isso aperte Ctrl-D(Linux ou Windows) ou Cmd-D (MacOS)

## Iniciando os containers
###### `AVISO: Certifique-se de que as portas 3000 e 5432 não estão ocupadas.`

```bash
docker-compose up -d
```

Após isso, você deve obter a seguinte saída no terminal:
```bash
Starting my-financial-moment-db ... done
Starting my-financial-moment-api    ... done
```

Para verificar se os containeres estão em execução digite o comando:

```bash
docker-compose ps
```
Esses são os nomes dos containers seguidos de seus respectivos serviços, executando atualmente:

```bash
my-financial-moment-api => mfm.api (rails)
sopha-produtos-db => db (postgres)
```

Caso algum container estiver mostrando `exit` e algum número na coluna State, veja os logs do container.

Para ler os logs do container execute:

```bash
docker logs <nome-do-container>
```

Para executar a aplicação em modo debugger

```bash
docker attach my-financial-moment-api
```

Entre no browser e digite `localhost:3000`

Depois desses passos você deve ver a aplicação em execução


---
## Executando os testes com rspec

Para executar os testes da aplicação, no terminal digite

```bash
docker-compose run --rm mfm.api bash
```
Depois execute o seguinte comando para executar todos os testes:

```bash
rspec spec 
```

Para executar testes mais específicos, visite a página do github do [rspec](https://github.com/rspec/rspec-rails)

## Documentação 

Acesse [Documentação](https://app.swaggerhub.com/apis-docs/jpoliveiraa/MyFinancialMoment/1.0.0#/) Swagger da Api 

---

Exemplo de uso via Postman:

Preencha os dados dos parâmetros e clique em send

![send](https://user-images.githubusercontent.com/64380907/180779419-33b81fba-5bcb-4326-8eeb-3db91436370b.png)

Exemplo de retorno

![response](https://user-images.githubusercontent.com/64380907/180779534-6371a974-ff39-45c2-9f43-7c3677c88f0c.png)




