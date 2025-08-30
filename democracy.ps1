<#
.SYNOPSIS
  Democracy simulator.
  © 2025 DJ Stomp
  "No Rights Reserved"
  
.NOTES
  Author: DJ Stomp <85457381+DJStompZone@users.noreply.github.com>
  License: MIT
  Repo: https://github.com/djstompzone/democracy-simulator
#>

[CmdletBinding()]
param()

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

function New-DemocracyForm {
  <#
  .SYNOPSIS
    Participate in Democracy.
  #>

  $form = New-Object System.Windows.Forms.Form
  $form.Text = "Voting Machine"
  $form.StartPosition = "CenterScreen"
  $form.Size = New-Object System.Drawing.Size(420,220)
  $form.MinimumSize = $form.Size
  $form.MaximumSize = $form.Size
  $form.FormBorderStyle = "FixedDialog"
  $form.ControlBox = $false
  $form.MinimizeBox = $false
  $form.MaximizeBox = $false
  
  $label = New-Object System.Windows.Forms.Label
  $label.Text = "Please select from the following options:"
  $label.AutoSize = $true
  $label.Location = New-Object System.Drawing.Point(16,16)
  $label.Font = New-Object System.Drawing.Font("Segoe UI",11,[System.Drawing.FontStyle]::Regular)

  $radioA = New-Object System.Windows.Forms.RadioButton
  $radioA.Text = "Vote Option A"
  $radioA.AutoSize = $true
  $radioA.Location = New-Object System.Drawing.Point(20,58)
  $radioA.Font = New-Object System.Drawing.Font("Segoe UI",10,[System.Drawing.FontStyle]::Regular)
  $radioA.TabStop = $true
  
  $radioB = New-Object System.Windows.Forms.RadioButton
  $radioB.Text = "Vote Option B"
  $radioB.AutoSize = $true
  $radioB.Location = New-Object System.Drawing.Point(20,58)
  $radioB.Font = New-Object System.Drawing.Font("Segoe UI",10,[System.Drawing.FontStyle]::Regular)
  $radioB.TabStop = $true
  
  $radioC = New-Object System.Windows.Forms.RadioButton
  $radioC.Text = "Vote Option C"
  $radioC.AutoSize = $true
  $radioC.Location = New-Object System.Drawing.Point(20,58)
  $radioC.Font = New-Object System.Drawing.Font("Segoe UI",10,[System.Drawing.FontStyle]::Regular)
  $radioC.TabStop = $true
  
  $radioD = New-Object System.Windows.Forms.RadioButton
  $radioD.Text = "Vote Option D"
  $radioD.AutoSize = $true
  $radioD.Location = New-Object System.Drawing.Point(20,58)
  $radioD.Font = New-Object System.Drawing.Font("Segoe UI",10,[System.Drawing.FontStyle]::Regular)
  $radioD.TabStop = $true

  $ok = New-Object System.Windows.Forms.Button
  $ok.Text = "OK"
  $ok.Size = New-Object System.Drawing.Size(88,32)
  $ok.Location = New-Object System.Drawing.Point(200,130)
  $ok.DialogResult = [System.Windows.Forms.DialogResult]::OK

  $cancel = New-Object System.Windows.Forms.Button
  $cancel.Text = "Cancel"
  $cancel.Size = New-Object System.Drawing.Size(88,32)
  $cancel.Location = New-Object System.Drawing.Point(300,130)
  $cancel.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
  $form.Add_FormClosing({
      param($sender,$e)
      if (-not $script:Voted) {
        $e.Cancel = $true
      }
    })
  $ok.Add_Click({
    if ($radioA.Checked) {
      $script:Voted = $true
      $form.DialogResult = [System.Windows.Forms.DialogResult]::OK
      $form.Close()
    } else {
      [System.Windows.Forms.MessageBox]::Show("Please select from the available options to continue.","Selection Required","OK","Information") | Out-Null
    }
  })

  $cancel.Add_Click({
    if (-not $script:Voted) {
      [System.Windows.Forms.MessageBox]::Show("You must make a selection.","Action Required","OK","Exclamation") | Out-Null
      return
    }
  })

  $form.AcceptButton = $ok
  $form.CancelButton = $null

  $form.Controls.Add($label)
  $form.Controls.Add($radioA)
  $form.Controls.Add($ok)
  $form.Controls.Add($cancel)

  return $form
}

