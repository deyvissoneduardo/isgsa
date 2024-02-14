# Widget em Flutter: StatelessWidget e StatefulWidget

## StatelessWidget

`StatelessWidget` é uma classe utilizada para criar widgets imutáveis em Flutter. Uma vez que seus parâmetros são definidos, eles não podem ser alterados. É ideal para representar elementos da interface do usuário que permanecem constantes ao longo do tempo.

## StatefulWidget

`StatefulWidget` é uma classe utilizada para criar widgets mutáveis em Flutter. Este tipo de widget pode ser reconstruído dinamicamente para refletir alterações no estado. É a escolha adequada quando a aparência ou comportamento do widget precisa ser alterado em resposta a eventos ou interações do usuário.

Em resumo, `StatelessWidget` é estático e não muda, enquanto `StatefulWidget` pode ser dinamicamente reconstruído para lidar com mudanças de estado.

## Ciclo de Vida de um StatefulWidget

1. **createState():** Chamado quando o widget é instanciado pela primeira vez para criar o objeto `State`. Esta é uma fase de inicialização.

2. **initState():** Chamado após a criação do `State`. Utilizado para realizar tarefas de inicialização que ocorrem apenas uma vez durante o ciclo de vida do widget.

3. **build():** Chamado sempre que o widget precisa ser renderizado. Aqui, você define a estrutura do widget com base no estado atual.

4. **didUpdateWidget():** Chamado quando o widget pai reconstrói e fornece um novo widget para o `StatefulWidget`. Útil para comparar os widgets antigo e novo e reagir a mudanças.

5. **setState():** Utilizado para notificar o framework de que o estado interno do widget mudou, solicitando uma reconstrução do widget. A fase de construção é disparada novamente.

6. **dispose():** Chamado quando o widget está prestes a ser removido da árvore de widgets. Usado para realizar a limpeza de recursos ou tarefas antes da destruição do widget.