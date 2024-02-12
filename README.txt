#Projeto Flutter Experience - Academia do Flutter

Este é o repositório do projeto realizado durante o Flutter Experience da Academia do Flutter, ministrado pelo Rodrigo Rahman.

## onfigurações

Antes de começar, é necessário configurar o ambiente de acordo com as seguintes instruções:

1.Instalação do backend:
   - Utilize o package `json_rest_server: ^2.0.4`.
   - Consulte a documentação para instalação direta na máquina.

2.Configuração do arquivo `env.json`:
   - Crie uma pasta chamada `.config` no diretório raiz da aplicação.
   - Dentro dessa pasta, crie um arquivo chamado `env.json` com o seguinte conteúdo:
     ```json
     {
         "BACKEND_BASE_URL": "http://SEUIP:8080"
     }
     ```
     Substitua `SEUIP` pelo IP da sua máquina.

3.Inicialização do banco de dados:
   - Navegue até a pasta `API`, preferencialmente utilizando o PowerShell.
   - Execute o comando `jrs run` para iniciar o banco de dados.

4.Inicialização das aplicações:
   - Após as configurações anteriores, inicie as aplicações conforme necessário.
   - Certifique-se de que as configurações básicas para operação do Flutter estão prontas, incluindo Flutter Desktop, Mobile e Web.

##Pacotes Utilizados

A lista de pacotes utilizados neste projeto inclui:

- cupertino_icons: ^1.0.2
- flutter_getit: ^2.0.0-dev.12
- fe_lab_clinicas_core:
  - Path: `../fe_lab_clinicas_core
- asyncstate: ^2.1.1-dev.1
- dotted_border: ^2.1.0
- validatorless: ^1.2.3
- signals_flutter: ^3.0.0
- dio: ^5.4.0
- shared_preferences: ^2.2.2
- json_annotation: ^4.8.1
- brasil_fields: ^1.14.3
- camera: ^0.10.5+9
- flutter_lints: ^2.0.0
- json_serializable: ^6.7.1
- build_runner: ^2.4.8

##Contribuição

Se você deseja contribuir com o projeto, siga estas etapas:

1. Faça um fork do projeto.
2. Crie uma nova branch (`git checkout -b feature/nova-feature`).
3. Faça commit das suas mudanças (`git commit -am 'Adiciona nova feature'`).
4. Faça push para a branch (`git push origin feature/nova-feature`).
5. Abra um pull request.

Por favor, certifique-se de descrever claramente as mudanças propostas e o motivo delas.

## Licença

Este projeto está licenciado sob a [Licença MIT](https://opensource.org/licenses/MIT).
