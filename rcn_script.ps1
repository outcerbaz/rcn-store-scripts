# RCN Store Optimization Script
Write-Host "Iniciando a otimização do PC..."

# Limpeza do cache do sistema
Clear-Host
Write-Host "Limpeza do cache do sistema em andamento..."
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Windows\Explorer\thumbcache_*.db" -Force

# A linha abaixo foi removida para evitar o erro.
# Write-Host "Finalizando processos em segundo plano..."
# Stop-Process -Name "example-process" -Force

Write-Host "Otimização concluída!"