$script:Voted = $false
$form = New-DemocracyForm
$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK -and $script:Voted) {
  [System.Windows.Forms.MessageBox]::Show("Congratulations, you voted!","Congratulations","OK","Information") | Out-Null
}

# SIG # Begin signature block
# MIIb4wYJKoZIhvcNAQcCoIIb1DCCG9ACAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUniUH7dzfRvte2fVcmxCf9QlG
# RwqgghZOMIIDEDCCAfigAwIBAgIQWxvrrgsvaadDv4euX+8j2TANBgkqhkiG9w0B
# AQsFADAgMR4wHAYDVQQDDBVESiBTdG9tcCBDb2RlIFNpZ25pbmcwHhcNMjUwODMw
# MDAyMDMwWhcNMjYwODMwMDA0MDMwWjAgMR4wHAYDVQQDDBVESiBTdG9tcCBDb2Rl
# IFNpZ25pbmcwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDPAv4wv5Sd
# QPcxNuz6GXhIww95TaAlao7OJC/AAHb+Y9tegP4viRnyi1oiqLDNTBhocH/xggS2
# PFL6Jjw2kYDVGrYHBAv5WMnMVMz47QPwDkJI4CRqTYC2G11e8I90EYixQGbINnhz
# 0zdO0cHlC6xsHHvc7mAEffGW9gzg1SvcT9Xhuv+HbhGchkzB0zoU/cLp2p52jHl6
# weGDgGkU5+52ZK25EHK7HGHkt9ALbbdA23J63WSXkDvTTKjrH2hAF93ti3vbfFU+
# TioU7qqxDT0YxRk+BWm1YHXEMFBm5ha5VV7ksG9olyV9DiqGEhyqcN2z8G6gIsTN
# 6wkaTgv18eUFAgMBAAGjRjBEMA4GA1UdDwEB/wQEAwIHgDATBgNVHSUEDDAKBggr
# BgEFBQcDAzAdBgNVHQ4EFgQU4vZYmRRZ/SauzQK7UaKM6QBWzSgwDQYJKoZIhvcN
# AQELBQADggEBAIRvPXNGg92i5pYQady77i2eK0yizYl6C9EJEtGwypWOlGgZQ+Sa
# XmSZaHH/0sqlW1hrT8SjoPLLNhrvPtX9+s76wTfXfKJMHEm7Ze2fhkQom5ap7Fpz
# EkaRTNAyVYafDLnYCsTYZ/ke7aNmUtODQhX89Dyk72Zr7jzwSwb5ik2wacfelCL+
# oT33O8GwwFhls8JtwwL2BuNiKRLcsWxK+HkzDTA1EtRSWCfxfxcH0BwZwb/loyiw
# Nrxq0+WBDXwrAyWSMJGHy/n9reJcC15nXxV9dpgiCwA/5PGyqhyPHzsB2+N5is7m
# wi4sGmhDRfz2N4EiiFZIS/V68OAsAyWJLJcwggWNMIIEdaADAgECAhAOmxiO+dAt
# 5+/bUOIIQBhaMA0GCSqGSIb3DQEBDAUAMGUxCzAJBgNVBAYTAlVTMRUwEwYDVQQK
# EwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xJDAiBgNV
# BAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9vdCBDQTAeFw0yMjA4MDEwMDAwMDBa
# Fw0zMTExMDkyMzU5NTlaMGIxCzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2Vy
# dCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xITAfBgNVBAMTGERpZ2lD
# ZXJ0IFRydXN0ZWQgUm9vdCBHNDCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoC
# ggIBAL/mkHNo3rvkXUo8MCIwaTPswqclLskhPfKK2FnC4SmnPVirdprNrnsbhA3E
# MB/zG6Q4FutWxpdtHauyefLKEdLkX9YFPFIPUh/GnhWlfr6fqVcWWVVyr2iTcMKy
# unWZanMylNEQRBAu34LzB4TmdDttceItDBvuINXJIB1jKS3O7F5OyJP4IWGbNOsF
# xl7sWxq868nPzaw0QF+xembud8hIqGZXV59UWI4MK7dPpzDZVu7Ke13jrclPXuU1
# 5zHL2pNe3I6PgNq2kZhAkHnDeMe2scS1ahg4AxCN2NQ3pC4FfYj1gj4QkXCrVYJB
# MtfbBHMqbpEBfCFM1LyuGwN1XXhm2ToxRJozQL8I11pJpMLmqaBn3aQnvKFPObUR
# WBf3JFxGj2T3wWmIdph2PVldQnaHiZdpekjw4KISG2aadMreSx7nDmOu5tTvkpI6
# nj3cAORFJYm2mkQZK37AlLTSYW3rM9nF30sEAMx9HJXDj/chsrIRt7t/8tWMcCxB
# YKqxYxhElRp2Yn72gLD76GSmM9GJB+G9t+ZDpBi4pncB4Q+UDCEdslQpJYls5Q5S
# UUd0viastkF13nqsX40/ybzTQRESW+UQUOsxxcpyFiIJ33xMdT9j7CFfxCBRa2+x
# q4aLT8LWRV+dIPyhHsXAj6KxfgommfXkaS+YHS312amyHeUbAgMBAAGjggE6MIIB
# NjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBTs1+OC0nFdZEzfLmc/57qYrhwP
# TzAfBgNVHSMEGDAWgBRF66Kv9JLLgjEtUYunpyGd823IDzAOBgNVHQ8BAf8EBAMC
# AYYweQYIKwYBBQUHAQEEbTBrMCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdp
# Y2VydC5jb20wQwYIKwYBBQUHMAKGN2h0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNv
# bS9EaWdpQ2VydEFzc3VyZWRJRFJvb3RDQS5jcnQwRQYDVR0fBD4wPDA6oDigNoY0
# aHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0QXNzdXJlZElEUm9vdENB
# LmNybDARBgNVHSAECjAIMAYGBFUdIAAwDQYJKoZIhvcNAQEMBQADggEBAHCgv0Nc
# Vec4X6CjdBs9thbX979XB72arKGHLOyFXqkauyL4hxppVCLtpIh3bb0aFPQTSnov
# Lbc47/T/gLn4offyct4kvFIDyE7QKt76LVbP+fT3rDB6mouyXtTP0UNEm0Mh65Zy
# oUi0mcudT6cGAxN3J0TU53/oWajwvy8LpunyNDzs9wPHh6jSTEAZNUZqaVSwuKFW
# juyk1T3osdz9HNj0d1pcVIxv76FQPfx2CWiEn2/K2yCNNWAcAgPLILCsWKAOQGPF
# mCLBsln1VWvPJ6tsds5vIy30fnFqI2si/xK4VC0nftg62fC2h5b9W9FcrBjDTZ9z
# twGpn1eqXijiuZQwgga0MIIEnKADAgECAhANx6xXBf8hmS5AQyIMOkmGMA0GCSqG
# SIb3DQEBCwUAMGIxCzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMx
# GTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xITAfBgNVBAMTGERpZ2lDZXJ0IFRy
# dXN0ZWQgUm9vdCBHNDAeFw0yNTA1MDcwMDAwMDBaFw0zODAxMTQyMzU5NTlaMGkx
# CzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjFBMD8GA1UEAxM4
# RGlnaUNlcnQgVHJ1c3RlZCBHNCBUaW1lU3RhbXBpbmcgUlNBNDA5NiBTSEEyNTYg
# MjAyNSBDQTEwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQC0eDHTCphB
# cr48RsAcrHXbo0ZodLRRF51NrY0NlLWZloMsVO1DahGPNRcybEKq+RuwOnPhof6p
# vF4uGjwjqNjfEvUi6wuim5bap+0lgloM2zX4kftn5B1IpYzTqpyFQ/4Bt0mAxAHe
# HYNnQxqXmRinvuNgxVBdJkf77S2uPoCj7GH8BLuxBG5AvftBdsOECS1UkxBvMgEd
# gkFiDNYiOTx4OtiFcMSkqTtF2hfQz3zQSku2Ws3IfDReb6e3mmdglTcaarps0wjU
# jsZvkgFkriK9tUKJm/s80FiocSk1VYLZlDwFt+cVFBURJg6zMUjZa/zbCclF83bR
# VFLeGkuAhHiGPMvSGmhgaTzVyhYn4p0+8y9oHRaQT/aofEnS5xLrfxnGpTXiUOeS
# LsJygoLPp66bkDX1ZlAeSpQl92QOMeRxykvq6gbylsXQskBBBnGy3tW/AMOMCZIV
# NSaz7BX8VtYGqLt9MmeOreGPRdtBx3yGOP+rx3rKWDEJlIqLXvJWnY0v5ydPpOjL
# 6s36czwzsucuoKs7Yk/ehb//Wx+5kMqIMRvUBDx6z1ev+7psNOdgJMoiwOrUG2Zd
# SoQbU2rMkpLiQ6bGRinZbI4OLu9BMIFm1UUl9VnePs6BaaeEWvjJSjNm2qA+sdFU
# eEY0qVjPKOWug/G6X5uAiynM7Bu2ayBjUwIDAQABo4IBXTCCAVkwEgYDVR0TAQH/
# BAgwBgEB/wIBADAdBgNVHQ4EFgQU729TSunkBnx6yuKQVvYv1Ensy04wHwYDVR0j
# BBgwFoAU7NfjgtJxXWRM3y5nP+e6mK4cD08wDgYDVR0PAQH/BAQDAgGGMBMGA1Ud
# JQQMMAoGCCsGAQUFBwMIMHcGCCsGAQUFBwEBBGswaTAkBggrBgEFBQcwAYYYaHR0
# cDovL29jc3AuZGlnaWNlcnQuY29tMEEGCCsGAQUFBzAChjVodHRwOi8vY2FjZXJ0
# cy5kaWdpY2VydC5jb20vRGlnaUNlcnRUcnVzdGVkUm9vdEc0LmNydDBDBgNVHR8E
# PDA6MDigNqA0hjJodHRwOi8vY3JsMy5kaWdpY2VydC5jb20vRGlnaUNlcnRUcnVz
# dGVkUm9vdEc0LmNybDAgBgNVHSAEGTAXMAgGBmeBDAEEAjALBglghkgBhv1sBwEw
# DQYJKoZIhvcNAQELBQADggIBABfO+xaAHP4HPRF2cTC9vgvItTSmf83Qh8WIGjB/
# T8ObXAZz8OjuhUxjaaFdleMM0lBryPTQM2qEJPe36zwbSI/mS83afsl3YTj+IQhQ
# E7jU/kXjjytJgnn0hvrV6hqWGd3rLAUt6vJy9lMDPjTLxLgXf9r5nWMQwr8Myb9r
# EVKChHyfpzee5kH0F8HABBgr0UdqirZ7bowe9Vj2AIMD8liyrukZ2iA/wdG2th9y
# 1IsA0QF8dTXqvcnTmpfeQh35k5zOCPmSNq1UH410ANVko43+Cdmu4y81hjajV/gx
# dEkMx1NKU4uHQcKfZxAvBAKqMVuqte69M9J6A47OvgRaPs+2ykgcGV00TYr2Lr3t
# y9qIijanrUR3anzEwlvzZiiyfTPjLbnFRsjsYg39OlV8cipDoq7+qNNjqFzeGxcy
# tL5TTLL4ZaoBdqbhOhZ3ZRDUphPvSRmMThi0vw9vODRzW6AxnJll38F0cuJG7uEB
# YTptMSbhdhGQDpOXgpIUsWTjd6xpR6oaQf/DJbg3s6KCLPAlZ66RzIg9sC+NJpud
# /v4+7RWsWCiKi9EOLLHfMR2ZyJ/+xhCx9yHbxtl5TPau1j/1MIDpMPx0LckTetiS
# uEtQvLsNz3Qbp7wGWqbIiOWCnb5WqxL3/BAPvIXKUjPSxyZsq8WhbaM2tszWkPZP
# ubdcMIIG7TCCBNWgAwIBAgIQCoDvGEuN8QWC0cR2p5V0aDANBgkqhkiG9w0BAQsF
# ADBpMQswCQYDVQQGEwJVUzEXMBUGA1UEChMORGlnaUNlcnQsIEluYy4xQTA/BgNV
# BAMTOERpZ2lDZXJ0IFRydXN0ZWQgRzQgVGltZVN0YW1waW5nIFJTQTQwOTYgU0hB
# MjU2IDIwMjUgQ0ExMB4XDTI1MDYwNDAwMDAwMFoXDTM2MDkwMzIzNTk1OVowYzEL
# MAkGA1UEBhMCVVMxFzAVBgNVBAoTDkRpZ2lDZXJ0LCBJbmMuMTswOQYDVQQDEzJE
# aWdpQ2VydCBTSEEyNTYgUlNBNDA5NiBUaW1lc3RhbXAgUmVzcG9uZGVyIDIwMjUg
# MTCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBANBGrC0Sxp7Q6q5gVrMr
# V7pvUf+GcAoB38o3zBlCMGMyqJnfFNZx+wvA69HFTBdwbHwBSOeLpvPnZ8ZN+vo8
# dE2/pPvOx/Vj8TchTySA2R4QKpVD7dvNZh6wW2R6kSu9RJt/4QhguSssp3qome7M
# rxVyfQO9sMx6ZAWjFDYOzDi8SOhPUWlLnh00Cll8pjrUcCV3K3E0zz09ldQ//nBZ
# ZREr4h/GI6Dxb2UoyrN0ijtUDVHRXdmncOOMA3CoB/iUSROUINDT98oksouTMYFO
# nHoRh6+86Ltc5zjPKHW5KqCvpSduSwhwUmotuQhcg9tw2YD3w6ySSSu+3qU8DD+n
# igNJFmt6LAHvH3KSuNLoZLc1Hf2JNMVL4Q1OpbybpMe46YceNA0LfNsnqcnpJeIt
# K/DhKbPxTTuGoX7wJNdoRORVbPR1VVnDuSeHVZlc4seAO+6d2sC26/PQPdP51ho1
# zBp+xUIZkpSFA8vWdoUoHLWnqWU3dCCyFG1roSrgHjSHlq8xymLnjCbSLZ49kPmk
# 8iyyizNDIXj//cOgrY7rlRyTlaCCfw7aSUROwnu7zER6EaJ+AliL7ojTdS5PWPsW
# eupWs7NpChUk555K096V1hE0yZIXe+giAwW00aHzrDchIc2bQhpp0IoKRR7YufAk
# prxMiXAJQ1XCmnCfgPf8+3mnAgMBAAGjggGVMIIBkTAMBgNVHRMBAf8EAjAAMB0G
# A1UdDgQWBBTkO/zyMe39/dfzkXFjGVBDz2GM6DAfBgNVHSMEGDAWgBTvb1NK6eQG
# fHrK4pBW9i/USezLTjAOBgNVHQ8BAf8EBAMCB4AwFgYDVR0lAQH/BAwwCgYIKwYB
# BQUHAwgwgZUGCCsGAQUFBwEBBIGIMIGFMCQGCCsGAQUFBzABhhhodHRwOi8vb2Nz
# cC5kaWdpY2VydC5jb20wXQYIKwYBBQUHMAKGUWh0dHA6Ly9jYWNlcnRzLmRpZ2lj
# ZXJ0LmNvbS9EaWdpQ2VydFRydXN0ZWRHNFRpbWVTdGFtcGluZ1JTQTQwOTZTSEEy
# NTYyMDI1Q0ExLmNydDBfBgNVHR8EWDBWMFSgUqBQhk5odHRwOi8vY3JsMy5kaWdp
# Y2VydC5jb20vRGlnaUNlcnRUcnVzdGVkRzRUaW1lU3RhbXBpbmdSU0E0MDk2U0hB
# MjU2MjAyNUNBMS5jcmwwIAYDVR0gBBkwFzAIBgZngQwBBAIwCwYJYIZIAYb9bAcB
# MA0GCSqGSIb3DQEBCwUAA4ICAQBlKq3xHCcEua5gQezRCESeY0ByIfjk9iJP2zWL
# pQq1b4URGnwWBdEZD9gBq9fNaNmFj6Eh8/YmRDfxT7C0k8FUFqNh+tshgb4O6Lgj
# g8K8elC4+oWCqnU/ML9lFfim8/9yJmZSe2F8AQ/UdKFOtj7YMTmqPO9mzskgiC3Q
# YIUP2S3HQvHG1FDu+WUqW4daIqToXFE/JQ/EABgfZXLWU0ziTN6R3ygQBHMUBaB5
# bdrPbF6MRYs03h4obEMnxYOX8VBRKe1uNnzQVTeLni2nHkX/QqvXnNb+YkDFkxUG
# tMTaiLR9wjxUxu2hECZpqyU1d0IbX6Wq8/gVutDojBIFeRlqAcuEVT0cKsb+zJNE
# suEB7O7/cuvTQasnM9AWcIQfVjnzrvwiCZ85EE8LUkqRhoS3Y50OHgaY7T/lwd6U
# Arb+BOVAkg2oOvol/DJgddJ35XTxfUlQ+8Hggt8l2Yv7roancJIFcbojBcxlRcGG
# 0LIhp6GvReQGgMgYxQbV1S3CrWqZzBt1R9xJgKf47CdxVRd/ndUlQ05oxYy2zRWV
# FjF7mcr4C34Mj3ocCVccAvlKV9jEnstrniLvUxxVZE/rptb7IRE2lskKPIJgbaP5
# t2nGj/ULLi49xTcBZU8atufk+EMF/cWuiC7POGT75qaL6vdCvHlshtjdNXOCIUjs
# arfNZzGCBP8wggT7AgEBMDQwIDEeMBwGA1UEAwwVREogU3RvbXAgQ29kZSBTaWdu
# aW5nAhBbG+uuCy9pp0O/h65f7yPZMAkGBSsOAwIaBQCgeDAYBgorBgEEAYI3AgEM
# MQowCKACgAChAoAAMBkGCSqGSIb3DQEJAzEMBgorBgEEAYI3AgEEMBwGCisGAQQB
# gjcCAQsxDjAMBgorBgEEAYI3AgEVMCMGCSqGSIb3DQEJBDEWBBT2INPqYjv7Z506
# MW1X4cJgCiqVGjANBgkqhkiG9w0BAQEFAASCAQAMBLBpkZQbCqt5jzzEWlacCs07
# hj4XwRiAZHfMS4enx1tNV9a04GeDJwZZalUiK4BblgTL8kgIL/5+kkejPOQO+0s8
# DUc27a1M2JlWYP/JV9lYfZIvK1dBesN/Oa25tp8cbQnQJRQoBSCoK/pBDkJ7R3bZ
# HxNUy8paYDzpTumnYXMzwozIIbLLvJIG32h68nJE6+vESm/ISG0iak06DzOr2wj+
# Q1350fO2tXxJ4y24XmwmHrZ48B+I4jzvos475ZJkVgfYpAf/kKvBUc9+7f0akmGn
# w+LbYXa9VAZuljqT5ib5BfIMaMdV1q4+lvTKjy87WVGBCSFACeO3pRlI1fqMoYID
# JjCCAyIGCSqGSIb3DQEJBjGCAxMwggMPAgEBMH0waTELMAkGA1UEBhMCVVMxFzAV
# BgNVBAoTDkRpZ2lDZXJ0LCBJbmMuMUEwPwYDVQQDEzhEaWdpQ2VydCBUcnVzdGVk
# IEc0IFRpbWVTdGFtcGluZyBSU0E0MDk2IFNIQTI1NiAyMDI1IENBMQIQCoDvGEuN
# 8QWC0cR2p5V0aDANBglghkgBZQMEAgEFAKBpMBgGCSqGSIb3DQEJAzELBgkqhkiG
# 9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDgzMDAwMzE1OFowLwYJKoZIhvcNAQkE
# MSIEIHk9UJpyve5NYg+W9BQdMuC55SszpMwYbXubHPGxIPpoMA0GCSqGSIb3DQEB
# AQUABIICAJAnwY+zvQazwFp30ZjpaBBzaih1SCdPKWG8Z7QiS2p8PISAx1d1ehfO
# E8MRKZgxjiFXoCo2NUkgRaEaQOY2LAtjDGF6K97ozqwQ7J6kPhFwOty3BXhujef4
# 9c2Ugbb+v4woC6Xr19i1tUWJ8hFXRXpWjNa8Nr0ppD21bHX9Alwu38aapMUtEEU6
# sxGv0IEfqZViu98g9arwqibmMSTA/2YQy1yTFNB/B5Cmjy45kbMjD7rhju4fnz6Q
# dZsfF5EY+0aRk0z1nhRcjFPNUf74WDsUAf8TXlpyiWMQrl7YEmf3WbC7WuFTrLX1
# 5mJmoL/zJfJigi6Z3jWtmTe+WFjXyv9tievintsVlKDVBGXcTFRph/e7zN9siatn
# F4lPG+SClQV2CPihz/yDahd6Is9S4wLUXWQQWpJhaetR7hn6HqLWq/XX2PLH0uHv
# 4/pi+Rn7sycvUpfio1/r+aaUDMB5Ws1qEQnEBTrsJfj3lZRTkNRHCXnDlB9SE6tS
# qUCEYE5s4GeUEk4Hw1/GnXcHUVlqZ1VFss9UYe67XVs/SdTYAq2qhFfvzFqb8F1h
# C6FVMHloWORNAwNiXRuASghkeOnLvdN3+8t+aWzCbfevSPnmuXz4cVIanUZuCNW0
# fZNwsYjr46eCMshSLgOhouKZvnyLbR/1k6aqtfwUE8PAvcFHyjH8
# SIG # End signature block
