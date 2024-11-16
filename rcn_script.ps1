# RCN Store - Otimizacao Completa
[console]::OutputEncoding = [System.Text.Encoding]::UTF8
Clear-Host

# Funcoes (as mesmas do script anterior)...

# Menu principal
Function MainMenu {
    Clear-Host
    Write-Host "----------------------------------------"
    Write-Host "       RCN STORE - OTIMIZACAO"
    Write-Host "----------------------------------------"
    Write-Host "Escolha uma opcao abaixo digitando o numero correspondente:"
    Write-Host "[1] Criar Ponto de Restauracao"
    Write-Host "[2] Excluir Arquivos Temporarios"
    Write-Host "[3] Desativar Consumer Features"
    Write-Host "[4] Desativar Telemetria"
    Write-Host "[5] Desativar Historico de Atividades"
    Write-Host "[6] Desativar GameDVR"
    Write-Host "[7] Desativar Hibernacao"
    Write-Host "[8] Desativar Homegroup"
    Write-Host "[9] Preferir IPv4 ao inves de IPv6"
    Write-Host "[10] Desativar Rastreamento de Localizacao"
    Write-Host "[11] Desativar Storage Sense"
    Write-Host "[12] Desativar Wifi-Sense"
    Write-Host "[13] Habilitar Finalizar Tarefa com Botao Direito"
    Write-Host "[14] Executar Limpeza de Disco"
    Write-Host "[15] Configurar Terminal do Windows para PowerShell 7"
    Write-Host "[16] Desativar Telemetria do PowerShell 7"
    Write-Host "[17] Configurar Hibernacao como padrao (ideal para laptops)"
    Write-Host "[18] Outras Otimizacoes (CUIDADO)"
    Write-Host "[0] Sair"
    Write-Host "----------------------------------------"
}

# Menu de "Outras Otimizacoes (CUIDADO)"
Function AdvancedMenu {
    Clear-Host
    Write-Host "----------------------------------------"
    Write-Host "  RCN STORE - Outras Otimizacoes (CUIDADO)"
    Write-Host "----------------------------------------"
    Write-Host "Escolha uma opcao abaixo digitando o numero correspondente:"
    Write-Host "[1] Bloquear Adobe Network"
    Write-Host "[2] Remover Bloatware da Adobe"
    Write-Host "[3] Desativar IPv6"
    Write-Host "[4] Desativar Teredo"
    Write-Host "[5] Desativar Aplicativos em Segundo Plano"
    Write-Host "[6] Desativar Otimizacoes de Tela Cheia"
    Write-Host "[7] Desativar Microsoft Copilot"
    Write-Host "[8] Desativar MM Intel (vPro LMS)"
    Write-Host "[9] Desativar Barra de Notificacoes e Calendario"
    Write-Host "[10] Configurar Tela para Melhor Desempenho"
    Write-Host "[11] Ativar Menu Classico do Clique-Direito"
    Write-Host "[12] Configurar Horario UTC (Dual Boot)"
    Write-Host "[13] Remover Todos os Aplicativos da Microsoft Store"
    Write-Host "[14] Remover Microsoft Edge"
    Write-Host "[15] Remover OneDrive"
    Write-Host "[16] Bloquear Instalacoes de Software Razer"
    Write-Host "[0] Voltar"
    Write-Host "----------------------------------------"
}

# Execucao dos menus
Do {
    MainMenu
    $choice = Read-Host "Digite o numero da sua escolha"
    Switch ($choice) {
        1 { CreateRestorePoint }
        2 { DeleteTemporaryFiles }
        3 { Write-Host "Opcao ainda nao implementada!" }
        4 { DisableTelemetry }
        18 {
            Do {
                AdvancedMenu
                $advancedChoice = Read-Host "Digite o numero da sua escolha"
                Switch ($advancedChoice) {
                    1 { BlockAdobeNetwork }
                    3 { DisableIPv6 }
                    15 { RemoveOneDrive }
                    0 { Break }
                    Default { Write-Host "Escolha invalida. Tente novamente." }
                }
            } While ($advancedChoice -ne 0)
        }
        0 { Write-Host "Saindo do script. Ate mais!"; Break }
        Default { Write-Host "Escolha invalida. Tente novamente." }
    }
} While ($choice -ne 0)
