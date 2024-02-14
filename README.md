## Teste para Desenvolvedor Flutter Pleno

### Parte 1: Conhecimentos Técnicos Básicos
**Instruções:** Responda às seguintes perguntas teóricas.

1. **Flutter e Dart:**
   - Explique a diferença entre `StatelessWidget` e `StatefulWidget`.
   - Descreva o ciclo de vida de um `StatefulWidget`.<br>
      [clique aqui](./life_cycle.md)
2. **Gerenciamento de Estado:**
   - Compare os métodos `setState`, `Provider`, e `BLoC` para gerenciamento de estado no Flutter. Quais são as vantagens e desvantagens de cada um?

### Parte 2: Programação e Resolução de Problemas
**Instruções:** Desenvolva um aplicativo Flutter com as seguintes especificações.

- **Aplicativo de Lista de Tarefas:**
  - Permitir adicionar, remover e marcar tarefas como concluídas.
  - Incluir uma tela para adicionar detalhes da tarefa.
  - Implementar persistência de dados (pode ser local).

### Parte 3: Conhecimento Avançado e Melhores Práticas
**Instruções:** Responda à seguinte pergunta teórica e desenvolva um exemplo prático.

1. **Pergunta Teórica:**
   - Como você implementaria o padrão BLoC para gerenciamento de estado em um aplicativo Flutter? Explique com exemplos.

2. **Exemplo Prático:**
   - Implemente um exemplo simples usando BLoC para gerenciar o estado de um formulário de login.

### Parte 4: Testes e Debugging
**Instruções:** Escreva testes para o código fornecido.

- **Desafio de Teste:**
  - Escreva testes unitários para uma função de validação de email.
  - Escreva testes de widgets para um botão de login que se habilita apenas quando o formulário é válido.

### Parte 5: Avaliação de Código e Análise Crítica
**Instruções:** Revise o seguinte trecho de código Flutter.

- **Revisão de Código:**
  - Identifique e corrija erros no código fornecido.
  - Sugira melhorias para otimização de desempenho e legibilidade.

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Widget tapped');
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text('Tap Me'),
      ),
    );
  }
}
```



Este teste foi projetado para avaliar o conhecimento técnico, a habilidade prática, e a capacidade de resolução de problemas de um desenvolvedor Flutter Pleno.
