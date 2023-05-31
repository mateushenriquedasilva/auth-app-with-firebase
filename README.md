# Projeto em Flutter com Firebase Auth e Google como Sistema de Autenticação

## Introdução

Este é um projeto de estudo em Flutter que utiliza o Firebase Auth como sistema de autenticação, permitindo aos usuários autenticar-se usando suas contas do Google. O Flutter é um framework de desenvolvimento de aplicativos multiplataforma, e o Firebase é uma plataforma de desenvolvimento de aplicativos móveis do Google, que oferece diversos serviços, incluindo autenticação de usuários.

Neste projeto, vamos utilizar o Firebase Auth para permitir que os usuários façam login em nosso aplicativo utilizando suas contas do Google. Isso oferece uma forma conveniente e segura de autenticação para os usuários, além de facilitar a integração com outros serviços e funcionalidades fornecidos pelo Firebase.

## Configuração do Projeto

Antes de começar a desenvolver o projeto, é necessário realizar algumas configurações prévias:

1. Instale o Flutter SDK em seu computador. Você pode encontrar as instruções de instalação na documentação oficial do Flutter: [flutter.dev](https://flutter.dev/docs/get-started/install)

2. Crie um projeto no Firebase Console: [console.firebase.google.com](https://console.firebase.google.com)

3. No Firebase Console, ative o serviço de autenticação do Firebase Auth e habilite o provedor de autenticação do Google. Isso permitirá que os usuários façam login usando suas contas do Google.

4. Faça o download do arquivo de configuração do Firebase (geralmente chamado de `google-services.json` para projetos Android e `GoogleService-Info.plist` para projetos iOS). Esse arquivo contém as informações de configuração necessárias para conectar seu aplicativo Flutter ao projeto Firebase.

5. Crie um novo projeto Flutter em seu ambiente de desenvolvimento preferido.

6. Adicione as dependências necessárias ao arquivo `pubspec.yaml` do seu projeto Flutter. As dependências necessárias para este projeto são `firebase_core`, `firebase_auth` e `google_sign_in`. Certifique-se de especificar as versões compatíveis com a sua versão do Flutter.

7. Copie o arquivo de configuração do Firebase baixado anteriormente para o diretório apropriado do seu projeto Flutter. Normalmente, o arquivo `google-services.json` deve ser colocado na pasta `android/app` para projetos Android e o arquivo `GoogleService-Info.plist` na pasta `ios/Runner` para projetos iOS.

## Desenvolvimento do Projeto

Com as configurações e dependências corretamente configuradas, agora podemos começar o desenvolvimento do projeto. Vamos dividir o processo em três etapas principais: configuração, autenticação com o Firebase Auth e login com o Google.

### Configuração do Firebase

A primeira etapa é realizar a configuração inicial do Firebase em nosso projeto Flutter. Isso envolve a inicialização do Firebase e a configuração do provedor de autenticação do Google. Abaixo está um exemplo de código que deve ser colocado no arquivo `main.dart` do seu projeto:

```dart
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  
  // Resto do código do seu aplicativo Flutter...
}
