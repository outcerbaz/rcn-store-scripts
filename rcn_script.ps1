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
    Remove-Item -Path "$env:temp\*" -Recurse -Force -ErrorAct
