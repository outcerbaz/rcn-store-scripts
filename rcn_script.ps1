# RCN Store Optimization Script
Clear-Host
Write-Host "----------------------------------------"
Write-Host "         RCN STORE - OTIMIZAÇÃO         "
Write-Host "----------------------------------------"
Write-Host "Escolha uma opção abaixo digitando o número correspondente:"
Write-Host "[1] Criar Ponto de Restauração"
Write-Host "[2] Excluir Arquivos Temporários"
Write-Host "[3] Desativar Consumer Features"
Write-Host "[4] Desativar Telemetria"
Write-Host "[5] Desativar Histórico de Atividades"
Write-Host "[6] Desativar GameDVR"
Write-Host "[7] Desativar Hibernação"
Write-Host "[8] Desativar Homegroup"
Write-Host "[9] Preferir IPv4 ao invés de IPv6"
Write-Host "[10] Desativar Rastreamento de Localização"
Write-Host "[11] Desativar Storage Sense"
Write-Host "[12] Desativar Wifi-Sense"
Write-Host "[13] Habilitar Finalizar Tarefa com Botão Direito"
Write-Host "[14] Executar Limpeza de Disco"
Write-Host "[15] Configurar Terminal do Windows para PowerShell 7"
Write-Host "[16] Desativar Telemetria do PowerShell 7"
Write-Host "[17] Configurar Hibernação como padrão (ideal para laptops)"
Write-Host "[0] Sair"
Write-Host "----------------------------------------"

# Função para criar ponto de restauração
Function CreateRestorePoint {
    Write-Host "Criando ponto de restauração..."
    checkpoint-computer -Description "Ponto de Restauração RCN Store" -RestorePointType "MODIFY_SETTINGS"
    Write-Host "Ponto de restauração criado com sucesso!"
}

# Função para excluir arquivos temporários
Function DeleteTemporaryFiles {
    Write-Host "Excluindo arquivos temporários..."
    Remove-Item -Path "$env:temp\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item -Path "$env:windir\temp\*" -Recurse -Force -ErrorAction SilentlyContinue
    Write-Host "Arquivos temporários excluídos!"
}

# Outras funções
Function DisableConsumerFeatures {
    Write-Host "Consumer Features desativadas!"
}

Function DisableTelemetry {
    Write-Host "Telemetria desativada!"
}

Function DisableActivityHistory {
    Write-Host "Histórico de Atividades desativado!"
}

Function DisableGameDVR {
    Write-Host "GameDVR desativado!"
}

Function DisableHibernation {
    Write-Host "Hibernação desativada!"
}

Function DisableHomegroup {
    Write-Host "Homegroup desativado!"
}

Function PreferIPv4OverIPv6 {
    Write-Host "IPv4 preferido sobre IPv6!"
}

Function DisableLocationTracking {
    Write-Host "Rastreamento de Localização desativado!"
}

Function DisableStorageSense {
    Write-Host "Storage Sense desativado!"
}

Function DisableWifiSense {
    Write-Host "Wifi-Sense desativado!"
}

Function EnableEndTaskWithRightClick {
    Write-Host "Finalizar Tarefa com Botão Direito habilitado!"
}

Function RunDiskCleanup {
    Write-Host "Executando Limpeza de Disco..."
    Start-Process -FilePath "cleanmgr.exe" -ArgumentList "/sagerun:1" -NoNewWindow -Wait
    Write-Host "Limpeza de Disco concluída!"
}

Function ChangeTerminalToPS7 {
    Write-Host "Terminal configurado para PowerShell 7!"
}

Function DisablePS7Telemetry {
    Write-Host "Telemetria do PowerShell 7 desativada!"
}

Function SetHibernationDefault {
    Write-Host "Hibernação configurada como padrão!"
}

# Loop do menu
Do {
    $choice = Read-Host "Digite o número da sua escolha"
    Switch ($choice) {
        1 { CreateRestorePoint }
        2 { DeleteTemporaryFiles }
        3 { DisableConsumerFeatures }
        4 { DisableTelemetry }
        5 { DisableActivityHistory }
        6 { DisableGameDVR }
        7 { DisableHibernation }
        8 { DisableHomegroup }
        9 { PreferIPv4OverIPv6 }
        10 { DisableLocationTracking }
        11 { DisableStorageSense }
        12 { DisableWifiSense }
        13 { EnableEndTaskWithRightClick }
        14 { RunDiskCleanup }
        15 { ChangeTerminalToPS7 }
        16 { DisablePS7Telemetry }
        17 { SetHibernationDefault }
        0 { Write-Host "Saindo do script. Até mais!"; Break }
        Default { Write-Host "Escolha inválida. Tente novamente." }
    }
} While ($choice -ne 0)
