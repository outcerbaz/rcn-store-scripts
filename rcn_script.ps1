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

# Funções da primeira parte
Function AtivarPlanoDesempenhoMaximo {
    Write-Host "Ativando plano de energia: Desempenho Maximo..."
    powercfg -setactive SCHEME_MIN
    Write-Host "Plano de energia 'Desempenho Maximo' ativado com sucesso!"
    Write-Host "Depois de fazer todos os seus comandos, basta reiniciar!" -ForegroundColor Yellow
}

Function DesativarPrecisaoPonteiro {
    Write-Host "Desativando a opção 'Aprimorar precisão do ponteiro'..."
    $regPath = "HKCU:\\Control Panel\\Mouse"
    Set-ItemProperty -Path $regPath -Name "MouseSpeed" -Value 0
    Set-ItemProperty -Path $regPath -Name "MouseThreshold1" -Value 0
    Set-ItemProperty -Path $regPath -Name "MouseThreshold2" -Value 0
    Write-Host "Precisão do ponteiro desativada com sucesso!"
    Write-Host "Depois de fazer todos os seus comandos, basta reiniciar!" -ForegroundColor Yellow
}

Function ConfigurarTeclado {
    Write-Host "Configurando opções do teclado para repetição e intermitência..."
    $regPathTeclado = "HKCU:\\Control Panel\\Keyboard"
    Set-ItemProperty -Path $regPathTeclado -Name "KeyboardDelay" -Value 0  # Intervalo de repetição no máximo
    Set-ItemProperty -Path $regPathTeclado -Name "KeyboardSpeed" -Value 31  # Taxa de repetição rápida
    Write-Host "Configurações do teclado ajustadas com sucesso!"
    Write-Host "Depois de fazer todos os seus comandos, basta reiniciar!" -ForegroundColor Yellow
}

# Função para outras otimizações
Function OutrasOtimizacoes {
    Do {
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
        Write-Host "[9] Desativar Barra de Notificações e Calendario"
        Write-Host "[10] Configurar Tela para Melhor Desempenho"
        Write-Host "[11] Ativar Menu Classico do Clique-Direito"
        Write-Host "[12] Configurar Horario UTC (Dual Boot)"
        Write-Host "[13] Remover Todos os Aplicativos da Microsoft Store"
        Write-Host "[14] Remover Microsoft Edge"
        Write-Host "[15] Remover OneDrive"
        Write-Host "[16] Bloquear Instalacoes de Software Razer"
        Write-Host "[0] Voltar"
        Write-Host "----------------------------------------"

        $opcao = Read-Host "Digite o numero da sua escolha"
        Switch ($opcao) {
            1 { Write-Host "Bloqueando Adobe Network..." }
            2 { Write-Host "Removendo Bloatware da Adobe..." }
            3 { Write-Host "Desativando IPv6..." }
            4 { Write-Host "Desativando Teredo..." }
            5 { Write-Host "Desativando Aplicativos em Segundo Plano..." }
            6 { Write-Host "Desativando Otimizações de Tela Cheia..." }
            7 { Write-Host "Desativando Microsoft Copilot..." }
            8 { Write-Host "Desativando MM Intel (vPro LMS)..." }
            9 { Write-Host "Desativando Barra de Notificacoes e Calendario..." }
            10 { Write-Host "Configurando Tela para Melhor Desempenho..." }
            11 { Write-Host "Ativando Menu Classico do Clique-Direito..." }
            12 { Write-Host "Configurando Horario UTC (Dual Boot)..." }
            13 { Write-Host "Removendo Todos os Aplicativos da Microsoft Store..." }
            14 { Write-Host "Removendo Microsoft Edge..." }
            15 { Write-Host "Removendo OneDrive..." }
            16 { Write-Host "Bloqueando Instalacoes de Software Razer..." }
            0 { Write-Host "Voltando para o menu principal..." -ForegroundColor Yellow; break }
            Default { Write-Host "Opcao invalida. Tente novamente." -ForegroundColor Red }
        }
        Write-Host "Depois de fazer todos os seus comandos, basta reiniciar!" -ForegroundColor Yellow
    } While ($opcao -ne 0)
}

# Menu principal
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
    Write-Host "[9] Preferir IPv4 ao invés de IPv6"
    Write-Host "[10] Desativar Rastreamento de Localizacao"
    Write-Host "[11] Desativar Storage Sense"
    Write-Host "[12] Desativar Wifi-Sense"
    Write-Host "[13] Habilitar Finalizar Tarefa com Botao Direito"
    Write-Host "[14] Executar Limpeza de Disco"
    Write-Host "[15] Configurar Terminal do Windows para PowerShell 7"
    Write-Host "[16] Desativar Telemetria do PowerShell 7"
    Write-Host "[17] Configurar Hibernacao como padrao (ideal para laptops)"
    Write-Host "[18] Ativar plano de energia: Desempenho Maximo"
    Write-Host "[19] Desativar 'Aprimorar precisao do ponteiro'"
    Write-Host "[20] Configurar teclado (repeticao e intermitencia)"
    Write-Host "[21] Outras Otimizacoes"
    Write-Host "[0] Sair"
    Write-Host "----------------------------------------"

    $escolha = Read-Host "Digite o numero da sua escolha"
    Switch ($escolha) {
        1 { Write-Host "Criando ponto de restauracao..." }
        2 { Write-Host "Excluindo arquivos temporarios..." }
        18 { AtivarPlanoDesempenhoMaximo }
        19 { DesativarPrecisaoPonteiro }
        20 { ConfigurarTeclado }
        21 { OutrasOtimizacoes }
        0 {
            Write-Host "Saindo do programa..." -ForegroundColor Yellow
            break
        }
        Default {
            Write-Host "Opcao invalida. Tente novamente." -ForegroundColor Red
        }
    }
} While ($escolha -ne 0)
