# Configuração inicial com senha
$senhaCorreta = "214213"

Write-Host "----------------------------------------"
Write-Host "          RCN STORE - OTIMIZACAO"
Write-Host "----------------------------------------"

# Verificação de senha
$senha = Read-Host "Digite a senha para acessar o script"
if ($senha -ne $senhaCorreta) {
    Write-Host "Senha incorreta. Saindo..." -ForegroundColor Red
    exit
}

Write-Host "Acesso concedido!" -ForegroundColor Green

# Funções adicionais
Function AtivarPlanoDesempenhoMaximo {
    Write-Host "Ativando plano de energia: Desempenho Máximo..."
    powercfg -setactive SCHEME_MIN
    Write-Host "Plano de energia 'Desempenho Máximo' ativado com sucesso!"
}

Function DesativarPrecisaoPonteiro {
    Write-Host "Desativando a opção 'Aprimorar precisão do ponteiro'..."
    $regPath = "HKCU:\\Control Panel\\Mouse"
    Set-ItemProperty -Path $regPath -Name "MouseSpeed" -Value 0
    Set-ItemProperty -Path $regPath -Name "MouseThreshold1" -Value 0
    Set-ItemProperty -Path $regPath -Name "MouseThreshold2" -Value 0
    Write-Host "Aprimoração de precisão do ponteiro desativada com sucesso!"
}

Function ConfigurarTeclado {
    Write-Host "Configurando opções do teclado para repetição e intermitência..."
    $regPathTeclado = "HKCU:\\Control Panel\\Keyboard"
    Set-ItemProperty -Path $regPathTeclado -Name "KeyboardDelay" -Value 1
    Set-ItemProperty -Path $regPathTeclado -Name "KeyboardSpeed" -Value 31
    Write-Host "Configurações do teclado ajustadas com sucesso!"
}

# Loop principal
Do {
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
    Write-Host "[18] Ativar plano de energia: Desempenho Máximo"
    Write-Host "[19] Desativar 'Aprimorar precisão do ponteiro'"
    Write-Host "[20] Configurar teclado (repetição e intermitência)"
    Write-Host "[0] Sair"
    Write-Host "----------------------------------------"

    $escolha = Read-Host "Digite o numero da sua escolha"

    Switch ($escolha) {
        1 { Write-Host "Criar ponto de restauracao..." }
        2 { Write-Host "Excluir arquivos temporarios..." }
        3 { Write-Host "Desativar Consumer Features..." }
        4 { Write-Host "Desativar Telemetria..." }
        5 { Write-Host "Desativar Historico de Atividades..." }
        6 { Write-Host "Desativar GameDVR..." }
        7 { Write-Host "Desativar Hibernacao..." }
        8 { Write-Host "Desativar Homegroup..." }
        9 { Write-Host "Preferir IPv4 ao inves de IPv6..." }
        10 { Write-Host "Desativar Rastreamento de Localizacao..." }
        11 { Write-Host "Desativar Storage Sense..." }
        12 { Write-Host "Desativar Wifi-Sense..." }
        13 { Write-Host "Habilitar Finalizar Tarefa com Botao Direito..." }
        14 { Write-Host "Executar Limpeza de Disco..." }
        15 { Write-Host "Configurar Terminal do Windows para PowerShell 7..." }
        16 { Write-Host "Desativar Telemetria do PowerShell 7..." }
        17 { Write-Host "Configurar Hibernacao como padrao..." }
        18 { AtivarPlanoDesempenhoMaximo }
        19 { DesativarPrecisaoPonteiro }
        20 { ConfigurarTeclado }
        0 {
            Write-Host "Saindo do programa..." -ForegroundColor Yellow
            break
        }
        Default {
            Write-Host "Opcao invalida. Tente novamente." -ForegroundColor Red
        }
    }
} While ($escolha -ne 0)
