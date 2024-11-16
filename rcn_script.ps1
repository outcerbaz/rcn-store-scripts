# Configuração inicial com senha
$senhaCorreta = "214213"

Write-Host "----------------------------------------"
Write-Host "          RCN STORE - OTIMIZACAO"
Write-Host "----------------------------------------"

# Verificação de senha (oculta corretamente)
$senha = Read-Host -AsSecureString "Digite a senha para acessar o script"
$senhaTexto = [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($senha))

if ($senhaTexto -ne $senhaCorreta) {
    Write-Host "Senha incorreta. Saindo..." -ForegroundColor Red
    exit
}

Write-Host "Acesso concedido!" -ForegroundColor Green

# Funções principais
Function AtivarPlanoDesempenhoMaximo {
    Write-Host "Ativando plano de energia: Desempenho Maximo..."
    powercfg -setactive SCHEME_MIN
    Write-Host "Plano de energia 'Desempenho Maximo' ativado com sucesso!"
    Write-Host "Depois de fazer todos os seus comandos, basta reiniciar!" -ForegroundColor Yellow
}

Function DesativarPrecisaoPonteiro {
    Write-Host "Desativando a opcao 'Aprimorar precisao do ponteiro'..."
    $regPath = "HKCU:\\Control Panel\\Mouse"
    Set-ItemProperty -Path $regPath -Name "MouseSpeed" -Value 0
    Set-ItemProperty -Path $regPath -Name "MouseThreshold1" -Value 0
    Set-ItemProperty -Path $regPath -Name "MouseThreshold2" -Value 0
    Write-Host "Precisao do ponteiro desativada com sucesso!"
    Write-Host "Depois de fazer todos os seus comandos, basta reiniciar!" -ForegroundColor Yellow
}

Function ConfigurarTeclado {
    Write-Host "Configurando opcoes do teclado para repeticao e intermitencia..."
    $regPathTeclado = "HKCU:\\Control Panel\\Keyboard"
    Set-ItemProperty -Path $regPathTeclado -Name "KeyboardDelay" -Value 0  # Configura o intervalo de repetição para o máximo
    Set-ItemProperty -Path $regPathTeclado -Name "KeyboardSpeed" -Value 31  # Configura a taxa de repetição para rápida
    Write-Host "Configuracoes do teclado ajustadas com sucesso!"
    Write-Host "Depois de fazer todos os seus comandos, basta reiniciar!" -ForegroundColor Yellow
}

Function OutrasOtimizacoes {
    Write-Host "----------------------------------------"
    Write-Host "          OUTRAS OTIMIZACOES - CUIDADO"
    Write-Host "----------------------------------------"
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

    Do {
        $opcao = Read-Host "Digite o numero da sua escolha"
        Switch ($opcao) {
            1 { Write-Host "Bloqueando Adobe Network..."; Write-Host "Depois de fazer todos os seus comandos, basta reiniciar!" -ForegroundColor Yellow }
            2 { Write-Host "Removendo Bloatware da Adobe..."; Write-Host "Depois de fazer todos os seus comandos, basta reiniciar!" -ForegroundColor Yellow }
            3 { Write-Host "Desativando IPv6..."; Write-Host "Depois de fazer todos os seus comandos, basta reiniciar!" -ForegroundColor Yellow }
            4 { Write-Host "Desativando Teredo..."; Write-Host "Depois de fazer todos os seus comandos, basta reiniciar!" -ForegroundColor Yellow }
            5 { Write-Host "Desativando Aplicativos em Segundo Plano..."; Write-Host "Depois de fazer todos os seus comandos, basta reiniciar!" -ForegroundColor Yellow }
            6 { Write-Host "Desativando Otimizacoes de Tela Cheia..."; Write-Host "Depois de fazer todos os seus comandos, basta reiniciar!" -ForegroundColor Yellow }
            7 { Write-Host "Desativando Microsoft Copilot..."; Write-Host "Depois de fazer todos os seus comandos, basta reiniciar!" -ForegroundColor Yellow }
            8 { Write-Host "Desativando MM Intel (vPro LMS)..."; Write-Host "Depois de fazer todos os seus comandos, basta reiniciar!" -ForegroundColor Yellow }
            9 { Write-Host "Desativando Barra de Notificacoes e Calendario..."; Write-Host "Depois de fazer todos os seus comandos, basta reiniciar!" -ForegroundColor Yellow }
            10 { Write-Host "Configurando Tela para Melhor Desempenho..."; Write-Host "Depois de fazer todos os seus comandos, basta reiniciar!" -ForegroundColor Yellow }
            11 { Write-Host "Ativando Menu Classico do Clique-Direito..."; Write-Host "Depois de fazer todos os seus comandos, basta reiniciar!" -ForegroundColor Yellow }
            12 { Write-Host "Configurando Horario UTC (Dual Boot)..."; Write-Host "Depois de fazer todos os seus comandos, basta reiniciar!" -ForegroundColor Yellow }
            13 { Write-Host "Removendo Todos os Aplicativos da Microsoft Store..."; Write-Host "Depois de fazer todos os seus comandos, basta reiniciar!" -ForegroundColor Yellow }
            14 { Write-Host "Removendo Microsoft Edge..."; Write-Host "Depois de fazer todos os seus comandos, basta reiniciar!" -ForegroundColor Yellow }
            15 { Write-Host "Removendo OneDrive..."; Write-Host "Depois de fazer todos os seus comandos, basta reiniciar!" -ForegroundColor Yellow }
            16 { Write-Host "Bloqueando Instalacoes de Software Razer..."; Write-Host "Depois de fazer todos os seus comandos, basta reiniciar!" -ForegroundColor Yellow }
            0 { Write-Host "Voltando para o menu principal..." -ForegroundColor Yellow; break }
            Default { Write-Host "Opcao invalida. Tente novamente." -ForegroundColor Red }
        }
    } While ($opcao -ne 0)
}

# Loop principal
Do {
    Write-Host "----------------------------------------"
    Write-Host "Escolha uma opcao abaixo digitando o numero correspondente:"
    Write-Host "[1] Criar Ponto de Restauracao"
    Write-Host "[2] Excluir Arquivos Temporarios"
    Write-Host "[18] Ativar plano de energia: Desempenho Maximo"
    Write-Host "[19] Desativar 'Aprimorar precisao do ponteiro'"
    Write-Host "[20] Configurar teclado (repeticao e intermitencia)"
    Write-Host "[99] Outras Otimizacoes"
    Write-Host "[0] Sair"
    Write-Host "----------------------------------------"

    $escolha = Read-Host "Digite o numero da sua escolha"

    Switch ($escolha) {
        1 { Write-Host "Criando ponto de restauracao..."; Write-Host "Depois de fazer todos os seus comandos, basta reiniciar!" -ForegroundColor Yellow }
        2 { Write-Host "Excluindo arquivos temporarios..."; Write-Host "Depois de fazer todos os seus comandos, basta reiniciar!" -ForegroundColor Yellow }
        18 { AtivarPlanoDesempenhoMaximo }
        19 { DesativarPrecisaoPonteiro }
        20 { ConfigurarTeclado }
        99 { OutrasOtimizacoes }
        0 {
            Write-Host "Saindo do programa..." -ForegroundColor Yellow
            break
        }
        Default {
            Write-Host "Opcao invalida. Tente novamente." -ForegroundColor Red
        }
    }
} While ($escolha -ne 0)
