# RCN Store Optimization Script - CMD Version
[console]::OutputEncoding = [System.Text.Encoding]::UTF8
Clear-Host
Write-Host "----------------------------------------"
Write-Host "         RCN STORE - OTIMIZACAO         "
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
Write-Host "[0] Sair"
Write-Host "----------------------------------------"

# Função para executar comandos no CMD
Function RunInCMD {
    param (
        [string]$Command
    )
    cmd.exe /c $Command
}

# Função para criar ponto de restauração
Function CreateRestorePoint {
    Write-Host "Criando ponto de restauracao..."
    RunInCMD "wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint 'Ponto RCN Store', 100, 7"
    Write-Host "Ponto de restauracao criado com sucesso!"
}

# Função para excluir arquivos temporários
Function DeleteTemporaryFiles {
    Write-Host "Excluindo arquivos temporarios..."
    RunInCMD "del /s /q %temp%\*"
    Write-Host "Arquivos temporarios excluidos!"
}

# Função para desativar hibernação
Function DisableHibernation {
    Write-Host "Desativando hibernacao..."
    RunInCMD "powercfg -h off"
    Write-Host "Hibernacao desativada!"
}

# Outras funções podem ser adicionadas aqui, da mesma forma...

# Loop do menu
Do {
    $choice = Read-Host "Digite o numero da sua escolha"
    Switch ($choice) {
        1 { CreateRestorePoint }
        2 { DeleteTemporaryFiles }
        7 { DisableHibernation }
        0 { Write-Host "Saindo do script. obrigado"; Break }
        Default { Write-Host "Escolha invalida. Tente novamente." }
    }
} While ($choice -ne 0)
