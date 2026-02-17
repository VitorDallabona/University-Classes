#include <stdio.h>
#include <unistd.h>
#include <time.h>
#include <locale.h>
#include "tad_configs.h"

void simular(int tempo) {
    setlocale(LC_ALL, "Portuguese");
    printf("Simulando...\n");
    sleep(tempo);
    printf("Simulação concluída!\n");
}

int main() {
    setlocale(LC_ALL, "Portuguese");

    TadConfigs *tad_configs;
    tad_configs = configs_inicializar();
    if (!tad_configs) {
        printf("Erro ao criar TAD\n");
        return 1;
    }
    printf("Arquivo acessado!");

    configs_ler(tad_configs);
    configs_mostrar(tad_configs);

    while (1) {
        sleep(tad_configs->configs.intervalo);
        configs_ler(tad_configs);

        if (tad_configs->configs.status == TERMINAR) {
            configs_atualizar(tad_configs, AGUARDAR, tad_configs->configs.intervalo); // atualiza o status antes de sair
            break;
        }
        else if (tad_configs->configs.status == SIMULAR) {

            Item item;
            int item_removido = 0;

            // Tenta remover da fila de prioridade primeiro
            if (fila_remover_geral(FILA_PRIORIDADE_FILE,FILA_PRIORIDADE, &item)) {
                item_removido = 1;
                configs_atualizar(tad_configs, AGUARDAR, tad_configs->configs.intervalo); // atualiza o status
            }
            else if (fila_remover_geral(FILA_NORMAL_FILE, FILA_NORMAL, &item)) { // Tenta remover da fila normal
                item_removido = 1;
                configs_atualizar(tad_configs, AGUARDAR, tad_configs->configs.intervalo); // atualiza o status
            }
            if (item_removido) {
                printf("Removendo ID: %d, Prioridade: %d\n", item.id, item.prioridade);
                simular(item.tempo_processamento);
                configs_ler(tad_configs); // Atualiza as configurações após simular
            }
            else {
                printf("Nenhum item na fila. Aguardando...\n");
                sleep(1);
            }
        }
        else if (tad_configs->configs.status == AGUARDAR) {
            printf("Aguardando...\n");
            sleep(1);
        }
    }

    configs_destruir(tad_configs);
    printf("Simulação terminada.\n");
    return 0;
}
